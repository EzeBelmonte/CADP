{14. La biblioteca de la Universidad Nacional de La Plata necesita un programa para administrar información de préstamos de libros efectuados
en marzo de 2020. Para ello, se debe leer la información de los préstamos realizados. De cada préstamo se lee: 
nro. de préstamo, ISBN del libro prestado, nro. de socio al que se prestó el libro, día del préstamo (1..31). 
La información de los préstamos se lee de manera ordenada por ISBN y finaliza cuando se ingresa el ISBN -1 (que no debe procesarse).

Se pide:
A) Generar una estructura que contenga, para cada ISBN de libro, la cantidad de veces que fue prestado.
Esta estructura debe quedar ordenada por ISBN de libro.

B) Calcular e informar el día del mes en que se realizaron menos préstamos.
C) Calcular e informar el porcentaje de préstamos que poseen nro. de préstamo impar y nro. de socio
par.}

program eje14;
const
  dimF = 31;
type
  REG_prestamo = record
    numPres,isbn,numSocio,dia: integer;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_prestamo;
    sig: Lista;
  end;

  vecDia = array [1..dimF] of integer;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_prestamo);
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
        while (act <> nil) and (act^.dato.isbn < r.isbn) do
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

procedure preguntas (var r: REG_prestamo);
  begin
    with r do
      begin
        write ('Num de prestamo: '); readln(numPres);
        write ('ISBN: '); readln(isbn);
        if (isbn <> -1) then
          begin
            write ('Num. de socio: '); readln(numSocio);
            write ('Dia: '); readln(dia);
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_prestamo;
  begin
    preguntas(r);
    while (r.isbn <> -1) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

// =========== INCISOS
function impar (num: integer): boolean;
  begin
    if ((num mod 3) = 0) then
      impar:= true
    else
      impar:= false;  
  end;

function par (num: integer): boolean;
  begin
    if ((num mod 2) = 0) then
      par:= true
    else
      par:= false;  
  end;

procedure incisos (L: Lista);
  var
    x,dia,cant,sumaP,incB: integer;
    v: vecDia;
  begin
    for x:=1 to dimF do
      v[x]:= 0;
    
    sumaP:= 0;
    incB:= 0;
    while (L <> nil) do
      begin
        //Inciso B
        v[L^.dato.dia]:= v[L^.dato.dia] + 1;

        //Inciso C
        sumaP:= sumaP + 1;
        if (impar(L^.dato.numPres)) and (par(L^.dato.numSocio)) then
          incB:= incB + 1;

        L:= L^.sig;
      end;

    //Inciso B
    cant:= 32767;
    for x:=1 to dimF do
      if (cant > v[x]) then
        begin
          cant:= v[x];
          dia:= x;
        end;
    writeln ('El dia del mes en que se realizaron menos prestamos fue el dia ',dia,'.');

    //Inciso C
    writeln ('El porcentaje de prestamos que poseen nro. de prestamo impar y nro. de socio par',((incB * 100) / sumaP):0:2);
  end;
// =========== INCISOS

var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L);
end.