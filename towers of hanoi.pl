

hanoi(1, Source, _, Destination) :-

    write('Move disk from '), write(Source),
    write(' to '), write(Destination), nl.
hanoi(N, Source, Auxiliary, Destination) :-

    M is N - 1,
    hanoi(M, Source, Destination, Auxiliary),

    hanoi(1, Source, _, Destination),

    hanoi(M, Auxiliary, Source, Destination).


