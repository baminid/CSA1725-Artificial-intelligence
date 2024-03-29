% best_first_search(Start, Goal, Path) is true if Path is a path from Start to Goal, found by Best First Search.
best_first_search(Start, Goal, Path) :-
    best_first_search([[Start]], Goal, Path).

% Base case: Current path ends in the goal state.
best_first_search([[Goal|Path]|_], Goal, [Goal|Path]) :-
    write('Goal reached: '), write([Goal|Path]), nl.

% Recursive case: Expand the current path to its successor states and enqueue them based on the heuristic.
best_first_search([[Current|Path]|Paths], Goal, FinalPath) :-
    write('Expanding node: '), write(Current), nl,
    findall([Next, Current|Path],
            (succ(Current, Next), \+ member(Next, [Current|Path])),
            Successors),
    evaluate(Successors, Goal, Evaluated),
    append(Paths, Evaluated, NewPaths),
    sort_paths(NewPaths, SortedPaths),
    best_first_search(SortedPaths, Goal, FinalPath).

% Evaluate successor states based on the heuristic function.
evaluate([], _, []).

evaluate([[State|Path]|Successors], Goal, [[State|Path]|Evaluated]) :-
    heuristic(State, Goal, H),
    evaluate(Successors, Goal, Evaluated),
    insert_ordered([[State|Path]], H, Evaluated).

% Heuristic function (in this case, a simple one: distance from the goal state).
heuristic(State, Goal, H) :-
    distance(State, Goal, H),
    write('Heuristic value for '), write(State), write(': '), write(H), nl

% Distance function (just an example, can be customized for specific problem domains).
distance(State, Goal, Distance) :-
    % Example: Calculate distance as the absolute difference between two values.
    State = [X1, Y1],
    Goal = [X2, Y2],
    Distance is abs(X2 - X1) + abs(Y2 - Y1),
    write('Distance between '), write(State), write(' and '), write(Goal), write(': '), write(Distance), nl.

% Insert a path into a list of paths ordered by heuristic value.
insert_ordered(Path, _, [], [Path]).

insert_ordered(Path, H, [[State2|Path2]|Paths], [[State2|Path2]|Result]) :-
    heuristic(State2, Goal, H2),
    H =< H2,
    insert_ordered(Path, H, Paths, Result).

insert_ordered(Path, H, Paths, [Path|Paths]).

% Sort paths based on heuristic value.
sort_paths(Paths, Sorted) :-
    predsort(compare_heuristic, Paths, Sorted).

% Compare paths based on heuristic value.
compare_heuristic(Result, [Path1|_], [Path2|_]) :-
    heuristic(Path1, Goal, H1),
    heuristic(Path2, Goal, H2),
    compare(Result, H1, H2).

% Define successor states here (specific to the problem domain).
% Replace this with your actual successor function.
succ(State, Next) :-
    % Example: For simplicity, successor states are just incremented integers.
    State < 5,
    Next is State + 1,
    write('Successor of '), write(State), write(': '), write(Next), nl.

% Example usage:
% best_first_search(StartState, GoalState, Path).
