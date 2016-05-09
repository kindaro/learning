{-# LANGUAGE GADTs #-}
{-# LANGUAGE StandaloneDeriving #-}



module Main where

import Data.Map
import Data.Ix
import Data.Ix.List
import Data.Array


data StdObj = StdObjA {x :: Integer} | StdObjB {y :: Integer} deriving Show

data Elem a i where
    Elem :: Eq i => a -> i -> Elem a i

deriving instance (Show a, Show i) => Show (Elem a i)

newtype DList x = List x


data Repr = X | Y

data Statika a = Leaf a | Map Repr (Statika a)
data Type key value = NoValue | Value (Map key value)
type Type2 = Map Int String
newtype Type3 = Value3 (Map Int String)

data Node ref inner where
    Node :: (Functor f, Ix ref) => ref -> Either (f ref) val -> Node ref (Either (f ref) val)
deriving instance (Show ref, Show inner) => Show (Node ref inner)

exampleNode1, exampleNode2 :: NodeA String
exampleNode1 = Node (listAll2idx "index1") (Left [listAll2idx "index2"])
exampleNode2 = Node (listAll2idx "index2") (Right "I'm a leaf.")

type NodeA val = Node Int (Either [Int] val)

data Spine value where
    Spine :: NodeA value -> Spine (Array ref (NodeA value))

main :: IO ()
main = sequence' [ putStrLn (show $ Elem 1 2)
                 , putStrLn (show exampleNode1)
                 , putStrLn (show exampleNode2)
                 ]
       >> return ()

sequence' :: [IO a] -> IO [a]
sequence' [] = return []
sequence' (c:cs) = do
    x <- c
    xs <- sequence cs
    return (x:xs)
