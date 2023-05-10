{12. El centro de deportes Fortaco’s quiere procesar la información de los 4 tipos de suscripciones que ofrece: 1)Musculación, 2)Spinning, 
3)Cross Fit, 4)Todas las clases. Para ello, el centro dispone de una tabla con información sobre el costo mensual de cada tipo de suscripción.
Realizar un programa que lea y almacene la información de los clientes del centro. De cada cliente se conoce el nombre, DNI, edad y 
tipo de suscripción contratada (valor entre 1 y 4). Cada cliente tiene una sola suscripción. 
La lectura finaliza cuando se lee el cliente con DNI 0, el cual no debe procesarse.
Una vez almacenados todos los datos, procesar la estructura de datos generada, calcular e informar:
- La ganancia total de Fortaco’s
- Las 2 suscripciones con más clientes.
- Genere una lista con nombre y DNI de los clientes de más de 40 años que están suscritos a
CrossFit o a Todas las clases. Esta lista debe estar ordenada por DNI.}

program eje12;
const
  dimF = 4;
type
  str20 = string[20];
  suscripcion = 1..4;

  REG_cliente = record
    nom: str20;
    dni,edad: integer;
    sus: suscripcion;
  end;

  REG_clienteN = record
    nom: str20;
    dni: integer;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_cliente;
    sig: Lista;
  end;

  ListaN = ^NodoN;
  NodoN = record
    dato: REG_clienteN;
    sig: ListaN;
  end;

  vecSus = array [1..dimF] of real;
  vecCant = array [1..dimF] of integer;

// ================ CARGA LISTA Y VECTOR
procedure cargarVector (var v: vecSus);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      begin
        write ('Precio de la suscripcion ',x,': '); 
        readln(v[x]);
      end;
  end;

procedure crearLista (var L: Lista; r: REG_cliente);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_cliente);
  begin
    with r do
      begin
        write ('D.N.I: '); readln(dni);
        if (dni <> 0) then
          begin
            write ('Nombre: '); readln(nom);
            write ('Edad: '); readln(edad);
            write ('Tipo de suscripcion (1 a 4): '); readln(sus);
          end;
      end;  
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_cliente;
  begin
    preguntas(r);
    while (r.dni <> 0) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA Y VECTOR

// ========== INCISOS
procedure crearListaN (var L: ListaN; nom: str20; dni: integer);
  var
    nue,ant,act: ListaN;
  begin
    New(nue);
    nue^.dato.nom:= nom;
    nue^.dato.dni:= dni;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.dato.dni < dni) do
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

procedure incisos (L: Lista; v: vecSus; var Ln: ListaN);
  var
    x,pos1,pos2,max1,max2: integer;
    ganancias: real;
    vP2: vecCant;
  begin
    ganancias:= 0;
    for x:=1 to dimF do
      vP2[x]:= 0;
    max1:= 0;
    max2:= 0;

    while (L <> nil) do
      begin
        //Punto 1
        ganancias:= ganancias + (v[L^.dato.sus]);

        //Punto 2
        vP2[L^.dato.sus]:= vP2[L^.dato.sus] + 1;

        //Punto 3
        if (L^.dato.edad > 40) and ((L^.dato.sus = 3) or (L^.dato.sus = 4)) then
          crearListaN(Ln,L^.dato.nom,L^.dato.dni);

        L:= L^.sig;
      end;
    
    writeln ('La ganancia total de Fortacos es: $',ganancias:0:2,'.');
    for x:=1 to dimF do
      begin
        if (max1 < vP2[x]) then
          begin
            max2:= max1;
            pos2:= pos1;
            max1:= vP2[x];
            pos1:= x;
          end
        else
          if (max2 < vP2[x]) then
            begin
              max2:= vP2[x];
              pos2:= x;
            end;
      end;
    writeln ('Las 2 suscripciones con mas clientes son la ',pos1,' y ',pos2,'.');
  end;
// ========== INCISOS

//Programa principal
var
  L: Lista;
  v: vecSus;
  Ln: ListaN;
begin
  L:= nil;
  cargarVector(v);
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  Ln:= nil;
  incisos(L,v,Ln);
end.