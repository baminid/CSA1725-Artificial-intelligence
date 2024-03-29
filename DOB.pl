dob(john, '1990-05-15').
dob(lisa, '1985-11-20').
dob(mary, '1978-09-10').
dob(mark, '2000-03-25').
dob(anna, '1995-07-08').


older(Name1, Name2) :-
    dob(Name1, DOB1),
    dob(Name2, DOB2),
    older_than(DOB1, DOB2).

older_than(Date1, Date2) :-
    Date1 @< Date2.
