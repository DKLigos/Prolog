length1([],0):-!.
length1([_|Y],Z):-length1(Y,Z1), Z is Z1+1.

member(X,[X|_]):-!.
member(X,[_|Y]):-member(X,Y).
p([]):-!.
p([H|T]):- member(H, T),!.
p([T]).

