my_append([],R,R):-!.
my_append([H|T],L,[H|R]):-my_append(T,L,R).
split(middle,list,list,list).


stroka(X,Y):- split_string(_, ".", "",Y).
stroka(X,Y):-split([H|Y],Y,L1,L2).











