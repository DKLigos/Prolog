%����� �������������
run:- consult('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'),
    retractall(country/2),retractall(transport/2), retractall(character/3),
    menu.

menu:-repeat,
    write('���� ������'),nl,nl,
    write('1 - ������ � �������'),nl,
    write('2 - ������ � ����������'),nl,
    write('3 - ������ � �����'),nl,
    read(X),
    X<4,
    check(X).

check(1):-menu2.
check(2):-menu3.
check(3):-menu4.



menu2:-repeat,
    write('���� ������ � �������'),nl,nl,
    write('1 - ���������� ������ � �������'),nl,
    write('2 - �������� ������ � �������'),nl,
    write('3 - ������� ������ �� �������'),nl,
    write('4 - ��������� ���� � ����'),nl,
    read(X),
    X<5,
    process(X).

menu3:-repeat,
    write('���� ������ � ��������'),nl,nl,
    write('1 - ���������� ������ � ��������'),nl,
    write('2 - �������� ������ � �������'),nl,
    write('3 - ������� ������ �� �������'),nl,
    write('4 - ��������� ���� � ����'),nl,
    read(X),
    X<5,
    process1(X).

menu4:-repeat,
    write('���� ������ ����������'),nl,nl,
    write('1 - ���������� ������ � ����������'),nl,
    write('2 - �������� ������ � �������'),nl,
    write('3 - ������� ������ �� �������'),nl,
    write('4 - ��������� ���� � ����'),nl,
    read(X),
    X<5,
    process2(X).




process(1):-viewdata.
process(2):-addcountry.
process(3):-deletecountry.
process(4):-dbsave.

process1(1):-viewdata1.
process1(2):-addtransport.
process1(3):-deletetransport.
process1(4):-dbsave.

process2(1):-viewdata2.
process2(2):-addcharacter.
process2(3):-deletecharacter.
process2(4):-dbsave.



viewdata1:- transport(_,X),
    write("��������: "), write(X),nl,
    write('------------------------------------'),nl,fail.

viewdata2:-transport(T,Y),country(Z,D), character(X,T,D),
    write("���: "), write(X),nl,
    write("���������: "), write(Y),nl,
    write("������: "), write(Z),nl,
    write('------------------------------------'),nl,fail.



adddata:- country(X,Y), asserta(country(X,Y)).
adddata:-!.

means(X,X).

viewdata:- country(X,_),
    write("��������: "), write(X),nl,
    write('------------------------------------'),nl,fail.

addcountry:-write("�������� ������"),nl,nl,
    repeat, write("��������: "),
    read(X),
    write("id: "), read(Y),
    assertz(country(X,Y)).

addcharacter:-
    write("�������� ��������"),nl,nl,
    write("���: "),read(X),
    write("������: "), read(Y),
    Y1 is Y,
    write("���������"),read(Z),
    Z1 is Z,
    check(Y1,Z1,F), F=0,
    assertz(character(X,Z,Y)),
    write(X);
    write("������ ���������� ���").

check(X,Y,F):- country(_,X), transport(Y,_),!, F is 0;F is 1.

deletecountry:- write('������� ������'),nl,nl,
    write('�������� �������� ������: '),
    read(X),
    retract(country(X,Y)),
    retract(character(_,_,Y)),
    write('country deleted'),nl,nl,
    tell('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'), listing(country),
    listing(character),listing(transport),
    told, write('������� ���������'),nl.

deletetransport:- write('������� ���������'),nl,nl,
    write('�������� �������� ����������: '),
    read(X),
    retract(transport(Y,X)),
    retract(character(_,Y,_)),
    write('transport deleted'),nl,nl,
    tell('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'), listing(country),
    listing(character),listing(transport),
    told, write('������� ���������'),nl.

deletecharacter:- write('������� ��������'),nl,nl,
    write('�������� ��� ��������: '),
    read(X),
    retract(character(X,_,_)),
    write('character deleted'),nl,nl,
    tell('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'), listing(country),
    listing(character),listing(transport),
    told, write('������� ���������'),nl.


dbsave:- tell('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'), listing(country),listing(transport),listing(character),
    told, write('���� ���������'),nl,fail.
