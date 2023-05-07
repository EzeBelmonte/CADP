{3. Dado el siguiente programa, indicar cuál es el error y su causa.}

program alcance3;
var a: integer;

procedure uno;
  var b: integer;
  begin
    b:= 2;
    writeln(b);
  end;
begin
  a:= 1;
  uno;
  writeln(a, b);
end.

//Respuesta: La variable B solo esta inicializada en el proceso, entonces en el programa principal cuando quiere imprimira
// da error ya que no hay ninguna variable B creada.