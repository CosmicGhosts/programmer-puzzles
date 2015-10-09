module Main (NoisyNum(Fizz, Buzz, FizzBuzz, Num), main, app, isDivisible, fizzBuzz) where
import Prim
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
data NoisyNum = Fizz  | Buzz  | FizzBuzz  | Num Prim.Int
foreign import main :: forall t60. Control.Monad.Eff.Eff (err :: Control.Monad.Eff.Exception.EXCEPTION, console :: Control.Monad.Eff.Console.CONSOLE | t60) Prelude.Unit
foreign import app :: forall eff. Prim.Array Prim.String -> Control.Monad.Eff.Eff (console :: Control.Monad.Eff.Console.CONSOLE | eff) Prelude.Unit
foreign import isDivisible :: Prim.Int -> Prim.Int -> Prim.Boolean
foreign import fizzBuzz :: Prim.Int -> Prim.Int -> Prim.Int -> Main.NoisyNum
foreign import instance showNoisyNum :: Prelude.Show Main.NoisyNum