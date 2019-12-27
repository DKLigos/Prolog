% main file

run:- consult('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    retractall(country/2),retractall(transport/2),
    retractall(citizen/4).


showcitizen:- run, nl, transport(A,B), country(C,D),
    citizen(_, A, C, X),
    write("Имя: "), writeln(X),
    write("Транспорт: "), writeln(B),
    write("Страна: "), writeln(D), nl, fail.


showtransport:-run, nl, transport(_,X),
    write("Транспорт: "), writeln(X),nl, fail.


showСountry:-run, nl, country(_,X),
    write("Название cтраны: "), writeln(X), nl, fail.


addtransport:-writeln("Добавление транспорта"),
    write("ID: "), read(X),
    write("Название: "), read(Y),
    assertz(transport(X,Y)),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('Транспорт успешно добавлен'),nl.


addСountry:-writeln("Добавление страны"),
    write("ID: "), read(X),
    write("Название: "), read(Y),
    assertz(country(X,Y)),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('Страна успешно добавлена'),nl.


addcitizen:-writeln("Добавление гражданина"),
   write("ID гражданина:"), read(X),
   write("ID страна: "), read(Y),
   write("ID транспорт: "), read(Z),
   write("Имя: "), read(W),
   assertz(citizen(X,Y,Z,W)),
   tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
   listing(country), listing(transport), listing(citizen),
   told, write('Гражданин успешно добавлен'),nl.


deltransport:-writeln("Удалить транспорт"),
    write("ID транспорта: "),read(X),
    retract(transport(X,_)),
    retractall(citizen(_,_,X,_)),
    writeln("Транспорт успешно удален"),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('Таблица транспорта обновлена'),nl.


delcountry:-writeln("Удалить страну"),
    write("ID страны: "),read(X),
    retract(country(X,_)),
    retractall(citizen(_,X,_,_)),
    writeln("Cтрана успешно удалена"),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('Таблица стран обновлена'),nl.


delcitizen:-writeln("Удалить гражданина"),
    write("ID гражданина: "),read(X),
    retract(citizen(X,_,_,_)),
    writeln("Гражданин успешно удален"),
    tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country), listing(transport), listing(citizen),
    told, write('Таблица гражданинов обновлена'),nl.


save:- tell('C:/Users/Zubko/Downloads/Telegram Desktop/db.pl'),
    listing(country),listing(transport),listing(citizen),
    told, write('База сохранена'),nl,fail.






