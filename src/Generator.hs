module Generator (generateModels) where
import System.IO (FilePath)
import DbTypes
import DbLexer
import Data.Char
import Data.List
import Data.Maybe
import Data.String.Utils
-- from Database.Persist.TH
recName :: String -> String -> String
recName dt f = lowerFirst dt ++ upperFirst f

lowerFirst :: String -> String
lowerFirst (a:b) = (toLower a):b
lowerFirst a = a

upperFirst :: String -> String
upperFirst (a:b) = (toUpper a):b
upperFirst a = a
-- ^^^^ Database.Persist.TH        
entityFieldDeps :: DbModule -> String -> [String]
entityFieldDeps db name 
    | name `elem` [ entityName entity | entity <- dbEntities db ] = [name]
    | otherwise = [name ++ "Inst", name ++ "InstRef"]

getFieldDeps :: DbModule -> Field -> [String]
getFieldDeps db field = case (fieldContent field) of
    (NormalField _ _) -> []
    (EntityField entityName) -> entityFieldDeps db entityName

lookupDeps :: DbModule -> String -> [String]
lookupDeps db name = concatMap (getFieldDeps db) $ (dbdefFields . (dbLookup db)) name

genUnique :: Unique -> String
genUnique (Unique name fields) = "Unique" ++ name ++ " " ++ intercalate " " fields

genFieldType :: DbModule -> Field -> String
genFieldType db field = case (fieldContent field) of
    (NormalField ftype _)   -> fromTkType ftype
    (EntityField entityName) -> entityName ++ "Id"
    where 
        fromTkType TWord32 = "Word32"
        fromTkType TWord64 = "Word64"
        fromTkType TInt32  = "Int32"
        fromTkType TInt64  = "Int64"
        fromTkType TText   = "Text"
        fromTkType TBool   = "Bool"
        fromTkType TDouble = "Double"
        fromTkType TTime   = "TimeOfDay"
        fromTkType TDate   = "Day"
        fromTkType TDateTime = "UTCTime"
        fromTkType TZonedTime = "ZonedTime"
        fromTkType ft = error $ "Unknown field type: " ++ show ft 

haskellFieldType :: DbModule -> Field -> String
haskellFieldType db field = (maybeMaybe (fieldOptional field)) ++ genFieldType db field 
        where
            maybeMaybe True = "Maybe "
            maybeMaybe False = ""

persistFieldType :: DbModule -> Field -> String
persistFieldType db field = genFieldType db field ++ (maybeMaybe (fieldOptional field))
        where
            maybeMaybe True = " Maybe "
            maybeMaybe False = " "

genField :: DbModule -> Field -> String
genField db field = fieldName field ++ " " ++ persistFieldType db field

genModel :: DbModule -> Entity -> String
genModel db entity = unlines $ [ entityName entity ] 
                            ++ (indent $ (map (genField db) (entityFields entity))
                                      ++ (map genUnique (entityUniques entity)))

generateModels :: DbModule -> [(FilePath,String)]
generateModels db =  [("config/generated-models", unlines $ map (genModel db) (dbEntities db)),
                      ("Model/Validation.hs", genValidation db ),
                      ("Model/Interfaces.hs", genInterfaces db ) ]

genFieldChecker :: EntityName -> Field -> Maybe String
genFieldChecker name (Field _ fname (NormalField _ opts)) 
        | null opts = Nothing
        | otherwise = Just $ join "," $ catMaybes (map maybeCheck opts)
        where
            maybeCheck (FieldCheck func) = Just $ "if (not . V." ++ func ++ ") $" ++ fname ++ " d then Just \"" ++ name ++ "." ++ fname ++ " " ++ func ++ "\" else Nothing"
            maybeCheck _ = Nothing
genFieldChecker name _ = Nothing

genEntityChecker :: Entity -> [String]
genEntityChecker e = [ join "," $ [ "if (not . V." ++ func ++ ") d then Just \"" ++ 
                        entityName e ++ " " ++ func ++ "\" else Nothing" ] 
                       | func <- entityChecks e ]
genEntityValidate :: DbModule -> Entity -> [String]
genEntityValidate db e = ["instance Validatable " ++ (entityName e) ++ " where "]
                       ++ (indent (["validate d = catMaybes ["]
                           ++ fieldChecks ++ genEntityChecker e
                           ++ ["]",""]))
              where fieldChecks = mapMaybe (genFieldChecker (entityName e)) (entityFields e)



genValidation :: DbModule -> String
genValidation db = unlines $ [
    "{-# LANGUAGE OverloadedStrings #-}",
    "module Model.Validation (Validatable(..)) where",
    "import Data.Text",
    "import qualified Model.ValidationFunctions as V",
    "import Import",
    "class Validatable a where",
    "    validate :: a -> [Text]"
    ] ++ concatMap (genEntityValidate db) (dbEntities db)
                   
ifaceFieldName :: Iface -> Field -> String
ifaceFieldName i f = (lowerFirst . ifaceName) i ++ (upperFirst . fieldName) f

entityFieldName :: Entity -> Field -> String
entityFieldName e f = (lowerFirst . entityName) e ++ (upperFirst . fieldName) f

    
genInterfaces :: DbModule -> String
genInterfaces db = unlines $ [
    "module Model.Interfaces where",
    "import Import"
    ] ++ concatMap genInterface (dbIfaces db)
    where
        genInterface i = [ "class " ++ ifaceName i ++ " a where" ]
                      ++ (indent $ [ ifaceFieldName i f 
                                     ++ " :: a -> " ++ haskellFieldType db f 
                                     | f <- ifaceFields i ] )
                      ++ [""]
                      ++ concatMap (genInstance i) [ e | e <- dbEntities db, 
                                                     (ifaceName i) `elem` entityImplements e ]

        genInstance i e = [ "instance " ++ ifaceName i ++ " " ++ entityName e ++ " where " ]
                        ++ (indent $ [ ifaceFieldName i f ++ " = " 
                                        ++ entityFieldName e f | f <- ifaceFields i ])
                        ++ [""]

                              

indent :: [String] -> [String]
indent = map (\l -> "    " ++ l)
        


