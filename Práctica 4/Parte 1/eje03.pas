{3. Se dispone de un vector con números enteros, de dimensión física dimF y dimensión lógica dimL.
a) Realizar un módulo que imprima el vector desde la primera posición hasta la última.
b) Realizar un módulo que imprima el vector desde la última posición hasta la primera.
c) Realizar un módulo que imprima el vector desde la mitad (dimL DIV 2) hacia la primera posición, y
desde la mitad más uno hacia la última posición.
d) Realizar un módulo que reciba el vector, una posición X y otra posición Y, e imprima el vector desde la
posición X hasta la Y. Asuma que tanto X como Y son menores o igual a la dimensión lógica. Y considere
que, dependiendo de los valores de X e Y, podría ser necesario recorrer hacia adelante o hacia atrás.
e) Utilizando el módulo implementado en el inciso anterior, vuelva a realizar los incisos a, b y c.}

program eje03;

const
  dimF = 150;
type
  vector = array [1..dimF] of integer;

procedure cargarVector (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      v[x]:= random(500);
  end;

procedure incisoA (v:vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      write(v[x],' ');
    writeln();
  end;

procedure incisoB (v:vector);
  var
    x: integer;
  begin
    for x:= dimF downto 1 do
      write(v[x],' ');
    writeln();
  end;

procedure incisoC (v:vector);
  var
    x,dimL: integer;
  begin
    dimL:= dimF div 2;
    for x:= dimL downto 1 do
      write(v[x],' ');
    writeln();
    dimL:= dimL + 1;
    for x:= dimL to dimF do
      write(v[x],' ');
    writeln();
  end;

procedure incisoD (v:vector; x,y: integer);
  var
    ini: integer;
  begin
    if (x < y) then
      for ini:= x to y do
        write(v[ini],' ')
    else
      for ini:= y downto x do
        write(v[ini],' ');
    writeln();
  end;

//Programa principal
var
  v: vector;
  x,y: integer;
begin
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  cargarVector(v); //No lo pide el enunciado, lo hice por mi cuenta
  //=================================

  writeln('===== INCISO A =====');
  incisoA(v);
  writeln('===== INCISO B =====');
  incisoB(v);
  writeln('===== INCISO C =====');
  incisoC(v);
  writeln('===== INCISO D =====');
  write ('Numero 1: '); readln(x);
  write ('Numero 2: '); readln(y);
  incisoD(v,x,y);
end.