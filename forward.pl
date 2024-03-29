american(robert).
enemy(country_a).
missiles(country_a).
criminal(X) :-
    american(X),
    sells_weapons(X, Y ),
    enemy(Y).

sells_weapons(robert, Y) :-
    american(robert),
    missiles(Y).
criminal(robert) :- american(robert), sells_weapons(robert, country_a), enemy(country_a).
