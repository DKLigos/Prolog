member(X,[X|_]):-!.
member(X,[_|Y]):-member(X,Y).
p([]):-!.
p([H|T]):- member(H, T),!.
p([T]).
