% �������
swap([X,Y|Z],[Y,X|Z]):-X>Y,!.
swap([X|Y],[X|Y1]):-swap(Y,Y1),!.

sort(Q,W):-swap(Q,X),!,sort(X,W).
sort(X,X):-!.
%__________________________________


