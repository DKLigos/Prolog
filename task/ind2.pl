    name(balash).
    name(bela).
    name(aladar).
    town(budapest).
    town(bekescsaba).
    town(aszod).
    job(aptekar).
    job(agronom).
    job(buhgalter).

condition(X,Y,Z) :- name(X), town(Y), job(Z),
X=balash, not(Y=budapest), not(Z=aptekar), dif(Y,Z).
condition(X,Y,Z) :- name(X), town(Y), job(Z),
X=bela, not(Y=aszod), not(Z=agronom), dif(Y,Z).
condition(X,Y,Z) :-  name(X), town(Y), job(Z),
X=aladar, not(Y=bekescsaba), not(Z=buhgalter), dif(Y,Z).
man(X1,Y1,Z1,X2,Y2,Z2,X3,Y3,Z3):-
X1=balash, condition(X1,Y1,Z1),
X2=bela, condition(X2,Y2,Z2),
X3=aladar, condition(X3,Y3,Z3),
dif(Y1,Y2), dif(Y2,Y3), dif(Y1,Y3),
dif(Z1,Z2), dif(Z2,Z3), dif(Z1,Z3).
