import Control.Monad.RWS (MonadState(put))
moveMaxToFront :: [Int] -> [Int]
moveMaxToFront [] = []
moveMaxToFront xs = 
    let maxElem = maximum xs
        maxes   = filter (== maxElem) xs
        others  = filter (/= maxElem) xs
    in  maxes ++ others

main :: IO ()
main = do
    putStrLn "Тест 1. Порожній список"
    let list1 = [] :: [Int]
    putStrLn "Вхідні дані:"
    print list1
    putStrLn "Результат:"
    print (moveMaxToFront list1)

    putStrLn "Тест 2. Список з одним елементом"
    let list2 = [148]
    putStrLn "Вхідні дані:"
    print list2
    putStrLn "Результат:"
    print (moveMaxToFront list2)

    putStrLn "Тест 3. Список з кількома однаковими максимальними елементами"
    let list3 = [1, 3, 2, 3, 1, 3]
    putStrLn "Вхідні дані:"
    print list3
    putStrLn "Результат:"
    print (moveMaxToFront list3)

    putStrLn "Тест 4. Ввід користувача"
    input <- getLine
    let list4 = read input :: [Int]
    putStrLn "Вхідні дані:"
    print list4
    putStrLn "Результат:"
    print (moveMaxToFront list4)
