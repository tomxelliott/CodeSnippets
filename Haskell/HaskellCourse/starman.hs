-- Declare type of function.
-- Always useful to do this first.
-- Since it focuses the attention on what the function
-- is supposed to compute and what data is used to do it.
import System.Random

check :: String -> String -> Char -> (Bool,String)
check word display c
	= (c `elem` word, [if x==c 
	then c 
	else y | (x,y) <- zip word display])


turn :: String -> String -> Int -> IO ()
turn word display n =
	do if n==0
		then putStrLn "You lose"
		else if word==display
			then putStrLn "You win!"
			else mkguess word display n

mkguess word display n =
  do putStrLn (display ++ "  " ++ take n (repeat '*'))
     putStr "  Enter your guess: "
     q <- getLine
     let (correct, display') = check word display (q!!0)
     let n' = if correct then n else n-1
     turn word display' n'

-- TOP LEVEL FUNCTION:
starman :: String -> Int -> IO ()
starman word n = turn word ['-' | x <- word] n

drawInt :: Int -> Int -> IO Int
drawInt x y = getStdRandom (randomR (x,y))

dict :: IO [String]
dict = do 
	w <- readFile " " -<- file directory to be entered here
	let q = words w
	return q

main = do
	x <- dict
	n <- drawInt 0 ((length x)-1)
	let wrd = (x!!n) 
	starman wrd 5  -- this is where the starman function gets called
	putStrLn $ "Correct answer was: " ++ wrd
