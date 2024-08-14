% Aquí va el código.

% Cancion, Compositores, Reproducciones

cancion(bailanSinCesar, [pabloIlabaca, rodrigoSalinas], 10600177).
cancion(yoOpino, [alvaroDiaz, carlosEspinoza, rodrigoSalinas], 5209110).
cancion(equilibrioEspiritual, [danielCastro, alvaroDiaz, pabloIlabaca, pedroPeirano, rodrigoSalinas], 12052254).
cancion(tangananicaTanganana, [danielCastro, pabloIlabaca, pedroPeirano], 5516191).
cancion(dienteBlanco, [danielCastro, pabloIlabaca, pedroPeirano], 5872927).
cancion(lala, [pabloIlabaca, pedroPeirano], 5100530).
cancion(meCortaronMalElPelo, [danielCastro, alvaroDiaz, pabloIlabaca, rodrigoSalinas], 3428854).

% Ranking top 3 por mes

rankingTop3(febrero, 1, lala).
rankingTop3(febrero, 2, tangananicaTanganana).
rankingTop3(febrero, 3, meCortaronMalElPelo).

rankingTop3(marzo, 1, meCortaronMalElPelo).
rankingTop3(marzo, 2, tangananicaTanganana).
rankingTop3(marzo, 3, lala).

rankingTop3(abril, 1, tangananicaTanganana).
rankingTop3(abril, 2, dienteBlanco).
rankingTop3(abril, 3, equilibrioEspiritual).

rankingTop3(mayo, 1, meCortaronMalElPelo).
rankingTop3(mayo, 2, dienteBlanco).
rankingTop3(mayo, 3, equilibrioEspiritual).

rankingTop3(junio, 1, dienteBlanco).
rankingTop3(junio, 2, tangananicaTanganana).
rankingTop3(junio, 3, lala).

hit(Cancion):-
    cancion(Cancion,_,_),
    forall(rankingTop3(Mes,_,_), rankingTop3(Mes,_,Cancion)).

muchasReproducciones(Cancion):-
    cancion(Cancion,_, Reproducciones),
    Reproducciones > 7000000.

subvalorada(Cancion):-
    cancion(Cancion,_,_),
    muchasReproducciones(Cancion),
    not(rankingTop3(_,_, Cancion)).

colaboraron(Compositor1, Compositor2):-
    cancion(_,Compositores,_),
    member(Compositor1, Compositores),
    member(Compositor2, Compositores).

% Trabajos

trabajador(tulio, conductor(5)).
trabajador(bodoque, periodista(2, licenciatura)).
trabajador(bodoque, reportero(5, 300)).
trabajador(marioHugo, periodista(10, posgrado)).
trabajador(juanin, conductor(0)).

listaSueldos(Persona, Sueldos):-
    trabajador(Persona,_),
    findall(Sueldo, (trabajador(Persona, Trabajo),(sueldo(Trabajo, Sueldo))), Sueldos).
    
sueldo(conductor(Exp), Sueldo):-
    Sueldo is Exp * 10000.

sueldo(reportero(Exp, Notas), Sueldo):-
    Sueldo is Exp * 10000 + Notas * 100.

sueldo(periodista(Exp, licenciatura), Sueldo):-
    Sueldo is Exp * 5000 * 12 / 10.

sueldo(periodista(Exp, posgrado), Sueldo):-
    Sueldo is Exp * 5000 * 135 / 100.

sueldoTotal(Persona, SueldoT):-
    trabajador(Persona,_),
    listaSueldos(Persona, Sueldos),
    sum_list(Sueldos, SueldoT).