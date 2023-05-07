{5. Utilizando los módulos implementados en el ejercicio 4, realizar un programa que lea números enteros
desde teclado (a lo sumo 100) y los almacene en un vector. La carga finaliza al leer el número 0. Al finalizar
la carga, se debe intercambiar la posición del mayor elemento por la del menor elemento, e informe la
operación realizada de la siguiente manera: “El elemento máximo ... que se encontraba en la posición ...
fue intercambiado con el elemento mínimo ... que se encontraba en la posición ...”.}

program eje05;

const
  dimF = 100;
type
  vector = array [1..dimF] of integer;

// =========== COMIENZO: COMO SE SUPONE QUE SE DISPONE EL VECTOR
procedure cargarVector (var v: vector; var dimL: integer);
  var
    num: integer;
  begin
    write ('Numero: '); readln(num);
    while (num <> 0) and (dimL < dimF) do
      begin
        dimL:= dimL + 1;
        v[dimL]:= num;
        write ('Numero: '); readln(num);
      end;
  end;
// =========== FIN: COMO SE SUPONE QUE SE DISPONE EL VECTOR

// ============ INCISO A
function posicion (v: vector; num: integer): integer;
  begin
    posicion:= 1;
    while (posicion <= dimF) and (v[posicion] <> num) do
      posicion:= posicion + 1;
    if (v[posicion] <> num) then
      posicion:= -1;
  end;

procedure incisoA (v: vector);
  var
    num: integer;
  begin
    write ('Numero: '); readln(num);
    writeln ('Posicion del numero es (en caso de no encontrarlo imprime - 1): ',posicion(v,num));
  end;
// ============ INCISO A

// ============ INCISO B
procedure intercambio (var v:vector; x,y: integer);
  var
    aux: integer;
  begin
    aux:= v[x];
    v[x]:= v[y];
    v[y]:= aux;
  end;

procedure incisoB (v: vector);
var
  x,y: integer;
begin
  write ('Posicion X: '); readln(x);
  write ('Posicion Y: '); readln(y);
  intercambio(v,x,y);
end;
// ============ INCISO B

// ============ INCISO C
function incisoC (v: vector): integer;
  var
    x: integer;
  begin
    incisoC:= 0;
    for x:=1 to dimF do
      incisoC:= incisoC + v[x];
  end;
// ============ INCISO C

// ============ INCISO D
function promedioD (v: vector): real;
  var
    x: integer;
  begin
    promedioD:= 0;
    for x:=1 to dimF do
      promedioD:= promedioD + v[x];
    promedioD:= promedioD / dimF;
  end;
// ============ INCISO D

// ============ INCISO E
function elementoMaximoE (v: vector; dimL: integer): integer;
  var
    x,num: integer;
  begin
    num:= 0;
    for x:=1 to dimL do
      begin
        if (num < v[x]) then
          begin
            num:= v[x];
            elementoMaximoE:= x;
          end;
      end;
  end;
// ============ INCISO E

// ============ INCISO F
function elementoMinimoF (v: vector; dimL: integer): integer;
  var
    x,num: integer;
  begin
    num:= 32767;
    for x:=1 to dimL do
      begin
        if (num > v[x]) then
          begin
            num:= v[x];
            elementoMinimoF:= x;
          end;
      end;
  end;
// ============ INCISO F

procedure inciso (var v: vector);
  var
    dimL: integer;
  begin
    dimL:= 0;
    cargarVector(v,dimL);
    intercambio(v,elementoMaximoE(v,dimL),elementoMinimoF(v,dimL)); //Las funciones me devuelven la posicion
    writeln ('El elemento maximo ',v[elementoMaximoE(v,dimL)],' que se encontraba en la posicion ',elementoMinimoF(v,dimL),' fue intercambiado con el elemento minimo ',v[elementoMinimoF(v,dimL)],' que se encontraba en la posicion ',elementoMaximoE(v,dimL));
  end;

//Programa principal
var
  v: vector;
  
begin
  inciso(v);
end.