% Thomas L.A. Elliott (te80).
:- use_module(library(clpfd)).

% 1) 
% distances(Bs, B, Ds)
distances([], _B, []).
distances([H|T], B, [D|Ds]):-
	D #= abs(B-H),
	distances(T, B, Ds).

% 2) 
% triangle(Bs, Ds)
triangle([], []).
triangle([B | Bs], Ds):- 
	distances(Bs, B, D1),
	triangle(Bs, D2),
	append(D1, D2, Ds).

% 3)
bananas(Bs):-
	Bs = [_A, _B, _C, _D],
	Bs ins 1..10,
    	triangle(Bs, Ds), 
    	all_different(Ds),
	labeling([], Bs).

% 4)
main(Solns) :-
    	findall(Bs,bananas(Bs),List),
    	length(List,Solns).
