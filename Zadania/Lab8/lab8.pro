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

% Regu�y

matka(X,Y) :-        % matka(X,Y)  Ma ~ D
  rodzic(X,Y),
  kobieta(X).

ojciec(X,Y) :-       % ojciec(X,Y)  Oj ~ D
  rodzic(X,Y),
  mezczyzna(X).

/* Przegl�d bazy wiedzy o rodzinie.

Relacje:

rodzic  R ~ D


W�a�ciwo�ci:

kobieta    K
mezczyzna  M


Procedury lub regu�y:

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

Logiczna ocena tego zjednoczenia to true (bo X i Y to zmienne i s� mo�liwe takie warto�ci pod zmienne, �e to b�dzie true).
*/

% siostra(X,Y) - Ko�czy si� sukcesem, je�li X jest siostr� Y.

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
1. Przy pomocy regu�y siostra wypisz wszystkie pary (siostra i siostra lub siostra i brat).

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
2. Podaj drug� wersj� regu�y siostra dla kt�rej nie jest mo�liwe wypisanie tych par.
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

% para(X,Y) - Ko�czy si� sukcesem, je�eli X jest kobiet�, Y jest m�czyzn� i maj� wsp�lne dziecko.

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

% brat(X,Y) - Ko�czy si� sukcesem, je�li X jest bratem Y.

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

% rodzina(X,Y,Z1,Z2) - Ko�czy si� sukcesem, je�eli X jest kobiet�, Y jest m�czyzn� i Z1, Z2 s� ich wsp�lnymi (r�nymi) dzie�mi.

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

% potomek(X,Y) - Regu�a ko�czy si� sukcesem, je�li X jest potomkiem Y.

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
1. Na ile sposob�w mo�na okre�li� regu�� potomek?

Regu�� potomek mo�na okre�li� na 2 sposoby.
*/

/*
2. Podaj wszystkie mo�liwe rozwi�zania dla regu�y potomek.
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
3. Czy regu�y potomek(X,Y) i potomek2(X,Y) s� r�wnowa�ne?

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

Regu�y potomek i potomek2 s� r�wnowa�ne (daj� te same wyniki ale w innej kolejno�ci).
*/

% Regu�a potomek3(X,Y) jest niewielk� modyfikacj� regu�y potomek(X,Y).

potomek3(X,Y) :- rodzic(Y,X).
potomek3(X,Y) :- potomek3(X,Z), rodzic(Y,Z). % Nie jest poprawne umieszczanie wywo�ania rekurencyjnego jako pierwszego predykatu w tre�ci regu�y.

/*
7 ?- potomek3(ola,tomek).
ERROR: Stack limit (1.0Gb) exceeded

8 ?- potomek3(radek,tomek).
true ;
ERROR: Stack limit (1.0Gb) exceeded
*/

% potomkowie(X) - Regu�a wypisuje na ekranie wszystkich potomk�w X (ka�dy w oddzielnej linii) i zawsze ko�czy si� sukcesem. Nale�y skorzysta� z predykatu fail do wyszukania wszystkich rozwi�za�.

potomkowie(X) :-
  potomek(P,X),
  write(P), 
  nl, fail.
potomkowie(_). % Klauzula, �eby zawsze zako�czy� sukcesem.

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
panstwo('W�ochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Krak�w').
miasto('Berlin').
miasto('Pary�').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Krak�w', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Pary�', 'Francja').
polozenie('Rzym', 'W�ochy').
polozenie('Wenecja', 'W�ochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pa�ac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Ko�ci� Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wie�a Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pa�ac Elizejski').
zabytek('Bazylika �w. Paw�a za Murami').
zabytek('Koloseum').
zabytek('Zamek �wi�tego Anio�a').
zabytek('Bazylika �w. Marka').
zabytek('Pa�ac Do��w').
zabytek('Sagrada Familia').
zabytek('Pa�ac Kryszta�owy').
zabytek('Tower Bridge').
zabytek('Pa�ac Buckingham').
zabytek('Katedra �wi�tego Paw�a').

gdzie('Pa�ac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Krak�w').
gdzie('Sukiennice', 'Krak�w').
gdzie('Ko�ci� Mariacki', 'Krak�w').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wie�a Eiffla', 'Pary�').
gdzie('Katedra Notre-Dame', 'Pary�').
gdzie('Pa�ac Elizejski', 'Pary�').
gdzie('Bazylika �w. Paw�a za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek �wi�tego Anio�a', 'Rzym').
gdzie('Bazylika �w. Marka', 'Wenecja').
gdzie('Pa�ac Do��w', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pa�ac Kryszta�owy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pa�ac Buckingham', 'Londyn').
gdzie('Katedra �wi�tego Paw�a', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'W�ochy').
obok('Francja', 'Hiszpania').

/* Przegl�d bazy wiedzy o zabytkach.

W�a�ciwo�ci:

kraj     K
miasto   M
zabytek  Z


Relacje:

lokalizacja  M ~ K
gdzie        Z ~ M
nast�pny     K1 ~ K2
*/

% zabytki_m(M) - Regu�a, kt�ra wypisuje na ekranie wszystkie zabytki znajduj�ce si� w mie�cie M (ka�dy w oddzielnej linii).

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

2 ?- zabytki_m('Rzesz�w').
true.
*/

% zabytki_mp(M) - Regu�a, kt�ra wypisuje na ekranie wszystkie zabytki znajduj�ce si� w mie�cie M (ka�dy w oddzielnej linii, ��cznie z nazw� miasta i pa�stwa).

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

4 ?- zabytki_mp('Rzesz�w').
true.
*/

% zabytki_p(P) - Regu�a, kt�ra wypisuje na ekranie wszystkie zabytki znajduj�ce si� w pa�stwie P (ka�dy w oddzielnej linii).

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
Pa�ac w Wilanowie
Kolumna Zygmunta III Wazy
Wawel
Sukiennice
Ko�ci� Mariacki
true.
*/

% zabytki_ps(P) - Regu�a, kt�ra wypisuje na ekranie wszystkie zabytki znajduj�ce si� w pa�stwie P (ka�dy w oddzielnej linii, ��cznie z nazw� miasta i pa�stwa) i w pa�stwach s�siednich.

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
Francja Pary� Wie�a Eiffla
Francja Pary� Katedra Notre-Dame
Francja Pary� Pa�ac Elizejski
Polska Warszawa Pa�ac w Wilanowie
Polska Warszawa Kolumna Zygmunta III Wazy
Polska Krak�w Wawel
Polska Krak�w Sukiennice
Polska Krak�w Ko�ci� Mariacki
true.

8 ?- zabytki_ps('Polska').
Polska Warszawa Pa�ac w Wilanowie
Polska Warszawa Kolumna Zygmunta III Wazy
Polska Krak�w Wawel
Polska Krak�w Sukiennice
Polska Krak�w Ko�ci� Mariacki
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
Drugie rozwi�zanie z wykorzystaniem operatora obci�cia !.
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
Podaj dwa rozwi�zania: bez i z operatorem obci�cia !.
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
kt�ra jest jednocze�nie podzielna przez 3, 5 i 7
oraz jest z zakresu od 100 do 999 (w��cznie).
*/

/*
W skrzyni znajduj� si� z�ote monety. Jest ich mniej ni� 100. 
Je�li b�d� wyjmowane po 3, to w skrzyni zostanie 1. 
Je�li b�d� wyjmowane po 4, to w skrzyni zostan� 2. 
Je�li b�d� wyjmowane po 5, to w skrzyni zostan� 3. 
Je�li b�d� wyjmowane po 6, to w skrzyni zostan� 4.
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
W pewnej liczbie trzycyfrowej zamieniono cyfr� dziesi�tek z cyfr� jedno�ci, 
tworz�c w ten spos�b now� liczb� trzycyfrow�. Suma obu liczb jest r�wna 1187. 
Znajd� te liczby. Czy rozwi�zanie jest jednoznaczne?
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
Czy rozwi�zanie jest jednoznaczne?

Nie, rozwi�zanie nie jest jednoznaczne, bo s� dwie r�ne liczby, kt�re spe�niaj� warunek: 589 i 598.
*/
