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

/*
Zapoznaj si� z definicj� predykatu.

Predykat to funkcja logiczna, kt�ra okre�la, 
czy pewne stwierdzenie dotycz�ce obiekt�w 
jest prawdziwe. W Prologu predykaty opisuj� 
relacje mi�dzy obiektami i maj� posta� fakt�w 
lub regu�, np.: rodzic(ala,kasia). oznacza, 
�e Ala jest rodzicem Kasi.
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

2 ?- false; true.
true.

3 ?- true; false.
true .

4 ?- true; false.
true ;
false.

4 ?- false; false.
false.
*/

/*
Om�w nast�puj�cy przyk�ad:
*/

predicate1 :- true.  % Mo�esz zmieni� true na false.
predicate2 :- false. % Mo�esz zmieni� false na true.

/*
1 ?- predicate1.
true.

2 ?- predicate2.
false.
*/

% Zamiast u�ywa� operatora ;

or :- predicate1; predicate2.

/*
1 ?- or.
true ;
false.
*/

% Zwykle definiujemy osobne regu�y dla ka�dego przypadku:

or2 :- predicate1.
or2 :- predicate2.

/*
1 ?- or2.
true ;
false.
*/

/*
1. Czy Tomek jest m�czyzn�?

1 ?- mezczyzna(tomek).
true.


2. Czy Tomek jest kobiet�?

2 ?- kobieta(tomek).
false.


3. Kto jest rodzicem Maxa?

3 ?- rodzic(R,max).
R = ola ;
R = tomek.


4. Czyim rodzicem jest Max?

4 ?- rodzic(max,D).
D = ania ;
D = kasia.


5. Czy Ola jest matk�?

5 ?- matka(ola,_).
true.


6. Czy Ola ma matk�?

6 ?- matka(_,ola).
false.


7. Czy Tomek ma dzieci?

7 ?- rodzic(tomek,_).
true ;
true.

8 ?- ojciec(tomek,_).
true ;
true.


8. Czy Ania ma matk� i ojca?

9 ?- matka(_,ania), ojciec(_,ania).
false.


9. Kto ma wnuka? (bez dodawania nowych regu�)

% R -> D -> W

10 ?- rodzic(R,D), rodzic(D,W), mezczyzna(W).
R = max,
D = kasia,
W = radek ;
false.


10. (*) Kto ma prawnuka? (bez dodawania nowych regu�)

% R -> D -> W -> Pw

11 ?- rodzic(R,D), rodzic(D,W), rodzic(W,Pw), mezczyzna(Pw).
R = ola,
D = max,
W = kasia,
Pw = radek ;
R = tomek,
D = max,
W = kasia,
Pw = radek ;
false.


11. (*) Czy Ola jest kobiet�?

12 ?- kobieta(ola).
true.


12. (*) Kto jest m�czyzn�?

13 ?- mezczyzna(M).
M = tomek ;
M = max ;
M = radek.


13. (*) Kto jest matk� Maxa?

14 ?- matka(M,max).
M = ola ;
false.


14. (*) Kto jest ojcem Maxa?

15 ?- ojciec(O,max).
O = tomek.


15. (*) Kto ma matk� i ojca?

16 ?- ojciec(_,D), matka(_,D).
D = max ;
false.


16. (*) Kto ma wnuczk�? (bez dodawania nowych regu�)

% R -> D -> W

17 ?- rodzic(R,D), rodzic(D,W), kobieta(W).
R = ola,
D = max,
W = ania ;
R = ola,
D = max,
W = kasia ;
R = tomek,
D = max,
W = ania ;
R = tomek,
D = max,
W = kasia ;
false.


17. (*) Kto ma prawnuczk�? (bez dodawania nowych regu�)

% R -> D -> W -> Pw

18 ?- rodzic(R,D), rodzic(D,W), rodzic(W,Pw), kobieta(Pw).
false.
*/

% 7.2

:- discontiguous rodzic/2.
:- discontiguous kobieta/1.
:- discontiguous mezczyzna/1.

rodzic(krystyna,ala). % rodzic  R ~ D
rodzic(ala,kasia).
rodzic(stefan,ala).
rodzic(max,piotr).
rodzic(piotr,roxana).

kobieta(krystyna).    % kobieta  K
kobieta(ala).
kobieta(roxana).

mezczyzna(stefan).    % mezczyzna M
mezczyzna(piotr).

prawnuk(R,Pw) :-      % prawnuk(R,Pw)  R ~ D ~ W ~ Pw
  rodzic(R,D),
  rodzic(D,W),
  rodzic(W,Pw),
  mezczyzna(Pw).

prawnuczka(R,Pw) :-   % prawnuczka(R,Pw)  R ~ D ~ W ~ Pw
  rodzic(R,D),
  rodzic(D,W),
  rodzic(W,Pw),
  kobieta(Pw).

/*
1. (*) Kto ma prawnuka?

1 ?- prawnuk(R,Pw).
R = ola,
Pw = radek ;
R = tomek,
Pw = radek ;
R = krystyna,
Pw = radek ;
R = stefan,
Pw = radek ;
false.


2. (*) Kto ma prawnuczk�?

2 ?- prawnuczka(R,Pw).
R = ola,
Pw = roxana ;
R = tomek,
Pw = roxana ;
false.
*/

/*
1. (*) Przetestuj dzia�anie predykatu listing/0 (wersja bezargumentowa).

1 ?- listing.

:- multifile prolog_list_goal/1.


:- dynamic term_expansion/2.
:- multifile term_expansion/2.


:- dynamic resource/3.
:- multifile resource/3.


:- multifile prolog_clause_name/2.


or2 :-
    predicate1.
or2 :-
    predicate2.

predicate2 :-
    false.

or :-
    (   predicate1
    ;   predicate2
    ).

:- dynamic file_search_path/2.
:- multifile file_search_path/2.

file_search_path(library, Dir) :-
    library_directory(Dir).
file_search_path(swi, A) :-
    system:current_prolog_flag(home, A).
file_search_path(swi, A) :-
    system:current_prolog_flag(shared_home, A).
file_search_path(library, app_config(lib)).
file_search_path(library, swi(library)).
file_search_path(library, swi(library/clp)).
file_search_path(library, A) :-
    system:'$ext_library_directory'(A).
file_search_path(foreign, swi(A)) :-
    system:
    (   current_prolog_flag(apple_universal_binary, true),
        A='lib/fat-darwin'
    ).
file_search_path(path, A) :-
    system:
    (   getenv('PATH', B),
        current_prolog_flag(path_sep, C),
        atomic_list_concat(D, C, B),
        '$member'(A, D)
    ).
file_search_path(user_app_data, A) :-
    system:'$xdg_prolog_directory'(data, A).
file_search_path(common_app_data, A) :-
    system:'$xdg_prolog_directory'(common_data, A).
file_search_path(user_app_config, A) :-
    system:'$xdg_prolog_directory'(config, A).
file_search_path(common_app_config, A) :-
    system:'$xdg_prolog_directory'(common_config, A).
file_search_path(app_data, user_app_data('.')).
file_search_path(app_data, common_app_data('.')).
file_search_path(app_config, user_app_config('.')).
file_search_path(app_config, common_app_config('.')).
file_search_path(app_preferences, user_app_config('.')).
file_search_path(user_profile, app_preferences('.')).
file_search_path(app, swi(app)).
file_search_path(app, app_data(app)).
file_search_path(autoload, swi(library)).
file_search_path(autoload, pce(prolog/lib)).
file_search_path(autoload, app_config(lib)).
file_search_path(autoload, Dir) :-
    '$autoload':'$ext_library_directory'(Dir).
file_search_path(pack, app_data(pack)).
file_search_path(library, PackLib) :-
    '$pack':pack_dir(_Name, prolog, PackLib).
file_search_path(foreign, PackLib) :-
    '$pack':pack_dir(_Name, foreign, PackLib).
file_search_path(app, AppDir) :-
    '$pack':pack_dir(_Name, app, AppDir).

predicate1.

:- multifile message_property/2.


prawnuczka(R, Pw) :-
    rodzic(R, D),
    rodzic(D, W),
    rodzic(W, Pw),
    kobieta(Pw).

:- dynamic library_directory/1.
:- multifile library_directory/1.


prawnuk(R, Pw) :-
    rodzic(R, D),
    rodzic(D, W),
    rodzic(W, Pw),
    mezczyzna(Pw).

:- dynamic expand_answer/2.
:- multifile expand_answer/2.


ojciec(X, Y) :-
    rodzic(X, Y),
    mezczyzna(X).

:- dynamic prolog_file_type/2.
:- multifile prolog_file_type/2.

prolog_file_type(pl, prolog).
prolog_file_type(prolog, prolog).
prolog_file_type(qlf, prolog).
prolog_file_type(qlf, qlf).
prolog_file_type(A, executable) :-
    system:current_prolog_flag(shared_object_extension, A).
prolog_file_type(dylib, executable) :-
    system:current_prolog_flag(apple, true).

:- dynamic prolog_load_file/2.
:- multifile prolog_load_file/2.


matka(X, Y) :-
    rodzic(X, Y),
    kobieta(X).

rodzic(ola, max).
rodzic(tomek, max).
rodzic(tomek, lila).
rodzic(max, ania).
rodzic(max, kasia).
rodzic(kasia, radek).
rodzic(krystyna, ala).
rodzic(ala, kasia).
rodzic(stefan, ala).
rodzic(max, piotr).
rodzic(piotr, roxana).

:- dynamic exception/3.
:- multifile exception/3.


:- multifile prolog_predicate_name/2.


:- dynamic expand_query/4.
:- multifile expand_query/4.


:- dynamic portray/1.
:- multifile portray/1.


:- dynamic goal_expansion/2.
:- multifile goal_expansion/2.


:- thread_local thread_message_hook/3.
:- dynamic thread_message_hook/3.
:- volatile thread_message_hook/3.


mezczyzna(tomek).
mezczyzna(max).
mezczyzna(radek).
mezczyzna(stefan).
mezczyzna(piotr).

:- dynamic resource/2.
:- multifile resource/2.


:- dynamic goal_expansion/4.
:- multifile goal_expansion/4.


:- dynamic message_hook/3.
:- multifile message_hook/3.


:- dynamic term_expansion/4.
:- multifile term_expansion/4.


kobieta(ola).
kobieta(lila).
kobieta(kasia).
kobieta(ania).
kobieta(krystyna).
kobieta(ala).
kobieta(roxana).
true.
*/

/*
1. (*) Przetestuj dzia�anie predykatu listing/1 (wersja jednoargumentowa).

1 ?- listing(rodzic).
rodzic(ola, max).
rodzic(tomek, max).
rodzic(tomek, lila).
rodzic(max, ania).
rodzic(max, kasia).
rodzic(kasia, radek).
rodzic(krystyna, ala).
rodzic(ala, kasia).
rodzic(stefan, ala).
rodzic(max, piotr).
rodzic(piotr, roxana).

true.
*/

% 7.3

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

/*
Czy relacja jest symetryczna?

Polska ~ Niemcy
Niemncy !~ Polska (nie zachodzi)

Czyli relacja nie jest symetryczna.
*/

/*
1. Jakie zabytki znajduj� si� w Berlinie?

31 ?- gdzie(Z,'Berlin'), zabytek(Z).
Z = 'Brama Brandenburska' ;
Z = 'Reichstag'.


2. Jakie miasta znajduj� si� w Hiszpani?

32 ?- polozenie(M,'Hiszpania'), miasto(M).
M = 'Barcelona' ;
M = 'Madryt'.


3. Jakie zabytki znajduj� si� we W�oszech?

% gdzie      Z ~ M
% polozenie  M ~ P

33 ?- gdzie(Z,M), polozenie(M,'W�ochy'), zabytek(Z), miasto(M).
Z = 'Bazylika �w. Paw�a za Murami',
M = 'Rzym' ;
Z = 'Koloseum',
M = 'Rzym' ;
Z = 'Zamek �wi�tego Anio�a',
M = 'Rzym' ;
Z = 'Bazylika �w. Marka',
M = 'Wenecja' ;
Z = 'Pa�ac Do��w',
M = 'Wenecja' ;
false.


4. W jakim mie�cie znajduje si� Bazylika �w. Paw�a za Murami?

34 ?- gdzie('Bazylika �w. Paw�a za Murami',M), miasto(M).
M = 'Rzym'.


5. W jakim pa�stwie jest Sagrada Familia?

35 ?- gdzie('Sagrada Familia',M), polozenie(M,P), miasto(M), panstwo(P).
M = 'Barcelona',
P = 'Hiszpania'.


6. Jakie zabytki mo�na zwiedza� w Pa�stwach s�siaduj�cych z Francj�?

36 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), panstwo(P), (obok('Francja',P); obok(P,'Francja')).
Z = 'Brama Brandenburska',
M = 'Berlin',
P = 'Niemcy' ;
Z = 'Reichstag',
M = 'Berlin',
P = 'Niemcy' ;
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
Z = 'Sagrada Familia',
M = 'Barcelona',
P = 'Hiszpania' ;
Z = 'Pa�ac Kryszta�owy',
M = 'Madryt',
P = 'Hiszpania' ;
Z = 'Tower Bridge',
M = 'Londyn',
P = 'Wielka Brytania' ;
Z = 'Pa�ac Buckingham',
M = 'Londyn',
P = 'Wielka Brytania' ;
Z = 'Katedra �wi�tego Paw�a',
M = 'Londyn',
P = 'Wielka Brytania' ;
false.


7. (*) Jakie zabytki mo�na zwiedza� w pa�stwie, w kt�rym znajduje si� Barcelona?

37 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), polozenie('Barcelona',P), panstwo(P).
Z = 'Sagrada Familia',
M = 'Barcelona',
P = 'Hiszpania' ;
Z = 'Pa�ac Kryszta�owy',
M = 'Madryt',
P = 'Hiszpania' ;
false.


8. (*) Jakie miasta znajduj� si� w Pa�stwach s�siaduj�cych z Niemcami?

38 ?- miasto(M), polozenie(M,P), panstwo(P), (obok('Niemcy',P); obok(P,'Niemcy')).
M = 'Warszawa',
P = 'Polska' ;
M = 'Krak�w',
P = 'Polska' ;
M = 'Pary�',
P = 'Francja' ;
false.


9. (*) Czy w Wielkiej Brytanii znajduj� si� jakie� zabytki?

39 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,'Wielka Brytania'), panstwo('Wielka Brytania').
Z = 'Tower Bridge',
M = 'Londyn' ;
Z = 'Pa�ac Buckingham',
M = 'Londyn' ;
Z = 'Katedra �wi�tego Paw�a',
M = 'Londyn'.


10. (*) Czy istnieje pa�stwo, kt�re s�siaduje z pa�stwem, w kt�rym znajduje si� Madryt?

40 ?- miasto('Madryt'), polozenie('Madryt',P2), panstwo(P2), (obok(P2,P1); obok(P1,P2)), panstwo(P1), (obok(P1,P); obok(P,P1)), panstwo(P), P \= P1, P1 \= P2, P \= P2.
P2 = 'Hiszpania',
P1 = 'Francja',
P = 'Wielka Brytania' ;
P2 = 'Hiszpania',
P1 = 'Francja',
P = 'W�ochy' ;
P2 = 'Hiszpania',
P1 = 'Francja',
P = 'Niemcy'.
*/

/*
Dodatkowo, dla zadania 7.3.6 zdefiniuj r�wnowa�ne regu�y
sasiad i sasiad2 na dwa sposoby i u�yj ich w zapytaniach.
*/

sasiad(P1,P2) :- obok(P1,P2); obok(P2,P1).

sasiad2(P1,P2) :- obok(P1,P2).
sasiad2(P1,P2) :- obok(P2,P1).

/*
1. Jakie zabytki mo�na zwiedza� w Pa�stwach s�siaduj�cych z Francj�?

50 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), panstwo(P), sasiad('Francja',P).   51 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), panstwo(P), sasiad2('Francja',P).
Z = 'Brama Brandenburska',                                                                  Z = 'Brama Brandenburska',                                                                         
M = 'Berlin',                                                                               M = 'Berlin',                                                                                      
P = 'Niemcy' ;                                                                              P = 'Niemcy' ;                                                                                     
Z = 'Reichstag',                                                                            Z = 'Reichstag',                                                                                   
M = 'Berlin',                                                                               M = 'Berlin',                                                                                      
P = 'Niemcy' ;                                                                              P = 'Niemcy' ;                                                                                     
Z = 'Bazylika �w. Paw�a za Murami',                                                         Z = 'Bazylika �w. Paw�a za Murami',                                                                
M = 'Rzym',                                                                                 M = 'Rzym',                                                                                        
P = 'W�ochy' ;                                                                              P = 'W�ochy' ;                                                                                     
Z = 'Koloseum',                                                                             Z = 'Koloseum',                                                                                    
M = 'Rzym',                                                                                 M = 'Rzym',                                                                                        
P = 'W�ochy' ;                                                                              P = 'W�ochy' ;                                                                                     
Z = 'Zamek �wi�tego Anio�a',                                                                Z = 'Zamek �wi�tego Anio�a',                                                                       
M = 'Rzym',                                                                                 M = 'Rzym',                                                                                        
P = 'W�ochy' ;                                                                              P = 'W�ochy' ;                                                                                     
Z = 'Bazylika �w. Marka',                                                                   Z = 'Bazylika �w. Marka',                                                                          
M = 'Wenecja',                                                                              M = 'Wenecja',                                                                                     
P = 'W�ochy' ;                                                                              P = 'W�ochy' ;                                                                                     
Z = 'Pa�ac Do��w',                                                                          Z = 'Pa�ac Do��w',                                                                                 
M = 'Wenecja',                                                                              M = 'Wenecja',                                                                                     
P = 'W�ochy' ;                                                                              P = 'W�ochy' ;                                                                                     
Z = 'Sagrada Familia',                                                                      Z = 'Sagrada Familia',                                                                             
M = 'Barcelona',                                                                            M = 'Barcelona',                                                                                   
P = 'Hiszpania' ;                                                                           P = 'Hiszpania' ;                                                                                  
Z = 'Pa�ac Kryszta�owy',                                                                    Z = 'Pa�ac Kryszta�owy',                                                                           
M = 'Madryt',                                                                               M = 'Madryt',                                                                                      
P = 'Hiszpania' ;                                                                           P = 'Hiszpania' ;                                                                                  
Z = 'Tower Bridge',                                                                         Z = 'Tower Bridge',                                                                                
M = 'Londyn',                                                                               M = 'Londyn',                                                                                      
P = 'Wielka Brytania' ;                                                                     P = 'Wielka Brytania' ;                                                                            
Z = 'Pa�ac Buckingham',                                                                     Z = 'Pa�ac Buckingham',                                                                            
M = 'Londyn',                                                                               M = 'Londyn',                                                                                      
P = 'Wielka Brytania' ;                                                                     P = 'Wielka Brytania' ;                                                                            
Z = 'Katedra �wi�tego Paw�a',                                                               Z = 'Katedra �wi�tego Paw�a',                                                                      
M = 'Londyn',                                                                               M = 'Londyn',                                                                                      
P = 'Wielka Brytania' ;                                                                     P = 'Wielka Brytania' ;                                                                            
false.                                                                                      false.
*/

/*
Czy regu�y sasiad i sasiad2 powinny by� symetryczne?

Regu�y powinny by� symetryczne. Przyk�adowo, 
je�li Francja s�siaduje z Niemcami, 
to Niemcy te� s�siaduj� z Francj�. 
W bazie wiedzy niekt�re relacje s� 
tylko jednokierunkowe, wi�c potrzeba regu�y, 
kt�ra t� symetri� uzupe�ni. To w�a�nie to robi 
regu�a sasiad i sasiad2.
*/
