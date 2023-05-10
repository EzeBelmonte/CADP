{11. Realizar un programa para una empresa productora que necesita organizar 100 eventos culturales. De
cada evento se dispone la siguiente información: nombre del evento, tipo de evento (1: música, 2: cine, 3:
obra de teatro, 4: unipersonal y 5: monólogo), lugar del evento, cantidad máxima de personas permitidas
para el evento y costo de la entrada. Se pide:

1. Generar una estructura con las ventas de entradas para tales eventos culturales. De cada venta se
debe guardar: código de venta, número de evento (1..100), DNI del comprador y cantidad de
entradas adquiridas. La lectura de las ventas finaliza con código de venta -1.

2. Una vez leída y almacenada la información de las ventas, calcular e informar:
a. El nombre y lugar de los dos eventos que han tenido menos recaudación.
b. La cantidad de entradas vendidas cuyo comprador contiene en su DNI más dígitos pares que
impares y que sean para el evento de tipo “obra de teatro”.
c. Si la cantidad de entradas vendidas para el evento número 50 alcanzó la cantidad máxima de
personas permitidas.}

program eje11;
uses
  sysutils; //Externo a CADP
const
  dimF = 100;
type
  numero_evento = 1..100;

  REG_evento = record
    nom,ubicacion: string;
    tipo,capacidad: integer;
    costo: real;
  end;

  REG_venta = record
    codVenta,dni,entradas: integer;
    numEvento: numero_evento;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_venta;
    sig: Lista;
  end;

  vector = array [1..dimF] of REG_evento;
  vec2a = array [1..dimF] of real;

// ================ CARGA LISTA Y VECTOR
procedure cargarVector (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      begin
        {write ('Nombre del evento: '); readln(v[x].nom);
        write ('Tipo de evento: '); readln(v[x].tipo);
        write ('Lugar del evento: '); readln(v[x].ubicacion);
        write ('Capacidad del evento: '); readln(v[x].capacidad);
        write ('Costo de la entrada: '); readln(v[x].costo);}
        v[x].nom:= Concat('Nombre-',IntToStr(random(2000)));
        v[x].tipo:= random(5) + 1;
        v[x].ubicacion:= Concat('Ubicacion-',IntToStr(random(4000)));
        v[x].capacidad:= random(200) + 50;
        v[x].costo:= random(2000) + 500;
      end;  
  end;

procedure crearLista (var L: Lista; r: REG_venta);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_venta);
  begin
    with r do
      begin
        //write ('Codigo de venta: '); readln(codVenta);
        codVenta:= random(1000) - 15;
        if (codVenta <> -1) then
          begin
            {write ('Num. de evento: '); readln(numEvento);
            write ('D.N.I: '); readln(dni);
            write ('Cantidad de entradas: '); readln(entradas);}
            numEvento:= random(100) + 1;
            dni:= random(10767) + 20000;
            entradas:= random(4) + 1;
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_venta;
  begin
    preguntas(r);
    while (r.codVenta <> -1) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA Y VECTOR

// ========== INCISOS
procedure inciso2a (inc2a: vec2a; v: vector);
  var
    x,pos1,pos2: integer;
    min1,min2: real;
  begin
    min1:= 32767;
    min2:= 32767;
    for x:=1 to dimF do
      begin
        if (inc2a[x] < min1) then
          begin
            min2:= min1;
            pos2:= pos1;
            min1:= inc2a[x];
            pos1:= x;
          end
        else
          if (inc2a[x] < min2) then
            min2:= inc2a[x];
            pos2:= x;
      end;
    writeln ('Los dos eventos que han tenido menos recaudacion son:');
    writeln (v[pos1].nom,' ubicado en ',v[pos1].ubicacion,' y ',v[pos2].nom,' ubicado en ',v[pos2].ubicacion,'.');
  end;

function inciso2b (dni: integer): boolean;
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
      inciso2b:= true
    else
      inciso2b:= false;
  end;

procedure incisos (L: Lista; v: vector);
  var
    x,entradas2b,evento50: integer;
    inc2a: vec2a;
  begin
    for x:=1 to dimF do
      inc2a[x]:= 0;
    
    entradas2b:= 0;
    evento50:= 0;
    while (L <> nil) do
      begin
        //Inciso 2 a
        inc2a[L^.dato.numEvento]:= inc2a[L^.dato.numEvento] + (v[L^.dato.numEvento].costo * L^.dato.entradas);

        //Inciso 2 b
        if (v[L^.dato.numEvento].tipo = 3) and (inciso2b(L^.dato.dni)) then
          entradas2b:= entradas2b + L^.dato.entradas;

        //Inciso 2 c
        if (L^.dato.numEvento = 50) then
          evento50:= evento50 + L^.dato.entradas;

        L:= L^.sig;
      end;
    inciso2a(inc2a,v);
    writeln ('La cant. de entradas vendidas cuyo comprador contiene en su DNI más dig. pares que impares y el evento es "obra de teatro" es: ',entradas2b,'.');
    if (v[50].capacidad < evento50) then
      writeln ('No alcanzo la capacidad maxima.')
    else
      writeln ('Supero o llego a la capacidad maxima permitida');
  end;
// ========== INCISOS

//Programa principal
var
  L: Lista;
  v: vector;
begin
  Randomize; //Externo a CADP
  cargarVector(v);
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L,v);
end.