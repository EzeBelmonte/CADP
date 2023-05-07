{Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1.

Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)

Nota: recuerde que, para poder rendir el EXAMEN PARCIAL, el alumno deberá obtener “Presente” en al
menos el 75% del total de las autoevaluaciones propuestas. Se considera “Presente” la autoevaluación que se
entrega en tiempo y forma y con al menos el 40% de respuestas correctas.}

program eje12_2;

type
  REG_alumno = record
    legajo: integer;
    condicion: char;
  end;

procedure leerNota (var contador,cant0,cantMax: integer; var sumaNota: real);
  var
    x: integer;
    nota: real;
  begin
    for x:=1 to 5 do
      begin
        write ('Nota: '); readln(nota);
        if (nota >= 4) then
          contador:= contador + 1;
        
        sumaNota:= sumaNota + nota;

        if (nota = 0) then
          cant0:= cant0 + 1
        else
          if (nota = 10) then
            cantMax:= cantMax + 1;
      end;
  end;

procedure leer (var r: REG_alumno; var cantIngre,cantRecu,todasAE,nota6,nota0,min1,min2,max1,max2,aluMin1,aluMin2,aluMax1,aluMax2: integer);
  var
    contador,cant0,cantMax: integer;
    sumaNota: real;
  begin
    contador:= 0;
    sumaNota:= 0;
    cant0:= 0;
    cantMax:= 0;
    write ('Legajo: '); readln(r.legajo);
    if (r.legajo <> - 1) then
      begin
        write ('Condicion (i/r): '); readln(r.condicion);
        leerNota(contador,cant0,cantMax,sumaNota);

        // PUNTO 1 Y 2
        if (contador >= 4) then
          if (r.condicion = 'i') then
            cantIngre:= cantIngre + 1
          else
            cantRecu:= cantRecu + 1;
        
        // PUNTO 3
        if (contador = 5) then
          todasAE:= todasAE + 1;
        
        // PUNTO 4
        if (((sumaNota) / 5) >6.5) then
          nota6:= nota6 + 1;
        
        // PUNTO 5
        if (cant0 > 0) then
          nota0:= nota0 + 1;
        
        // PUNTO 6
        if (cant0 > min1) then
          begin
            min2:= min1;
            aluMin2:= aluMin1;
            min1:= cant0;
            aluMin1:= r.legajo;
          end
        else
          if (cant0 > min2) then
            begin
              min2:= cant0;
              aluMin2:= r.legajo;
            end;

        // PUNTO 7
        if (cantMax > max1) then
          begin
            max2:= max1;
            aluMax2:= aluMax1;
            max1:= cantMax;
            aluMax1:= r.legajo;
          end
        else
          if (cantMax > max2) then
            begin
              max2:= cantMax;
              aluMax2:= r.legajo;
            end;
      end;
  end;

procedure inciso;
  var
    r: REG_alumno;
    alumnos,cantIngre,cantRecu,todasAE,nota6,nota0,min1,min2,max1,max2,aluMin1,aluMin2,aluMax1,aluMax2: integer;
    porcenIngre,porcenRecu: real;
  begin
    alumnos:= 0;
    cantIngre:= 0;
    cantRecu:= 0;
    porcenIngre:= 0;
    porcenRecu:= 0;
    todasAE:= 0;
    nota6:= 0;
    nota0:= 0;
    min1:= 32767;
    min2:= min1;
    max1:= 0;
    max2:= 0;

    leer(r,cantIngre,cantRecu,todasAE,nota6,nota0,min1,min2,max1,max2,aluMin1,aluMin2,aluMax1,aluMax2);
    while (r.legajo <> - 1) do
      begin
        alumnos:= alumnos + 1;
  
        leer(r,cantIngre,cantRecu,todasAE,nota6,nota0,min1,min2,max1,max2,aluMin1,aluMin2,aluMax1,aluMax2);
      end;

    porcenIngre:= (cantIngre * 100) / alumnos;
    porcenRecu:= (cantRecu * 100) / alumnos;
    writeln ('Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje es: ',porcenIngre);
    writeln ('Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje es: ',porcenRecu);
    writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones es: ',todasAE);
    writeln('Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos es: ',nota6);
    writeln('Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación es: ',nota0);
    writeln('Legajo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 es: ',aluMax1,' y ',aluMax2);
    writeln('Legajo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 es: ',aluMin1,' y ',aluMin2);
  
  end;

//Programa principal
begin
  inciso;
end.