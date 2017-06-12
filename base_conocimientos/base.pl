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


% Reglas:
    buscar([], E). % buscar([lista], enfermedad).
    buscar(X, E) :- sintomaDe(X, E). % Caso base: buscar(sintoma(1), enfermedad) === sintomade(sintoma, enfermedad).
    buscar([X|Cola], E) :- enfermedad(E), buscar(X, E), buscar(Cola, E).