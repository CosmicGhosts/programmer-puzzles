import System.Environment

data FizzBuzzNum = Fizz | Buzz | FizzBuzz | Num Int

instance Show FizzBuzzNum where
  show Fizz     = "Fizz"
  show Buzz     = "Buzz"
  show FizzBuzz = "FizzBuzz"
  show (Num n)  = show n

fizzBuzz :: Int -> Int -> Int -> FizzBuzzNum
fizzBuzz div1 div2 n
  | byDiv1 n && byDiv2 n = FizzBuzz
  | byDiv1 n             = Fizz
  | byDiv2 n             = Buzz
  | otherwise            = Num n
  where
   byDiv1 = isDivisible div1
   byDiv2 = isDivisible div2

isDivisible divisor n = n `mod` divisor == 0

main = do
  args <- getArgs
  let div1:div2:upperBound:[] = [read arg | arg <- args]
  let putFizzBuzz = show . fizzBuzz div1 div2
  mapM putStrLn $ map putFizzBuzz [0..upperBound]
