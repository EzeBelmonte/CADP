{Realizar un programa que lea el código, el precio actual y el nuevo precio de los productos de un
almacén. La lectura finaliza al ingresar el producto con el código 32767, el cual debe procesarse.
Para cada producto leído, el programa deberá indicar si el nuevo precio del producto supera en un
10% al precio anterior.
Por ejemplo:
○ Si se ingresa el código 10382, con precio actual 40, y nuevo precio 44, deberá imprimir: “el
aumento de precio del producto 10382 no supera el 10%”
○ Si se ingresa el código 32767, con precio actual 30 y nuevo precio 33,01, deberá imprimir: “el
aumento de precio del producto 32767 es superior al 10%”}

program eje07;

var
  cod: integer;
  precioAc, precioN: real;

begin
  cod:= 0;
  while (cod <> 32767) do
    begin
      write ('Codigo: '); readln (cod);
      write ('Precio Actual: '); readln (precioAc);
      write ('Nuevo precio: '); readln (precioN);
      if ((((precioAc * 10) / 100) + precioAc) < precioN) then
        writeln ('el aumento de precio del producto ',cod,' es suprerior al 10%')
      else
        writeln ('el aumento de precio del producto ',cod,' no supera el 10%');
    end;
end.