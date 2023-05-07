{2. Dado el siguiente programa, indicar qué imprime.}
program alcance2;
var a,b: integer;
procedure uno;
begin
b := 3;
writeln(b);
end;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.

//Respuesta: 3, 3, 1