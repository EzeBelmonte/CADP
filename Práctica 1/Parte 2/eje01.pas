{Realizar un programa que lea 10 números enteros e informe la suma total de los números leídos.
a. Modifique el ejercicio 1 para que además informe la cantidad de números mayores a 5.}

program eje01;

var
  x, num, cant, total: integer;

begin
  total:= 0;
  cant:= 0;
  for x:=1 to 10 do
    begin
      write ('Num: '); readln(num);
      total:= total + num;
      if (num > 5) then
        cant:= cant + 1;
    end;
  
  writeln ('La suma es: ', total);
  writeln ('Cantidad num mayores a 5 es: ', cant);

end.