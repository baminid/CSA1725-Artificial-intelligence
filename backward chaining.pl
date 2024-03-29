% Rule 1: If X is a mammal, then X is warm-blooded.
is_mammal(X) :- is_warm_blooded(X).
is_warm_blooded(X) :- is_mammal(X).

% Rule 2: If X gives birth to live young, then X is a mammal.
gives_birth_to_live_young(X) :- is_mammal(X).

% Rule 3: Dog gives birth to live young.
gives_birth_to_live_young(dog).

% Define a predicate to initiate backward chaining
% This predicate takes a query and tries to find a proof for it using backward chaining
prove(Query) :-
    call(Query), % Try to prove the query
    write('Query is true: '), write(Query), nl. % If successful, print that the query is true
prove(Query) :-
    \+ call(Query), % If the query cannot be directly proven
    clause(Query, Body), % Get the body of the clause corresponding to the query
    prove(Body). % Recursively try to prove the body of the clause
