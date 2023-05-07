{6. a. Realice un módulo que lea de teclado números enteros hasta que llegue un valor negativo. Al finalizar la
lectura el módulo debe imprimir en pantalla cuál fue el número par más alto.
b. Implemente un programa que invoque al módulo del inciso a.}

program eje06;

procedure masAlto;
var
  num,max: integer;
begin
  max:= 0;
  write('Numero: '); readln(num);
  while (num >= 0) do
    begin
      if (num mod 2 = 0) then
        if (max < num) then
          max:= num;
      write('Numero: '); readln(num);
    end;
  writeln('El valor mas grande fue el ',max);
end;

begin
  masAlto;
end.