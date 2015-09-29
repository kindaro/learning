module Main where


import Data.List


main = do
    putStrLn.show $ solution f list
    putStrLn.show $ solution' f list
    putStrLn.show $ solution3 f list


f = (++) "uber "

list = ["Amy", "Henrik", "Josephine"]

solution :: (String -> String) -> [String] -> [String]
solution _ [] = []
solution f (l:ls) = map f $ l : solution f ls

solution' :: (String -> String) -> [String] -> [String]
solution' _ [] = []
solution' f (l:ls) = (head $ map f [l]) : (map f $ solution' f ls)

recursive :: (a -> a) -> (a -> a) -> [a] -> [a]
recursive _ _ [] = []
recursive fh ft (l:ls) = fh l : map ft (recursive fh ft ls)

solution3 :: (String -> String) -> [String] -> [String]
solution3 f = recursive f f
