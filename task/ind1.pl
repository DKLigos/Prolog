great(_, [], 0):-!.
great(N,[H|Q],X):-H>N,great(N,Q,X1),X is X1+1.
great(N,[H|Q],X):- H=< N, great(N,Q,X).
% write_length('dfs',X).
%string_concat(s1,s2,s2).
%split_string(s,sep,pad,swos).
%sub_string(s,befor,length,After,sub).
%atomics_to_string(list,sep,s).
%string_chars.
pr3(X):-
    string_concat(X,',',Z),
    write(Z),
    write(Z),
    write(Z),
    string_length(X,L),
    write(L).
pr1(X):-
    string_length(X,L),
    Y is L mod 2, Y=1,!,
    D is L div 2,
    sub_string(X,D,1,_,Z1),
    write(Z1),

     sub_string(X,0,1,_,L2),
    print(L2),
    sub_string(X,_,1,0,L1),
    print(L1).
pr1(X):-
     sub_string(X,0,1,_,L2),
    print(L2),
    sub_string(X,_,1,0,L1),
    print(L1).


% ���� ������ , �������� ������ ��������, ������� ��������� � ���������
% �� ��������.
 pr2(X):-
    sub_string(X,_,1,0,L1),
    sub_string(X,Y,_,_,L1),
    print(Y).
%������� � ������ ��� ��������� 'abc'
pr4(Z):-
    split_string(Z,"abc","abc",X),
    atomics_to_string(X,'',S),
    print(S).
pr6(Z):-
    split_string(Z," "," ",X),
    atomics_to_string(X,' ',S),
    print(S).




