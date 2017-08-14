% Vectores que causan las enfermedades:
vector(aedes_aegypti).
vector(aedes_albopictu).

% Enfermedades causados por los vectores:
enfermedad(dengue).
enfermedad(zica).
enfermedad(chikungunya).

% Síntomas causados por la enfermedad:
    %Dengue:
    sintomaDe(mareo, dengue).
    sintomaDe(dolor_reticular, dengue).
    sintomaDe(manchas_rojas, dengue).
    sintomaDe(dolor_articulaciones, dengue).
    sintomaDe(nauseas, dengue).
    sintomaDe(dolor_cabeza, dengue).
    sintomaDe(debilidad, dengue).
    sintomaDe(perdida_peso, dengue).
    sintomaDe(fiebre_alta, dengue).
    sintomaDe(sangrado_nariz, dengue).

    %Zica:
    sintomaDe(manchas_rojas, zica).
    sintomaDe(fiebre_alta, zica).
    sintomaDe(dolor_intenso_articulaciones_pies, zica).
    sintomaDe(dolor_intenso_articulaciones_manos, zica).
    sintomaDe(dolor_muscular, zica).
    sintomaDe(dolor_cabeza, zica).
    sintomaDe(conjuntivitis, zica).

    %Chikungunya:
    sintomaDe(dolor_muscular, chikungunya).
    sintomaDe(dolor_cabeza, chikungunya).
    sintomaDe(ojos_rojos, chikungunya).
    sintomaDe(conjuntivitis, chikungunya).
    sintomaDe(fiebre_baja, chikungunya).
    sintomaDe(dolor_espalda, chikungunya).
    sintomaDe(sensibilidad_luz, chikungunya).
    sintomaDe(picazon, chikungunya).
    sintomaDe(dolor_articulaciones, chikungunya).
    sintomaDe(erupciones, chikungunya).

% Relacion : vector -> enfermedad:
    % Aedes_aegypti:
    causanteDe(aedes_aegypti, dengue).
    causanteDe(aedes_aegypti, zica).
    causanteDe(aedes_aegypti, chikungunya).
    % Aedes_albopictu:
    causanteDe(aedes_albopictu, zica).
    causanteDe(aedes_albopictu, chikungunya).


% Distritos de Trujillo : 
    esDistrito(trujillo).
    esDistrito(el_porvenir).
    esDistrito(florencia_de_mora).
    esDistrito(huanchaco).
    esDistrito(la_esperanza).
    esDistrito(laredo).
    esDistrito(moche).
    esDistrito(poroto).
    esDistrito(salaverry).
    esDistrito(simbal).
    esDistrito(victor_larco_herrera).

% Hay campo:
    hayCampo(laredo, 5).
    hayCampo(moche, 5).
    hayCampo(poroto, 5).
    hayCampo(salaverry, 5).
    hayCampo(simbal, 5).
    hayCampo(trujillo, 0).
    hayCampo(el_porvenir, 0).
    hayCampo(florencia_de_mora, 0).
    hayCampo(huanchaco, 0).
    hayCampo(la_esperanza, 0).
    esDistrito(victor_larco_herrera, 0).

% Reglas:

    % Regla que detecta enfermedad al 100%:
    buscar([], E, 0). % lista vacía.
    
    buscar(X, E, 1) :- sintomaDe(X, E). % Caso base: buscar(sintoma(1), enfermedad) === sintomade(sintoma, enfermedad).
    
    buscar([X|Cola], E, P) :- enfermedad(E), buscar(X, E, S1), buscar(Cola, E, S2), P is S1 + S2.

    % Cantidad de sintomas por enfermedad:
    cantSint(E, C) :- findall(X, sintomaDe(X, E), L), length(L, R), C is R.

    
    % Porcentage de estar contagiado:
    diagnostico([X|Cola], E, K, D, E) :- buscar([X|Cola], E, P), 
                                                        cantSint(E, T), 
                                                        esRural(D, C), 
                                                        esAnciano(Edad),
                                                        K is (P * 100 / T + C + A).

    diagnostico([X|Cola], E, K, D) :- buscar([X|Cola], E, P), 
                                                        cantSint(E, T), 
                                                        esRural(D, C), 
                                                        K is (P * 100 / T + C).

    diagnosticoSint([X|Cola], E, K) :- buscar([X|Cola], E, P), 
                                        cantSint(E, T), 
                                        K is P * 100 / T.

    
    % Es rural:
    esRural(X, P) :- esDistrito(X), hayCampo(X, P).

    % Es anciano:
    esAnciano(Edad, P) :- Edad >= 65. 
