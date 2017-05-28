:-use_module(library(clpfd)).

wedding(X):-
	  X = [B, G, BM1, BM2, BGF, BGM, BF, BSM, BM, M],
	  X ins 1..10,
	  B in 5..6,
	  G in 5..6,
	  M in 1\/10,
	  all_different(X),
	  abs(BM1-BM2) #= 1,
	  abs(BF-BM) #> 1,
	  labeling([], X).
