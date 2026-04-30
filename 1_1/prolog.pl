append([], L, L).
append([H|T], L, [H|Rest]) :- append(T, L, Rest).

find_max([X], X).
find_max([H|T], Max) :-
    find_max(T, TMax),
    (H > TMax -> Max = H ; Max = TMax).

split_by_max([], _, [], []).
split_by_max([H|T], Max, [H|Maxes], Others) :-
    H =:= Max, split_by_max(T, Max, Maxes, Others).
split_by_max([H|T], Max, Maxes, [H|Others]) :-
    H =\= Max, split_by_max(T, Max, Maxes, Others).

move_max_to_front([], []).
move_max_to_front([H|T], Result) :-
    find_max([H|T], Max),
    split_by_max([H|T], Max, Maxes, Others),
    append(Maxes, Others, Result).

main :-
    run_test(1, 1, [], move_max_to_front),
    run_test(1, 2, [148], move_max_to_front),
    run_test(1, 3,[1, 3, 2, 3, 1, 3], move_max_to_front),
    run_user_test(1, 4, move_max_to_front).

run_test(_, TestNum, Input, Predicate) :-
    format('Тест ~w.~n', [TestNum]),
    format('Вхідні дані: ~w~n', [Input]),
    call(Predicate, Input, Result),
    format('Результат: ~w~n~n', [Result]).

run_user_test(_, TestNum, Predicate) :-
    format('Тест ~w. Ввід користувача~n', [TestNum]),
    write('Введіть список цілих чисел у форматі "[1,2,3].": '),
    read(Input),
    format('Вхідні дані: ~w~n',[Input]),
    call(Predicate, Input, Result),
    format('Результат: ~w~n~n', [Result]).
