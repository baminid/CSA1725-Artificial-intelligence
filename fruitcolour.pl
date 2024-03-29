fruit_color(apple, red).
fruit_color(banana, yellow).
fruit_color(grape, purple).
fruit_color(orange, orange).
fruit_color(lemon, yellow).
fruit_color(blueberry, blue).
fruit_color(watermelon, green).

% Predicate to find the color of a fruit
color_of_fruit(Fruit, Color) :-
    fruit_color(Fruit, Color).

% Predicate to find the fruit of a color
fruit_of_color(Fruit, Color) :-
    fruit_color(Fruit, Color).
