module YesodDsl.Validation.Handlers (handlerErrors) where
import YesodDsl.AST
import Data.Maybe
handlerErrors :: Module -> String
handlerErrors m = (concatMap notAllowedError $ 
                    [ (r, ht, routeLoc r, p)
                    | r <- modRoutes m, (Handler _ ht ps) <- routeHandlers r,
                      p <- ps, not $ allowed ht p ])
                ++ (concatMap missingError $
                     [ (r, ht, routeLoc r, pt)
                    | r <- modRoutes m, (Handler _ ht ps) <- routeHandlers r,
                      pt <- missing ht ps ])
                        
    where             
        
        allowed _ Public = True
        allowed ht (Call _ _) = ht /= GetHandler
        allowed PostHandler (Insert _ _ _) = True
        allowed PostHandler (Update _ _ _) = True
        allowed PostHandler (DeleteFrom _ _ _) = True
        allowed PostHandler (Require _) = True
        allowed PostHandler (For _ _ _) = True
        allowed ht (GetById _ _ _) = ht /= GetHandler
        allowed ht (Return _) = ht /= GetHandler
        allowed PutHandler (Insert _ _ _) = True
        allowed PutHandler (Update _ _ _) = True
        allowed PutHandler (DeleteFrom _ _ _) = True
        allowed PutHandler (Require _) = True
        allowed PutHandler (For _ _ _) = True
        allowed DeleteHandler (Insert _ _ _) = True
        allowed DeleteHandler (Update _ _ _) = True
        allowed DeleteHandler (DeleteFrom _ _ _) =True
        allowed DeleteHandler (Require _) = True
        allowed DeleteHandler (For _ _ _) = True
        allowed GetHandler DefaultFilterSort = True
        allowed GetHandler (Select _) = True
        allowed GetHandler (IfFilter (_, joins, _,_)) = onlyInnerJoins joins
        allowed GetHandler (Require _) = True
        allowed _ _ = False

        onlyInnerJoins js = all (\j -> joinType j == InnerJoin) js

        missing ht ps  
            | ht == GetHandler = mapMaybe (requireMatch ps) [
           (\p -> case p of (Select _) -> True; _ -> False, "select from")]
            | otherwise = []
        requireMatch ps (f,err) = case listToMaybe (filter f ps) of
            Just _ -> Nothing
            Nothing -> Just err     
        notAllowedError (r, ht, l, p) = show p ++ " not allowed in " 
                                   ++ show ht ++ " of " ++ show (routePath r)
                                   ++ " in " ++ show l ++ "\n"
        missingError (r,ht,l,p) = "Missing " ++ p ++ " in " ++ show ht 
                                ++ " of " ++ show (routePath r) ++ " in "
                                ++ show l ++ "\n"
