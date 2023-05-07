program alcance4a;
var a,b: integer;
procedure uno;
begin
a := 1;
writeln(a);
end;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.

// Respuesta: El programa imprimiria 1, 2, 1


program alcance4b;
procedure uno;
begin
a := 1;
writeln(a);
end;
var a,b: integer;
begin
a:= 1;
b:= 2;
uno;
writeln(b, a);
end.

//Respuesta: En el 4b la variable A esta creada en el programa pincipal, pero en el proceso no hay una variable local A,
//Lo cual daria error.