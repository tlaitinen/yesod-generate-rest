{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
module YesodDsl.Generator.PureScript (moduleToPureScript) where
import YesodDsl.AST
import Data.List
import Data.Maybe
import Data.Char (toLower)
import Data.String.Utils (rstrip, replace)
import Data.Text (Text)
import qualified Data.Text as T
import Text.Shakespeare.Text hiding (toText)
import Data.Generics.Uniplate.Data
import YesodDsl.Generator.Common
import YesodDsl.Generator.Input
import YesodDsl.Generator.Client
  
pureScriptFieldType :: Field -> String
pureScriptFieldType f = (if fieldOptional f then "Maybe " else "") 
    ++ case fieldContent f of
        NormalField ft -> case ft of
            FTWord32 -> "Int"
            FTWord64 -> "BigInt"
            FTInt32 -> "Int"
            FTInt -> "BigInt"
            FTInt64 -> "BigInt"
            FTText -> "String"
            FTBool -> "Boolean"
            FTDouble -> "Number"
            FTRational -> "Number" -- TODO: Data.Rational
            FTTimeOfDay -> "TimeOfDay"
            FTDay -> "Day"           
            FTUTCTime -> "UTCTime"
            FTCheckmark -> "Boolean"
        EntityField en -> en ++ "Id"
        EnumField en -> en


moduleToPureScript :: Module -> String
moduleToPureScript m = T.unpack $(codegenFile "codegen/purescript.cg")
    where
        enum e = T.unpack $(codegenFile "codegen/purescript-enum.cg")
            where
                value v = enumName e ++ v
                showValue v = T.unpack $(codegenFile "codegen/purescript-enum-show.cg")
                decodeValue v = rstrip $ T.unpack $(codegenFile "codegen/purescript-enum-decodevalue.cg")
                encodeValue v = T.unpack $(codegenFile "codegen/purescript-enum-encodevalue.cg")
        route r = T.unpack $(codegenFile "codegen/purescript-route.cg")        
        exportHandler r h = rstrip $ T.unpack $(codegenFile "codegen/purescript-export-handler.cg")
        importHandler r h = T.unpack $(codegenFile "codegen/purescript-import-handler.cg")

        handlerModuleName h = case handlerType h of
            GetHandler -> "Get" :: String
            PostHandler -> "Post"
            DeleteHandler -> "Delete"
            PutHandler -> "Put"
        handler r h 
            | handlerType h == GetHandler = T.unpack $(codegenFile "codegen/purescript-handler-get.cg")
            | null $ handlerInputFields h =T.unpack $(codegenFile "codegen/purescript-handler-update-empty-body.cg")
            | otherwise = T.unpack $(codegenFile "codegen/purescript-handler-update.cg")
            where
                defineResultType
                    | null $ handlerOutputFields m h = ""
                    | otherwise = T.unpack $(codegenFile "codegen/purescript-handler-update-result-type.cg")
                resultType 
                    | null $ handlerOutputFields m h = "Boolean"
                    | otherwise = handlerEntityName ++ "Result"
                processResult 
                    | null $ handlerOutputFields m h = T.unpack $(codegenFile "codegen/purescript-handler-update-boolean-result.cg")
                    | otherwise = T.unpack $(codegenFile "codegen/purescript-handler-update-process-result.cg")
                field f  = rstrip $ T.unpack $(codegenFile "codegen/purescript-field.cg")
                encodeJson (fn,Right f) = rstrip $ T.unpack $(codegenFile "codegen/purescript-encodejson-field.cg")
                encodeJson (fn,Left _) = rstrip $ T.unpack $(codegenFile "codegen/purescript-encodejson-unknown.cg")

                decodeJsonExtract f = T.unpack $(codegenFile "codegen/purescript-decodejson-extract.cg")
                decodeJsonAssign f = rstrip $ T.unpack $(codegenFile "codegen/purescript-decodejson-assign.cg")

                handlerTypeName = upperFirst $ map toLower (show $ handlerType h) 
                handlerEntityName = (if handlerType h /= GetHandler then handlerTypeName else "") ++ routePathName r

                inputFieldSetter (fn, Right f) = T.unpack $(codegenFile "codegen/purescript-inputfield-setter.cg")
                inputFieldSetter (fn, Left optional) = T.unpack $(codegenFile "codegen/purescript-inputfield-setter-unknown.cg")

                outputFieldLens f = T.unpack $(codegenFile "codegen/purescript-output-field-lens.cg")
        toURIQuery (fn,_) = T.unpack $(codegenFile "codegen/purescript-touriquery.cg")
        inputField (fn,Right f) = rstrip $ T.unpack $(codegenFile "codegen/purescript-inputfield.cg")
        inputField (fn,Left optional) = rstrip $ T.unpack $(codegenFile "codegen/purescript-inputfield-unknown.cg")
        maybeMaybe x = if x then "Maybe " else "" :: Text
        routeModuleName = routePathName 
        routePathName = (concatMap pathName) . routePath
        pathName pp = case pp of
            PathText t -> upperFirst t
            PathId _ en -> "I"
         
        routePathParams r = mapMaybe (\(n,pp) -> case pp of
            PathText _ -> Nothing
            PathId _ en -> Just ("p" ++ show (n::Int),en ++ "Id")) $ zip [1..] (routePath r)
        routePathUrl r = concatMap (\(n,pp) -> case pp of
            PathText t -> " ++ \"/" ++ t ++ "\""
            PathId _ _ -> " ++ \"/\" ++ show p" ++ show (n::Int)) $ zip [1..] (routePath r)
        
        entity e = T.unpack $(codegenFile "codegen/purescript-entity.cg")
