module Main where


main = putStrLn.show $ solution f list


f = (++) "prefix "

list = ["Amy", "Henrik", "Josephine"]

solution :: (String -> String) -> [String] -> [String]
solution _ [] = []
solution f l = map f $ (head l) : (solution f $ tail l)
