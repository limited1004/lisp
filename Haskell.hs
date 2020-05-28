import Data.List
  
-- Задача №16
-- Определите предикат РАВЕНСТВО-МНОЖЕСТВ, проверяющий совпадение двух множеств (независимо от порядка следования элементов). Подсказка:
-- напишите функцию УДАЛИТЬ, удаляющую данный элемент из множества.

allDifferent :: (Eq a) => [a] -> Bool
allDifferent list = case list of
    []      -> True
    (x:xs)  -> x `notElem` xs && allDifferent xs

-- Задача №18
-- Определите предикат РАВЕНСТВО-МНОЖЕСТВ, проверяющий совпадение двух множеств (независимо от порядка следования элементов). Подсказка:
-- напишите функцию УДАЛИТЬ, удаляющую данный элемент из множества.

check_lists :: (Eq a) => [a] -> [a] -> Bool
check_lists xs ys = null (xs \\ ys) && null (ys \\ xs)

-- Задача №19
-- Определите функцию ПОДМНОЖЕСТВО, которая проверяет, является ли одно мно-
-- жество подмножеством другого. Определите такое СОБСТВЕННОЕ-ПОДМНОЖЕСТВО.

subSet :: Eq a => [a] -> [a] -> Bool
subSet [] [] = True
subSet _ []    = False
subSet [] _    = True
subSet (x:xs) (y:ys) 
    | x == y    = subSet xs ys   
    | otherwise = subSet (x:xs) ys

-- Задача №25
-- Реализовать алгоритм быстрой сортировки.

qsort :: Ord a => [a] -> [a]
qsort []     = []
qsort (x:xs) = qsort lesser ++ [x] ++ qsort greater
    where
        lesser  = filter (< x) xs
        greater = filter (>= x) xs


main = do 

       putStrLn "Task 16"
       print (allDifferent [5,4,3,2,1,2]) 
       print (allDifferent [1,2]) 
       print (allDifferent [1,2,3,4,5,1,4])

       putStrLn " "
       putStrLn "Task 18"
       print (check_lists [5,4,3,2,1,2] [1,2,3,4,2,5]) 
       print (check_lists [1,2] [2,2,1]) 
       print (check_lists [1,2,3,4,5,1,4] [1,2,3,4,4,1])

       putStrLn " "
       putStrLn "Task 19"
       print (subSet [3] [1,2,3])
       print (subSet [1] [4,2,3])
       print (subSet [1] [])
       print (subSet [1,2] [1,2])
       print (subSet [1,2] [2,1])

       putStrLn " "
       putStrLn "Task 25"
       print (qsort [1,2,3,2,4,1,4])
       print (qsort [1,2,3,5,6,1,4])
       print (qsort [1,2,1,3,4,5,4])
