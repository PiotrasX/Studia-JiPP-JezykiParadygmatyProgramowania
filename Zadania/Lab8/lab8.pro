% Fakty

rodzic(ola,max).     % rodzic  R ~ D
rodzic(tomek,max).
rodzic(tomek,lila).
rodzic(max,ania).
rodzic(max,kasia).
rodzic(kasia,radek).

kobieta(ola).        % kobieta  K
kobieta(lila).
kobieta(kasia).
kobieta(ania).

mezczyzna(tomek).    % mezczyzna  M
mezczyzna(max).
mezczyzna(radek).

% Regu³y

matka(X,Y) :-        % matka(X,Y)  Ma ~ D
  rodzic(X,Y),
  kobieta(X).

ojciec(X,Y) :-       % ojciec(X,Y)  Oj ~ D
  rodzic(X,Y),
  mezczyzna(X).

/* Przegl¹d bazy wiedzy o rodzinie.

Relacje:

rodzic  R ~ D


W³aœciwoœci:

kobieta    K
mezczyzna  M


Procedury lub regu³y:

matka(X,Y)   Ma ~ D
ojciec(X,Y)  Oj ~ D
*/

% 8.1

/*
1 ?- \+ false.
true.

2 ?- \+ true.
false.

3 ?- not(false).
true.

4 ?- not(true).
false.

5 ?- X = Y.
X = Y.

6 ?- \+ X = Y.
false.

7 ?- not(X = Y).
false.

8 ?- X \= Y.
false.
*/

/*
5 ?- X = Y.
X = Y.

Jaka jest logiczna ocena tego zjednoczenia?

Logiczna ocena tego zjednoczenia to true (bo X i Y to zmienne i s¹ mo¿liwe takie wartoœci pod zmienne, ¿e to bêdzie true).
*/

% siostra(X,Y) - Koñczy siê sukcesem, jeœli X jest siostr¹ Y.

siostra(X,Y) :-
  rodzic(R,X),
  rodzic(R,Y),
  kobieta(X),
  X \= Y.

/*
1 ?- siostra(ola,lila).
false.

2 ?- siostra(lila,max).
true.
*/

/*
1. Przy pomocy regu³y siostra wypisz wszystkie pary (siostra i siostra lub siostra i brat).

3 ?-
siostra(X,Y).
X = lila,
Y = max ;
X = ania,
Y = kasia ;
X = kasia,
Y = ania ;
false.
*/

/*
2. Podaj drug¹ wersjê regu³y siostra dla której nie jest mo¿liwe wypisanie tych par.
10 ?- siostra2(X,Y).
false.
*/

siostra2(X,Y) :-
  X \= Y,
  rodzic(R,X),
  rodzic(R,Y),
  kobieta(X).

/*
4 ?- siostra2(ola,lila).
false.

5 ?- siostra2(lila,max).
true.

6 ?- siostra2(X,Y).
false.
*/

% para(X,Y) - Koñczy siê sukcesem, je¿eli X jest kobiet¹, Y jest mê¿czyzn¹ i maj¹ wspólne dziecko.

para(X,Y) :-
  kobieta(X),
  mezczyzna(Y),
  rodzic(X,D),
  rodzic(Y,D).

/*
7 ?- para(X,Y).
X = ola,
Y = tomek ;
false.
*/

% brat(X,Y) - Koñczy siê sukcesem, jeœli X jest bratem Y.

brat(X,Y) :-
  rodzic(R,X),
  rodzic(R,Y),
  mezczyzna(X),
  X \= Y.

/*
8 ?- brat(max,ola).
false.

9 ?- brat(max,lila).
true.
*/

% rodzina(X,Y,Z1,Z2) - Koñczy siê sukcesem, je¿eli X jest kobiet¹, Y jest mê¿czyzn¹ i Z1, Z2 s¹ ich wspólnymi (ró¿nymi) dzieæmi.

rodzina(X,Y,Z1,Z2) :-
  kobieta(X),
  mezczyzna(Y),
  Z1 \= Z2,
  matka(X,Z1),
  matka(X,Z2),
  ojciec(Y,Z1),
  ojciec(Y,Z2).

/*
10 ?- rodzina(ola,tomek,max,lila).
false.
*/

% 8.2

rodzice(X) :-
  ojciec(O,X),
  matka(M,X),
  write('ojciec: '), writeln(O),
  write('matka: '), writeln(M), !.

rodzice(X) :-
  ojciec(O,X),
  write('ojciec: '), writeln(O), !.

rodzice(X) :-
  matka(M,X),
  write('matka: '), writeln(M), !.

rodzice(_) :-
  write('brak danych').

/*
11 ?- rodzice(max).
ojciec: tomek
matka: ola
true.

12 ?- rodzice(lila).
ojciec: tomek
true.

13 ?- rodzice(radek).
matka: kasia
true.

14 ?- rodzice(ola).
brak danych
true.
*/

% 8.3

/*
X jest potomkiem Y.

X <- Y
X <- Z <- Y
 \__/ \__/

X <- ... <- Y
*/

% potomek(X,Y) - Regu³a koñczy siê sukcesem, jeœli X jest potomkiem Y.

potomek(X,Y) :- rodzic(Y,X).
potomek(X,Y) :- rodzic(Y,Z), potomek(X,Z).

/*
1 ?- potomek(ola,tomek).
false.

2 ?- potomek(radek,tomek).
true ;
false.
*/

/*
1. Na ile sposobów mo¿na okreœliæ regu³ê potomek?

Regu³ê potomek mo¿na okreœliæ na 2 sposoby.
*/

/*
2. Podaj wszystkie mo¿liwe rozwi¹zania dla regu³y potomek.
*/

potomek2(X,Y) :- rodzic(Y,X).
potomek2(X,Y) :- rodzic(Z,X), potomek(Z,Y).

/*
3 ?- potomek2(ola,tomek).
false.

4 ?- potomek2(radek,tomek).
true ;
false.
*/

/*
3. Czy regu³y potomek(X,Y) i potomek2(X,Y) s¹ równowa¿ne?

5 ?- potomek(X,Y).   6 ?- potomek2(X,Y).
X = max,             X = max,
Y = ola ;            Y = ola ;
X = max,             X = max,
Y = tomek ;          Y = tomek ;
X = lila,            X = lila,
Y = tomek ;          Y = tomek ;
X = ania,            X = ania,
Y = max ;            Y = max ;
X = kasia,           X = kasia,
Y = max ;            Y = max ;
X = radek,           X = radek,
Y = kasia ;          Y = kasia ;
X = ania,            X = ania,
Y = ola ;            Y = ola ;
X = kasia,           X = ania,
Y = ola ;            Y = tomek ;
X = radek,           X = kasia,
Y = ola ;            Y = ola ;
X = ania,            X = kasia,
Y = tomek ;          Y = tomek ;
X = kasia,           X = radek,
Y = tomek ;          Y = max ;
X = radek,           X = radek,
Y = tomek ;          Y = ola ;
X = radek,           X = radek,
Y = max ;            Y = tomek ;
false.               false.

Regu³y potomek i potomek2 s¹ równowa¿ne (daj¹ te same wyniki ale w innej kolejnoœci).
*/

% Regu³a potomek3(X,Y) jest niewielk¹ modyfikacj¹ regu³y potomek(X,Y).

potomek3(X,Y) :- rodzic(Y,X).
potomek3(X,Y) :- potomek3(X,Z), rodzic(Y,Z). % Nie jest poprawne umieszczanie wywo³ania rekurencyjnego jako pierwszego predykatu w treœci regu³y.

/*
7 ?- potomek3(ola,tomek).
ERROR: Stack limit (1.0Gb) exceeded

8 ?- potomek3(radek,tomek).
true ;
ERROR: Stack limit (1.0Gb) exceeded
*/

% potomkowie(X) - Regu³a wypisuje na ekranie wszystkich potomków X (ka¿dy w oddzielnej linii) i zawsze koñczy siê sukcesem. Nale¿y skorzystaæ z predykatu fail do wyszukania wszystkich rozwi¹zañ.

potomkowie(X) :-
  potomek(P,X),
  write(P), 
  nl, fail.
potomkowie(_). % Klauzula, ¿eby zawsze zakoñczyæ sukcesem.

/*
9 ?- potomkowie(max).
ania
kasia
radek
true.

10 ?- potomkowie(tomek).
max
lila
ania
kasia
radek
true.

11 ?- potomkowie(kasia).
radek
true.

12 ?- potomkowie(radek).
true.
*/

% 8.4

panstwo('Polska').
panstwo('Niemcy').
panstwo('Francja').
panstwo('W³ochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Kraków').
miasto('Berlin').
miasto('Pary¿').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Kraków', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Pary¿', 'Francja').
polozenie('Rzym', 'W³ochy').
polozenie('Wenecja', 'W³ochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pa³ac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Koœció³ Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wie¿a Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pa³ac Elizejski').
zabytek('Bazylika œw. Paw³a za Murami').
zabytek('Koloseum').
zabytek('Zamek Œwiêtego Anio³a').
zabytek('Bazylika œw. Marka').
zabytek('Pa³ac Do¿ów').
zabytek('Sagrada Familia').
zabytek('Pa³ac Kryszta³owy').
zabytek('Tower Bridge').
zabytek('Pa³ac Buckingham').
zabytek('Katedra Œwiêtego Paw³a').

gdzie('Pa³ac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Kraków').
gdzie('Sukiennice', 'Kraków').
gdzie('Koœció³ Mariacki', 'Kraków').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wie¿a Eiffla', 'Pary¿').
gdzie('Katedra Notre-Dame', 'Pary¿').
gdzie('Pa³ac Elizejski', 'Pary¿').
gdzie('Bazylika œw. Paw³a za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek Œwiêtego Anio³a', 'Rzym').
gdzie('Bazylika œw. Marka', 'Wenecja').
gdzie('Pa³ac Do¿ów', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pa³ac Kryszta³owy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pa³ac Buckingham', 'Londyn').
gdzie('Katedra Œwiêtego Paw³a', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'W³ochy').
obok('Francja', 'Hiszpania').

/* Przegl¹d bazy wiedzy o zabytkach.

W³aœciwoœci:

kraj     K
miasto   M
zabytek  Z


Relacje:

lokalizacja  M ~ K
gdzie        Z ~ M
nastêpny     K1 ~ K2
*/

% zabytki_m(M) - Regu³a, która wypisuje na ekranie wszystkie zabytki znajduj¹ce siê w mieœcie M (ka¿dy w oddzielnej linii).

zabytki_m(M) :-
  gdzie(Z,M),
  write(Z),
  nl, fail.
zabytki_m(_).

/*
1 ?- zabytki_m('Berlin').
Brama Brandenburska
Reichstag
true.

2 ?- zabytki_m('Rzeszów').
true.
*/

% zabytki_mp(M) - Regu³a, która wypisuje na ekranie wszystkie zabytki znajduj¹ce siê w mieœcie M (ka¿dy w oddzielnej linii, ³¹cznie z nazw¹ miasta i pañstwa).

zabytki_mp(M) :-
  gdzie(Z,M),
  polozenie(M,P),
  write(P),
  write(' '),
  write(M),
  write(' '),
  write(Z),
  nl, fail.
zabytki_mp(_).

/*
3 ?- zabytki_mp('Berlin').
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
true.

4 ?- zabytki_mp('Rzeszów').
true.
*/

% zabytki_p(P) - Regu³a, która wypisuje na ekranie wszystkie zabytki znajduj¹ce siê w pañstwie P (ka¿dy w oddzielnej linii).

zabytki_p(P) :-
  polozenie(M,P),
  gdzie(Z,M),
  write(Z),
  nl, fail.
zabytki_p(_).

/*
5 ?- zabytki_p('Niemcy').
Brama Brandenburska
Reichstag
true.

6 ?- zabytki_p('Polska').
Pa³ac w Wilanowie
Kolumna Zygmunta III Wazy
Wawel
Sukiennice
Koœció³ Mariacki
true.
*/

% zabytki_ps(P) - Regu³a, która wypisuje na ekranie wszystkie zabytki znajduj¹ce siê w pañstwie P (ka¿dy w oddzielnej linii, ³¹cznie z nazw¹ miasta i pañstwa) i w pañstwach s¹siednich.

sasiad(P1,P2) :- obok(P1,P2); obok(P2,P1).

zabytki_ps(P) :-
  (P2 = P; sasiad(P,P2)),
  polozenie(M,P2),
  gdzie(Z,M),
  write(P2),
  write(' '),
  write(M),
  write(' '),
  write(Z),
  nl, fail.
zabytki_ps(_).

/*
7 ?- zabytki_ps('Niemcy').
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
Francja Pary¿ Wie¿a Eiffla
Francja Pary¿ Katedra Notre-Dame
Francja Pary¿ Pa³ac Elizejski
Polska Warszawa Pa³ac w Wilanowie
Polska Warszawa Kolumna Zygmunta III Wazy
Polska Kraków Wawel
Polska Kraków Sukiennice
Polska Kraków Koœció³ Mariacki
true.

8 ?- zabytki_ps('Polska').
Polska Warszawa Pa³ac w Wilanowie
Polska Warszawa Kolumna Zygmunta III Wazy
Polska Kraków Wawel
Polska Kraków Sukiennice
Polska Kraków Koœció³ Mariacki
Niemcy Berlin Brama Brandenburska
Niemcy Berlin Reichstag
true.
*/

% 8.5

/*
1 ?- X is 3*5.
X = 15.
*/

/*
2 ?- 1 + 3 = 1 + 3.
true.

3 ?- 1 + 3 = 3 + 1.
false.

4 ?- 1 + 3 =:= 1 + 3.
true.

5 ?- 1 + 3 =:= 3 + 1.
true.
*/

fun(X,Y) :- Y is 2*X.

/*
6 ?- fun(5,Y).
Y = 10.
*/

delta(A,B,C,W) :- W is B*B - 4*A*C.

trojmian(A,B,C,W) :-
  delta(A,B,C,D),
  D > 0,
  X1 is (-B - sqrt(D)) / (2*A),
  X2 is (-B + sqrt(D)) / (2*A),
  W = [X1, X2].

trojmian(A,B,C,W) :-
  delta(A,B,C,D),
  D =:= 0,
  X is -B / (2*A),
  W = [X].

trojmian(A,B,C,W) :-
  delta(A,B,C,D),
  D < 0,
  W = [].

/*
1 ?- trojmian(1,0,-1,X).
X = [-1.0, 1.0] ;
false.

2 ?- trojmian(1,-2,1,X).
X = [1] ;
false.

3 ?- trojmian(1,0,1,X).
X = [].
*/

/*
Drugie rozwi¹zanie z wykorzystaniem operatora obciêcia !.
*/

trojmian2(A,B,C,W) :-
  delta(A,B,C,D),
  D > 0, !,
  X1 is (-B - sqrt(D)) / (2*A),
  X2 is (-B + sqrt(D)) / (2*A),
  W = [X1, X2].

trojmian2(A,B,C,W) :-
  delta(A,B,C,D),
  D =:= 0, !,
  X is -B / (2*A),
  W = [X].

trojmian2(_,_,_,[]).

/*
4 ?- trojmian2(1,0,-1,X).
X = [-1.0, 1.0].

5 ?- trojmian2(1,-2,1,X).
X = [1].

6 ?- trojmian2(1,0,1,X).
X = [].
*/

% 8.6

test(1,3).

/*
1 ?- test(1,3).
true.

2 ?- test(3,1).
false.

3 ?- test(_,3).
true.

4 ?- test(1,_).
true.

5 ?- test(_,_).
true.

6 ?- test(X,3).
X = 1.

7 ?- test(1,Y).
Y = 3.

8 ?- test(X,Y).
X = 1,
Y = 3.

9 ?- test(3,Y).
false.

10 ?- test(X,1).
false.
*/

/*
Podaj dwa rozwi¹zania: bez i z operatorem obciêcia !.
*/

seq(N,W) :-
  N > 2,
  N1 is N - 1,
  N2 is N - 2,
  seq(N1,W1),
  seq(N2,W2),
  W is W1 + 3*W2.
seq(1,3).
seq(2,4).

/*
11 ?- seq(1,X).
X = 3.

12 ?- seq(2,X).
X = 4.

13 ?- seq(3,X).
X = 13.

14 ?- seq(4,X).
X = 25.

15 ?- seq(5,X).
X = 64.
*/

seq2(N,W) :-
  N > 2, !,
  N1 is N - 1,
  N2 is N - 2,
  seq2(N1,W1),
  seq2(N2,W2),
  W is W1 + 3*W2.
seq2(1,3).
seq2(2,4).

/*
16 ?- seq2(1,X).
X = 3.

17 ?- seq2(2,X).
X = 4.

18 ?- seq2(3,X).
X = 13.

19 ?- seq2(4,X).
X = 25.

20 ?- seq2(5,X).
X = 64.
*/

% 8.7

liczba(X) :-
  between(100,999,X),
  X mod 3 =:= 0,
  X mod 5 =:= 0,
  X mod 7 =:= 0.

/*
Jakie zadanie realizuje predykat liczba/1?

1 ?- liczba(35).
false.

2 ?- liczba(70).
false.

3 ?- liczba(105).
true.

4 ?- liczba(X).
X = 105 ;
X = 210 ;
X = 315 ;
X = 420 ;
X = 525 ;
X = 630 ;
X = 735 ;
X = 840 ;
X = 945 ;
false.

Predykat liczba/1 szuka liczby, 
która jest jednoczeœnie podzielna przez 3, 5 i 7
oraz jest z zakresu od 100 do 999 (w³¹cznie).
*/

/*
W skrzyni znajduj¹ siê z³ote monety. Jest ich mniej ni¿ 100. 
Jeœli bêd¹ wyjmowane po 3, to w skrzyni zostanie 1. 
Jeœli bêd¹ wyjmowane po 4, to w skrzyni zostan¹ 2. 
Jeœli bêd¹ wyjmowane po 5, to w skrzyni zostan¹ 3. 
Jeœli bêd¹ wyjmowane po 6, to w skrzyni zostan¹ 4.
Ile monet jest w skrzyni?
*/

monety(X) :-
  between(0,99,X),
  X mod 3 =:= 1,
  X mod 4 =:= 2,
  X mod 5 =:= 3,
  X mod 6 =:= 4.

/*
1 ?- monety(X).
X = 58 ;
false.
*/

% 8.8

/*
W pewnej liczbie trzycyfrowej zamieniono cyfrê dziesi¹tek z cyfr¹ jednoœci, 
tworz¹c w ten sposób now¹ liczbê trzycyfrow¹. Suma obu liczb jest równa 1187. 
ZnajdŸ te liczby. Czy rozwi¹zanie jest jednoznaczne?
*/

cyfry3cyfrowa(X,S,D,J) :-
  S is X // 100,
  D is (X mod 100) // 10,
  J is X mod 10.

liczba3cyfrowa(X) :-
  between(100,999,X),
  cyfry3cyfrowa(X,S,D,J),
  1187 =:= S*100 + D*10 + J + S*100 + J*10 + D.

/*
1 ?- liczba3cyfrowa(X).
X = 589 ;
X = 598 ;
false.
*/

/*
Czy rozwi¹zanie jest jednoznaczne?

Nie, rozwi¹zanie nie jest jednoznaczne, bo s¹ dwie ró¿ne liczby, które spe³niaj¹ warunek: 589 i 598.
*/
