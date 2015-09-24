{-# Language GADTs #-}
{-# Language TemplateHaskell #-}

module Main where

import Control.Lens
import Data.List
import Data.Function


data TestCase i o where
    TestCase:: { _input:: i
        , _output:: o
        } -> TestCase i o

makeLenses ''TestCase

main = sequence [ (putStrLn . show) (test f c) | f <- function_variants, c <- test_cases ]

function_variants = [ f1 ]

test_cases = [ TestCase [1.. 10] [1.. 10]
            , TestCase [-2.. 3] [1.. 3]
            ]

test f c = f (c ^. input) == (c ^. output)


f1 = fst . maximumBy (compare `on` snd) . fmap (\x -> (x, length x)) . groupBy ((==) `on` signum)
