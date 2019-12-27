great(_, [], 0):-!. %Выводит числа > заданного N
great(N,[H|Q],X):-H>N,great(N,Q,X1),X is X1+1.
great(N,[H|Q],X):- H=< N, great(N,Q,X).

%Попытка подсчитать заданное число
%
find1(H,[H|T],R,CC):-find(H,[H|T],R,0,CC).
find(_,[],[],C,CC):-CC is C,!.
find(H,[H|T],R,C,CC):-
    C1 is C+1,
    find(H,[H|T],R,C1,CC),!.
find(H,[H|T],[H|R],C,CC):-find(H,T,R,C,CC).












%Считает кол-во вхождений слов (Не мое)
co(X,L) :- co(X,[],L).
co([],A,A).
co([X|Xs], A, L) :-p(X-Z,A,R), !, Z1 is Z+1, co(Xs,[X-Z1|R], L).
co([X|Xs], A, L) :- co(Xs, [X-1|A], L).

p(X-Y,[X-Y|R],R):- !.
p(X,[H|Y],[H|Z]):- p(X,Y,Z).














