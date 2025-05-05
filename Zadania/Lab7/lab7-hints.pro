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

/* Task 1 *

Zapoznaj siê z definicj¹ predykatu.

https://pl.wikipedia.org/wiki/Predykat
*/

% 7.1

/* AND operator

1 ?- true, true.
true.

2 ?- false, true.
false.

3 ?- true, false.
false.

4 ?- false, false.
false.
*/

/* OR operator

1 ?- true; true.
true .

2 ?- true; true.
true ;
true.

3 ?- false; true.
true.

4 ?- true; false.
true .

5 ?- true; false.
true ;
false.

6 ?- false; false.
false.
*/

/* Task 2

Omów nastêpuj¹cy przyk³ad:
*/

predicate1 :- true.  % Mo¿esz zmieniæ true na false.
predicate2 :- false. % Mo¿esz zmieniæ false na true.

% Zamiast u¿ywaæ operatora ;

or :- predicate1; predicate2.

/*
1 ?- or.
true ;
false.
*/

% Zwykle definiujemy osobne regu³y dla ka¿dego przypadku:

or2 :- predicate1.
or2 :- predicate2.

/*
1 ?- or2.
true ;
false.
*/

% 7.1.9

% R -> D -> W (mezczyzna)

% 7.2 *

% Zadanie domowe

% 7.3

/*
Skopiuj bazê wiedzy o zabytkach ze strony:

https://www.balois.pl/jipp/help
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

/* Task 3

Czy relacja jest symetryczna?
*/

/* Task 4

Dodatkowo, dla zadania 7.3.6 zdefiniuj równowa¿ne regu³y
sasiad i sasiad2 na dwa sposoby i u¿yj ich w zapytaniach.

Czy regu³y sasiad i sasiad2 powinny byæ symetryczne?
*/
