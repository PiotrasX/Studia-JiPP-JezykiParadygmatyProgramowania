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

siostra(X,Y) :-
  rodzic(R,X),
  rodzic(R,Y),
  kobieta(X),
  X \= Y.

para(X,Y) :-
  kobieta(X),
  mezczyzna(Y),
  rodzic(X,D),
  rodzic(Y,D).

brat(X,Y) :-
  rodzic(R,X),
  rodzic(R,Y),
  mezczyzna(X),
  X \= Y.

rodzina(X,Y,Z1,Z2) :-
  kobieta(X),
  mezczyzna(Y),
  Z1 \= Z2,
  matka(X,Z1),
  matka(X,Z2),
  ojciec(Y,Z1),
  ojciec(Y,Z2).

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

potomek(X,Y) :- rodzic(Y,X).
potomek(X,Y) :- rodzic(Y,Z), potomek(X,Z).

potomkowie(X) :-
  potomek(P,X),
  write(P), 
  nl, fail.
potomkowie(_).
