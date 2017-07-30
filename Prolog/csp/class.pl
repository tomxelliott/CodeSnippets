:- use_module(library(clpfd)).

class(X):-
    X = [A,B,C,D,E,F],
    X ins 1..6,
    difference(A,C),
    difference(A,E),
    difference(B,D),
    difference(B,E),
    difference(C,F),
    all_different(X),
    labeling([], X).


difference(A, B):-
	  abs(A-B) #> 2.

q(X):-
	  findall(X, class(X), Z),
	  length(Z,X).
