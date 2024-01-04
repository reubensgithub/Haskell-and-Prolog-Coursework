-- any imports go here
import Data.List(inits,tails,permutations)

{-Begin Question 2.1-}
digits :: Int -> [Int]
digits x
  | x <= 10 = [x]
  | otherwise = reverse (x `mod` 10 : reverse(digits (x 
    `div` 10)))

number :: [Int] -> Int
number [] 
  = 0
number (x:xs)
   = inverse(digits(x + (10 * inverse xs)))
   where
  inverse :: [Int] -> Int
  inverse [] = 0
  inverse (x:xs) =  x + (10 * inverse xs)

{-End Question 2.1-}

{-Begin Question 2.2-}

removeFirstandLast :: [a] -> [a]
removeFirstandLast [] 
  = []
removeFirstandLast [x] 
  = []
removeFirstandLast xs 
  = tail (init xs)

splits :: [a] -> [([a],[a])]
splits []
  = [([], [])]
splits (as)
  = removeFirstandLast(zip (inits as)(tails as))


perm_list :: [[Int]]
perm_list
  = permutations [1,2,3,4,5,6,7,8,9]

possibles :: [([Int],[Int])]
possibles
  = concat(map (\x -> splits x) perm_list)

{-End Question 2.2-}
{-Begin Question 2.3-}
inverse :: [Int] -> Int
inverse [] 
  = 0
inverse (x:xs) 
  =  x + (10 * inverse xs)

isPalindromic :: [Int] -> Bool
isPalindromic x
  = number x == inverse x

isAcceptable :: ([Int],[Int]) -> Bool
isAcceptable (x,y)
    | number x < number y && (number x) `mod` 10 == 3 && isPalindromic(digits(number x * number y)) && (number x * number y) `mod` 10 == 4 = True
    | number x > number y && (number y) `mod` 10 == 3 && isPalindromic(digits(number x * number y)) && (number x * number y) `mod` 10 == 4 = True
    | otherwise = False
    

acceptables :: [([Int],[Int])]
acceptables
  = filter isAcceptable possibles
{-End Question 2.3-}

-- any main functions for testing goes here

main :: IO()
main
  = putStrLn (show (acceptables))