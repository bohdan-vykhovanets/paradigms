splitSymmetric :: [a] -> [[a]]
splitSymmetric xs = helper xs 1

helper :: [a] -> Int -> [[a]]
helper xs n
    | length xs == 0    = []
    | length xs < 2 * n = [xs]
    | otherwise         = 
        let len   = length xs
            front = take n xs
            back  = drop (len - n) xs
            mid   = take (len - 2 * n) (drop n xs)
        in  front : (helper mid (n + 1) ++ [back])

main :: IO ()
main = do
    putStrLn "Тест 1. Порожній список"
    let list1 = [] :: [Int]
    putStrLn "Вхідні дані:"
    print list1
    putStrLn "Результат:"
    print (splitSymmetric list1)

    putStrLn "Тест 2. Список з одним елементом"
    let list2 = [148]
    putStrLn "Вхідні дані:"
    print list2
    putStrLn "Результат:"
    print (splitSymmetric list2)

    putStrLn "Тест 3. Довгий список (повноцінний поділ)"
    let list3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    putStrLn "Вхідні дані:"
    print list3
    putStrLn "Результат:"
    print (splitSymmetric list3)

    putStrLn "Тест 4. Ввід користувача (формат: [1,2,3,4,5,6,7,8])"
    input <- getLine
    let list4 = read input :: [Int]
    putStrLn "Вхідні дані:"
    print list4
    putStrLn "Результат:"
    print (splitSymmetric list4)
