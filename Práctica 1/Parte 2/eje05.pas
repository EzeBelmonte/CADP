{Realizar un programa que lea números enteros desde teclado. La lectura debe finalizar cuando se
ingrese el número 100, el cual debe procesarse. Informar en pantalla:
◦ El número máximo leído.
◦ El número mínimo leído.
◦ La suma total de los números leídos.}

program eje05;

var
  num, min, max, total: integer;

begin
  min:= 32767;
  max:= 0;
  total:= 0;

  repeat
    write ('Num: '); readln (num);
    if (min > num) then
      min:= num;
    if (max < num) then
      max:= num;
    total:= total + num;
  until num = 100;

  writeln ('El minimo num leido fue el ',min);
  writeln ('El maximo num leido fue el ',max);
  writeln ('La suma de los numeros leidos es ',total);

end.