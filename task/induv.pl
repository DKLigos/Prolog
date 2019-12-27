% количество вхождений элемента в список
count_member(_,[],0):-!.
count_member(X,[X|T],R1):-count_member(X,T,R2),R1 is R2+1,!.
count_member(X,[_|T],R):-count_member(X,T,R),!.

% удаление всех элементов из списка с заданным значением
delete_all(_,[],[]):-!.
delete_all(X,[X|T],R):-delete_all(X,T,R),!.
delete_all(X1,[X2|T],[X2|R]):-delete_all(X1,T,R),!.

list_set([],[]):-!.
list_set([H|T],[H|T1]):-delete_all(H,T,T2), list_set(T2,T1),!.
% слияние двух списков
my_append([],R,R):-!.
my_append([H|T],L,[H|R]):-my_append(T,L,R).


solution([],[]):-!.
%solution(L,R):-solution(L,L,R),!.
solution(L,R1):-solution(L,L,R2),list_set(R2,R1),!.
solution([],_,[]):-!.
solution([H|T],L,R1):-count_member(H,L,C),
    (   C>3,solution(T,L,R2),my_append([H],R2,R1);
    solution(T,L,R1)),!.
