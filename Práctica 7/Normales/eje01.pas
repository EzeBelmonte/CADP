{1. Una productora nacional realiza un casting de personas para la selección de actores extras de una
nueva película, para ello se debe leer y almacenar la información de las personas que desean
participar de dicho casting. De cada persona se lee: DNI, apellido y nombre, edad y el código de
género de actuación que prefiere (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror). La lectura
finaliza cuando llega una persona con DNI 33555444, la cual debe procesarse.

Una vez finalizada la lectura de todas las personas, se pide:
a. Informar la cantidad de personas cuyo DNI contiene más dígitos pares que impares.
b. Informar los dos códigos de género más elegidos.
c. Realizar un módulo que reciba un DNI, lo busque y lo elimine de la estructura. El DNI puede no
existir. Invocar dicho módulo en el programa principal.}

program eje01;

const
  dimF = 5;
type
  str30 = string[30];

  REG_persona = record
    cod: (1: drama, 2: romántico, 3: acción, 4: suspenso, 5: terror)
    dni,edad,cod: integer;
    apellido,nombre: str30;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_persona;
    sig: Lista;
  end;

  vector = array [1..dimF] of integer;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_persona);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;  
  end;

procedure preguntas (var r: REG_persona);
  begin
    with r do
      begin
        write ('D.N.I: '); readln(dni);
        write ('Apellido: '); readln(apellido);
        write ('Nombre: '); readln(nombre);
        write ('Edad: '); readln(edad);
        write ('Codigo Pelicula: '); readln(cod);
      end;
  end;
procedure cargarLista (var L: Lista);
  var
    r: REG_persona;
  begin
    repeat
      preguntas(r);
      crearLista(L,r);
    until (r.dni = 30000) //Como no se lee el 33555444, pongo un integer valido
  end;
// ================ CARGA LISTA

procedure imprimir (incA,cod1,cod2: integer; v: vector);
  var
    x: integer;
  begin
    writeln ('La cantidad de personas cuyo DNI contiene mas digitos pares que impares es: ',incA,'.');
    for x:=1 to dimF do
      begin
        if (cod1 < v[x]) then
          begin
            cod2:= cod1;
            cod1:= x;
          end
        else
          if (cod2 < v[x]) then
            cod2:= x;
      end;
    writeln ('Los dos codigos de genero mas elegidos son el ',cod1,' y ',cod2,'.');
  end;

// ========== INCISO A
function incisoA (dni: integer): boolean;
  var
    par,impar: integer;
  begin
    par:= 0;
    impar:= 0;
    while (dni > 0) do
      begin
        if ((dni mod 2) = 0) then
          par:= par + 1
        else
          impar:= impar + 1;
        dni:= dni div 10;
      end;
    if (par > impar) then
      incisoA:= true
    else
      incisoA:= false;
  end;
// ========== INCISO A

// ================= INCISOS
procedure incisos (L: Lista);
  var
    x,incA,cod1,cod2: integer;
    v: vector;
  begin
    incA:= 0;
    cod1:= 0;
    cod2:= 0;
    for x:=1 to dimF do
      v[x]:= 0;
    while (L <> nil) do
      begin
        //Inciso A
        if (incisoA(L^.dato.dni)) then
          incA:= incA + 1;
        //Inciso B
        v[L^.dato.cod]:= v[L^.dato.cod] + 1;
        L:= L^.sig;
      end;
    imprimir (incA,cod1,cod2,v);
  end;
// ================= INCISOS

// ========== INCISO C
procedure borrarDNI (var L: Lista);
  var
    dni: integer;
    ant,act: Lista;
  begin
    write ('DNI a borrar: '); readln(dni);
    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.dni <> dni) do
      begin
        ant:= act;
        act:= act^.sig;
      end;
    
    if (act <> nil) then
      begin
        if (ant = act) then
            L:= act^.sig
        else
            ant^.sig:= act^.sig;
        dispose(act);
        writeln ('Persona borrada de la lista');
      end
    else
      writeln ('Persona NO esta en la lista');
  end;
// ========== INCISO C

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L);
  borrarDNI(L);
end.