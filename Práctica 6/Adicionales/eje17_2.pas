{17. Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
sumaremos lo aprendido sobre listas para almacenar la información ingresada por teclado. Consideraciones
importantes:
● Los datos ingresados por teclado deberán almacenarse en una estructura de tipo lista apropiada.
● Una vez leídos y almacenados los datos, deberán procesarse (recorrer la lista) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en las prácticas anteriores. En
la medida de lo posible, la lista deberá recorrerse una única vez para resolver todos los incisos.}

{Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
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

program eje17_2;
const
 dimF = 5;
type
  REG_alumno = record
    legajo: integer;
    condicion: char;
    nota: array [1..dimF] of real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_alumno;
    sig: Lista;
  end;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_alumno);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_alumno);
  var
    x: integer;
  begin
    with r do
      begin
        write ('Legajo: '); readln(legajo);
        if (legajo > -1) then
          begin
            write ('Condicion (r/i): '); readln(condicion);
            writeln ('==== Notas ====');
            for x:=1 to 5 do
              write ('Nota ',x,': '); readln (nota[x]);
          end;
      end;
  end;
procedure cargarLista (var L: Lista);
  var
    r: REG_alumno;
  begin
    preguntas(r);
    while (r.legajo > -1) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA
// ==== Punto 1 y 2
function presente (r: REG_alumno): boolean;
  var
   x,y: integer;
  begin
    y:= 0;
    for x:=1 to dimF do
      if (r.nota[x] >= 4) then
        y:= y + 1;
      if (y >= 4) then
        presente:= true
      else
        presente:= false;
  end;

// ==== Punto 3
function todoAprob (r: REG_alumno): boolean;
  var
    x, y: integer;
  begin
    y:= 0;
    for x:=1 to dimF do
      if (r.nota[x] >= 4) then
        y:= y + 1;
    if (y = 5) then
      todoAprob:= true
    else
      todoAprob:= false;
  end;

// ==== Punto 4
function promedio6 (r: REG_alumno): boolean;
  var
    x: integer;
    y: real;
  begin
    y:= 0;
    for x:=1 to dimF do
      y:= y + r.nota[x];
    
    if (y > 6.5) then
      promedio6:= true
    else
      promedio6:= false;
  end;

// ==== Punto 5
function cantidad0 (r: REG_alumno): integer;
  var
    x: integer;
  begin
    cantidad0:= 0;
    for x:=1 to dimF do
      if (r.nota[x] = 0) then
        cantidad0:= cantidad0 + 1;
  end;

// ==== Punto 6
function cantidad10 (r: REG_alumno): integer;
  var
    x: integer;
  begin
    cantidad10:= 0;
    for x:=1 to dimF do
      if (r.nota[x] = 10) then
        cantidad10:= cantidad10 + 1;
  end;

// =========== IMPRIMIR
procedure imprimir (rendirI,rendirR,todoApro,cant0,cod10_1,cod10_2,cod0_1,cod0_2: integer; promI,promR,prom6: real);
  begin
    writeln ('Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial ',rendirI,' y porcentaje sobre el total de alumnos INGRESANTES es: ',promI:0:2);
    writeln ('Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial ',rendirR,' y porcentaje sobre el total de alumnos RECURSANTES es: ',promR:0:2);
    writeln ('La cantidad de alumnos que aprobaron todas las autoevaluaciones es: ',todoApro);
    writeln ('La cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos es: ',prom6:0:2);
    writeln ('La cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluacion es: ',cant0);
    writeln ('Los codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) son: ',cod10_1,' y ',cod10_2);
    writeln ('Los codigo de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) son: ',cod0_1,' y ',cod0_2);
  end;
// =========== IMPRIMIR

// =========== INCISOS
procedure incisos (L: Lista);
  var
    cantAlumnos,rendirR,rendirI,todoApro,cant0,cant10,cant10_1,cant10_2,cod10_1,cod10_2,cant0_1,cant0_2,cod0_1,cod0_2: integer;
    promR,promI,prom6: real;
  begin
    cantAlumnos:= 0;
    rendirR:= 0;
    rendirI:= 0;
    todoApro:= 0;
    prom6:= 0;
    cant0:= 0;
    cant10_1:= 0;
    cant10_2:= 0;
    cant0_1:= 0;
    cant0_2:= 0;
    while (L <> nil) do
      begin
        //Punto 1 y 2
        cantAlumnos:= cantAlumnos + 1;
        if (presente(L^.dato)) then
          begin
            if (L^.dato.condicion = 'r') then
              rendirR:= rendirR + 1
            else
              if (L^.dato.condicion = 'i') then
                rendirI:= rendirI + 1;
          end;
        
        //Punto 3
        if (todoAprob(L^.dato)) then
          todoApro:= todoApro + 1;
        
        //Punto 4
        if (promedio6(L^.dato)) then
          prom6:= prom6 + 1;

        //Punto 5
        if (cantidad0(L^.dato) > 0) then
          cant0:= cant0 + 1;

        //Punto 6
        cant10:= cantidad10(L^.dato);
        if (cant10_1 < cant10) then
          begin
            cant10_2:= cant10_1;
            cod10_2:= cod10_1;
            cant10_1:= cant10;
            cod10_1:= L^.dato.legajo;
          end
        else
          if (cant10_2 < cant10) then
            begin
              cant10_2:= cant10;
              cod10_2:= L^.dato.legajo;
            end;
        
        //Punto 7
        if (cant0 < cant0_1) then
          begin
            cant0_2:= cant0_1;
            cod0_2:= cod0_1;
            cant0_1:= cant0;
            cod0_1:= L^.dato.legajo;
          end
        else
          if (cant0_2 < cant0) then
            begin
              cant0_2:= cant0;
              cod0_2:= L^.dato.legajo;
            end;

        L:= L^.sig;
      end;
    promI:= cantAlumnos / rendirI;
    promR:= cantAlumnos / rendirR;

    imprimir (rendirI,rendirR,todoApro,cant0,cod10_1,cod10_2,cod0_1,cod0_2,promI,promR,prom6);
  end;
// =========== INCISOS

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  writeln ('========== FIN CARGA ==========');
  incisos(L);
end.