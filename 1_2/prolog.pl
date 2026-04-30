frequencies([], []).
frequencies([H|T], [[H, Count]|FreqT]) :-
    count_and_remove([H|T], H, Count, Rest),
    frequencies(Rest, FreqT).

count_and_remove([], _, 0, []).
count_and_remove([H|T], Val, Count, Rest) :-
    H =:= Val,
    count_and_remove(T, Val, C1, Rest),
    Count is C1 + 1.
count_and_remove([H|T], Val, Count, [H|Rest]) :-
    H =\= Val,
    count_and_remove(T, Val, Count, Rest).

max_freq([[_, F]], F).
max_freq([[_, F]|T], Max) :-
    max_freq(T, TMax),
    (F > TMax -> Max = F ; Max = TMax).

extract_elements([], _, []).
extract_elements([[Elem, Freq]|T], MaxF, [Elem|ResT]) :-
    Freq =:= MaxF, extract_elements(T, MaxF, ResT).
extract_elements([[_, Freq]|T], MaxF, ResT) :-
    Freq =\= MaxF, extract_elements(T, MaxF, ResT).

most_frequent([],[]).
most_frequent(List, Result) :-
    frequencies(List, Freqs),
    max_freq(Freqs, MaxF),
    extract_elements(Freqs, MaxF, Result).

main :-
    run_test(2, 1,[], most_frequent),
    run_test(2, 2, [42], most_frequent),
    run_test(2, 3,[1, 2, 2, 3, 3, 1, 2, 1], most_frequent),
    run_user_test(2, 4, most_frequent).

run_test(_, TestNum, Input, Predicate) :-
    format('Тест ~w.~n', [TestNum]),
    format('Вхідні дані: ~w~n', [Input]),
    call(Predicate, Input, Result),
    format('Результат: ~w~n~n',[Result]).

run_user_test(_, TestNum, Predicate) :-
    format('Тест ~w. Ввід користувача~n', [TestNum]),
    write('Введіть список цілих чисел у форматі "[1,2,3].": '),
    read(Input),
    format('Вхідні дані: ~w~n', [Input]),
    call(Predicate, Input, Result),
    format('Результат: ~w~n~n', [Result]).
