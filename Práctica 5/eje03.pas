{3) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.}

program punteros;

type
  numeros = array[1..10000] of integer;
  puntero_numeros = ^numeros;

var 
  n: puntero_numeros;
  num: numeros;
  i:integer;
begin
  writeln(sizeof(n), ' bytes'); // 4
  writeln(sizeof(num), ' bytes'); // 20000
  new(n);
  writeln(sizeof(n^), ' bytes'); // 20000
  for i:= 1 to 5000 do
    n^[i]:= i;
  writeln(sizeof(n^), ' bytes'); // 20000
end.