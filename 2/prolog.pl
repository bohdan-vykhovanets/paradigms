my_length([], 0).
my_length([_|T], N) :- my_length(T, N1), N is N1 + 1.

my_take(0, List,[], List).
my_take(N, [H|T], [H|ChunkT], Rest) :-
    N > 0, N1 is N - 1,
    my_take(N1, T, ChunkT, Rest).

my_append([], L, L).
my_append([H|T], L, [H|Rest]) :- my_append(T, L, Rest).

build_pattern(0, _,[]) :- !.
build_pattern(Len, Curr, Pattern) :-
    Needed is Curr * 2,
    Len >= Needed, !, 
    Rem is Len - Needed,
    NextCurr is Curr + 1,
    build_pattern(Rem, NextCurr, MidPattern),
    my_append([Curr|MidPattern], [Curr], Pattern).
build_pattern(Len, _, [Len]).

split_by_sizes([], [], []).
split_by_sizes(List, [Size|SizesT],[Chunk|ChunksT]) :-
    my_take(Size, List, Chunk, Rest),
    split_by_sizes(Rest, SizesT, ChunksT).

split_symmetric([],[]).
split_symmetric(List, Result) :-
    my_length(List, Len),
    build_pattern(Len, 1, Sizes),
    split_by_sizes(List, Sizes, Result).

main :-
    run_test(3, 1,[], split_symmetric),
    run_test(3, 2, [9], split_symmetric),
    run_test(3, 3,[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], split_symmetric),
    run_user_test(3, 4, split_symmetric).

run_test(_, TestNum, Input, Predicate) :-
    format('Тест ~w.~n', [TestNum]),
    format('Вхідні дані: ~w~n', [Input]),
    call(Predicate, Input, Result),
    format('Результат: ~w~n~n', [Result]).

run_user_test(_, TestNum, Predicate) :-
    format('Тест ~w. Ввід користувача~n', [TestNum]),
    write('Введіть список цілих чисел у форматі "[1,2,3].": '),
    read(Input),
    format('Вхідні дані: ~w~n', [Input]),
    call(Predicate, Input, Result),
    format('Результат: ~w~n~n', [Result]).
