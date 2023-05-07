{11. La Facultad de Informática debe seleccionar los 10 egresados con mejor promedio a los que la UNLP les
entregará el premio Joaquín V. González. De cada egresado se conoce su número de alumno, apellido y el
promedio obtenido durante toda su carrera.
Implementar un programa que:
a. Lea la información de todos los egresados, hasta ingresar el código 0, el cual no debe procesarse.
b. Una vez ingresada la información de los egresados, informe el apellido y número de alumno de los
egresados que recibirán el premio. La información debe imprimirse ordenada según el promedio del egresado
(de mayor a menor).}

program eje11;

const
  dimF = 10;
type
  REG_alumno = record
    numAlumno: integer;
    apellido: string[20];
    promedio: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_alumno;
    sig: Lista;
  end;

  vector = array [1..dimF] of REG_alumno;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_alumno);
  var
    nue,ant,act: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.dato.promedio > r.Promedio) do
          begin
            ant:= act;
            act:= act^.sig;
          end;
        if (ant = act) then
          L:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;
  end;

// ==== INCISOS A
procedure preguntas (var r: REG_alumno);
  begin
    with r do
      begin
        // random Externo a CADP
        writeln ('Numero de alumno: '); readln(numAlumno);
        if (numAlumno <> 0) then
          begin
            writeln ('Apellido: '); readln(apellido);
            writeln ('Promedio: '); readln(promedio);
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_alumno;
  begin
    preguntas(r);
    while (r.numAlumno <> 0) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ==== INCISOS A
// ================ CARGA LISTA

// ==== INCISOS B
procedure incisoB (L: Lista);
  var
    x,y: integer;
    v: vector;
  begin
    for x:=1 to dimF do
      begin
        v[x].promedio:= 0;
        v[x].numAlumno:= 0;
        v[x].apellido:= 'Vacio';
      end;
      
    while (L <> nil) do
      begin
        x:= 1;
        while (v[x].promedio > L^.dato.promedio) and (x <= dimF) do
          x:= x + 1;
        
        if (x <= dimF) then
          begin
            if (x = dimF) then
              v[x]:= L^.dato
            else
              begin
                for y:=dimF downto x do
                  v[y]:= v[y - 1];
                v[y]:= L^.dato;
              end;
          end;
        L:= L^.sig;
      end;
    for x:=1 to dimF do
      writeln (v[x].apellido,' ',v[x].numAlumno);
  end;
// ==== INCISOS B

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  //INCISO A
  cargarLista(L);
  //INCISO A
  writeln ('========== FIN CARGA ==========');
  incisoB(L);
end.