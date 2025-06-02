take2(_,[],[]) :- !.
take2(0,_,[]) :- !.
take2(N,T,L) :-
  M is N - 1,
  T = [H | T1],
  L = [H | L1],
  take2(M,T1,L1).

take(_,[],[]) :- !.
take(0,_,[]) :- !.
take(N,[H | T],[H | L]) :-
  M is N - 1,
  take(M,T,L).

drop2(_,[],[]) :- !.
drop2(0,T,T) :- !.
drop2(N,T,L) :-
  M is N - 1,
  T = [_ | T1],
  L = L1,
  drop2(M,T1,L1).

drop(_,[],[]) :- !.
drop(0,T,T) :- !.
drop(N,[_ | T],L) :-
  M is N - 1,
  drop(M,T,L).

init2(L,I) :-
  reverse(L,R),
  R = [_ | T],
  reverse(T,I).

init(L,I) :-
  reverse(L,[_ | T]),
  reverse(T,I).

init3(L,I) :-
  length(L,M),
  N is M - 1,
  N >= 0,
  take(N,L,I).

middle2(L,M) :-
  L = [_ | T],
  init(T,M).

middle([_ | T],M) :-
  init(T,M).

split(L,L1,L2) :-
  length(L,M),
  M > 2, !,
  N is M // 2,
  take(N,L,L1),
  drop(N,L,L2).
split([],[],[]) :- !.
split([L],[],[L]) :- !.
split([H | L],[H],L) :- !.

% permutation(P,L) -> P jest permutacj¹ listy L

permutation([],[]).
permutation(P,[H | T]) :-
    permutation(P1,T),
    append(A,B,P1),        % P1 dzielimy na dwie czêœci
    append(A,[H | B],P).   % P powstaje poprzez wstawienie elementu H w pewne miejsce listy P1

middle(N,L,K) :-
  length(L,X),
  Y is 2 * N,
  Z is X - N,
  X > Y, !,
  take(Z,L,L1),
  drop(N,L1,K).
middle(_,_,[]) :- !.

move([],[]) :- !.
move([H | L],K) :-
  append(L,[H],K).
