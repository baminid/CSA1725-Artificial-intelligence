
planet(mercury, 0.39, 0).
planet(venus, 0.72, 0).
planet(earth, 1.0, 1).
planet(mars, 1.52, 2).
planet(jupiter, 5.20, 79).
planet(saturn, 9.58, 82).
planet(uranus, 19.22, 27).
planet(neptune, 30.05, 14).

distance_from_sun(Planet, Distance) :-
    planet(Planet, Distance, _).

number_of_moons(Planet, Moons) :-
    planet(Planet, _, Moons).


habitable(Planet) :-
    planet(Planet, Distance, Moons),
    Distance > 0.38,
    Distance < 30,
    Moons < 20.
