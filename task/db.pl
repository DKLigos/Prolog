%(Имя/Id)
:- dynamic country/2.
country("No crew",1).
country("Jabbawockeez",2).
country("Kinjaz",2).

% (Название/Id)
:- dynamic transport/2.
transport("Hip-hop",1).
transport("Popping",2).
transport("breakdance",3).

% (Имя, Id стиля, Id команды)
:- dynamic citizen/4.
citizen("Dytto",2,1).
citizen("Anthony Lee").
