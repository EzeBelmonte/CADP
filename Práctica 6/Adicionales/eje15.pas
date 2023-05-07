{15. La cátedra de CADP está organizando la cursada para el año 2019. Para ello, dispone de una lista con
todos los alumnos que cursaron EPA. De cada alumno se conoce su DNI, apellido, nombre y la nota obtenida.
Escribir un programa que procese la información de alumnos disponible y los distribuya en turnos utilizando
los siguientes criterios:
- Los alumnos que obtuvieron al menos 8 en EPA deberán ir a los turnos 1 ó 4.
- Los alumnos que obtuvieron entre 5 y 8 deberán ir a los turnos 2, 3 ó 5.
- Los alumnos que no alcanzaron la nota 5 no se les asignará turno en CADP.
Al finalizar, el programa debe imprimir en pantalla la lista de alumnos para cada turno.
Nota: La distribución de alumnos debe ser lo más equitativa posible.}

program eje15;
const
  dimF = 5;
type
  REG_alumno = record
    dni: integer;
    apellido,nombre: string[30];
    nota: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_alumno;
    sig: Lista;
  end;

  vecLista = array [1..dimF] of Lista;
  vecEqui = array [1..dimF] of integer;

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
  begin
    with r do
      begin
        writeln ('D.N.I: '); readln(dni);
        if (dni <> 0) then
          begin
            writeln ('Apellido: '); readln(apellido);
            writeln ('Nombre: '); readln(nombre);
            writeln ('Nota: '); readln(nota);

            writeln ('D.N.I: '); readln(dni);
          end;
      end;  
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_alumno;
  begin
    preguntas(r);
    while (r.dni <> 0) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

procedure inciso (L: Lista; var vLista: vecLista);
  var
    vEquidad: vecEqui;
    x: integer;
  begin
    for x:=1 to dimF do
      vEquidad[x]:= 0;
    while (L <> nil) do
      begin
        if (L^.dato.nota >= 8) then
          begin //No es necesario poner begin-end, pero para mayor legilibilidad lo pongo.
            if (vEquidad[1] <= vEquidad[4]) then
              begin
                crearLista(vLista[1],L^.dato);
                vEquidad[1]:= vEquidad[1] + 1;
              end
            else
              begin
                crearLista(vLista[4],L^.dato);
                vEquidad[4]:= vEquidad[4] + 1;
              end;
          end
        else
          if (L^.dato.nota < 8) and (L^.dato.nota >= 5) then
          begin //No es necesario poner begin-end, pero para mayor legilibilidad lo pongo.
            if (vEquidad[2] <= vEquidad[3]) and (vEquidad[2] <= vEquidad[5]) then
              begin
                crearLista(vLista[2],L^.dato);
                vEquidad[2]:= vEquidad[2] + 1;
              end
            else
              begin
                if (vEquidad[3] <= vEquidad[5]) then
                  begin
                    crearLista(vLista[3],L^.dato);
                    vEquidad[3]:= vEquidad[3] + 1;
                  end
                else
                  begin
                    crearLista(vLista[5],L^.dato);
                    vEquidad[5]:= vEquidad[5] + 1;
                  end;
              end;
          end;
        L:= L^.sig;
      end;
  end;

procedure imprimir (v: vecLista);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      begin
        writeln ('Lista del turno ',x,':');
        while (v[x] <> nil) do
          begin
            write ('D.N.I: ',v[x]^.dato.dni,' | Apellido: ',v[x]^.dato.apellido,' | Nombre: ',v[x]^.dato.nombre);
            writeln();
            v[x]:= v[x]^.sig;
          end;
      end;
  end;

//Programa principal
var
  listaAlumno: Lista;
  vLista: vecLista;
  x: integer;
begin
  // CARGA LISTA
  listaAlumno:= nil;
  cargarLista(listaAlumno);
  // CARGA LISTA
  writeln ('========== FIN CARGA ==========');

  // INCISO
  for x:=1 to dimF do
    vLista[x]:= nil;
  inciso(listaAlumno,vLista);
  // INCISO

  writeln ('========== LISTAD COMISIONES ==========');
  imprimir(vLista);
end.