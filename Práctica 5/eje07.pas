{7) Se desea almacenar en memoria una secuencia de 2500 nombres de ciudades, cada nombre podrá tener
una longitud máxima de 50 caracteres.

a) Definir una estructura de datos estática que permita guardar la información leída. Calcular el tamaño
de memoria que requiere la estructura.

b) Dado que un compilador de Pascal típico no permite manejar estructuras de datos estáticas que
superen los 64 Kb, pensar en utilizar un vector de punteros a palabras, como se indica en la siguiente
estructura:
Type 
  Nombre = String[50];
  Puntero = ^Nombre;
  ArrPunteros = array[1..2500] of Puntero;
Var
  Punteros: ArrPunteros;

b.1) Indicar cuál es el tamaño de la variable Punteros al comenzar el programa.
b.2) Escribir un módulo que permita reservar memoria para los 2500 nombres. ¿Cuál es la cantidad de
memoria reservada después de ejecutar el módulo? ¿La misma corresponde a memoria estática o
dinámica?
b.3) Escribir un módulo para leer los nombres y almacenarlos en la estructura de la variable Punteros.}

{program eje07;
// Externo a CADP
Uses
  sysutils;
// Externo a CADP
type
  vector = array [1..2500] of string[50];

procedure cargarV (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to 2500 do
      v[x]:= Concat('Nombre-',IntToStr(random(32767)));
  end;

var
  v: vector;
begin
  Randomize; //No tener en cuenta, Externo a CADP
  cargarV(v);
  writeln(sizeof(v),' bytes.');
end.}

//RESPUESTA: UTILIZA 127500 BYTES

// ======================================================

program eje07;
// Externo a CADP
Uses
  sysutils;
// Externo a CADP
type
  Nombre = String[50];
  Puntero = ^Nombre;
  vector = array [1..2500] of Puntero;

procedure cargarV (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to 2500 do
      v[x]:= Concat('Nombre-',IntToStr(random(32767)));
  end;

var
  v: vector;
begin
  Randomize; //No tener en cuenta, Externo a CADP
  cargarV(v);
  writeln(sizeof(v),' bytes.');
end.