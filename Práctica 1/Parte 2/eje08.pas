{Un local de ropa desea analizar las ventas realizadas en el último mes. Para ello se lee por cada día
del mes, los montos de las ventas realizadas. La lectura de montos para cada día finaliza cuando se
lee el monto 0. Se asume un mes de 31 días. Informar la cantidad de ventas por cada día, y el monto
total acumulado en ventas de todo el mes.
a. Modifique el ejercicio anterior para que además informe el día en el que se realizó la mayor
cantidad de ventas.}

program eje08;

var
  monto, totalD, totalM, diaMax: real;
  x, y, dia: integer;

begin
  for x:= 1 to 12 do
    begin
      totalM:= 0;
      diaMax:= 0;
      for y:=1 to 31 do
        begin
          totalD:= 0;
          write ('Monto: '); readln (monto);
          while (monto <> 0) do
            begin
              totalD:= totalD + monto;
              write ('Monto: '); readln (monto);
            end;
            
          if (diaMax < totalD) then
            begin
              diaMax:= totalD;
              dia:= y;
            end;

          writeln ('El total del monto del dia fue: ',totalD:10:2,'%.');
          totalM:= totalM + totalD;
        end;
      writeln ('El dia que mas se recaudo fue: ',dia,'.');
      writeln ('El total del monto del mes fue: ',totalM:10:2,'%.');
    end;
end.