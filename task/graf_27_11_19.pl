edge(1,2).
edge(1,4).
edge(1,3).
edge(2,4).
edge(4,3).
edge(4,5).
edge(5,3).
edge(5,6).

children(1,[2,3,4]).
children(2,[1,4]).
children(3,[1,4,5]).
children(4,[1,2,3,5]).
children(5,[3,4,6]).
children(6,[5]).

search(X,Y,[X,Y]):-edge(X,Y);edge(Y,X),!.
search(X,Y,[X|Y]):-(edge(X,Z);edge(Z,X)),
    search(Z,Y,T),not(member(X,T)),!.
search(X,Y,T):-(edge(X,Z);edge(Z,X)),
    search(Z,Y,T).
path(X,Y,T):-path(X,Y,[],T).
path(X,Y,Seen,[X,Y]):- \+memberchk(X,Seen),(edge(X,Y);edge(Y,X)).
path(X,Z,Seen,[X|T]):- \+ memberchk(X,Seen),
                    (edge(X,Y);edge(Y,X)),
           path(Y,Z,[X|Seen],T),\+memberchk(X,T).
path_first(Start,Answer):-path_start([Start],Answer),!.
path_start([X|T],Y):-children(X,C),member(Z,C), \+memberchk(Z,[X|T]),path_start([Z,X|T],Y).
path_start(X,Y):-reverse(X,Y).
