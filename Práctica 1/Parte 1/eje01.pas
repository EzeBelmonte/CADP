{Realizar un programa que lea 2 números enteros desde teclado e informe en pantalla cuál de los
dos números es el mayor. Si son iguales debe informar en pantalla lo siguiente: “Los números leídos
son iguales”.}

program eje01;

var
  num1, num2: integer;

begin
  write ('Num 1: '); readln(num1);
  write ('Num 2: '); readln(num2);

  if (num1 = num2) then
    writeln ('Los numeros leidos son iguales')
  else
    if (num1 > num2) then
      writeln ('El numero mas grande es ',num1)
    else
      writeln ('El numero mas grande es ',num2);
end.