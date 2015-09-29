module Main where


main = putStrLn.show $ solution f list == ["uber Amy", "uber uber Henrik", "uber uber uber Josephine"]


f = (++) "uber "

list = ["Amy", "Henrik", "Josephine"]

solution :: (String -> String) -> [String] -> [String]
solution _ [] = []
solution f (l:ls) = map f $ l : solution f ls
