filetolist(L):-seen,see('C:/Users/Zubko/Documents/Prolog/otv'), readfile([],[],L),seen.
filetolist1(L):-seen,see('C:/Users/Zubko/Documents/Prolog/otv1'), readfile([],[],L),seen.

readfile(T,R,L):-get0(X),(X<0,(T=[],L=R; name(T1,T),append(R,[T1],L)),!;
                         (X=32; X=10; X=13),
                         (T=[], readfile(T,R,L);name(T1,T), append(R,[T1],R1),
                          readfile([],R1,L)),!;
                         X>0, append(T,[X],T1),readfile(T1,R,L),!).

keychange(X,L,R):-keychange(X,L,R,'').
keychange(_,0,R,R).
keychange(X,L,R,T):-string_length(X,LN), LN>=L, sub_string(X,0,L,_,Y),concat(T,Y,R),
    keychange(X,0,R,_).
keychange(X,L,R,T):-string_length(X,LN), LN<L, concat(T,X,Z),L1 is L-LN,
   keychange(X,L1,R,Z).
% находим длину слова, которое шифруем, делаем для него ключевое нужной
% длины, шестиместный предикат vinger имеет следующие аргументы:
% шифруемое слово, удлинённое ключевое слово, результат,
% строка, из которой будет сформирован результат, текущий индекс и
% максимальная величина индекса.
vinger(X,KEY,RES):-string_length(X,LN),keychange(KEY,LN,R),
                   vinger(X,R,RES,'',0,LN).

vinger(_,_,Y,Y,X,X).
vinger(X,R,RES,T,I,LN):-sub_string(X,I,1,_,X1), sub_string(R,I,1,_,R1),
                   char_code(X1,X2),char_code(R1,R2),
                   X3 is X2-65, R3 is R2-65,
                   S is (X3+R3) mod 26,
                   S1 is S+65,
                   char_code(SYMB,S1),
                   concat(T,SYMB,NEW),
                   I1 is  I+1,
                   vinger(X,R,RES,NEW,I1,LN).


v_f:-see('C:/Users/Zubko/Documents/Prolog/otv'),filetolist(LST),seen, readln(X),
            all_vinger(LST,X,RES),tell('otv1'),
            file_writer(RES),told.

all_vinger(LIST,[K1|_],RESULT):-all_vinger(LIST,K1,RESULT,[]).
all_vinger([],_,R,R).
all_vinger([L1|L],KEY,RESULT,R):-string_upper(L1,L2),vinger(L2,KEY,R1),
    all_vinger(L,KEY,RESULT,[R1|R]).
file_writer([]).
file_writer([L|L1]):-write(L), write('\n'), file_writer(L1).

% vinger, отличие в том, что первый аргумент - закодированное слово, а
% не исходное.
vinger_decode(X,KEY,RES):-string_length(X,LN),keychange(KEY,LN,R),
                   vinger_decode(X,R,RES,'',0,LN).
vinger_decode(_,_,Y,Y,X,X).
vinger_decode(X,R,RES,T,I,LN):-sub_string(X,I,1,_,X1), sub_string(R,I,1,_,R1),
                   char_code(X1,X2),char_code(R1,R2),
                   X3 is X2-65, R3 is R2-65,
                   S is (X3-R3+26) mod 26,
                   S1 is S+65,
                   char_code(SYMB,S1),
                   concat(T,SYMB,NEW),
                   I1 is  I+1,
                   vinger_decode(X,R,RES,NEW,I1,LN).
v_d_f:-see('C:/Users/Zubko/Documents/Prolog/otv1'),filetolist1(LST),seen, readln(X),
            all_decode_vinger(LST,X,RES),tell('C:/Users/Zubko/Documents/Prolog/otv2'),
            file_writer(RES),told.
all_decode_vinger(LIST,[K1|_],RESULT):-all_decode_vinger(LIST,K1,RESULT,[]).
all_decode_vinger([],_,R,R).
all_decode_vinger([L1|L],KEY,RESULT,R):-string_upper(L1,L2),
    vinger_decode(L2,KEY,R1),
    all_decode_vinger(L,KEY,RESULT,[R1|R]).









