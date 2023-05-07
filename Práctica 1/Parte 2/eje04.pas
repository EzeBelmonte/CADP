{Realizar un programa que lea 1000 números enteros desde teclado. Informar en pantalla cuáles son
los dos números mínimos leídos.
a. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual debe procesarse.
b. Modifique el ejercicio anterior para que, en vez de leer 1000 números, la lectura finalice al leer
el número 0, el cual no debe procesarse}


program eje04;

const
  fin = 1000;

var
  x, num, min1, min2: integer;

begin
  min1:= 32767;
  min2:= min1;
  for x:=1 to fin do
    begin
      write ('Num: '); readln (num);
      if (num < min1) then
        begin
          min2:= min1;
          min1:= num;
        end
      else
        if (num < min2) then
          min2:= num;
    end;
  
  writeln ('Los 2 numeros mas chicos fueron el ',min1,' y el ',min2);
end.

// ===================================================================================

program eje04;

var
  num, min1, min2: integer;

begin
  min1:= 32767;
  min2:= 32767;

  repeat
    write ('Num: '); readln (num);
    if (num < min1) then
      begin
        min2:= min1;
        min1:= num;
      end
    else
      if (num < min2) then
        min2:= num;
  until num = 0;
  writeln ('Los 2 numeros mas chicos fueron el ',min1,' y el ',min2);

end.

// ===================================================================================

program eje04;

var
  num, min1, min2: integer;

begin
  min1:= 32767;
  min2:= 32767;

  write ('Num: '); readln (num);
  while (num <> 0) do
    begin
      if (num < min1) then
        begin
          min2:= min1;
          min1:= num;
        end
      else
        if (num < min2) then
          min2:= num;

      write ('Num: '); readln (num);
    end;
  writeln ('Los 2 numeros mas chicos fueron el ',min1,' y el ',min2);

end.