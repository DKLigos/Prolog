p(1,2,1).
p(1,3,2).
p(2,4,1).
p(3,4,2).
p(4,5,3).
find_all(X,G,Bag):-post_it(X,G),gather([],Bag).
post_it(X,G):-call(G),
             assert(data999(X)),fail.
post_it(_,_).
gather(B,Bag):-data999(X),
              retract(data999(X)),
              gather([X|B],Bag),!.
gather(B,B).

search(X,Y,[X,Y]):-(p(X,Y,_);p(Y,X,_)).%!.
search(X,Y,[X|Y]):-(p(X,Z,_);p(Z,X,_)),
    search(Z,Y,T).
    %not(member(X,T)),!.


maxDeg(Res):-
    findall(X,p(X,Y,Z),Bag1),
    findall(Y,p(X,Y,Z),Bag2),
    append(Bag1,Bag2,Res).



