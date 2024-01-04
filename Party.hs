-- any imports go here
import Data.List

{-Begin Question 1.1-}
digits :: Int -> [Int]
digits x
  | x <= 10 = [x]
  | otherwise = reverse (x `mod` 10 : reverse(digits (x 
    `div` 10)))

{-End Question 1.1-}

{-Begin Question 1.2-}

isPar :: Int -> Bool
isPar x
  | (x `mod` 10) == (((x `mod` 100) - (x `mod` 10)) `div` 10) = False
  | ((((x `mod` 1000) - (x `mod` 100)) `div` 100)) == ((x - (x `mod` 1000)) `div` 1000) = False
  | (x `mod` 10) == ((((x `mod` 1000) - (x `mod` 100)) `div` 100)) = False
  | (x `mod` 10) == ((x - (x `mod` 1000)) `div` 1000) = False
  | ((((x `mod` 1000) - (x `mod` 100)) `div` 100)) == (((x `mod` 100) - (x `mod` 10)) `div` 10) = False
  | (x `mod` 100) == 0 = False 
  | (x `mod` 100) == ((x - (x `mod` 100))`div`100) = False
  | (x `mod` 10) == 0 = False
  | (x `mod` 100) == 0 = False
  | (x `mod` 1000) == 0 = False
  | x == 0 = False
  | (x `mod` 100) `rem` ((x - (x `mod` 100))`div`100) == 0 = True
  | otherwise = False

pars :: [Int]
pars
  = filter isPar [1000..9999]

{-End Question 1.2-}

{-Begin Question 1.3-}

sumOfDigits :: Int -> Int
sumOfDigits x
  | x >= 1000 = x `mod` 10 + (((x `mod` 100) - (x `mod` 10)) `div` 10) + (((x `mod` 1000) - (x `mod` 100)) `div` 100) + ((x - (x `mod` 1000)) `div` 1000)
  | otherwise = 0

missingDigit :: (Int, Int) -> Int
missingDigit (x, y)
  | isPar x && isPar y = 45 - ((sumOfDigits x) +     
    (sumOfDigits y))
  | otherwise = 0
{- 45 subtract total of every integer of the two numbers to get the missing number then check if both pars are multiple of number-}
isParPair :: (Int, Int) -> Bool
isParPair (x, y)
  | x `mod` 10 == y `mod` 10 = False
  | x `mod` 10 == (((y `mod` 100) - (y `mod` 10)) `div` 10) = False
  | x `mod` 10 == (((y `mod` 1000) - (y `mod` 100)) `div` 100) = False
  | x `mod` 10 == ((y - (y `mod` 1000)) `div` 1000) = False
  | (((x `mod` 100) - (x `mod` 10)) `div` 10) == y `mod` 10 = False
  | (((x `mod` 100) - (x `mod` 10)) `div` 10) == (((y `mod` 100) - (y `mod` 10)) `div` 10) = False
  | (((x `mod` 100) - (x `mod` 10)) `div` 10) == (((y `mod` 1000) - (y `mod` 100)) `div` 100) = False
  | (((x `mod` 100) - (x `mod` 10)) `div` 10) == ((y - (y `mod` 1000)) `div` 1000) = False
  | (((x `mod` 1000) - (x `mod` 100)) `div` 100) == y `mod` 10 = False
  | (((x `mod` 1000) - (x `mod` 100)) `div` 100) == (((y `mod` 100) - (y `mod` 10)) `div` 10) = False
  | (((x `mod` 1000) - (x `mod` 100)) `div` 100) == (((y `mod` 1000) - (y `mod` 100)) `div` 100) = False
  | (((x `mod` 1000) - (x `mod` 100)) `div` 100) == ((y - (y `mod` 1000)) `div` 1000) = False
  | ((x - (x `mod` 1000)) `div` 1000) == y `mod` 10 = False
  | ((x - (x `mod` 1000)) `div` 1000) == (((y `mod` 100) - (y `mod` 10)) `div` 10) = False
  | ((x - (x `mod` 1000)) `div` 1000) == (((y `mod` 1000) - (y `mod` 100)) `div` 100) = False
  | ((x - (x `mod` 1000)) `div` 1000) == ((y - (y `mod` 1000)) `div` 1000) = False
  | otherwise = True
  

{- checks to see if there are any repeating digits in the pair-}
isMultiple :: (Int, Int) -> Bool
isMultiple (x, y)
  | missingDigit(x,y) == 0 = False
  | isParPair(x,y) && x `rem` missingDigit(x,y) == 0 && y `rem` missingDigit(x,y) == 0 = True
  | otherwise = False
{- check if two inputted pars is multiple of missingDigit from previous function -}

possiblePartyPairs :: [Int] -> [(Int, Int)]
possiblePartyPairs p 
  = [(x,y) | (x:ys) <- tails p, y <- ys]

possiblePartyPairsList :: [(Int, Int)]
possiblePartyPairsList
  = possiblePartyPairs pars

isParty :: (Int, Int) -> Bool
isParty (x, y)
  | isMultiple (x,y) = True
  | otherwise = False

partys :: [(Int, Int)]
partys
  = filter isParty possiblePartyPairsList

{-End Question 1.3-}

-- any main functions for testing goes here

main :: IO ()
main
  = putStrLn (show (partys))