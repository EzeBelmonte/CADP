{6. Realizar un programa modularizado que lea datos de 100 productos de una tienda de ropa. Para cada
producto debe leer el precio, código y tipo (pantalón, remera, camisa, medias, campera, etc.). Informar:
● Código de los dos productos más baratos.
● Código del producto de tipo “pantalón” más caro.
● Precio promedio.}

program eje06;

procedure imprimir (baratoC1,baratoC2,codPantalon: integer; promedio:real);
  begin
    writeln ('Los codigos de los 2 productos mas baratos son el ',baratoC1,' y ',baratoC2,'.');
    writeln ('El pantalon mas caro vale ',codPantalon,'.');
    writeln ('El precio promedio es ',promedio:2:2,'$.');
  end;

procedure leer (var precio: real; var cod: integer; var tipo: string);
  begin
    write ('Precio: '); readln(precio);
    write ('Codigo: '); readln(cod);
    write ('Tipo: '); readln(tipo);
  end;

procedure baratos (precio: real; var baratoP1, baratoP2: real; cod: integer;  var baratoC1,baratoC2: integer);
  begin
    if (baratoP1 > precio) then
        begin
          baratoP2:= baratoP1;
          baratoC2:= baratoC1;
          baratoP1:= precio;
          baratoC1:= cod;
        end
      else
        if (baratoP2 > precio) then
          begin
            baratoP2:= precio;
            baratoC2:= cod;
          end;
  end;

procedure inciso;
var
  precio, baratoP1, baratoP2, pantalonC, promedio: real;
  x,cod, baratoC1, baratoC2, codPantalon: integer;
  tipo: string[20];
begin
  baratoP1:= 32767;
  baratoP2:= baratoP1;
  pantalonC:= 0;
  promedio:= 0;

  for x:=1 to 100 do
    begin
      
      leer(precio,cod,tipo);
      promedio:= promedio + precio;
      baratos(precio,baratoP1,baratoP2,cod,baratoC1,baratoC2);
      
      if (tipo = 'pantalon') and (pantalonC < precio) then
        begin
          pantalonC:= precio;
          codPantalon:= cod;
        end;
    end;
  
  promedio:= promedio / 100;
  imprimir(baratoC1,baratoC2,codPantalon,promedio);
end;

//Programa principal
begin
  inciso;
end.