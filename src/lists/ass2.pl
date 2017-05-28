% Thomas L.A. Elliott (te80).
%------------------------------------
% Q1) same_content/2
% ?-same_content([1,2,4,2],[4,2,1]) would succeed.
% -----------------------------------
same_content(X,Y) :- sort(X,XS), sort(Y,YS), compare(=,XS,YS).


%------------------------------------
% Q2) totatives/2
% -----------------------------------
totatives(N,Xs) :- aux(N,N,Xs).

aux(_X,0,[]).
aux(X,Y,[Y|T]) :- Y>0, 1 is gcd(X,Y), !, YY is Y-1, aux(X,YY,T).
aux(X,Y,T) :- Y>0, YY is Y-1, aux(X,YY,T).


%------------------------------------
% Q3) aNatural/1
% -----------------------------------
aNatural(X) :- integer(X), X >= 0, !.
aNatural(X) :- var(X), between(0,infinite,X).


%------------------------------------
% Q4) anInteger/1
% -----------------------------------
anInteger(X) :- integer(X), !.
anInteger(X) :- var(X), nextInteger(0,X).

nextInteger(X,Y) :- Y is -X.
nextInteger(X,Y) :- X1 is X+1, nextIntegerAlt(X1,Y).

nextIntegerAlt(X,Y) :- Y is -X.
nextIntegerAlt(X,X).
nextIntegerAlt(X,Y) :- X1 is X+1, nextIntegerAlt(X1,Y).

%------------------------------------
% Q5) eval/2
% -----------------------------------
eval(X*Y, Z) :- var(X), !, X is div(Z,Y).
eval(X*Y, Z) :- var(Y), !, Y is div(Z,X).
eval(X*Y, Z) :- var(Z), !, Z is *(X,Y).
eval(X/Y, Z) :- var(X), !, X is *(Z,Y).
eval(X/Y, Z) :- var(Y), !, Y is div(X,Z).
eval(X/Y, Z) :- var(Z), !, Z is div(X,Y).
eval(X+Y, Z) :- var(X), !, X is -(Z,Y).
eval(X+Y, Z) :- var(Y), !, Y is -(Z,X).
eval(X+Y, Z) :- var(Z), !, Z is +(X,Y).
eval(X-Y, Z) :- var(X), !, X is +(Z,Y).
eval(X-Y, Z) :- var(Y), !, Y is +(Z,X).
eval(X-Y, Z) :- var(Z), !, Z is -(X,Y).
eval(mod(X,Y), Z) :- var(X), !, anInteger(Xs), Result is mod(Xs,Y), Z =:= Result -> X = Result.
eval(mod(X,Y), Z) :- var(X), !, X is +(Y,Z). 
eval(mod(X,Y), Z) :- var(Y), !, Y is -(X,Z). 
eval(mod(X,Y), Z) :- var(Z), !, Z is mod(X,Y).
eval(X*Y, Z) :- Z is *(X,Y), !.
eval(X/Y, Z) :- Z is div(X,Y), !.
eval(X+Y, Z) :- Z is +(X,Y), !.
eval(X-Y, Z) :- Z is -(X,Y), !.
eval(mod(X,Y), Z) :- Z is mod(X,Y), !.
