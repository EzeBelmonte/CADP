{Realizar un programa que lea un carácter, que puede ser “+” (suma) o “-” (resta); si se ingresa otro
carácter, debe informar un error y finalizar. Una vez leído el carácter de suma o resta, deberá leerse
una secuencia de números enteros que finaliza con 0. El programa deberá aplicar la operación leída
con la secuencia de números, e imprimir el resultado final.
Por ejemplo:
○ Si se lee el carácter “-” y la secuencia 4 3 5 -6 0 , deberá imprimir: 2 (4 – 3 – 5 - (-6) )
○ Si se lee el carácter “+” y la secuencia -10 5 6 -1 0, deberá imprimir 0 ( -10 + 5 + 6 + (-1) )}

{program eje09;

var
  carac: char;
  num, total: integer;

begin
  write ('Ingresar caracter "+" o "-" para realizar cuenta: '); readln (carac);

  if (carac = '+') or (carac = '-') then 
    begin
      write ('Ingresar num: '); readln (num);
      total:= num;
      if (carac = '-') then
        while (num <> 0) do
          begin
            write ('Ingresar num: '); readln (num);
            total:= total - num;
          end
      else
        while (num <> 0) do
          begin
            write ('Ingresar num: '); readln (num);
            total:= num + total;
          end;
      writeln ('El resultado es: ',total);
    end
  else
    writeln ('Error al ingresar el caracter.');
end.}

//===================================================== 
{program eje09;

var
  carac: char;
  num, total: integer;

begin
  write ('Ingresar caracter "+" o "-" para realizar cuenta: '); readln (carac);

  if (carac <> '+') and (carac <> '-') then
    writeln ('Error al ingresar el caracter.')
  else
    begin
      write ('Ingresar num: '); readln (num);
      total:= num;
      repeat
        write ('Ingresar num: '); readln (num);
        if (carac = '+') then 
          total:= total + num
        else
          total:= total - num;
      until num = 0;
      writeln ('El resultado es: ',total);
    end;
end.}

//===================================================== 
program eje09;

var
  carac: char;
  num, total: integer;

begin
  write ('Ingresar caracter "+" o "-" para realizar cuenta: '); readln (carac);

  if (carac <> '+') and (carac <> '-') then
    writeln ('Error al ingresar el caracter.')
  else
    begin
      write ('Ingresar num: '); readln (num);
      total:= num;
      while (num <> 0) do
        begin
          write ('Ingresar num: '); readln (num);
          if (carac = '+') then 
            total:= total + num
          else
            total:= total - num;
        end;
      writeln ('El resultado es: ',total);
    end;
end.