:-dynamic edge/2.
readgr:-see('C:/Users/Zubko/Desktop/Prolog/edge.pl'),readall,seen.
readall:- read(X), assert(X), X=end_of_file.
readall:- readall.

add_point(N,H):-assert(edge(N,H)).

add_edge(Point1,Point2):-assert(edge(Point1,Point2)).


findall(List,List2):-findall(X,edge(X,_),List),findall(Y,edge(_,Y),List2).
concatList([],[],[]):-!.
concatList([H1|T1],[H2|T2],[H1-H2|R]):-
    concatList(T1,T2,R).


transitive_closurel(Graph, Closure) :-
warshall(Graph, Graph, Closure).

warshall([], Closure, Closure) :- !.
warshall([V-_|G], E, Closure) :-
memberchk(V-Y, E),
warshall(E, V, Y, NewE),
warshall(G, NewE, Closure).

warshall([X-Neibs|G], V, Y, [X-NewNeibs|NewG]) :-
memberchk(V, Neibs),
!,
ord_union(Neibs, Y, NewNeibs),
warshall(G, V, Y, NewG).
warshall([X-Neibs|G], V, Y, [X-Neibs|NewG]) :-
!,
warshall(G, V, Y, NewG).
warshall([], _, _, []).


transitive(L):-findall(List1,List2),concatList(List1,List2,R),
    transitive_closurel(R,L).




