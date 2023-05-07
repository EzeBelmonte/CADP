{8. Realizar un programa modularizado que lea secuencia de números enteros. La lectura finaliza cuando llega el
número 123456, el cual no debe procesarse. Informar en pantalla para cada número la suma de sus dígitos
pares y la cantidad de dígitos impares que posee.}

program eje08;

procedure descomponer (num: integer; var sumaPares, cantImpares: integer);
var
  aux: integer;
begin
  while (num > 0) do
    begin
      aux:= num mod 10;
      if (aux mod 2 = 0) then
        sumaPares:= sumaPares + aux
      else
        cantImpares:= cantImpares + 1;
      num:= num div 10;
    end;
end;

procedure leer;
var
  num, sumaPares, cantImpares: integer;
begin
  write ('Numero: '); readln(num);
  while (num <> 12345) do //Un integer llega hasta el valor 32767 asi que le saque el 6 a la condicion de corte
    begin
      sumaPares:= 0;
      cantImpares:= 0;
      descomponer(num,sumaPares,cantImpares);
      writeln ('La suma de pares es ',sumaPares);
      writeln ('Cantidad de impares es ',cantImpares);
      writeln();
      write ('Numero: '); readln(num);
    end;
end;

//Programa principal
begin
  leer;
end.