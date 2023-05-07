{Realizar un programa que lea desde teclado información de autos de carrera. Para cada uno de los
autos se lee el nombre del piloto y el tiempo total que le tomó finalizar la carrera. En la carrera
participaron 100 autos. Informar en pantalla:
- Los nombres de los dos pilotos que finalizaron en los dos primeros puestos.
- Los nombres de los dos pilotos que finalizaron en los dos últimos puestos.}

program eje07;

const
  fin = 100;

var
  tiempo, minT1, minT2, maxT1, maxT2: real;
  nombre, minP1, minP2, maxP1, maxP2: string;
  x: integer;

begin
  minT1:= 30000;
  minT2:= 30000;
  maxT1:= 0;
  maxT2:= 0;

  for x:=1 to fin do
    begin
      write ('Nombre: '); readln (nombre);
      write ('Tiempo: '); readln (tiempo);

      if (minT1 > tiempo) then
        begin
          minT2:= minT1;
          minP2:= minP1;
          minT1:= tiempo;
          minP1:= nombre;
        end
      else
        if (minT2 > tiempo) then
          begin
            minT2:= tiempo;
            minP2:= nombre;
          end;

      if (maxT1 < tiempo) then
        begin
          maxT2:= maxT1;
          maxP2:= maxP1;
          maxT1:= tiempo;
          maxP1:= nombre;
        end
      else
        if (maxT2 < tiempo) then
          begin
            maxT2:= tiempo;
            maxP2:= nombre;
          end;

    end;

  writeln ('Los 2 pilotos que terminaron en los 2 primeros puestos fue ',maxP1,' y ',maxP2);
  writeln ('Los 2 pilotos que terminaron en los 2 ultimos puestos fue ',minP1,' y ',minP2);

end.