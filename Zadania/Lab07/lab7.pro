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

/*
Zapoznaj siê z definicj¹ predykatu.

Predykat to funkcja logiczna, która okreœla, 
czy pewne stwierdzenie dotycz¹ce obiektów 
jest prawdziwe. W Prologu predykaty opisuj¹ 
relacje miêdzy obiektami i maj¹ postaæ faktów 
lub regu³, np.: rodzic(ala,kasia). oznacza, 
¿e Ala jest rodzicem Kasi.
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
Omów nastêpuj¹cy przyk³ad:
*/

predicate1 :- true.  % Mo¿esz zmieniæ true na false.
predicate2 :- false. % Mo¿esz zmieniæ false na true.

/*
1 ?- predicate1.
true.

2 ?- predicate2.
false.
*/

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

/*
1. Czy Tomek jest mê¿czyzn¹?

1 ?- mezczyzna(tomek).
true.


2. Czy Tomek jest kobiet¹?

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


5. Czy Ola jest matk¹?

5 ?- matka(ola,_).
true.


6. Czy Ola ma matkê?

6 ?- matka(_,ola).
false.


7. Czy Tomek ma dzieci?

7 ?- rodzic(tomek,_).
true ;
true.

8 ?- ojciec(tomek,_).
true ;
true.


8. Czy Ania ma matkê i ojca?

9 ?- matka(_,ania), ojciec(_,ania).
false.


9. Kto ma wnuka? (bez dodawania nowych regu³)

% R -> D -> W

10 ?- rodzic(R,D), rodzic(D,W), mezczyzna(W).
R = max,
D = kasia,
W = radek ;
false.


10. (*) Kto ma prawnuka? (bez dodawania nowych regu³)

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


11. (*) Czy Ola jest kobiet¹?

12 ?- kobieta(ola).
true.


12. (*) Kto jest mê¿czyzn¹?

13 ?- mezczyzna(M).
M = tomek ;
M = max ;
M = radek.


13. (*) Kto jest matk¹ Maxa?

14 ?- matka(M,max).
M = ola ;
false.


14. (*) Kto jest ojcem Maxa?

15 ?- ojciec(O,max).
O = tomek.


15. (*) Kto ma matkê i ojca?

16 ?- ojciec(_,D), matka(_,D).
D = max ;
false.


16. (*) Kto ma wnuczkê? (bez dodawania nowych regu³)

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


17. (*) Kto ma prawnuczkê? (bez dodawania nowych regu³)

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


2. (*) Kto ma prawnuczkê?

2 ?- prawnuczka(R,Pw).
R = ola,
Pw = roxana ;
R = tomek,
Pw = roxana ;
false.
*/

/*
1. (*) Przetestuj dzia³anie predykatu listing/0 (wersja bezargumentowa).

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
1. (*) Przetestuj dzia³anie predykatu listing/1 (wersja jednoargumentowa).

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
panstwo('W³ochy').
panstwo('Hiszpania').
panstwo('Wielka Brytania').

miasto('Warszawa').
miasto('Kraków').
miasto('Berlin').
miasto('Pary¿').
miasto('Rzym').
miasto('Wenecja').
miasto('Barcelona').
miasto('Madryt').
miasto('Londyn').

polozenie('Warszawa', 'Polska').
polozenie('Kraków', 'Polska').
polozenie('Berlin', 'Niemcy').
polozenie('Pary¿', 'Francja').
polozenie('Rzym', 'W³ochy').
polozenie('Wenecja', 'W³ochy').
polozenie('Barcelona', 'Hiszpania').
polozenie('Madryt', 'Hiszpania').
polozenie('Londyn', 'Wielka Brytania').

zabytek('Pa³ac w Wilanowie').
zabytek('Kolumna Zygmunta III Wazy').
zabytek('Wawel').
zabytek('Sukiennice').
zabytek('Koœció³ Mariacki').
zabytek('Brama Brandenburska').
zabytek('Reichstag').
zabytek('Wie¿a Eiffla').
zabytek('Katedra Notre-Dame').
zabytek('Pa³ac Elizejski').
zabytek('Bazylika œw. Paw³a za Murami').
zabytek('Koloseum').
zabytek('Zamek Œwiêtego Anio³a').
zabytek('Bazylika œw. Marka').
zabytek('Pa³ac Do¿ów').
zabytek('Sagrada Familia').
zabytek('Pa³ac Kryszta³owy').
zabytek('Tower Bridge').
zabytek('Pa³ac Buckingham').
zabytek('Katedra Œwiêtego Paw³a').

gdzie('Pa³ac w Wilanowie', 'Warszawa').
gdzie('Kolumna Zygmunta III Wazy', 'Warszawa').
gdzie('Wawel', 'Kraków').
gdzie('Sukiennice', 'Kraków').
gdzie('Koœció³ Mariacki', 'Kraków').
gdzie('Brama Brandenburska', 'Berlin').
gdzie('Reichstag', 'Berlin').
gdzie('Wie¿a Eiffla', 'Pary¿').
gdzie('Katedra Notre-Dame', 'Pary¿').
gdzie('Pa³ac Elizejski', 'Pary¿').
gdzie('Bazylika œw. Paw³a za Murami', 'Rzym').
gdzie('Koloseum', 'Rzym').
gdzie('Zamek Œwiêtego Anio³a', 'Rzym').
gdzie('Bazylika œw. Marka', 'Wenecja').
gdzie('Pa³ac Do¿ów', 'Wenecja').
gdzie('Sagrada Familia', 'Barcelona').
gdzie('Pa³ac Kryszta³owy', 'Madryt').
gdzie('Tower Bridge', 'Londyn').
gdzie('Pa³ac Buckingham', 'Londyn').
gdzie('Katedra Œwiêtego Paw³a', 'Londyn').

obok('Polska', 'Niemcy').
obok('Niemcy', 'Francja').
obok('Francja', 'Wielka Brytania').
obok('Francja', 'W³ochy').
obok('Francja', 'Hiszpania').

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

/*
Czy relacja jest symetryczna?

Polska ~ Niemcy
Niemncy !~ Polska (nie zachodzi)

Czyli relacja nie jest symetryczna.
*/

/*
1. Jakie zabytki znajduj¹ siê w Berlinie?

31 ?- gdzie(Z,'Berlin'), zabytek(Z).
Z = 'Brama Brandenburska' ;
Z = 'Reichstag'.


2. Jakie miasta znajduj¹ siê w Hiszpani?

32 ?- polozenie(M,'Hiszpania'), miasto(M).
M = 'Barcelona' ;
M = 'Madryt'.


3. Jakie zabytki znajduj¹ siê we W³oszech?

% gdzie      Z ~ M
% polozenie  M ~ P

33 ?- gdzie(Z,M), polozenie(M,'W³ochy'), zabytek(Z), miasto(M).
Z = 'Bazylika œw. Paw³a za Murami',
M = 'Rzym' ;
Z = 'Koloseum',
M = 'Rzym' ;
Z = 'Zamek Œwiêtego Anio³a',
M = 'Rzym' ;
Z = 'Bazylika œw. Marka',
M = 'Wenecja' ;
Z = 'Pa³ac Do¿ów',
M = 'Wenecja' ;
false.


4. W jakim mieœcie znajduje siê Bazylika œw. Paw³a za Murami?

34 ?- gdzie('Bazylika œw. Paw³a za Murami',M), miasto(M).
M = 'Rzym'.


5. W jakim pañstwie jest Sagrada Familia?

35 ?- gdzie('Sagrada Familia',M), polozenie(M,P), miasto(M), panstwo(P).
M = 'Barcelona',
P = 'Hiszpania'.


6. Jakie zabytki mo¿na zwiedzaæ w Pañstwach s¹siaduj¹cych z Francj¹?

36 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), panstwo(P), (obok('Francja',P); obok(P,'Francja')).
Z = 'Brama Brandenburska',
M = 'Berlin',
P = 'Niemcy' ;
Z = 'Reichstag',
M = 'Berlin',
P = 'Niemcy' ;
Z = 'Bazylika œw. Paw³a za Murami',
M = 'Rzym',
P = 'W³ochy' ;
Z = 'Koloseum',
M = 'Rzym',
P = 'W³ochy' ;
Z = 'Zamek Œwiêtego Anio³a',
M = 'Rzym',
P = 'W³ochy' ;
Z = 'Bazylika œw. Marka',
M = 'Wenecja',
P = 'W³ochy' ;
Z = 'Pa³ac Do¿ów',
M = 'Wenecja',
P = 'W³ochy' ;
Z = 'Sagrada Familia',
M = 'Barcelona',
P = 'Hiszpania' ;
Z = 'Pa³ac Kryszta³owy',
M = 'Madryt',
P = 'Hiszpania' ;
Z = 'Tower Bridge',
M = 'Londyn',
P = 'Wielka Brytania' ;
Z = 'Pa³ac Buckingham',
M = 'Londyn',
P = 'Wielka Brytania' ;
Z = 'Katedra Œwiêtego Paw³a',
M = 'Londyn',
P = 'Wielka Brytania' ;
false.


7. (*) Jakie zabytki mo¿na zwiedzaæ w pañstwie, w którym znajduje siê Barcelona?

37 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), polozenie('Barcelona',P), panstwo(P).
Z = 'Sagrada Familia',
M = 'Barcelona',
P = 'Hiszpania' ;
Z = 'Pa³ac Kryszta³owy',
M = 'Madryt',
P = 'Hiszpania' ;
false.


8. (*) Jakie miasta znajduj¹ siê w Pañstwach s¹siaduj¹cych z Niemcami?

38 ?- miasto(M), polozenie(M,P), panstwo(P), (obok('Niemcy',P); obok(P,'Niemcy')).
M = 'Warszawa',
P = 'Polska' ;
M = 'Kraków',
P = 'Polska' ;
M = 'Pary¿',
P = 'Francja' ;
false.


9. (*) Czy w Wielkiej Brytanii znajduj¹ siê jakieœ zabytki?

39 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,'Wielka Brytania'), panstwo('Wielka Brytania').
Z = 'Tower Bridge',
M = 'Londyn' ;
Z = 'Pa³ac Buckingham',
M = 'Londyn' ;
Z = 'Katedra Œwiêtego Paw³a',
M = 'Londyn'.


10. (*) Czy istnieje pañstwo, które s¹siaduje z pañstwem, w którym znajduje siê Madryt?

40 ?- miasto('Madryt'), polozenie('Madryt',P2), panstwo(P2), (obok(P2,P1); obok(P1,P2)), panstwo(P1), (obok(P1,P); obok(P,P1)), panstwo(P), P \= P1, P1 \= P2, P \= P2.
P2 = 'Hiszpania',
P1 = 'Francja',
P = 'Wielka Brytania' ;
P2 = 'Hiszpania',
P1 = 'Francja',
P = 'W³ochy' ;
P2 = 'Hiszpania',
P1 = 'Francja',
P = 'Niemcy'.
*/

/*
Dodatkowo, dla zadania 7.3.6 zdefiniuj równowa¿ne regu³y
sasiad i sasiad2 na dwa sposoby i u¿yj ich w zapytaniach.
*/

sasiad(P1,P2) :- obok(P1,P2); obok(P2,P1).

sasiad2(P1,P2) :- obok(P1,P2).
sasiad2(P1,P2) :- obok(P2,P1).

/*
1. Jakie zabytki mo¿na zwiedzaæ w Pañstwach s¹siaduj¹cych z Francj¹?

50 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), panstwo(P), sasiad('Francja',P).   51 ?- zabytek(Z), gdzie(Z,M), miasto(M), polozenie(M,P), panstwo(P), sasiad2('Francja',P).
Z = 'Brama Brandenburska',                                                                  Z = 'Brama Brandenburska',                                                                         
M = 'Berlin',                                                                               M = 'Berlin',                                                                                      
P = 'Niemcy' ;                                                                              P = 'Niemcy' ;                                                                                     
Z = 'Reichstag',                                                                            Z = 'Reichstag',                                                                                   
M = 'Berlin',                                                                               M = 'Berlin',                                                                                      
P = 'Niemcy' ;                                                                              P = 'Niemcy' ;                                                                                     
Z = 'Bazylika œw. Paw³a za Murami',                                                         Z = 'Bazylika œw. Paw³a za Murami',                                                                
M = 'Rzym',                                                                                 M = 'Rzym',                                                                                        
P = 'W³ochy' ;                                                                              P = 'W³ochy' ;                                                                                     
Z = 'Koloseum',                                                                             Z = 'Koloseum',                                                                                    
M = 'Rzym',                                                                                 M = 'Rzym',                                                                                        
P = 'W³ochy' ;                                                                              P = 'W³ochy' ;                                                                                     
Z = 'Zamek Œwiêtego Anio³a',                                                                Z = 'Zamek Œwiêtego Anio³a',                                                                       
M = 'Rzym',                                                                                 M = 'Rzym',                                                                                        
P = 'W³ochy' ;                                                                              P = 'W³ochy' ;                                                                                     
Z = 'Bazylika œw. Marka',                                                                   Z = 'Bazylika œw. Marka',                                                                          
M = 'Wenecja',                                                                              M = 'Wenecja',                                                                                     
P = 'W³ochy' ;                                                                              P = 'W³ochy' ;                                                                                     
Z = 'Pa³ac Do¿ów',                                                                          Z = 'Pa³ac Do¿ów',                                                                                 
M = 'Wenecja',                                                                              M = 'Wenecja',                                                                                     
P = 'W³ochy' ;                                                                              P = 'W³ochy' ;                                                                                     
Z = 'Sagrada Familia',                                                                      Z = 'Sagrada Familia',                                                                             
M = 'Barcelona',                                                                            M = 'Barcelona',                                                                                   
P = 'Hiszpania' ;                                                                           P = 'Hiszpania' ;                                                                                  
Z = 'Pa³ac Kryszta³owy',                                                                    Z = 'Pa³ac Kryszta³owy',                                                                           
M = 'Madryt',                                                                               M = 'Madryt',                                                                                      
P = 'Hiszpania' ;                                                                           P = 'Hiszpania' ;                                                                                  
Z = 'Tower Bridge',                                                                         Z = 'Tower Bridge',                                                                                
M = 'Londyn',                                                                               M = 'Londyn',                                                                                      
P = 'Wielka Brytania' ;                                                                     P = 'Wielka Brytania' ;                                                                            
Z = 'Pa³ac Buckingham',                                                                     Z = 'Pa³ac Buckingham',                                                                            
M = 'Londyn',                                                                               M = 'Londyn',                                                                                      
P = 'Wielka Brytania' ;                                                                     P = 'Wielka Brytania' ;                                                                            
Z = 'Katedra Œwiêtego Paw³a',                                                               Z = 'Katedra Œwiêtego Paw³a',                                                                      
M = 'Londyn',                                                                               M = 'Londyn',                                                                                      
P = 'Wielka Brytania' ;                                                                     P = 'Wielka Brytania' ;                                                                            
false.                                                                                      false.
*/

/*
Czy regu³y sasiad i sasiad2 powinny byæ symetryczne?

Regu³y powinny byæ symetryczne. Przyk³adowo, 
jeœli Francja s¹siaduje z Niemcami, 
to Niemcy te¿ s¹siaduj¹ z Francj¹. 
W bazie wiedzy niektóre relacje s¹ 
tylko jednokierunkowe, wiêc potrzeba regu³y, 
która tê symetriê uzupe³ni. To w³aœnie to robi 
regu³a sasiad i sasiad2.
*/
