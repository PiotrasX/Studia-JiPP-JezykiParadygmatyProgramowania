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

5 ?- X = Y.  % Jaka jest logiczna ocena tego zjednoczenia?
X = Y.

6 ?- \+ X = Y.
false.

7 ?- not(X = Y).
false.

8 ?- X \= Y.  % Czy to prawda, ¿e X nie mo¿e byæ zunifikowane z Y? Nie, nie jest, poniewa¿ X mo¿e byæ zunifikowane z Y.
false.
*/

% 8.1.1

% siostra(X,Y) - Koñczy siê sukcesem, jeœli X jest siostr¹ Y.

/*
1 ?- siostra(ola,lila).
false.

2 ?- siostra(lila,max).
true.
*/

/* Task 1

1. Przy pomocy regu³y siostra wypisz wszystkie pary (siostra i siostra lub siostra i brat).

2. Podaj drug¹ wersjê regu³y siostra dla której nie jest mo¿liwe wypisanie tych par.
*/

% 8.1.2

% para(X,Y) - Koñczy siê sukcesem, je¿eli X jest kobiet¹, Y jest mê¿czyzn¹ i maj¹ wspólne dziecko.

/*
1 ?- para(X,Y).
X = ola,
Y = tomek ;
false.
*/

% 8.2

/*
Dokonaj analizy przyk³adów ze strony:

http://www.balois.pl/jipp/prolog/obciecia.htm
*/

/*
1 ?- rodzice(max).
ojciec: tomek
matka: ola
true.

2 ?- rodzice(lila).
ojciec: tomek
true.

3 ?- rodzice(kasia).
ojciec: max
true.

4 ?- rodzice(ola).
brak danych
true.
*/

% 8.3.1

/*
X jest potomkiem Y.

X <- Y
X <- Z <- Y
 \__/ \__/

X <- ... <- Y
*/

/*
1 ?- potomek(ola,tomek).
false.

2 ?- potomek(radek,tomek).
true ;
false.
*/

/* Task 2

1. Na ile sposobów mo¿na okreœliæ regu³ê potomek?

2. Podaj wszystkie mo¿liwe rozwi¹zania dla regu³y potomek.

3. Czy regu³y potomek(X,Y) i potomek2(X,Y) s¹ równowa¿ne?
*/

% Regu³a potomek3(X,Y) jest niewielk¹ modyfikacj¹ regu³y potomek(X,Y).

potomek3(X,Y) :- rodzic(Y,X).
potomek3(X,Y) :- potomek3(X,Z), rodzic(Y,Z). % Nie jest poprawne umieszczanie wywo³ania rekurencyjnego jako pierwszego predykatu w treœci regu³y.

/*
1 ?- potomek3(ola,tomek).
ERROR: Out of local stack

2 ?- potomek3(radek,tomek).
true ;
ERROR: Out of local stack
*/

% 8.4

/*
Skopiuj bazê wiedzy ze strony: http://www.balois.pl/jipp/help/
*/

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

% 8.4.1

% zabytki_m(M) :-

/*
1 ?- zabytki_m('Berlin').
Brama Brandenburska
Reichstag
true.
*/

% 8.4.2

% zabytki_mp(M) :-

/*
2 ?- zabytki_mp('Berlin').
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

% delta(A,B,C,W) :-

% trojmian(...) :-

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

/* Task 3

Podaj drugie rozwi¹zanie z wykorzystaniem operatora obciêcia !.
*/

% 8.6 *

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
