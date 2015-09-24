module Main where


data StdObj x y = StdObjA x | StdObjB y deriving Show

main :: IO ()
main = putStrLn . show $ test

obj :: StdObj Integer Integer
obj = StdObjA 1

test = innerProduct v1 v2 == r
    where
        v1 = [1, 2, 3]
        v2 = [4, 5, 6]
        r = 32

innerProduct = (sum .) . zipWith (*)
