module Main where


main = getLine >>= putStrLn . show . f . read

f :: Integer -> (Integer, Integer)
f x = (sum digits, (toInteger.length) digits)
    where digits = digits' 10 x

digits' :: Integer -> Integer -> [Integer]
digits' _ 0 = []
digits' base n = snd q : digits' base (fst q)
    where q = quotRem n base
