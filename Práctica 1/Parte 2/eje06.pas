{Realizar un programa que lea información de 200 productos de un supermercado. De cada producto
se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
- Los códigos de los dos productos más baratos.
- La cantidad de productos de más de 16 pesos con código par.}

program eje06;

var
  x, cod, cod1, cod2, cant: integer;
  min1, min2, precio: real;

begin
  cant:= 0;
  min1:= 32767;
  min2:= 32767; // No es necesario inicializar esta variable

  for x:=1 to 200 do
    begin
      write ('Cod: '); readln (cod);
      write ('Precio: '); readln (precio);

      if (precio < min1) then
        begin
          min2:= min1;
          cod2:= cod1;
          min1:= precio;
          cod1:= cod;
        end
      else
        if (precio < min2) then
          begin
            min2:= precio;
            cod2:= cod;
          end;

      if (precio > 16) and (cod mod 2 = 0) then
        cant:= cant + 1;
    end;

  writeln ('Los productos mas baratos fueron el ',cod1,' y el ',cod2);
  writeln ('La cantidad productos con precio mayor a 16 y codigo par son ',cant);

end.