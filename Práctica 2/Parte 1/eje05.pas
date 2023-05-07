{5. Dado el siguiente programa, indicar cuál es el error.}
program alcance4;
function cuatro: integer;
  begin
    cuatro:= 4;
  end;
var a: integer;
begin
  cuatro;
  writeln(a);
end.

//Respuesta: Cuando se llama a la funcion, esta devuelve un valor y ese valor debe ser guardado en la variable A
//Para que se imprima de forma correcta.