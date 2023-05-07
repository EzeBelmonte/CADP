{13. El Portal de Revistas de la UNLP está estudiando el uso de sus sistemas de edición electrónica por parte de
los usuarios. Para ello, se dispone de información sobre los 3600 usuarios que utilizan el portal. De cada
usuario se conoce su email, su rol (1: Editor; 2. Autor; 3. Revisor; 4. Lector), revista en la que participa y
cantidad de días desde el último acceso.
a. Imprimir el nombre de usuario y la cantidad de días desde el último acceso de todos los usuarios de la
revista Económica. El listado debe ordenarse a partir de la cantidad de días desde el último acceso (orden
ascendente).
b. Informar la cantidad de usuarios por cada rol para todas las revistas del portal.
c. Informar los emails de los dos usuarios que hace más tiempo que no ingresan al portal.}

program eje13;
const
  fin = 3600;
type
  REG_user = record
    email,revista: string;
    rol,cantDias: integer;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_user;
    sig: Lista;
  end;

  vecIncB = array [1..4] of integer;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_user);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_user);
  begin
    with r do
      begin
        writeln ('Email: '); readln(email);
        writeln ('Revista: '); readln(revista);
        writeln ('Rol: '); readln(rol);
        writeln ('Cantidad de dias desde el ultimo acceso: '); readln(cantDias);
      end;  
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_user;
    x: integer;
  begin
    for x:= 1 to fin do
      begin
        preguntas(r);
        crearLista(L,r);
      end;
  end;
// ================ CARGA LISTA

// ==== INCISOS A
procedure crearOrdenado (var L: Lista; r: REG_user);
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
        while (act <> nil) and (act^.dato.cantDias < r.cantDias) do
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

// ==== INCISOS C
procedure incisoC (r: REG_user; var max1,max2: integer; var email1,email2: string);
  begin
    if (r.cantDias > max1) then
      begin
        max2:= max1;
        email2:= email1;
        max1:= r.cantDias;
        email1:= r.email;
      end
    else
      if (r.cantDias > max2) then
        begin
          max2:= r.cantDias;
          email2:= r.email;
        end;
  end;
// ==== INCISOS C

// ==== INCISOS
procedure incisos (L: Lista; var ln: Lista; var v: vecIncB);
  var
    max1,max2: integer;
    email1,email2: string;
  begin
    max1:= 0;
    max2:= 0;
    while (L <> nil) do
      begin
        // INCISOS A
        if (L^.dato.revista = 'Económica') then
          crearOrdenado(ln,L^.dato);
        // INCISOS B
        v[L^.dato.rol]:= v[L^.dato.rol] + 1;

        incisoC(L^.dato,max1,max2,email1,email2);
        L:= L^.sig;
      end;

      //INCISOS B
      writeln ('Los emails de los dos usuarios que hace mas tiempo que no ingresan al portal son: ',email1,' y ',email2);
  end;
// ==== INCISOS


// ==== IMPRIMIR
procedure Imprimir (L: Lista; v: vecIncB);
  var
    x: integer;
  begin
    //INCISOS A
    while (L <> nil) do
      begin
        writeln ('Email: ',L^.dato.email,' con cantidad de dias: ',L^.dato.cantDias);
        L:= L^.sig;
      end;

    //INCISOS B
    for x:=1 to 4 do
      writeln ('La cantidad de usuarios del rol ',x,' es de: ',v[x]);
  end;
// ==== IMPRIMIR

//Programa principal
var
  x: integer;
  L,listaNueva: Lista;
  v: vecIncB;
begin
  for x:=1 to 4 do
    v[x]:= 0;
  L:= nil;
  cargarLista(L);
  writeln ('========== FIN CARGA ==========');

  //INCISOS
  listaNueva:= nil;
  incisos(L,listaNueva,v);
  Imprimir(listaNueva,v);
end.