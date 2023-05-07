{Realizar un programa que lea tres caracteres, e informe si los tres eran letras vocales o si al menos
uno de ellos no lo era. Por ejemplo, si se leen los caracteres “a e o” deberá informar “Los tres son
vocales”, y si se leen los caracteres “z a g” deberá informar “al menos un carácter no era vocal”.}

program eje08;

var
  carac: char;
  x,contador: integer;
begin
  contador:= 0;
  for x:=1 to 3 do
    begin
      write ('caracter: '); readln (carac);
      if (carac = 'a') or (carac = 'e') or (carac = 'i') or (carac = 'o') or (carac = 'u') or 
         (carac = 'A') or (carac = 'E') or (carac = 'I') or (carac = 'O') or (carac = 'U') then
        contador:= contador + 1;
    end;
  
  if (contador = 3) then
    writeln ('Las 3 eran vocales.')
  else
    writeln ('Al menos un caracter no era vocal.');
end.