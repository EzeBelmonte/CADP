{Modifique el ejercicio anterior para que, luego de leer el número X, se lean a lo sumo 10 números
reales. La lectura deberá finalizar al ingresar un valor que sea el doble de X, o al leer el décimo
número, en cuyo caso deberá informarse “No se ha ingresado el doble de X”.}

program eje04;
const
  contador = 10;
var
  num, condicion: real;
  cont: integer;

begin
  cont:= 0;
  write ('Num: '); readln (num);
  condicion:= num * 2;
  while (num <> condicion) and (cont < contador) do
    begin
      write ('Ingresar valor: '); readln (num);
      cont:= cont + 1
    end;

  if (cont = contador) and (num <> condicion) then
    writeln ('No se ha ingresado el doble de X')
  
end.