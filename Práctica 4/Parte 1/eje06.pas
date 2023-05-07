{6. Dado que en la solución anterior se recorre dos veces el vector (una para calcular el elemento máximo y
otra para el mínimo), implementar un único módulo que recorra una única vez el vector y devuelva ambas
posiciones.}

program eje06;

const
  dimF = 10;
type
  vector = array [1..dimF] of integer;

// =========== COMIENZO: COMO SE SUPONE QUE SE DISPONE EL VECTOR
procedure cargarVector (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      v[x]:= random(500);
  end;
// =========== FIN: COMO SE SUPONE QUE SE DISPONE EL VECTOR


procedure posiciones (v: vector; var posMin,posMax: integer);
  var
    x,min,max: integer;
  begin
    min:= 32767;
    max:= -32767;
    for x:=1 to dimF do
      begin
        if (v[x] > max) then
          begin
            max:= v[x];
            posMax:= x;
          end;
        if (v[x] < min) then
          begin
            min:= v[x];
            posMin:= x;
          end;
      end;
  end;

procedure inciso (var v: vector);
  var
    posMin,posMax: integer;
  begin
    posiciones(v,posMin,posMax);
    writeln ('El menor numero se encuentra en la posicion ',posMin,' y el maximo en ',posMax);
  end;

//Programa principal
var
  v: vector;
begin
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  cargarVector(v); //No lo pide el enunciado, lo hice por mi cuenta
  //=================================
  inciso(v);

end.