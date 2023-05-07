{La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1.

Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)}

program eje05_2;

procedure informar (cantR,cantI,todasAE,notaProm6,nota0: integer; porcenR,porcenI: real);
  begin
    writeln ('Cantidad de alumos ingresantes de rendir el parcial: ',cantI);
    writeln ('Porcentaje de alumnos ingresantes: ',porcenI:2:2,'%.');
    writeln ('Cantidad de alumos recursantes de rendir el parcial: ',cantR);
    writeln ('Porcentaje de alumnos recursantes: ',porcenR:2:2,'%.');
    writeln ('La cantidad de alumnos que aprobaron todas las autoevaluaciones: ',todasAE);
    writeln ('La cantidad de alumnos con nota promedio mayor a 6.5: ',notaProm6);
    writeln ('La cantidad de alumnos que sacaron al menos una vez: ',nota0);
  end;

procedure leerNota (var cantR,cantI,todasAE,notaProm6,nota0: integer; condicion: char);
  var
    sumaNota,nota: real;
    x,cumple: integer;
    unaVez0: boolean;
  begin
    cumple:= 0;
    sumaNota:= 0;
    unaVez0:= true;
    for x:=1 to 5 do
      begin
        write ('Nota ',x,': '); readln(nota);
        { Si la autoevaluacion son 5 preguntas y la nota max es 10, serian 2 puntos por pregunta, 
        lo que el 40% seria una nota de 4.}
        if (nota >= 4) then 
          cumple:= cumple + 1;
        
        sumaNota:= sumaNota + nota;

        if (unaVez0) and (nota = 0) then
          begin
            nota0:= nota0 + 1;
            unaVez0:= false;
          end;
      end;
    //Si cumple tiene un valor de 4, significa que tiene el  80% de asistencias.
    if (cumple >= 4) then
      if (condicion = 'r') then
        cantR:= cantR + 1
      else
        cantI:= cantI + 1;
    //Si cumple tiene un valor de 5, significa que aprobó todas las AutoEvaluaciones.
    if (cumple = 5) then
      todasAE:= todasAE + 1;

    if ((sumaNota / 5) > 6.5) then
      notaProm6:= notaProm6 + 1;
  end;

procedure leer;
  var
    legajo,cantR,cantI,totalAlum,todasAE,notaProm6,nota0: integer;
    condicion: char;
    porcenR,porcenI: real;
  begin
    cantR:= 0;
    cantI:= 0;
    totalAlum:= 0;
    porcenR:= 0;
    porcenI:= 0;
    todasAE:= 0;
    notaProm6:= 0;
    nota0:= 0;
    write ('Legajo: '); readln(legajo);
    while (legajo <> -1) do
      begin
        write ('Condicion (r/i): '); readln(condicion);
        leerNota(cantR,cantI,todasAE,notaProm6,nota0,condicion);

        totalAlum:= totalAlum + 1;

        write ('Legajo: '); readln(legajo);
      end;
    porcenR:= (cantR * 100) / totalAlum;
    porcenI:= (cantI * 100) / totalAlum;
    informar(cantR,cantI,todasAE,notaProm6,nota0,porcenR,porcenI);
  end;

begin
  leer;
end.