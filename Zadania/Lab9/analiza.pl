listSum([X],X).
listSum([X,Y|T],Sum) :-
  Z is X + Y,
  listSum([Z|T],Sum).

listProd([X],X).
listProd([X,Y|T],Prod) :-
  Z is X * Y,
  listProd([Z|T],Prod).

f1(X,Y) :- Y is 1/X.

s1(X) :-
  numlist(1,100,L1),
  maplist(f1,L1,L2),
  listSum(L2,X),
  !.

f2(X,Y) :- Y is (1+X)/(2+X).

p1(X) :-
  numlist(1,50,L1),
  maplist(f2,L1,L2),
  listProd(L2,X),
  !.

f3(X,Y) :- Y is 1/(X*X).

s2(X) :-
  numlist(1,1000,L1),
  maplist(f3,L1,L2),
  listSum(L2,X),
  !.

f4(X,Y) :- Y is (sqrt(X))-(1/X).

s3(X) :-
  numlist(1,1000,L1),
  maplist(f4,L1,L2),
  listSum(L2,X),
  !.

f5(X,Y) :- Y is (X+1)/(X*X*X).

p2(X) :-
  numlist(1,1000,L1),
  maplist(f5,L1,L2),
  listProd(L2,X),
  !.
