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

zabytki_m(M) :-
  gdzie(Z,M),
  write(Z),
  nl, fail.
zabytki_m(_).

zabytki_mp(M) :-
  gdzie(Z,M),
  polozenie(M,P),
  write(P),
  write(' '),
  write(M),
  write(' '),
  write(Z),
  nl, fail.
zabytki_mp(_).

zabytki_p(P) :-
  polozenie(M,P),
  gdzie(Z,M),
  write(Z),
  nl, fail.
zabytki_p(_).

sasiad(P1,P2) :- obok(P1,P2); obok(P2,P1).

zabytki_ps(P) :-
  (P2 = P; sasiad(P,P2)),
  polozenie(M,P2),
  gdzie(Z,M),
  write(P2),
  write(' '),
  write(M),
  write(' '),
  write(Z),
  nl, fail.
zabytki_ps(_).
