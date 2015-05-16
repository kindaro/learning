module Main where


data StdObj x y = StdObjA x | StdObjB y deriving Show

main :: IO ()
main = putStrLn (show $ obj)


obj :: StdObj Integer Integer
obj = StdObjA 1


