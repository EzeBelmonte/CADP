{2. Implementar un programa que lea y almacene información de clientes de una empresa aseguradora
automotriz. De cada cliente se lee: código de cliente, DNI, apellido, nombre, código de póliza
contratada (1..6) y monto básico que abona mensualmente. La lectura finaliza cuando llega el cliente
con código 1122, el cual debe procesarse.
La empresa dispone de una tabla donde guarda un valor que representa un monto adicional que el
cliente debe abonar en la liquidación mensual de su seguro, de acuerdo al código de póliza que tiene
contratada.

Una vez finalizada la lectura de todos los clientes, se pide:
a. Informar para cada cliente DNI, apellido, nombre y el monto completo que paga mensualmente
por su seguro automotriz (monto básico + monto adicional).
b. Informar apellido y nombre de aquellos clientes cuyo DNI contiene al menos dos dígitos 9.
c. Realizar un módulo que reciba un código de cliente, lo busque (seguro existe) y lo elimine de la
estructura.}

program eje02;
type
  str30 = string[30];
  codPoliza = 1..6;

  REG_cliente = record
    cod,dni: integer;
    poliza: codPoliza;
    apellido,nombre: str30;
    monto: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_cliente;
    sig: Lista;
  end;

  vecMontAdic = array [1..6] of real;

// ================ CARGA VECTOR
procedure cargarVector (var v: vecMontAdic);
  begin
    v[1]:= 1500;
    v[2]:= 2000;
    v[3]:= 2500;
    v[4]:= 3000;
    v[5]:= 3500;
    v[6]:= 4000;
  end;
// ================ CARGA VECTOR

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_cliente);
  var
    nue,pos: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        pos:= L;
        while (pos^.sig <> nil) do
          pos:= pos^.sig;
        pos^.sig:= nue;
      end;
  end;

procedure preguntas (var r: REG_cliente);
  begin
    with r do
      begin
        write ('Cod cliente: '); readln(cod);
        write ('D.N.I: '); readln(dni);
        write ('Apellido: '); readln(apellido);
        write ('Nombre: '); readln(nombre);
        write ('Cod de piliza (1 a 6): '); readln(poliza);
        write ('Monto mensual basico: '); readln(monto);
      end; 
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_cliente;
  begin
    repeat
      preguntas(r);
      crearLista(L,r);
    until (r.cod = 1122);
  end;
// ================ CARGA LISTA

// ========== INCISOS
function incisoB (dni: integer): boolean;
  var
    cant: integer;
  begin
    incisoB:= false;
    cant:= 0;
    while (dni > 0) and not(incisoB) do
      begin
        if ((dni mod 10) = 9) then
          cant:= cant + 1;
        if (cant = 2) then
          incisoB:= true
        else
          dni:= dni div 10;
      end;
  end;

procedure incisos (L: Lista; v: vecMontAdic);
  begin
    while (L <> nil) do
      begin
        //Inciso A
        writeln ('D.N.I: ',L^.dato.dni,' | Apellido: ',L^.dato.apellido,' | Nombre: ',L^.dato.nombre,' | Monto mensual: ',(L^.dato.monto + v[L^.dato.poliza]):0:2);
        //Inciso B
        if (incisoB(L^.dato.dni)) then
          writeln ('Apellido: ',L^.dato.apellido,' | Nombre: ',L^.dato.nombre);
        L:= L^.sig;
      end;
  end;

procedure borrarCliente (var L: Lista);
  var
    cod: integer;
    ant,act: Lista;
  begin
    ant:= L;
    act:= L;
    write ('Cod de cliente a borrar: '); readln(cod);
    while (act <> nil) and (act^.dato.cod <> cod) do
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
      end;
  end;
// ========== INCISOS

//Programa principal
var
  L: Lista;
  v: vecMontAdic;
begin
  L:= nil;
  cargarVector(v);
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L,v);
  borrarCliente(L);
end.