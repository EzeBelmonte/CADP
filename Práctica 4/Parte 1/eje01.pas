//1. Dado el siguiente programa:
program sumador;

Type
  vnums = array [1..10] of integer;

var
  numeros : vnums;
  i : integer;
begin
  for i:=1 to 10 do {primer bloque for}
    numeros[i] := i;

  for i := 2 to 10 do {segundo bloque for}
    numeros[i] := numeros[i] + numeros [i-1];
  for i:= 1 to 10 do
    writeln(numeros[i]);
end.

{
a) ¿Qué valores toma la variable numeros al finalizar el primer bloque for? //Respuesta: 1,2,3,4,5,6,7,8,9,10

b) Al terminar el programa, ¿con qué valores finaliza la variable números? //Respuesta: 1,3,6,10,15,21,28,36,45,55

c) Si se desea cambiar la línea 11 por la sentencia: for i:=1 to 9 do ¿Cómo debe modificarse el
código para que la variable números contenga los mismos valores que en 1.b)? //Respuesta: numeros[i+1] := numeros[i] + numeros [i+1];

d) ¿Qué valores están contenidos en la variable numeros si la líneas 11 y 12 se reemplazan por:
for i:=1 to 9 do numeros[i+1] := numeros[i]; //Respuesta: 1,1,1,1,1,1,1,1,1,1}