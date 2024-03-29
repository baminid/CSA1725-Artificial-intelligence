male(john).
male(mike).
male(peter).
male(mark).
female(sarah).
female(emily).
female(lisa).

parent(john, sarah).
parent(john, emily).
parent(john, mark).
parent(sarah, lisa).
parent(mike, sarah).
parent(mike, emily).
parent(mike, mark).
parent(lisa, peter).

% Rules for defining relationships
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).
male(john).
male(mike).
male(peter).
male(mark).
female(sarah).
female(emily).
female(lisa).

parent(john, sarah).
parent(john, emily).
parent(john, mark).
parent(sarah, lisa).
parent(mike, sarah).
parent(mike, emily).
parent(mike, mark).
parent(lisa, peter).

% Rules for defining relationships
father(Father, Child) :-
    male(Father),
    parent(Father, Child).

mother(Mother, Child) :-
    female(Mother),
    parent(Mother, Child).

grandparent(Grandparent, Grandchild) :-
    parent(Grandparent, Parent),
    parent(Parent, Grandchild).

sibling(Person1, Person2) :-
    parent(Parent, Person1),
    parent(Parent, Person2),
    Person1 \= Person2.

ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Descendant).
ancestor(Ancestor, Descendant) :-
    parent(Ancestor, Intermediate),
    ancestor(Intermediate, Descendant).


descendant(Descendant, Ancestor) :-
    ancestor(Ancestor, Descendant).
Family_tree
