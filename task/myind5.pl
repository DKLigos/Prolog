% main file

run:- consult('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    retractall(country/2),retractall(transport/2),
    retractall(citizen/4).


showcitizen:- run, nl, transport(A,B), country(C,D),
    citizen(_, A, C, X),
    write("���: "), writeln(X),
    write("���������: "), writeln(B),
    write("������: "), writeln(D), nl, fail.


showtransport:-run, nl, transport(_,X),
    write("���������: "), writeln(X),nl, fail.


show�ountry:-run, nl, country(_,X),
    write("�������� c�����: "), writeln(X), nl, fail.


addtransport:-writeln("���������� ����������"),
    write("ID: "), read(X),
    write("��������: "), read(Y),
    assertz(transport(X,Y)),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('��������� ������� ��������'),nl.


add�ountry:-writeln("���������� ������"),
    write("ID: "), read(X),
    write("��������: "), read(Y),
    assertz(country(X,Y)),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('������ ������� ���������'),nl.


addcitizen:-writeln("���������� ����������"),
   write("ID ����������:"), read(X),
   write("ID ������: "), read(Y),
   write("ID ���������: "), read(Z),
   write("���: "), read(W),
   assertz(citizen(X,Y,Z,W)),
   tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
   listing(country), listing(transport), listing(citizen),
   told, write('��������� ������� ��������'),nl.


deltransport:-writeln("������� ���������"),
    write("ID ����������: "),read(X),
    retract(transport(X,_)),
    retractall(citizen(_,_,X,_)),
    writeln("��������� ������� ������"),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('������� ���������� ���������'),nl.


delcountry:-writeln("������� ������"),
    write("ID ������: "),read(X),
    retract(country(X,_)),
    retractall(citizen(_,X,_,_)),
    writeln("C����� ������� �������"),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('������� ����� ���������'),nl.


delcitizen:-writeln("������� ����������"),
    write("ID ����������: "),read(X),
    retract(citizen(X,_,_,_)),
    writeln("��������� ������� ������"),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('������� ����������� ���������'),nl.


save:- tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country),listing(transport),listing(citizen),
    told, write('���� ���������'),nl,fail.






