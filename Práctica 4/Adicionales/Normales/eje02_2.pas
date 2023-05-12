{2. Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora utilizaremos vectores para almacenar 
la información ingresada por teclado. Consideraciones importantes:
- Los datos ingresados por teclado deberán almacenarse en una estructura de tipo vector apropiada.
Dado que en ninguno de los ejercicios se indica la cantidad máxima de datos a leer, para poder utilizar
un vector asumimos que en todos los casos se ingresarán a lo sumo 5000 datos (donde cada dato será
o bien una inversión, un alumno o un tanque de agua, según lo indica cada ejercicio).
- Una vez leídos y almacenados los datos, deberán procesarse (recorrer el vector) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en la práctica anterior. En la
medida de lo posible, el vector deberá recorrerse una única vez para resolver todos los incisos.
  
Actividad 2: procesamiento de las autoevaluaciones de CADP La cátedra de CADP está analizando los resultados de las autoevaluaciones 
que realizaron los alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, 
su condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5 autoevaluaciones. 
Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la nota -1. La lectura finaliza al ingresar el legajo -1.

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

program eje02_2;
const
  dimF = 5000;
  dimN = 5;
type
  vecNotas = array [1..dimN] of real;

  REG_alumno = record
    legajo: integer;
    cond: char;
    nota: vecNotas;
  end;

  vector = array [1..dimF] of REG_alumno;

//============== CARGA VECTOR
procedure preguntas (var r: REG_alumno);
  var
    x: integer;
  begin
    with r do
      begin
        write ('Legajo: '); readln(legajo);
        if (legajo <> -1) then
          begin
            write ('Condicion (i/r): '); readln(cond);
            writeln (' === NORAS ===');
            for x:=1 to dimN do
              begin
                write ('Nota ',x,': '); 
                readln(nota[x]);
              end;
          end;
      end;
  end;

procedure cargarVector (var v: vector; var dimL: integer);
  var
    r: REG_alumno;
  begin
    preguntas(r);
    while (r.legajo <> -1) and (dimL < dimF) do
      begin
        dimL:=dimL + 1;
        v[dimL]:= r;
        preguntas(r);
      end;
  end;
//============== CARGA VECTOR

//========= INCISOS
procedure leerNota (vn: vecNotas; var notasAprob,aux0,aux10: integer; var sumaNota: real);
  var
    x: integer;
  begin
    for x:=1 to dimN do
      if (vn[x] >= 4) then
        begin
          notasAprob:= notasAprob + 1;
          sumaNota:= sumaNota + vn[x];

          if (vn[x] = 0) then
            aux0:= aux0 + 1;
          
          if (vn[x] = 10) then
            aux10:= aux10 + 1;
        end;
  end;

procedure contarAlu (v: vector; dimL: integer): integer;
  var
    x: integer;
  begin
    contarAlu:= 0;
    for x:=1 to dimL do
      contarAlu:= contarAlu + 1;
  end;

procedure incisos (v: vector; dimL: integer);
  var
    x,totalAlu,cantI,cantR,todasAE,notasAprob,cant6,cant0,max1,max2,legMax1,legMax2,min1,min2,legMin1,legMin2,aux0,aux10: integer;
    sumaNota: real;
  begin
    totalAlu:= contarAlu(v,dimL);
    cantI:= 0;
    cantR:= 0;
    todasAE:= 0;
    cant6:= 0;
    cant0:= 0;
    min1:= 0;
    min2:= 0;
    max1:= 0;
    max2:= 0;

    for x:=1 to dimL do
      begin
        notasAprob:= 0;
        sumaNota:= 0;
        aux0:= 0;
        aux10:= 0;

        leerNota(v[x].nota,notasAprob,aux0,aux10,sumaNota);
        //Punto 1 y 2
        if (notasAprob >= 4) then
          begin
            if (v[x].cond = 'i') then
              cantI:= cantI + 1
            else
              cantR:= cantR + 1;
          end;
        
        //Punto 3
        if (notasAprob = 5) then
          todasAE:= todasAE + 1;

        //Punto 4
        if ((sumaNota / 5) > 6.5) then
          cant6:= cant6 + 1;
        
        //Punto 5
        if (aux0 > 0) then
          cant0:= cant0 + 1;
        
        //Punto 6
        if (aux10 > max1) then
          begin
            max2:= max1;
            legMax2:= legMax1;
            max1:= aux10;
            legMax1:= v[x].legajo;
          end
        else
          if (aux10 > max2) then
            begin
              max2:= aux10;
              legMax2:= v[x].legajo;
            end;
        
        //Punto 7
        if (aux0 > min1) then
          begin
            min2:= min1;
            legMin2:= legMin1;
            min1:= aux0;
            legMin1:= v[x].legajo;
          end
        else
          if (aux0 > min2) then
            begin
              min2:= aux0;
              legMin2:= v[x].legajo;
            end;
      end;
    
    writeln ('La cantidad de ingresantes en condiciones de rendir es: ',cantI,' y representa el ',((cantI * 100) / totalAlu):0:2,'%. del total de alumnos.');
    writeln ('La cantidad de recursantes en condiciones de rendir es: ',cantR,' y representa el ',((cantR * 100) / totalAlu):0:2,'%. del total de alumnos.');
    writeln ('La cantidad de alumnos que aprobaron todas las autoevaluaciones es: ',todasAE,'.');
    writeln ('La cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos es: ',cant6,'.');
    writeln ('La cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion es :',cant0,'.');
    writeln ('Los legajos de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) son el ',legMax1,' y ',legMax2,'.');
    writeln ('Los legajos de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) son el ',legMin1,' y ',legMin2,'.');
  end;
//========= INCISOS

//Programa principal
var
  v: vector;
  dimL: integer;
begin
  dimL:= 0;
  cargarVector(v,dimL);
  writeln ('======= FIN CARGA =======');
  incisos(v,dimL);
end.