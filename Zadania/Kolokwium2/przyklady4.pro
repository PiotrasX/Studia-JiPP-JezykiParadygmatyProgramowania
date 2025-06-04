rodzic(ola,max).
rodzic(tomek,max).
rodzic(tomek,lila).
rodzic(max,ania).
rodzic(max,kasia).
rodzic(kasia,radek).

kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(ania).

mezczyzna(tomek).
mezczyzna(max).
mezczyzna(radek).

matka(X,Y) :-
  rodzic(X,Y),
  kobieta(X).

ojciec(X,Y) :-
  rodzic(X,Y),
  mezczyzna(X).

% Zadanie 1
/*
Zdefiniuj poni¿sze regu³y:
   * potomek(N,X,Y) - Koñczy siê sukcesem, jeœli X jest potomkiem Y stopnia N.
   * potomkowie(N,X) - Wypisuje kolejno dla X jego potomków stopnia N.
*/

potomek(N,X,Y) :-
  N > 1,
  N1 is N - 1,
  rodzic(Y,Z),
  potomek(N1,X,Z).
potomek(1,X,Y) :-
  rodzic(Y,X).
potomek(0,X,Y) :-
  X = Y.

potomkowie(N,X) :-
  potomek(N,P,X),
  writeln(P),
  fail.
potomkowie(_,_).

/*
1 ?- potomek(0,max,max).
true.

2 ?- potomek(0,ania,max).
false.

3 ?- potomek(1,max,max).
false.

4 ?- potomek(1,ania,max).
true.

5 ?- potomek(1,D,max).
D = ania ;
D = kasia.

6 ?- potomkowie(0,max).
max
true.

7 ?- potomkowie(1,max).
ania
kasia
true.

8 ?- potomkowie(2,max).
radek
true.
*/



% Zadanie 2
/*
Zdefiniuj predykat sum/2 obliczaj¹cy 
sumê elementów listy przy pomocy akumulatora.

sum([],0).
sum(L,N) :- acc(L,0,N).

acc([],A,A).
acc([H|T],A,N) :- /// uzupe³niæ ///
*/

sum([],0) :- !.
sum(L,N) :- acc(L,0,N).

acc([],A,A).
acc([H|T],A,N) :-
  B is A + H,
  acc(T,B,N).

/*
1 ?- sum([],N).
N = 0.

2 ?- sum([3],N).
N = 3.

3 ?- sum([3,5],N).
N = 8.

4 ?- sum([3,5,1],N).
N = 9.

5 ?- sum([3,5,1,4],N).
N = 13.

6 ?- sum([3,5,1,4,9],N).
N = 22.
*/



% Zadanie 3
/*
Zdefiniuj nastêpuj¹ce regu³y:
   * cia2ele(X) - Wypisuje wszystkie ci¹gi dwuelementowe utworzone z elementów zbioru X.
   * pod2ele(X) - Wypisuje wszystkie podzbiory dwuelementowe utworzone z elementów zbioru X.
Zak³adamy, ¿e zbiór X jest reprezentowany przy pomocy listy.
*/

cia2ele(X) :-
  select(A,X,_),
  select(B,X,_),
  write(A), tab(1), write(B),
  nl, fail.

pod2ele(X) :-
  select(A,X,Rest),
  select(B,Rest,_),
  A < B,
  write(A), tab(1), write(B), 
  nl, fail.

/*
1 ?- cia2ele([1,2,3]).
1 1
1 2
1 3
2 1
2 2
2 3
3 1
3 2
3 3
false.

2 ?- pod2ele([1,2,3]).
1 2
1 3
2 3
false.
*/



% Zadanie 4
/*
Zdefiniuj nastêpuj¹ce regu³y:
   * printList(L,N) - Wypisuje wszystkie elementy listy L po N elementów w kolejnych wierszach.
   * printSquare(L) - Wypisuje wszystkie elementy listy L w taki sposób, aby utworzy³y one kwadrat.

printList(L,N) :- printList(L,N,N).

printList([],_,_).
printList([H|T],N,1) :- write(H), nl, printList(T,N,N), !.
printList([H|T],N,M) :- /// uzupe³niæ ///
*/

printList(L,N) :- printList(L,N,N).

printList([],_,_) :- !.
printList([H|T],N,1) :-
    write(H), nl,
    printList(T,N,N), !.
printList([H|T],N,M) :-
    write(H), write(' '),
    M1 is M - 1,
    printList(T,N,M1).

printSquare(L) :-
    length(L,Len),
    Sqrt is round(sqrt(Len)),
    printList(L,Sqrt).

/*
1 ?- printList([a,b,c,d,e,f,g,h],3).
a b c
d e f
g h
true.

2 ?- printList([a,b,c,d,e,f,g,h],2).
a b
c d
e f
g h
true.

3 ?- printSquare([a,b,c,d,e,f,g,h]).
a b c
d e f
g h
true.
*/



% Zadanie 5
/*
Zdefiniuj nastêpuj¹ce regu³y:
   * ciag1(N) - Wyœwietla kolejno w kolumnie liczby N, N-1, ..., 2, 1.
   * ciag2(N) - Wyœwietla kolejno w kolumnie liczby 1, 2, ..., N-1, N.
W ciag2(N) zdefiniowaæ regu³ê pomocnicz¹ ciag2(N,M) i zrobiæ wywo³anie:
ciag2(N) :- ciag2(N,1).
*/

ciag1(N) :-
  N > 0,
  writeln(N),
  N1 is N - 1,
  ciag1(N1).

ciag2(N) :- ciag2(N,1).

ciag2(N,M) :-
  M =< N,
  writeln(M),
  M1 is M + 1,
  ciag2(N,M1).

/*
1 ?- ciag1(0).
false.

2 ?- ciag1(1).
1
false.

3 ?- ciag1(2).
2
1
false.

4 ?- ciag1(3).
3
2
1
false.

5 ?- ciag1(4).
4
3
2
1
false.

6 ?- ciag1(5).
5
4
3
2
1
false.

7 ?- ciag2(0).
false.

8 ?- ciag2(1).
1
false.

9 ?- ciag2(2).
1
2
false.

10 ?- ciag2(3).
1
2
3
false.

11 ?- ciag2(4).
1
2
3
4
false.

12 ?- ciag2(5).
1
2
3
4
5
false.
*/



% Zadanie 6
/*
Zdefiniuj regu³ê equal(P,Q) sprawdzaj¹c¹, 
czy wartoœci logiczne P i Q s¹ identyczne.
Zauwa¿yæ, ¿e:
(p <=> q) <=> (p => q i q => p)
(p => q) <=> (¬p lub q)
a zatem:
(p <=> q) <=> ((¬p lub q) i (¬q lub p))
W definicji regu³y wykorzystaæ operatory: \+ oraz ; oraz ,
*/

equal(P,Q) :-
  (\+ P ; Q),
  (\+ Q ; P).

/*
1 ?- equal(true,true).
true.

2 ?- equal(true,false).
false.

3 ?- equal(false,true).
false.

4 ?- equal(false,false).
true ;
false.
*/
