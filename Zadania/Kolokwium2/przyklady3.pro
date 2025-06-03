kobieta(ola).
kobieta(kasia).
kobieta(ania).

mezczyzna(tomek).
mezczyzna(maks).
mezczyzna(adam).

pizza(capricciosa,24.90).
pizza(roma,27.00).
pizza(califfo,30.40).

skladnik(ser,capricciosa).
skladnik(szynka,capricciosa).
skladnik(pieczarki,capricciosa).
skladnik(ser,roma).
skladnik(salami,roma).
skladnik(kabanosy,roma).
skladnik(papryka,roma).
skladnik(ser,califfo).
skladnik(szynka,califfo).
skladnik(kabanosy,califfo).
skladnik(papryka,califfo).
skladnik(oliwki,califfo).

lubi(ola,szynka).
lubi(ola,oliwki).
lubi(kasia,szynka).
lubi(kasia,salami).
lubi(ania,oliwki).
lubi(ania,papryka).
lubi(ania,pieczarki).
lubi(tomek,szynka).
lubi(tomek,oliwki).
lubi(maks,salami).
lubi(maks,szynka).
lubi(maks,kabanosy).
lubi(maks,pieczarki).
lubi(adam,szynka).

% Zadanie 1
/*
Podaj pytania pozwalaj¹ce uzyskaæ informacje:
   * Jakie sk³adniki lubi Ania?
   * Jakie sk³adniki lubi¹ Ola i Tomek (tj. sk³adniki, które lubi¹ oboje)?
   * Która pizza kosztuje wiêcej ni¿ 30 z³?
   * Która pizza zawiera kabanosy?
*/

/*
Jakie sk³adniki lubi Ania?
1 ?- kobieta(ania), lubi(ania,S).
S = oliwki ;
S = papryka ;
S = pieczarki.

Jakie sk³adniki lubi¹ Ola i Tomek (tj. sk³adniki, które lubi¹ oboje)?
2 ?- kobieta(ola), mezczyzna(tomek), lubi(ola,S), lubi(tomek,S).
S = szynka ;
S = oliwki.

Która pizza kosztuje wiêcej ni¿ 30 z³?
3 ?- pizza(P,C), C > 30.
P = califfo,
C = 30.4.

Która pizza zawiera kabanosy?
4 ?- pizza(P,_), skladnik(kabanosy,P).
P = roma ;
P = califfo.
*/



% Zadanie 2
/*
Zdefiniuj predykat dobrapizza(X,Y) który wyszukuje pizze Y, 
zawieraj¹ce co najmniej 2 ró¿ne sk³adniki, które lubi osoba X.
*/

dobrapizza(X,Y) :-
  pizza(Y,_),
  lubi(X,S1),
  lubi(X,S2),
  skladnik(S1,Y),
  skladnik(S2,Y),
  S1 \= S2.

/*
1 ?- dobrapizza(X,Y).
X = maks,
Y = capricciosa ;
X = maks,
Y = capricciosa ;
X = maks,
Y = roma ;
X = maks,
Y = roma ;
X = ola,
Y = califfo ;
X = ola,
Y = califfo ;
X = ania,
Y = califfo ;
X = ania,
Y = califfo ;
X = tomek,
Y = califfo ;
X = tomek,
Y = califfo ;
X = maks,
Y = califfo ;
X = maks,
Y = califfo ;
false.
*/



% Zadanie 3
/*
Napisz program pozwalaj¹cy wyznaczyæ:
1500
     i + 1
 E  -------
    i^2 + 2
i=2
*/

listSum([X],X).
listSum([X,Y|T],Sum) :-
  Z is X + Y,
  listSum([Z|T],Sum).

f1(X,Y) :- Y is (X + 1)/(X*X + 2).

s1(X) :-
  numlist(2,1500,L1),
  maplist(f1,L1,L2),
  listSum(L2,X),
  !.

/*
1 ?- s1(X).
X = 7.116163439283606.
*/



% Zadanie 4
/*
Zdefiniuj predykat drop(N,X,Y) usuwaj¹cy N pocz¹tkowych 
elementów z listy X (Y jest list¹ wynikow¹).
*/

drop(0,X,X) :- !.
drop(_,[],[]) :- !.
drop(N,X,Y) :-
  M is N - 1,
  X = [_ | X1],
  Y = Y1,
  drop(M,X1,Y1).

/*
1 ?- drop(0,[a,b,c],Y).
Y = [a, b, c].

2 ?- drop(3,[],Y).
Y = [].

3 ?- drop(2,[a],Y).
Y = [].

4 ?- drop(2,[a,b],Y).
Y = [].

5 ?- drop(2,[a,b,c],Y).
Y = [c].

6 ?- drop(2,[a,b,c,d],Y).
Y = [c, d].

7 ?- drop(2,[a,b,c,d,e],Y).
Y = [c, d, e].
*/



% Zadanie 5
/*
Napisz program rozwi¹zuj¹cy nastêpuj¹ce zadanie:
W wierzcho³kach szeœcianu wpisaæ liczby od 1 do 8 
w ten sposób, aby sumy na ka¿dej œcianie by³y równe.

    A---------B
   /|        /|
  / |       / |
 /  |      /  |
D---------C   |
|   |     |   |
|   E-----|---F
|  /      |  /
| /       | /
|/        |/
H---------G

W programie mo¿na u¿yæ predykat assign:
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
  P = [A,B,C,D,E,F,G,H],
  M = [1,2,3,4,5,6,7,8],
  assign(P,M),
  Sum = A + B + C + D,
  Sum =:= E + F + G + H,
  Sum =:= A + B + F + E,
  Sum =:= B + F + C + G,
  Sum =:= D + C + G + H,
  Sum =:= A + E + H + D,
  writeln(P),
  fail.

/*
[A,B,C,D,E,F,G,H,I]

1 ?- solve.
[1,4,5,8,6,7,2,3]
[1,4,5,8,7,6,3,2]
[1,4,6,7,8,5,3,2]
[1,4,7,6,8,5,2,3]
[1,6,3,8,4,7,2,5]
[1,6,3,8,7,4,5,2]
[1,6,4,7,8,3,5,2]
[1,6,7,4,8,3,2,5]
[1,7,2,8,4,6,3,5]
[1,7,2,8,6,4,5,3]
[1,7,4,6,8,2,5,3]
[1,7,6,4,8,2,3,5]
[1,8,2,7,4,5,3,6]
[1,8,2,7,6,3,5,4]
[1,8,3,6,4,5,2,7]
[1,8,3,6,7,2,5,4]
[1,8,5,4,6,3,2,7]
[1,8,5,4,7,2,3,6]
[2,3,5,8,7,6,4,1]
[2,3,6,7,5,8,1,4]
[2,3,6,7,8,5,4,1]
[2,3,8,5,7,6,1,4]
[2,5,3,8,7,4,6,1]
[2,5,4,7,3,8,1,6]
[2,5,4,7,8,3,6,1]
[2,5,8,3,7,4,1,6]
[2,7,1,8,3,6,4,5]
[2,7,1,8,5,4,6,3]
[2,7,4,5,3,6,1,8]
[2,7,4,5,8,1,6,3]
[2,7,6,3,5,4,1,8]
[2,7,6,3,8,1,4,5]
[2,8,1,7,3,5,4,6]
[2,8,1,7,5,3,6,4]
[2,8,3,5,7,1,6,4]
[2,8,5,3,7,1,4,6]
[3,2,5,8,6,7,4,1]
[3,2,7,6,5,8,1,4]
[3,2,7,6,8,5,4,1]
[3,2,8,5,6,7,1,4]
[3,5,2,8,6,4,7,1]
[3,5,4,6,2,8,1,7]
[3,5,4,6,8,2,7,1]
[3,5,8,2,6,4,1,7]
[3,6,1,8,2,7,4,5]
[3,6,1,8,5,4,7,2]
[3,6,4,5,2,7,1,8]
[3,6,4,5,8,1,7,2]
[3,6,7,2,5,4,1,8]
[3,6,7,2,8,1,4,5]
[3,8,1,6,2,5,4,7]
[3,8,1,6,5,2,7,4]
[3,8,2,5,6,1,7,4]
[3,8,5,2,6,1,4,7]
[4,1,6,7,5,8,3,2]
[4,1,7,6,5,8,2,3]
[4,1,8,5,6,7,2,3]
[4,1,8,5,7,6,3,2]
[4,5,2,7,1,8,3,6]
[4,5,2,7,6,3,8,1]
[4,5,3,6,1,8,2,7]
[4,5,3,6,7,2,8,1]
[4,5,8,1,6,3,2,7]
[4,5,8,1,7,2,3,6]
[4,6,1,7,5,3,8,2]
[4,6,3,5,1,7,2,8]
[4,6,3,5,7,1,8,2]
[4,6,7,1,5,3,2,8]
[4,7,1,6,5,2,8,3]
[4,7,2,5,1,6,3,8]
[4,7,2,5,6,1,8,3]
[4,7,6,1,5,2,3,8]
[5,2,3,8,4,7,6,1]
[5,2,7,4,3,8,1,6]
[5,2,7,4,8,3,6,1]
[5,2,8,3,4,7,1,6]
[5,3,2,8,4,6,7,1]
[5,3,6,4,2,8,1,7]
[5,3,6,4,8,2,7,1]
[5,3,8,2,4,6,1,7]
[5,4,1,8,2,7,6,3]
[5,4,1,8,3,6,7,2]
[5,4,6,3,2,7,1,8]
[5,4,6,3,8,1,7,2]
[5,4,7,2,3,6,1,8]
[5,4,7,2,8,1,6,3]
[5,8,1,4,2,3,6,7]
[5,8,1,4,3,2,7,6]
[5,8,2,3,4,1,7,6]
[5,8,3,2,4,1,6,7]
[6,1,4,7,3,8,5,2]
[6,1,7,4,3,8,2,5]
[6,1,8,3,4,7,2,5]
[6,1,8,3,7,4,5,2]
[6,3,2,7,1,8,5,4]
[6,3,2,7,4,5,8,1]
[6,3,5,4,1,8,2,7]
[6,3,5,4,7,2,8,1]
[6,3,8,1,4,5,2,7]
[6,3,8,1,7,2,5,4]
[6,4,1,7,3,5,8,2]
[6,4,5,3,1,7,2,8]
[6,4,5,3,7,1,8,2]
[6,4,7,1,3,5,2,8]
[6,7,1,4,3,2,8,5]
[6,7,2,3,1,4,5,8]
[6,7,2,3,4,1,8,5]
[6,7,4,1,3,2,5,8]
[7,1,4,6,2,8,5,3]
[7,1,6,4,2,8,3,5]
[7,1,8,2,4,6,3,5]
[7,1,8,2,6,4,5,3]
[7,2,3,6,1,8,5,4]
[7,2,3,6,4,5,8,1]
[7,2,5,4,1,8,3,6]
[7,2,5,4,6,3,8,1]
[7,2,8,1,4,5,3,6]
[7,2,8,1,6,3,5,4]
[7,4,1,6,2,5,8,3]
[7,4,5,2,1,6,3,8]
[7,4,5,2,6,1,8,3]
[7,4,6,1,2,5,3,8]
[7,6,1,4,2,3,8,5]
[7,6,3,2,1,4,5,8]
[7,6,3,2,4,1,8,5]
[7,6,4,1,2,3,5,8]
[8,1,4,5,2,7,6,3]
[8,1,4,5,3,6,7,2]
[8,1,6,3,2,7,4,5]
[8,1,6,3,5,4,7,2]
[8,1,7,2,3,6,4,5]
[8,1,7,2,5,4,6,3]
[8,2,3,5,1,7,6,4]
[8,2,5,3,1,7,4,6]
[8,2,7,1,3,5,4,6]
[8,2,7,1,5,3,6,4]
[8,3,2,5,1,6,7,4]
[8,3,5,2,1,6,4,7]
[8,3,6,1,2,5,4,7]
[8,3,6,1,5,2,7,4]
[8,5,2,3,1,4,7,6]
[8,5,3,2,1,4,6,7]
[8,5,4,1,2,3,6,7]
[8,5,4,1,3,2,7,6]
false.
*/
