parent(tom,ann).% Отношение.
parent(tom,mike).
parent(mary,mike).
parent(mike,john).
parent(mike,sue).
parent(mike,nick).
parent(john,jane).
parent(john,jim).
parent(sue,bob).
parent(sue,mark).
man(tom).
man(mick).
man(nick).
man(john).
man(jim).
man(sue).
woman(mary).
woman(ann).
woman(jane).
grandchild(X,Y):-parent(X,Z),parent(Y,Z).
haschild(X):-parent(X,_).
sister(X,Y):-woman(X), parent(Z,X), parent(Z,Y),dif(X,Y).
ancestor(X,Y):-parent(X,Y).
%ancestor(X,Y):-parent(Y,Z), ancestor(X,Z).
ancestor(X,Y):-parent(X,Z), ancestor(Z,Y).
patriarch(X):-parent(X,_),not(parent(_,X)).
cousin(X,Y):-parent(Z,X), parent(T,Y), parent(S,T), parent(S,Z),dif(X,Y).





