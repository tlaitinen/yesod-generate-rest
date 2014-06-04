{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TemplateHaskell #-}
{-# LANGUAGE OverloadedStrings #-}
module YesodDsl.Generator.Require where
import YesodDsl.AST
import Text.Shakespeare.Text hiding (toText)
import qualified Data.Text as T
import YesodDsl.Generator.Common
import YesodDsl.Generator.Esqueleto
import Control.Monad.State
requireStmts :: State Context String
requireStmts  = do
    ps <- gets ctxHandlerParams
    liftM concat $ mapM f $ zip ([1..] :: [Int]) ps
    where 
        f (requireId,(Require sq)) = do

            ctx <- get
            put $ ctx { ctxNames = sqAliases sq }
            mw <- case sqWhere sq of
                Just expr -> do
                    e <- hsBoolExpr expr 
                    return $ "where_ (" ++ e ++ ")\n"
                Nothing -> return ""
            jes <- liftM concat $ mapM mapJoinExpr (reverse $ sqJoins sq)

            put ctx
            return $ let maybeWhere = mw 
                         joinExprs  = jes in 
                T.unpack $(codegenFile "codegen/require-select-query.cg")
                where 
                    (limit, offset) = sqLimitOffset sq
                    (selectEntity, selectVar) = sqFrom sq
        f _ = return "" 