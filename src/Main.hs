{-# LANGUAGE GADTs #-}
{-# LANGUAGE StandaloneDeriving #-}

module Main where


data StdObj = StdObjA {x :: Integer} | StdObjB {y :: Integer} deriving Show

data Elem a i where
    Elem :: Eq i => a -> i -> Elem a i

deriving instance (Show a, Show i) => Show (Elem a i)



main :: IO ()
main = putStrLn (show $ Elem 1 2)
