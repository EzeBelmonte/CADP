{5. Realizar un programa que lea y almacene la información de productos de un supermercado. De cada
producto se lee: código, descripción, stock actual, stock mínimo y precio. La lectura finaliza cuando se ingresa
el código -1, que no debe procesarse. Una vez leída y almacenada toda la información, calcular e informar:
a. Porcentaje de productos con stock actual por debajo de su stock mínimo.
b. Descripción de aquellos productos con código compuesto por al menos tres dígitos pares.
c. Código de los dos productos más económicos.}

program eje05;
type
  REG_producto = record
    cod,stockAct,stockMin: integer;
    descrip: string;
    precio: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_producto;
    sig: Lista;
  end;

// ================ CARGA LISTA
procedure crearLista(var l: Lista; r: REG_producto);
  var
    aux: Lista;
  begin
    New(aux);
    aux^.dato:= r;
    aux^.sig:= L;
    L:= aux;
  end;

procedure preguntas (var r: REG_producto);
  begin
    r.cod:= random (2000) - 3;
    with r do
      begin
        writeln ('Cod: '); readln(cod);
        if (r.cod > -1) then
          begin
            writeln ('Descripcion: '); readln(descrip);
            writeln ('Stock actual: ');readln(stockAct);
            writeln ('Stock minimo: '); readln(stockMin);
            writeln ('Precio: '); readln(precio);
          end;
        end;
  end;

procedure cargarLista(var l: Lista);
  var
    r: REG_producto;
  begin
    preguntas(r);
    while (r.cod > -1) do
      begin
        crearLista(l,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

// ==== INCISOS A
procedure incisoA (L: Lista; var cant, total: integer);
  begin
    if (L^.dato.stockAct < L^.dato.stockMin) then
      cant:= cant + 1;
    total:= total + 1;
  end;
// ==== INCISOS A

// ==== INCISOS B
procedure incisoB (r: REG_producto);
  var
    cantPar: integer;
  begin
    cantPar:= 0;
    while (r.cod > 0) do
      begin
        if ((r.cod mod 2) = 0) then
          cantPar:= cantPar + 1;
        r.cod:= r.cod div 10;
      end;
    if (cantPar >= 3) then
      writeln('Descripcion: ',r.descrip);
  end;
// ==== INCISOS B

// ==== INCISOS C
procedure incisoC (r: REG_producto; var min1,min2: real; var codMin1,codMin2: integer);
  begin
    if (min1 > r.precio) then
      begin
        min2:= min1;
        codMin2:= codMin1;
        min1:= r.precio;
        codMin1:= r.cod;
      end
    else
      if (min2 > r.precio) then
        begin
          min2:= r.precio;
          codMin2:= r.cod;
        end;
  end;
// ==== INCISOS C

// ==== INCISOS
procedure incisos (L: Lista);
  var
    cant,total,codMin1,codMin2: integer;
    min1,min2: real;
  begin
    cant:= 0;
    total:= 0;
    min1:= 32767;
    min2:= min1;
    while (L <> nil) do
      begin
        incisoA(L,cant,total);
        incisoB(L^.dato);
        incisoC(L^.dato,min1,min2,codMin1,codMin2);
        L:= L^.sig;
      end;

    // INCISO A
    writeln ('El porcentaje es: ',((cant * 100) / total):0:2);
    // INCISO B
    writeln ('Los codigo de los dos productos mas economicos son: ',codMin1,' y ',codMin2);
  end;
// ==== INCISOS

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  incisos(L);
end.