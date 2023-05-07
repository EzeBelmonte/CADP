{3. Realizar un programa modularizado que lea información de 200 productos de un supermercado. De cada
producto se lee código y precio (cada código es un número entre 1 y 200). Informar en pantalla:
● Los códigos de los dos productos más baratos.
● La cantidad de productos de más de 16 pesos con código par.}

program eje03;

procedure cargar (var cod: integer; var precio: real);
  begin
    {Seria mas sencillo si el codigo se asigna automaticamente con el valor de X, pero como dice que se lee,
    se entiende que hay que ingresarlo desde el teclado.}
    write ('Codigo: '); readln(cod);
    write ('Precio: '); readln(precio);
  end;
procedure procesar;
  var
    x, cod, min1, min2, cant16: integer;
    precio, minP1, minP2: real;
  begin
    minP1:= 32767;
    minP2:= minP1;
    cant16:= 0;
    for x:=1 to 200 do
      begin
        cargar(cod,precio);
        if (precio < minP1) then
          begin
            minP2:= minP1;
            min2:= min1;
            minP1:= precio;
            min1:= cod;
          end
        else
          if (precio < minP2) then
            begin
              minP2:= precio;
              min2:= cod;
            end;
        if (precio > 16) and (cod mod 2 = 0) then
          cant16:= cant16 + 1;
      end;

    writeln ('Los 2 codigos de los productos mas baratos son: ',min1, ' y ',min2);
    writeln ('La cantidad de productos con precio mayor a 16 con codigo par es: ',cant16);
  end;

begin
  procesar;
end.