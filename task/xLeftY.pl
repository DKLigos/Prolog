member1(X,[X|_]).
member1(X,[_|Y]):-member1(X,Y).

find(1,Res,[Res|_]):-!.
find(Num,Res,[_|Tail]):-N is Num-1,find(N,Res,Tail).

isLeft(X,Y,T):-append(_,[X,Y|_],T).

near(X,Y,T):-append(_,[X,Y|_],T).

near(Y,X,T):-append(_,[X,Y|_],T).

einsteis(Houses):-Houses=[_,_,_,_,_],
    find(1,[nord,_,_,_,_],Houses),
    find(3,[_,milk,_,_,_],Houses),
    isLeft([_,_,_,_,green],[_,_,_,_,white],Houses),
    near([_,_,mullboro,_,_],[_,_,_,cat,_],Houses),
    near([_,_,_,hors,_],[_,_,dunhill,_,_],Houses),
    near([nord,_,_,_,_],[_,_,_,_,blue],Houses),
    near([_,_,mullboro,_,_],[_,water,_,_,_],Houses),
    member([angl,_,_,_,red],Houses),
    member([swed,_,_,dog,_],Houses),
    member([dane,tea,_,_,_],Houses),
    member([_,coffee,_,_,green],Houses),
    member([_,_,pallmall,bird,_],Houses),
    member([_,_,dunhill,_,yellow],Houses),
    member([_,beer,wilfild,_,_],Houses),
    member([nem,_,rothmans,_,_],Houses).

%Норвежец живет в 1-ом доме
%жилец из среднего дома пьет молоко
%Англич живет в красном доме
%Швед живет с собакой
%Дотчанен пьет чай

