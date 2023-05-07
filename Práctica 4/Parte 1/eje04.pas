{4. Se dispone de un vector con 100 números enteros. Implementar los siguientes módulos:

a) posicion: dado un número X y el vector de números, retorna la posición del número X en dicho vector,
o el valor -1 en caso de no encontrarse.
b) intercambio: recibe dos valores x e y (entre 1 y 100) y el vector de números, y retorna el mismo vector
donde se intercambiaron los valores de las posiciones x e y.
c) sumaVector: retorna la suma de todos los elementos del vector.
d) promedio: devuelve el valor promedio de los elementos del vector.
e) elementoMaximo: retorna la posición del mayor elemento del vector
f) elementoMinimo: retorna la posicion del menor elemento del vector}

program eje04;

const
  dimF = 100;
type
  vector = array [1..dimF] of integer;

// =========== COMIENZO: COMO SE SUPONE QUE SE DISPONE EL VECTOR
procedure cargarVector (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      v[x]:= random(500);
    {for x:=1 to dimF do
      write (v[x],' ');
    writeln();}
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
function elementoMaximoE (v: vector): integer;
  var
    x,num: integer;
  begin
    num:= 0;
    for x:=1 to dimF do
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
function elementoMinimoF (v: vector): integer;
  var
    x,num: integer;
  begin
    num:= 32767;
    for x:=1 to dimF do
      begin
        if (num > v[x]) then
          begin
            num:= v[x];
            elementoMinimoF:= x;
          end;
      end;
  end;
// ============ INCISO F

//Programa principal
var
  v: vector;
begin
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  cargarVector(v); //No lo pide el enunciado, lo hice por mi cuenta
  //=================================
  incisoA(v);
  incisoB(v);
  writeln ('La suma de los elementos del vector es: ',incisoC(v));
  writeln ('El primedio de los elementos del vector es: ',promedioD(v):5:2);
  writeln ('La posicion del mayor elemento del vector es: ',elementoMaximoE(v));
  writeln ('La posicion del menor elemento del vector es: ',elementoMinimoF(v));
end.