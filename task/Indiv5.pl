%пятая идивидуальная
run:- consult('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'),
    retractall(country/2),retractall(transport/2), retractall(character/3),
    menu.

menu:-repeat,
    write('База данных'),nl,nl,
    write('1 - Данные о странах'),nl,
    write('2 - Данные о транспорте'),nl,
    write('3 - Данные о людях'),nl,
    read(X),
    X<4,
    check(X).

check(1):-menu2.
check(2):-menu3.
check(3):-menu4.



menu2:-repeat,
    write('База данных о странах'),nl,nl,
    write('1 - Посмотреть данные о странах'),nl,
    write('2 - Добавить данные в таблицу'),nl,
    write('3 - Удалить данные из таблицы'),nl,
    write('4 - Сохранить базу в файл'),nl,
    read(X),
    X<5,
    process(X).

menu3:-repeat,
    write('База данных о техниках'),nl,nl,
    write('1 - Посмотреть данные о техниках'),nl,
    write('2 - Добавить данные в таблицу'),nl,
    write('3 - Удалить данные из таблицы'),nl,
    write('4 - Сохранить базу в файл'),nl,
    read(X),
    X<5,
    process1(X).

menu4:-repeat,
    write('База данных персонажах'),nl,nl,
    write('1 - Посмотреть данные о персонажах'),nl,
    write('2 - Добавить данные в таблицу'),nl,
    write('3 - Удалить данные из таблицы'),nl,
    write('4 - Сохранить базу в файл'),nl,
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
    write("Название: "), write(X),nl,
    write('------------------------------------'),nl,fail.

viewdata2:-transport(T,Y),country(Z,D), character(X,T,D),
    write("Имя: "), write(X),nl,
    write("Транспорт: "), write(Y),nl,
    write("Страна: "), write(Z),nl,
    write('------------------------------------'),nl,fail.



adddata:- country(X,Y), asserta(country(X,Y)).
adddata:-!.

means(X,X).

viewdata:- country(X,_),
    write("Название: "), write(X),nl,
    write('------------------------------------'),nl,fail.

addcountry:-write("Добавить страну"),nl,nl,
    repeat, write("Название: "),
    read(X),
    write("id: "), read(Y),
    assertz(country(X,Y)).

addcharacter:-
    write("Добавить человека"),nl,nl,
    write("Имя: "),read(X),
    write("страна: "), read(Y),
    Y1 is Y,
    write("транспорт"),read(Z),
    Z1 is Z,
    check(Y1,Z1,F), F=0,
    assertz(character(X,Z,Y)),
    write(X);
    write("Такого транспорта нет").

check(X,Y,F):- country(_,X), transport(Y,_),!, F is 0;F is 1.

deletecountry:- write('Удалить страну'),nl,nl,
    write('Напишите название страны: '),
    read(X),
    retract(country(X,Y)),
    retract(character(_,_,Y)),
    write('country deleted'),nl,nl,
    tell('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'), listing(country),
    listing(character),listing(transport),
    told, write('Таблица обновлена'),nl.

deletetransport:- write('Удалить транспорт'),nl,nl,
    write('Напишите название транспорта: '),
    read(X),
    retract(transport(Y,X)),
    retract(character(_,Y,_)),
    write('transport deleted'),nl,nl,
    tell('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'), listing(country),
    listing(character),listing(transport),
    told, write('Таблица обновлена'),nl.

deletecharacter:- write('Удалить человека'),nl,nl,
    write('Напишите имя человека: '),
    read(X),
    retract(character(X,_,_)),
    write('character deleted'),nl,nl,
    tell('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'), listing(country),
    listing(character),listing(transport),
    told, write('Таблица обновлена'),nl.


dbsave:- tell('C:/Users/Zubko/Desktop/Prolog/task/mydata.pl'), listing(country),listing(transport),listing(character),
    told, write('База сохранена'),nl,fail.
