-- Задача 7
-- Определите функцию, удаляющую в исходном списке все повторные вхождения элементов.
deleteSameElems :: (Eq a) => [a] -> [a]
deleteSameElems list = deleteSameElems list []
          where deleteSameElems [] acc = acc
                deleteSameElems [x] acc = (acc ++ [x])
                deleteSameElems (x:xs) acc
                  | x == (head xs)  = deleteSameElems xs acc
                  | otherwise       = deleteSameElems xs (acc ++ [x])


-- Задача 9
-- Определите функцию, которая обращает список (а b с) и разбивает его на уровни (((с) b) а).
reversing :: [Int] -> [Int]
reversing [] = []
reversing x = reversing (tail x) ++ [head x]


-- Задача 16
-- Определите предикат МНОЖЕСТВО-Р, который проверяет, является ли список
-- множеством, т.е. входит ли каждый элемент в список лишь один раз.
checkIsSet::(Eq a) => [a] -> Bool
checkIsSet list
    | list == [] = True
    | (head list) `elem` (tail list) = False
    | otherwise = checkIsSet(tail list)

--  Задача 22 
-- Определите функцию ОБЪЕДИНЕНИЕ, формирующую объединение двух множеств.
union :: [a] -> [a] -> [a]
union xs [] = xs
union [] ys = ys
union (x:xs) (y:ys) = x : y : union xs ys

-- Задача 24
-- Определите функцию РАЗНОСТЬ, формирующую разность двух множеств, т.е. удаляющую из 
-- первого множества все общие со вторым множеством элементы.
difference :: [Integer] -> [Integer] -> [Integer]
difference xs ys = quicksort([] ++ combine xs ys)
    where combine [] _ = []
          combine (c:cs) bs = if (elem c bs)
                               then combine cs bs
                              else c : combine cs bs
                              
quicksort :: Ord a => [a] -> [a]
quicksort [] = []
quicksort(e:es) = quicksort smaller ++ [e] ++ quicksort bigger
    where bigger = [b | b <- es, b>e]
          smaller = [a | a <- es, a<e]

main = do
    putStrLn "Задача 7"
    putStrLn "Ввод: [1,2,3,3,3,4,5,5]"
    putStr "Вывод: "
    print $ deleteSameElems [1,2,3,3,3,4,5,5]
    putStrLn "Ввод: aaabbcc"
    putStr "Вывод: "
    print $ deleteSameElems "aaabbcc"

    putStrLn "_____________________________________"

    putStrLn "Задача 9"
    putStrLn "Ввод: [1,2,3,4,5]"
    putStr "Вывод: [5,4,3,2,1]"
    print $ reversing [1,2,3,4,5]

    putStrLn "_____________________________________"

    putStrLn "Задача 16"
    putStrLn "Ввод: [1,2,3,4,5]"
    putStr "Вывод: True"
    print $ checkIsSet [1,2,3,4,5]
    putStrLn "Ввод: [1,2,1]"
    putStr "Вывод: False"
    print $ checkIsSet [1,2,1]

    putStrLn "_____________________________________"

    putStrLn "Задача 22"
    putStrLn "Ввод: [1,2,3] [3,4,5]"
    putStr "Вывод: [1,3,2,4,3,5]"
    print $ union [1,2,3] [3,4,5]

    putStrLn "_____________________________________"

    putStrLn "Задача 24"
    putStrLn "Ввод: [1,2,3,4] [1,2]"
    putStr "Вывод: []"
    print $ difference [1,2,3,4] [1,2]
    putStrLn "Ввод: [1,2] [1,2]"
    putStr "Вывод: []"
    print $ difference [1,2] [1,2]
  

