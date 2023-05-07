{11. Realizar un programa modularizado que lea una secuencia de caracteres y verifique si cumple con el patrón
A%B*, donde:
- A es una secuencia de caracteres en la que no existe el carácter ‘$’.
- B es una secuencia con la misma cantidad de caracteres que aparecen en A y en la que aparece a lo sumo
3 veces el carácter ‘@’.
- Los caracteres % y * seguro existen
Nota: en caso de no cumplir, informar que parte del patrón no se cumplió.}

program eje11;

procedure procesar (secuencia: char);
var
  contador, cantAr: integer;
begin
  contador:= 0;
  cantAr:= 0;
  while (secuencia <> '$') and (secuencia <> '%') do
    begin
      contador:= contador + 1;
      read(secuencia);
    end;
  if (secuencia = '$') then
    write ('No cumplio en la parte A del patron.')
  else
    begin
      read(secuencia);
      while (secuencia <> '*') do
        begin
          if (secuencia = '@') then
            cantAr:= cantAr + 1;
          contador:= contador - 1;
          read(secuencia);
        end;
  
      if (cantAr < 3 ) or (contador <> 0) then
        write ('No cumplio en la parte B del patron.');
    
    end;
end;

procedure leer;
var
  secuencia: char;
begin
  write ('Secuencia: '); read(secuencia);
  procesar(secuencia);
end;

//Programa principal
begin
  leer;
end.