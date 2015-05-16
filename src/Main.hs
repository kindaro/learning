module Main where


data StdObj x y = StdObjA {x :: Integer} | StdObjB {y :: Integer} deriving Show

main :: IO ()
main = putStrLn (show $ StdObjA 1)
