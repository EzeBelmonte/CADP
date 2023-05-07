{10. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A$B#, donde:
- A es una secuencia de sólo letras vocales
- B es una secuencia de sólo caracteres alfabéticos sin letras vocales
- los caracteres $ y # seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program eje10;

procedure procesar(s: char);
var
  cumple: boolean;
begin
  cumple:= true;
  while (cumple) and (s <> '#') do
    begin
      while (s <> '$') and ((s = 'a') or (s = 'e') or (s = 'i') or (s = 'o') or (s = 'u') or (s = 'A') or (s = 'E') or (s = 'I') or (s = 'O') or (s = 'U')) do
        read(s);
      if (s <> '$') and (cumple) then
        begin
          cumple:= false;
          writeln ('No cumplio en la parte de las minusculas');
        end;
      while (s <> '#') and (cumple) and ((s <> 'a') and (s <> 'e') and (s <> 'i') and (s <> 'o') and (s <> 'u') and (s <> 'A') and (s <> 'E') and (s <> 'I') and (s <> 'O') and (s <> 'U')) do
        read(s);
      if (s <> '#') and (cumple) then
        begin
          cumple:= false;
          writeln ('No cumplio en la parte de las mayusculas');
        end;
    end;
end;

procedure leer;
var
  s: char;
begin
  write ('Secuencia de caracteres: '); read(s);
  //writeln('====================');
  procesar(s);
end;

//Programa principal
begin
  leer;
end.