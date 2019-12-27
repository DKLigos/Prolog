%fact(1,1).
%fact(X,Y):- X1 is X-1, fact(X1,Y1), Y is Y1*X.
facti(X,Y):-factn(X,Y,1,1).
%factn(X,Y,I,P):-I=<X,!, P1 is P*I, I1 is I+1, factn(X,Y,I1,P1).
%factn(_,P,_,P).
factn(X,P,X,P):-!.
factn(X,Y,I,P):-(I1 is I+1), P1 is P*I1, factn(X,Y,I1,P1).
%___________________________________________________________

fib(1,1).
fib(2,1).
%fib(X,Y):- X1 is X-1, fib(X1,Y1),X2 is X-2 , fib(X2,Y2), Y is Y1+Y2.
fibi(X,Y):-fibn(X,Y,1,0,1).
fibn(X,P,X,_,P):-!.
fibn(X,Y,I,T,P):-P1 is T+P, I1 is I+1, fibn(X,Y,I1,P,P1).
%___________________________________________________________
nod(A,0,A):-!.
nod(0,A,A):-!.
nod(A,B,C):- A >= B, !, X is A-B, nod(B,X,C).
nod(A,B,C):- X is B-A, nod(A,X,C).
%___________________________________________________________
max(X,Y,Z):- X>=Y,!, Z is X.
max(_,Y,Z):- Z is Y.
%___________________________________________________________
min(X,Y,Z):- X=<Y,!, Z is X.
min(_,Y,Z):-Z is Y.
%____________________________________b_____________________
nok(X,Y,Z):-nod(X,Y,Z1),Z is (X*Y)/ Z1.
%___________________________________________________________
