countOccurrences :: Int -> [Int] -> Int
countOccurrences target xs = length (filter (== target) xs)

removeDuplicates :: [Int] -> [Int]
removeDuplicates [] = []
removeDuplicates (x : rest) = x : removeDuplicates (filter (/= x) rest)

mostFrequent :: [Int] -> [Int]
mostFrequent [] = []
mostFrequent xs = 
    let uniqueElems = removeDuplicates xs
        counts      = map (\x -> countOccurrences x xs) uniqueElems
        maxCount    = maximum counts
    in  filter (\x -> countOccurrences x xs == maxCount) uniqueElems

main :: IO ()
main = do
    putStrLn "Тест 1. Порожній список"
    let list1 = [] :: [Int]
    putStrLn "Вхідні дані:"
    print list1
    putStrLn "Результат:"
    print (mostFrequent list1)

    putStrLn "Тест 2. Список з одним елементом"
    let list2 = [148]
    putStrLn "Вхідні дані:"
    print list2
    putStrLn "Результат:"
    print (mostFrequent list2)

    putStrLn "Тест 3. Список з кількома елементами, які зустрічаються однакову кількість разів"
    let list3 = [1, 2, 2, 2, 3, 3, 3, 4, 5]
    putStrLn "Вхідні дані:"
    print list3
    putStrLn "Результат:"
    print (mostFrequent list3)

    putStrLn "Тест 4. Ввід користувача"
    input <- getLine
    let list4 = read input :: [Int]
    putStrLn "Вхідні дані:"
    print list4
    putStrLn "Результат:"
    print (mostFrequent list4)
