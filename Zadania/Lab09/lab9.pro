% 9.1

/*
1 ?- [H | T] = [].
false.

2 ?- [H | T] = [a].
H = a,
T = [].

3 ?- [H | T] = [a, b].
H = a,
T = [b].

4 ?- [H | T] = [a, b, c].
H = a,
T = [b, c].

5 ?- [H | T] = [a, b, c, d].
H = a,
T = [b, c, d].

6 ?- [H | T] = [a, b, c, d, e].
H = a,
T = [b, c, d, e].
*/

take2(_,[],[]) :- !.
take2(0,_,[]) :- !.
take2(N,T,L) :-
  M is N - 1,
  T = [H | T1],
  L = [H | L1],
  take2(M,T1,L1).

/*
7 ?- take2(2,[],X).
X = [].

8 ?- take2(0,[a,b,c,d],X).
X = [].

9 ?- take2(2,[a,b,c,d],X).
X = [a, b].
*/

take(_,[],[]) :- !.
take(0,_,[]) :- !.
take(N,[H | T],[H | L]) :-
  M is N - 1,
  take(M,T,L).

/*
10 ?- take(2,[],X).
X = [].

11 ?- take(0,[a,b,c,d],X).
X = [].

12 ?- take(2,[a,b,c,d],X).
X = [a, b].
*/

/*
Dokonaj analizy wywo³ania take(2,[a,b,c,d],X).

1. Przebieg z góry do do³u.                   2. Przebieg z do³u do góry.
                                                                                         
* 1 take(2,[a,b,c,d],X) =>                    * 1 take(2,[a,b,c,d],X) => X = [a,b]
  N = 2                                         N = 2
  [H | T] = [a,b,c,d] => H = a, T = [b,c,d]     [H | T] = [a,b,c,d] => H = a, T = [b,c,d]
  X := [H | L] = [a | L] =                      X := [H | L] = [a | L] = [a | [b]] = [a,b]
  :-                                            :-                                       
  M is 2 - 1 = 1                                M is 2 - 1 = 1                           
  2 take(1,[b,c,d],L) =>                        2 take(1,[b,c,d],L) => L = [b]
                                                                                         
* 2 take(1,[b,c,d],L) =>                      * 2 take(1,[b,c,d],L) => L = [b]
  N = 1                                         N = 1                                    
  [H | T] = [b,c,d] => H = b, T = [c,d]         [H | T] = [b,c,d] => H = b, T = [c,d]
  L := [H | L] = [b | L] =                      L := [H | L] = [b | L] = [b | []] = [b]
  :-                                            :-                                       
  M is 1 - 1 = 0                                M is 1 - 1 = 0                           
  3 take(0,[c,d],L) =>                          3 take(0,[c,d],L) => L = []
                                                                                         
* 3 take(0,[c,d],L) =>                        * 3 take(0,[c,d],L) => L = []
  0 = 0                                         0 = 0                                    
  _ = [c,d]                                     _ = [c,d]                                
  L = []                                        L = []
  :-                                            :-
  !                                             !
*/

/*
13 ?- trace.
true.

[trace] 13 ?- take(2,[a,b,c,d],X).
   Call: (12) take(2, [a, b, c, d], _9116) ? creep
   Call: (13) _10488 is 2+ -1 ? creep
   Exit: (13) 1 is 2+ -1 ? creep
   Call: (13) take(1, [b, c, d], _10480) ? creep
   Call: (14) _12936 is 1+ -1 ? creep
   Exit: (14) 0 is 1+ -1 ? creep
   Call: (14) take(0, [c, d], _12928) ? creep
   Exit: (14) take(0, [c, d], []) ? creep
   Exit: (13) take(1, [b, c, d], [b]) ? creep
   Exit: (12) take(2, [a, b, c, d], [a, b]) ? creep
X = [a, b].

[trace] 14 ?- nodebug.
true.
*/

% 9.2

drop2(_,[],[]) :- !.
drop2(0,T,T) :- !.
drop2(N,T,L) :-
  M is N - 1,
  T = [_ | T1],
  L = L1,
  drop2(M,T1,L1).

/*
1 ?- drop2(2,[],X).
X = [].

2 ?- drop2(0,[a,b,c,d],X).
X = [a, b, c, d].

3 ?- drop2(2,[a,b,c,d],X).
X = [c, d].
*/

drop(_,[],[]) :- !.
drop(0,T,T) :- !.
drop(N,[_ | T],L) :-
  M is N - 1,
  drop(M,T,L).

/*
4 ?- drop(2,[],X).
X = [].

5 ?- drop(0,[a,b,c,d],X).
X = [a, b, c, d].

6 ?- drop(2,[a,b,c,d],X).
X = [c, d].
*/

/*
Dokonaj analizy wywo³ania drop(2,[a,b,c,d],X).

1. Przebieg z góry do do³u.                   2. Przebieg z do³u do góry.
                                                                                         
* 1 drop(2,[a,b,c,d],X) =>                    * 1 drop(2,[a,b,c,d],X) => X = [c,d]
  N = 2                                         N = 2
  [_ | T] = [a,b,c,d] => _ = a, T = [b,c,d]     [_ | T] = [a,b,c,d] => _ = a, T = [b,c,d]
  X := L =                                      X := L = [c,d]
  :-                                            :-                                       
  M is 2 - 1 = 1                                M is 2 - 1 = 1
  2 drop(1,[b,c,d],L) =>                        2 drop(1,[b,c,d],L) => L = [c,d]
                                                                                         
* 2 drop(1,[b,c,d],L) =>                      * 2 drop(1,[b,c,d],L) => L = [c,d]
  N = 1                                         N = 1                                    
  [_ | T] = [b,c,d] => _ = b, T = [c,d]         [_ | T] = [b,c,d] => _ = b, T = [c,d]
  L := L =                                      L := L = [c,d]
  :-                                            :-                                       
  M is 1 - 1 = 0                                M is 1 - 1 = 0                           
  3 drop(0,[c,d],L) =>                          3 drop(0,[c,d],L) => L = [c,d]
                                                                                         
* 3 drop(0,[c,d],L) =>                        * 3 drop(0,[c,d],L) => L = [c,d]
  0 = 0                                         0 = 0                                    
  T = [c,d]                                     T = [c,d]
  L = T = [c,d]                                 L = T = [c,d]
  :-                                            :-
  !                                             !
*/

/*
7 ?- trace.
true.

[trace] 7 ?- drop(2,[a,b,c,d],X).
   Call: (12) drop(2, [a, b, c, d], _268) ? creep
   Call: (13) _1642 is 2+ -1 ? creep
   Exit: (13) 1 is 2+ -1 ? creep
   Call: (13) drop(1, [b, c, d], _268) ? creep
   Call: (14) _4084 is 1+ -1 ? creep
   Exit: (14) 0 is 1+ -1 ? creep
   Call: (14) drop(0, [c, d], _268) ? creep
   Exit: (14) drop(0, [c, d], [c, d]) ? creep
   Exit: (13) drop(1, [b, c, d], [c, d]) ? creep
   Exit: (12) drop(2, [a, b, c, d], [c, d]) ? creep
X = [c, d].

[trace] 8 ?- nodebug.
true.
*/

% 9.3

/*
1 ?- reverse([a,b,c],R).
R = [c, b, a].

2 ?- [c,b,a] = [_ | T].
T = [b, a].
*/

/*
L          R          T        I
[a,b,c] -> [c,b,a] -> [b,a] -> [a,b]
*/

init2(L,I) :-
  reverse(L,R),
  R = [_ | T],
  reverse(T,I).

/*
3 ?- init2([],I).
false.

4 ?- init2([a],I).
I = [].

5 ?- init2([a,b],I).
I = [a].

6 ?- init2([a,b,c],I).
I = [a, b].

7 ?- init2([a,b,c,d],I).
I = [a, b, c].
*/

init(L,I) :-
  reverse(L,[_ | T]),
  reverse(T,I).

/*
8 ?- init([],I).
false.

9 ?- init([a],I).
I = [].

10 ?- init([a,b],I).
I = [a].

11 ?- init([a,b,c],I).
I = [a, b].

12 ?- init([a,b,c,d],I).
I = [a, b, c].
*/

init3(L,I) :-
  length(L,M),
  N is M - 1,
  N >= 0,
  take(N,L,I).

/*
13 ?- init3([],I).
false.

14 ?- init3([a],I).
I = [].

15 ?- init3([a,b],I).
I = [a].

16 ?- init3([a,b,c],I).
I = [a, b].

17 ?- init3([a,b,c,d],I).
I = [a, b, c].
*/

% 9.4

/*
L            T          M
[a,b,c,d] -> [b,c,d] -> [b,c]
*/

middle2(L,M) :-
  L = [_ | T],
  init(T,M).

/*
18 ?- middle2([],M).
false.

19 ?- middle2([a],M).
false.

20 ?- middle2([a,b],M).
M = [].

21 ?- middle2([a,b,c],M).
M = [b].

22 ?- middle2([a,b,c,d],M).
M = [b, c].
*/

middle([_ | T],M) :-
  init(T,M).

/*
23 ?- middle([],M).
false.

24 ?- middle([a],M).
false.

25 ?- middle([a,b],M).
M = [].

26 ?- middle([a,b,c],M).
M = [b].

27 ?- middle([a,b,c,d],M).
M = [b, c].
*/

% 9.5

split(L,L1,L2) :-
  length(L,M),
  M > 2, !,
  N is M // 2,
  take(N,L,L1),
  drop(N,L,L2).
split([],[],[]) :- !.
split([L],[],[L]) :- !.
split([H | L],[H],L) :- !.

/*
28 ?- split([],L1,L2).
L1 = L2, L2 = [].

29 ?- split([a],L1,L2).
L1 = [],
L2 = [a].

30 ?- split([a,b],L1,L2).
L1 = [a],
L2 = [b].

31 ?- split([a,b,c],L1,L2).
L1 = [a],
L2 = [b, c].

32 ?- split([a,b,c,d],L1,L2).
L1 = [a, b],
L2 = [c, d].

33 ?- split([a,b,c,d,e],L1,L2).
L1 = [a, b],
L2 = [c, d, e].

34 ?- split([a,b,c,d,e,f],L1,L2).
L1 = [a, b, c],
L2 = [d, e, f].

35 ?- split([a,b,c,d,e,f,g],L1,L2).
L1 = [a, b, c],
L2 = [d, e, f, g].

36 ?- split([a,b,c,d,e,f,g,h],L1,L2).
L1 = [a, b, c, d],
L2 = [e, f, g, h].

37 ?- split([a,b,c,d,e,f,g,h,i],L1,L2).
L1 = [a, b, c, d],
L2 = [e, f, g, h, i].
*/

% 9.6

% permutation(P,L) -  P jest permutacj¹ listy L

permutation([],[]).
permutation(P,[H | T]) :-
    permutation(P1,T),
    append(A,B,P1),        % P1 dzielimy na dwie czêœci
    append(A,[H | B],P).   % P powstaje poprzez wstawienie elementu H w pewne miejsce listy P1

/*
1 ?- permutation([a,b],Y).
Y = [a, b] ;
Y = [b, a] ;

1 ?- permutation([a,b,c],Y).
Y = [a, b, c] ;
Y = [b, a, c] ;
Y = [c, a, b] ;
Y = [a, c, b] ;
Y = [b, c, a] ;
Y = [c, b, a] ;

1 ?- permutation([a,b,c,d],Y).
Y = [a, b, c, d] ;
Y = [b, a, c, d] ;
Y = [c, a, b, d] ;
Y = [d, a, b, c] ;
Y = [a, c, b, d] ;
Y = [b, c, a, d] ;
Y = [c, b, a, d] ;
Y = [d, b, a, c] ;
Y = [a, d, b, c] ;
Y = [b, d, a, c] ;
Y = [c, d, a, b] ;
Y = [d, c, a, b] ;
Y = [a, b, d, c] ;
Y = [b, a, d, c] ;
Y = [c, a, d, b] ;
Y = [d, a, c, b] ;
Y = [a, c, d, b] ;
Y = [b, c, d, a] ;
Y = [c, b, d, a] ;
Y = [d, b, c, a] ;
Y = [a, d, c, b] ;
Y = [b, d, c, a] ;
Y = [c, d, b, a] ;
Y = [d, c, b, a] ;
*/

/*
1 ?- permutation([a,b],[X,Y]).
X = a,
Y = b ;
X = b,
Y = a ;
false.

2 ?- permutation([a,b,c],[X,Y,Z]).
X = a,
Y = b,
Z = c ;
X = b,
Y = a,
Z = c ;
X = c,
Y = a,
Z = b ;
X = a,
Y = c,
Z = b ;
X = b,
Y = c,
Z = a ;
X = c,
Y = b,
Z = a ;
false.

3 ?- permutation([a,b,c,d],[X,Y,Z,W]).
X = a,
Y = b,
Z = c,
W = d ;
X = b,
Y = a,
Z = c,
W = d ;
X = c,
Y = a,
Z = b,
W = d ;
X = d,
Y = a,
Z = b,
W = c ;
X = a,
Y = c,
Z = b,
W = d ;
X = b,
Y = c,
Z = a,
W = d ;
X = c,
Y = b,
Z = a,
W = d ;
X = d,
Y = b,
Z = a,
W = c ;
X = a,
Y = d,
Z = b,
W = c ;
X = b,
Y = d,
Z = a,
W = c ;
X = c,
Y = d,
Z = a,
W = b ;
X = d,
Y = c,
Z = a,
W = b ;
X = a,
Y = b,
Z = d,
W = c ;
X = b,
Y = a,
Z = d,
W = c ;
X = c,
Y = a,
Z = d,
W = b ;
X = d,
Y = a,
Z = c,
W = b ;
X = a,
Y = c,
Z = d,
W = b ;
X = b,
Y = c,
Z = d,
W = a ;
X = c,
Y = b,
Z = d,
W = a ;
X = d,
Y = b,
Z = c,
W = a ;
X = a,
Y = d,
Z = c,
W = b ;
X = b,
Y = d,
Z = c,
W = a ;
X = c,
Y = d,
Z = b,
W = a ;
X = d,
Y = c,
Z = b,
W = a ;
false.
*/

% 9.7

middle(N,L,K) :-
  length(L,X),
  Y is 2 * N,
  Z is X - N,
  X > Y, !,
  take(Z,L,L1),
  drop(N,L1,K).
middle(_,_,[]) :- !.

/*
1 ?- middle(0,[],K).
K = [].

2 ?- middle(0,[a],K).
K = [a].

3 ?- middle(0,[a,b],K).
K = [a, b].

4 ?- middle(0,[a,b,c],K).
K = [a, b, c].

5 ?- middle(0,[a,b,c,d],K).
K = [a, b, c, d].

6 ?- middle(0,[a,b,c,d,e],K).
K = [a, b, c, d, e].

7 ?- middle(1,[],K).
K = [].

8 ?- middle(1,[a],K).
K = [].

9 ?- middle(1,[a,b],K).
K = [].

10 ?- middle(1,[a,b,c],K).
K = [b].

11 ?- middle(1,[a,b,c,d],K).
K = [b, c].

12 ?- middle(1,[a,b,c,d,e],K).
K = [b, c, d].

13 ?- middle(2,[],K).
K = [].

14 ?- middle(2,[a],K).
K = [].

15 ?- middle(2,[a,b],K).
K = [].

16 ?- middle(2,[a,b,c],K).
K = [].

17 ?- middle(2,[a,b,c,d],K).
K = [].

18 ?- middle(2,[a,b,c,d,e],K).
K = [c].
*/

% 9.8

move([],[]) :- !.
move([H | L],K) :-
  append(L,[H],K).

/*
1 ?- move([],K).
K = [].

2 ?- move([1,2,3,4],X), move(X,Y), move(Y,Z), move(Z,W).
X = [2, 3, 4, 1],
Y = [3, 4, 1, 2],
Z = [4, 1, 2, 3],
W = [1, 2, 3, 4].
*/

% 9.9

/*
1 ?- numlist(1,5,L).
L = [1, 2, 3, 4, 5].
*/

listSum([X],X).
listSum([X,Y|T],Sum) :-
  Z is X + Y,
  listSum([Z|T],Sum).

listProd([X],X).
listProd([X,Y|T],Prod) :-
  Z is X * Y,
  listProd([Z|T],Prod).

% Suma od 1 do 100 liczb postaci 1/n.

f1(X,Y) :- Y is 1/X.

s1(X) :-
  numlist(1,100,L1),
  maplist(f1,L1,L2),
  listSum(L2,X),
  !.

/*
2 ?- s1(X).
X = 5.187377517639621.
*/

% Iloczyn od 1 do 50 liczb postaci (1+n)/(2+n).

f2(X,Y) :- Y is (1+X)/(2+X).

p1(X) :-
  numlist(1,50,L1),
  maplist(f2,L1,L2),
  listProd(L2,X),
  !.

/*
3 ?- p1(X).
X = 0.03846153846153846.
*/

% (*) Suma od 1 do 1000 liczb postaci 1/(i^2).

f3(X,Y) :- Y is 1/(X*X).

s2(X) :-
  numlist(1,1000,L1),
  maplist(f3,L1,L2),
  listSum(L2,X),
  !.

/*
4 ?- s2(X).
X = 1.6439345666815615.
*/

% (*) Suma od 1 do 1000 liczb postaci (sqrt i)-(1/i).

f4(X,Y) :- Y is (sqrt(X))-(1/X).

s3(X) :-
  numlist(1,1000,L1),
  maplist(f4,L1,L2),
  listSum(L2,X),
  !.

/*
5 ?- s3(X).
X = 21089.970416620185.
*/

% (*) Iloczyn od 1 do 1000 liczb postaci (i+1)/(i^3).

f5(X,Y) :- Y is (X+1)/(X*X*X).

p2(X) :-
  numlist(1,1000,L1),
  maplist(f5,L1,L2),
  listProd(L2,X),
  !.

/*
6 ?- p2(X).
X = 0.0.
*/
