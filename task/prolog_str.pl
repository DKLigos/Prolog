longword(X):-split_string(X, ".", "",[L1,L2,L3|_]),
    split_string(L1," ","",Z1),
    split_string(L2," ","",Z2),
    split_string(L3," ","",Z3),
    max_ln(Z1,Z2,Z3).


max_ln(X,Y,Z):-max_ln(X,Y,Z,0,_),!.
max_ln([],_,_,_,R):-write(R),!.
max_ln([X1|X],Y,Z,L,_):-
    string_length(X1,LEN),LEN>L,
    member(X1,Y), member(X1,Z),
    max_ln(X,Y,Z,LEN,X1).
max_ln([_|X],Y,Z,L,R):- max_ln(X,Y,Z,L,R).

