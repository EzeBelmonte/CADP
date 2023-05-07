{2) Indicar los valores que imprime el siguiente programa en Pascal. Justificar mediante prueba de
escritorio.}

program punteros;

type
  cadena = string[9];

  producto = record
    codigo: integer;
    descripcion: cadena;
    precio: real; // Vale 8, no 4 como dice en el PDF
  end;

  //puntero_producto = ^producto;

var
  //p: puntero_producto;
  prod: producto;
begin
  writeln(sizeof(p), ' bytes'); // 4
  writeln(sizeof(prod), ' bytes'); // 24
  new(p);
  writeln(sizeof(p), ' bytes'); // 4
  p^.codigo := 1;
  p^.descripcion := 'nuevo producto';
  writeln(sizeof(p^), ' bytes'); // 24
  p^.precio := 200;
  writeln(sizeof(p^), ' bytes'); // 24
  prod.codigo := 2;
  prod.descripcion := 'otro nuevo producto';
  writeln(sizeof(prod), ' bytes'); // 24
end.

//Nota: aca imprime los valores 4 24 4 24 24 24, haciendo la cuenta deberia darme 4 20 4 20 20 20.
// Y si el REAL vale 4 como dice el PDF, deberia imprimir 4 16 4 16 16 16.