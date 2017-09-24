-- nice cheeky comment

add x y = x + y

sub x y = x - y

mult x y = x * y

divider x y = x / y

myDrop n xs = if n <= 0 || null xs
	then xs
	else myDrop (n - 1) (tail xs)

isOdd n = mod n 2 == 1

multList n [] = []
multList n (x:xs) = n*x : multList n xs

larger x y =
	if x>y 
		then x
		else y

smaller x y =
	if x<y then
		x
	else
		y

-- Double colon is a type declaration.
mysequence :: (Num a, Ord a) => a -> a -> [a] -> [a]
mysequence lower upper accum_list =
    if upper<lower
        then accum_list
        else mysequence lower (upper-1) (upper:accum_list)


roots a b c = 
        let
            det2 = b*b-4*a*c;
            det  = sqrt(det2);
            rootp = (-b + det)/a/2;
            rootm = (-b - det)/a/2;
        in
            [rootm,rootp]


-- below is an example of a case statement in Haskell
data Color = Red | Blue | Yellow

color = set_color
action = case color of
	Red -> action1
	Blue -> action2
	Yellow -> action3
--------------------------------------------------------

-- below is a Map structure in Haskell
-- Essentially equivalent of Java:
-- Map<String, Integer> set = new HashMap<String, Integer>();
-- important to remember that set isn't immutable like in Java.
-- import functionality
import Data.Map
set :: Data.Map.Map String Integer
set = Data.Map.empty
-- to insert:
-- set' is a different variable to set.
set' = Data.Map.insert "100" 100 set
------------------------------------------------------------
{- Random bits a pieces from week one below:

-- add3nums = \x y z -> x + y + z

-- minmax = \x y -> [min x y, max x y]
	-- minmax 3 8	returns [3,8]
	-- minmax 8 3	returns [3,8] 

-- answer = 42
-- yourlist = [7, answer+1, 7*8]
-- yourlist  



-- [0 .. 5] -- > [0,1,2,3,4,5]
-- [100 .. 103] -- > [100,101,102,103]


[3*x | x <- [1..10]]
-- >
[3,6,9,12,15,18,21,24,27,30]

[2*x | x <- [0..10]]
-- >
[0,2,4,6,8,10,12,14,16,18,20]

[2*x + 1 | x <- [0..10]]
-- >  
[1,3,5,7,9,11,13,15,17,19,21]

[[a,b] | a <- [10,11,12] , b <- [20,21]]
-- >
[[10,20],[10,21],[11,20],[11,21],[12,20],[12,21]]




[5,3,8,7]  !! 2    -- > 8
[0 .. 100]  !! 81  -- > 81
['a'..'z'] !! 13  -- > 'n'




Example of lazy evaluation in Haskell with lists as example
xs = [1,2,xs2 !! 5,4]
xs2 = xs ++ xs
xs2 !! 2 -- > 2
xs !! 2 -- > 2


let f = \x->do {print x;f(x+10)} in f 10

-}
