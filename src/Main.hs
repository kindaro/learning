module Main where


data Sweet =
          Empty
        | Candy { price:: Integer , amount:: Integer }
        | Cake { price:: Integer }
            deriving Show


-- class Goods a where
--     value :: a -> Integer

main = putStrLn.show $ sum (map value testCase)

testCase = [Candy 2 3, Cake 5, Empty]

value :: Sweet -> Integer

value a @ Candy {} = price a * amount a
value a @ Cake {} = price a
value Empty = 0


