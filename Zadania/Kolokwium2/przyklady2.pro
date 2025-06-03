kraj('Polska').
kraj('Francja').
kraj('W�ochy').
kraj('Hiszpania').

miasto('Warszawa').
miasto('Krak�w').
miasto('Pary�').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').

polozenie('Warszawa','Polska').
polozenie('Krak�w','Polska').
polozenie('Pary�','Francja').
polozenie('Rzym','W�ochy').
polozenie('Wenecja','W�ochy').
polozenie('Barcelona','Hiszpania').
polozenie('Madryt','Hiszpania').

zabytek('Pa�ac w Wilanowie').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Ko�ci� Mariacki').
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

gdzie('Pa�ac w Wilanowie','Warszawa').
gdzie('Wawel','Krak�w').
gdzie('Sukiennice','Krak�w').
gdzie('Ko�ci� Mariacki','Krak�w').
gdzie('Wie�a Eiffla','Pary�').
gdzie('Katedra Notre-Dame','Pary�').
gdzie('Pa�ac Elizejski','Pary�').
gdzie('Bazylika �w. Paw�a za Murami','Rzym').
gdzie('Koloseum','Rzym').
gdzie('Zamek �wi�tego Anio�a','Rzym').
gdzie('Bazylika �w. Marka','Wenecja').
gdzie('Pa�ac Do��w','Wenecja').
gdzie('Sagrada Familia','Barcelona').
gdzie('Pa�ac Kryszta�owy','Madryt').

% Zadanie 1
/*
Podaj pytania pozwalaj�ce uzyska� informacje:
   * Jakie zabytki znajduj� si� w Warszawie?
   * W jakim pa�stwie jest Sagrada Familia?
   * Jakie zabytki mo�na znale�� w pa�stwie, w kt�rym znajduje si� Rzym?
   * Czy w bazie s� jakie� zabytki zlokalizowane w Rosji?
*/

/*
Jakie zabytki znajduj� si� w Warszawie?
1 ?- zabytek(Z), gdzie(Z,'Warszawa'), miasto('Warszawa').
Z = 'Pa�ac w Wilanowie' ;
false.

W jakim pa�stwie jest Sagrada Familia?
2 ?- zabytek('Sagrada Familia'), gdzie('Sagrada Familia',M), miasto(M), polozenie(M,P), kraj(P).
M = 'Barcelona',
P = 'Hiszpania'.

Jakie zabytki mo�na znale�� w pa�stwie, w kt�rym znajduje si� Rzym?
3 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), kraj(P), polozenie('Rzym',P), miasto('Rzym').
Z = 'Bazylika �w. Paw�a za Murami',
M = 'Rzym',
P = 'W�ochy' ;
Z = 'Koloseum',
M = 'Rzym',
P = 'W�ochy' ;
Z = 'Zamek �wi�tego Anio�a',
M = 'Rzym',
P = 'W�ochy' ;
Z = 'Bazylika �w. Marka',
M = 'Wenecja',
P = 'W�ochy' ;
Z = 'Pa�ac Do��w',
M = 'Wenecja',
P = 'W�ochy' ;
false.

Czy w bazie s� jakie� zabytki zlokalizowane w Rosji?
4 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,'Rosja'), kraj('Rosja').
false.
*/



% Zadanie 2
/*
Napisz program pozwalaj�cy wyznaczy�:
200
     i - 2
II  -------
    i^2 + 1
i=1
*/

listProd([X],X).
listProd([X,Y|T],Prod) :-
  Z is X * Y,
  listProd([Z|T],Prod).

f1(X,Y) :- Y is (X - 2)/(X*X + 1).

p1(X) :-
  numlist(1,200,L1),
  maplist(f1,L1,L2),
  listProd(L2,X),
  !.

/*
1 ?- p1(X).
X = -0.0.
*/



% Zadanie 3
/*
Zdefiniuj rekurencyjny predykat seq(N,X),
wyznaczaj�cy warto�� N-tego wyrazu ci�gu 
liczbowego zdefiniowanego nast�puj�co:
         | 2                           gdy�N=1
seq(N) = | 3                           gdy�N=2
         | seq(N-1) + (seq(N-2) - 1)   gdy�N>2
*/

seq(N,X) :-
  N > 2,
  N1 is N - 1,
  N2 is N - 2,
  seq(N1,X1),
  seq(N2,X2),
  X is X1 + (X2 - 1).
seq(1,2).
seq(2,3).

/*
1 ?- seq(0,X).
false.

2 ?- seq(1,X).
X = 2.

3 ?- seq(2,X).
X = 3.

4 ?- seq(3,X).
X = 4.

5 ?- seq(4,X).
X = 6.

6 ?- seq(5,X).
X = 9.

7 ?- seq(6,X).
X = 14.

8 ?- seq(7,X).
X = 22.

9 ?- seq(8,X).
X = 35.
*/



% Zadanie 4
/*
Zdefiniuj predykat init2(X,Y), pobieraj�cy z listy X wszystkie 
elementy z pomini�ciem dw�ch ostatnich (Y jest list� wynikow�).
Predykat ma dzia�a� dla list o d�ugo�ci co najmniej 2.
*/

init2(X,Y) :-
  length(X,L),
  L >= 2,
  reverse(X,W),
  [_,_|T] = W,
  reverse(T,Y).

/*
1 ?- init2([],Y).
false.

2 ?- init2([a],Y).
false.

3 ?- init2([a,b],Y).
Y = [].

4 ?- init2([a,b,c],Y).
Y = [a].

5 ?- init2([a,b,c,d],Y).
Y = [a, b].

6 ?- init2([a,b,c,d,e],Y).
Y = [a, b, c].

7 ?- init2([a,b,c,d,e,f],Y).
Y = [a, b, c, d].
*/



% Zadanie 5
/*
Napisz program rozwi�zuj�cy nast�puj�ce zadanie:
Wpisa� liczby od 1 do 9 tak, aby sumy liczb wyst�puj�cych 
w wierzcho�kach sze�ciu poszczeg�lnych kwadrat�w by�y r�wne.

A-----B-----C
|   / | \   |
|  /  |  \  |
| /   |   \ |
D-----E-----F
| \   |   / |
|  \  |  /  |
|   \ | /   |
G-----H-----I

W programie mo�na u�y� predykat assign:
assign([],_).
assign([V|Vs],L1) :-
  select(V,L1,L2),
  assign(Vs,L2).
*/

assign([],_).
assign([V|Vs],L1) :-
  select(V,L1,L2),
  assign(Vs,L2).

solve :-
  P = [A,B,C,D,E,F,G,H,I],
  M = [1,2,3,4,5,6,7,8,9],
  assign(P,M),
  Sum = A + C + I + G,
  Sum =:= B + F + H + D,
  Sum =:= A + B + D + E,
  Sum =:= B + C + F + E,
  Sum =:= D + E + H + G,
  Sum =:= E + F + I + H,
  writeln(P),
  fail.

/*
[A,B,C,D,E,F,G,H,I]

1 ?- solve.
[1,6,7,8,5,2,3,4,9]
[1,8,3,6,5,4,7,2,9]
[3,4,9,8,5,2,1,6,7]
[3,8,1,4,5,6,9,2,7]
[7,2,9,6,5,4,1,8,3]
[7,6,1,2,5,8,9,4,3]
[9,2,7,4,5,6,3,8,1]
[9,4,3,2,5,8,7,6,1]
false.
*/
