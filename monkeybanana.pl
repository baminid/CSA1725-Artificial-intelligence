
initial_state(state(middle, onfloor, middle, hasnot)).
final_state(state(_, _, _, has)
action(go(X, Y), state(X, onfloor, X, Banana), state(Y, onfloor, Y, Banana)).
action(push(X, Y), state(X, onfloor, X, Banana), state(Y, onfloor, Y, Banana)).
action(climbup, state(X, onfloor, X, Banana), state(X, onbox, X, Banana)).
action(climbdown, state(X, onbox, X, Banana), state(X, onfloor, X, Banana)).
action(grab, state(X, onfloor, X, hasnot), state(X, onfloor, X, has)).
valid(state(_, _, _, has)) :- !.
valid(state(_, _, Y, _)) :- Y \= has.
valid([]).
valid([Action|Actions]) :-
    action(Action, State, NextState),
    valid(NextState),
    valid(Actions).
dfs([State|Visited], [Action|Actions]) :-
    action(Action, State, NextState),
    valid(NextState),
    \+ member(NextState, Visited),
    dfs([NextState,State|Visited], Actions).
