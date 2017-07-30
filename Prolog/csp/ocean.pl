:- use_module(library(clpfd)).

ocean(Sol):-
    Sol = [O, C, E, A, N, U],
    Sol ins 0..9,
    all_different(Sol),
    abs(E+A+U) * abs(E+A+U) #= abs(O+C+E+A+N),
    labeling([], Sol).
