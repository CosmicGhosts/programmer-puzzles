module Main where

import Prelude

import Data.Maybe
import Data.Array
import Data.Either
import Data.Foreign

import Node.Yargs
import Node.Yargs.Setup
import Node.Yargs.Applicative

import Control.Monad.Eff
import Control.Monad.Eff.Console

data NoisyNum = Fizz | Buzz | FizzBuzz | Num Int

instance showNoisyNum :: Show NoisyNum where
  show Fizz     = "Fizz"
  show Buzz     = "Buzz"
  show FizzBuzz = "FizzBuzz"
  show (Num n ) = show n

fizzBuzz :: Int -> Int -> Int -> NoisyNum
fizzBuzz div1 div2 n
  | isDivisible div1 n && isDivisible div2 n = FizzBuzz
  | isDivisible div1 n           = Fizz
  | isDivisible div2 n           = Buzz
  | otherwise                    = Num n

isDivisible divisor n = n `mod` divisor == 0

app :: forall eff. Array String -> Eff (console :: CONSOLE | eff) Unit
app []        = return unit
app [x]       = return unit
app [x, y]    = return unit
app [x, y, z] = print $ show $ map (\n -> fizzBuzz 3 5 n) (1..100)

main = do
  let setup = usage "$0 Word1 Word2"
              <> example "$0 Hello -w World" "Say hello!"

  runY setup $ app <$> yarg "w" ["word"] (Just "A word") (Right "At least one word is required") false
