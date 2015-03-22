module Examples where

length' [] = 0
length' (x:xs)
    | (length xs == 4) = 10 + length' xs
    | otherwise         = 1 + length' xs

compare' xs ys = compare (length xs) (length ys)
