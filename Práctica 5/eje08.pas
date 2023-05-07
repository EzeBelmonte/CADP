//8) Analice el siguiente programa:

{1. program memoria;

2.  type
3.    datos = array [1..20] of integer;
4.    punt = ^datos;
5.
6.  procedure procesarDatos(v : datos; var v2 : datos);
7.    var
8.      i, j : integer;
9.    begin
10.     for i := 1 to 20 do
11.       v2[21 - i] := v[i];
12.   end;
13.
14. var
15.   vect : datos;
16.   pvect : punt;
17.   i : integer;
18. begin
19.   for i:= 1 to 20 do
20.     vect[i] := i;
21.   new(pvect);
22.   for i:= 20 downto 1 do
23.     pvect^[i] := 0;
24.   procesarDatos(pvect^, vect);
25.   writeln('fin');
26. end.

Responda: ¿cuánta memoria en total ocupa el programa al ejecutarse? Considere tanto variables estáticas
como dinámicas, parámetros y variables locales de los módulos.

a) Hasta la sentencia de la línea 18 //Rta: Creo que 0 ya que no se llamó a ningún proceso ni variable
b) Hasta la sentencia de la línea 20 //Rta: 42 Bytes
c) Hasta la sentencia de la línea 23 //Rta: 88 Bytes (sumando los 42 bytes anteriores).
d) Hasta la sentencia de la línea 11 //Rta: Si no se imvoca el proceso, se ocupa memoria? Si es asi 42
e) Hasta la sentencia de la línea 25 //Rta: 130 Bytes (sumando los 88 Bytes anteriores).
}

program memoria;
type
  datos = array [1..20] of integer;
  punt = ^datos;

procedure procesarDatos(v : datos; var v2 : datos);
  var
    i, j : integer;
  begin
    for i := 1 to 20 do
      v2[21 - i] := v[i];
    writeln('=================================');
    writeln('Linea 25 Vector: ',sizeof(v2),' bytes.');
    writeln('Linea 25 i: ',sizeof(i),' bytes.');
    writeln('=================================');
  end;

var
  vect : datos;
  pvect : punt;
  i : integer;
begin
  for i:= 1 to 20 do
    vect[i] := i;
  writeln('=================================');
  writeln('Linea 20 Vector: ',sizeof(vect),' bytes.');
  writeln('Linea 20 i: ',sizeof(i),' bytes.');
  writeln('=================================');
  new(pvect);
  for i:= 20 downto 1 do
    pvect^[i] := 0;
  writeln('=================================');
  writeln('Linea 23 Vector: ',sizeof(pvect),' bytes.');
  writeln('Linea 23 i: ',sizeof(i),' bytes.');
  writeln('=================================');
  procesarDatos(pvect^, vect);
  writeln('fin');
end.