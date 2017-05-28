:- use_module(library(clpfd)).

paint(Rooms) :-
	Rooms = [A, B, C, D, E, F, G],
	Rooms ins 1..4,
	A #\= B, A #\= C,
	A #\= D, A #\= E,
	A #\= F, A #\= G,
	B #\= C, C #\= D,
	E #\= F, E #\= G,
	F #\= G,
	labeling([], Rooms).

main(X):- 
	findall(Rooms, paint(Rooms), Z), 
	length(Z,X).
