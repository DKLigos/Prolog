z([],_):-!.
z([H|T],[L]):-
    find(H,[H|T],R,N),N>3,
    z(R,L),!.

find(_,[],0,0):-!.
find(E,[E|T],R,N):-
        find(E,T,R,N1),
        N is N1+1,!.
find(E,[E|T],R,N):-find(E,T,R,N).
