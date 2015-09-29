module Main where


main :: IO ()
main = getLine >>= putStrLn . show . f . read

f :: Integer -> (Integer, Integer)
f x = (sum digits, (toInteger.length) digits)
    where digits = digits' 10 x

digits' :: Integer -> Integer -> [Integer]
digits' _ 0 = []
digits' base n = r : digits' base (q)
    where (q, r) = quotRem n base
