{1. a. Dado un vector de enteros de a lo sumo 500 valores, realice un módulo que reciba dicho vector y un valor
n y retorne si n se encuentra en el vector o no.
b. Modifique el módulo del inciso a. considerando ahora que el vector se encuentra ordenado de manera
ascendente.}

program eje01;

const
  dimF = 500;
type
  vector = array [1..dimF] of integer;

// =========== COMIENZO: COMO SE SUPONE QUE SE DISPONE EL VECTOR
procedure cargarV (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      v[x]:= random(1000);
  end;
// =========== FIN: COMO SE SUPONE QUE SE DISPONE EL VECTOR

function incisoA (v: vector; num: integer): boolean;
  var
    x: integer;
  begin
    incisoA:= false;
    x:=1;
    while (x <= dimF) and not(incisoA) do
      begin
        if (v[x] = num) then
          incisoA:= true
        else
          x:= x + 1;
      end;
  end;

function incisoB (v: vector; num: integer): boolean;
  var
    x: integer;
  begin
    incisoB:= false;
    x:=1;
    while (x <= dimF) and (v[x] <= num) and not(incisoB) do
      begin
        if (v[x] = num) then
          incisoB:= true
        else
          x:= x + 1;
      end;
  end;

procedure inciso (v: vector);
  var
    num: integer;
  begin
    write ('Numero: '); readln(num);
    //Inciso A
    if (incisoA(v,num)) then
      writeln ('Se encuentra en el vector')
    else
      writeln ('NO se encuentra en el vector');

    //Inciso B
    if (incisoB(v,num)) then
      writeln ('Se encuentra en el vector')
    else
      writeln ('NO se encuentra en el vector');
  end;

var
  v: vector;
begin
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  cargarV(v); //No lo pide el enunciado, lo hice por mi cuenta
  //=================================
  inciso(v);
end.