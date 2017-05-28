:- use_module(library(clpfd)).

fireball(Sol) :-
	Sol = [A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P],
	Sol ins 1..9,
	A+B #= 5, C+D+E+F #= 29, G+H #= 14,
	I+J #= 4, K+L+M+N #= 16, O+P #= 7,
	A+D+H+K #= 18, B+E #= 13, C+G #= 16, F+I+M+P #= 11,
	J+N #= 3, L+O #= 14, A #\= B, G #\= H, I #\= J, 
    	O #\= P, J #\= N, L #\= O, C #\=D, C #\=E, C #\=F,
    	D #\= E, D #\= F, E #\= F, K #\= L, K #\= M, K #\= N,
    	L #\= M, L #\= N, M #\= N, A #\= D, A #\= H, A #\= K,
    	D #\= H, D #\= K, H #\= K,
	label(Sol).
