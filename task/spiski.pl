sum([],0):-!.
sum([X|Y],Z):-sum(Y,Z1), Z is Z1+X. %Сумма элеменов списка
find(0,[X|_],X):-!.
find(I,[_|Y],Z):-I1 is I-1, find(I1,Y,Z).

member(X,[X|_]):-!.
member(X,[_|Y]):-member(X,Y).

minelem(X,[X]):-!.
minelem(X,[Y|Z]):-minelem(X1,Z), Y=<X1,!,X is Y.
minelem(X,[_|Z]):-minelem(X,Z).

reverse(X,Y):-reverse(X,[],Y).
reverse([],Y,Y):-!.
reverse([X|Y],Z,T):-reverse(Y,[X|Z],T).

isbegin([],_):-!.
isbegin([X|Y],[X|Z]):-isbegin(Y,Z).

sublist(X,Y):-isbegin(X,Y),!.
sublist(X,[_|Z]):-sublist(X,Z).

delete([],_,[]):-!.
delete([X|Y],X,Z):-delete(Y,X,Z),!.
delete([X|Y],T,[X|Z]):-delete(Y,T,Z).

append([],X,X):-!.
append([X|Y1],Z,[X|Y2]):-append(Y1,Z,Y2).
% В списке нет повторяющихся элементов, true
% Объединяет два отсортированных списка в один
% Длина списка
length1([],0):-!.
length1([_|Y],Z):-length1(Y,Z1), Z is Z1+1.
