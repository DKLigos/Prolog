:-dynamic fact/2.
fact(1,1):-!.
fact(X,Y):-
    X1 is X-1,
    fact(X1,Y1),asserta(fact(X1,Y1)),
    Y is Y1*X,!.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
:-dynamic fib/2.
fib(1,1):-!.
fib(2,1):-!.
fib(X,Y):-
    X1 is X-1,
    X2 is X-2,
    fib(X1,Y1),
    fib(X2,Y2),
    asserta(fib(X1,Y1)),
    asserta(fib(X2,Y2)),
    Y is Y1+Y2.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
student('������',"25.05.1999","932492492349").
student('Denis',"25.05.1992","93249249233").
:-dynamic studentd/3.
myassert:-
    student(X,Y,Z),
    assertz(studentd(X,Y,Z)),fail.
myassert:-!.
