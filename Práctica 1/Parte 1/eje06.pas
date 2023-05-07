{Realizar un programa que lea el número de legajo y el promedio de cada alumno de la facultad. La
lectura finaliza cuando se ingresa el legajo -1, que no debe procesarse.
Por ejemplo, se lee la siguiente secuencia:
33423
8.40
19003
6.43
-1
En el ejemplo anterior, se leyó el legajo 33422, cuyo promedio fue 8.40, luego se leyó el legajo
19003, cuyo promedio fue 6.43, y finalmente el legajo -1 (para el cual no es necesario leer un
promedio).
Al finalizar la lectura, informar:
a. La cantidad de alumnos leída (en el ejemplo anterior, se debería informar 2).
b. La cantidad de alumnos cuyo promedio supera 6.5 (en el ejemplo anterior, se debería informar
1).
c. El porcentaje de alumnos destacados (alumnos con promedio mayor a 8.5) cuyo legajo sean
menor al valor 2500 (en el ejemplo anterior se debería informar 0%).}

program eje06;

var
  legajo, cantAlumnos, cantAlumnosProm: integer;
  promedio, promDestacados: real;

begin
  cantAlumnos:= 0;
  cantAlumnosProm:= 0;
  promDestacados:= 0;

  write ('Legajo: '); readln (legajo);

  while (legajo <> -1) do 
    begin
      write ('Promedio: '); readln (promedio);
      cantAlumnos:= cantAlumnos + 1;

      if (promedio > 6.5) then
        cantAlumnosProm:=  cantAlumnosProm + 1;

      if (promedio > 8.5) and (legajo <= 2500) then
        promDestacados:= promDestacados + 1;

      write ('Legajo: '); readln (legajo);
    end;
  
  promDestacados:= promDestacados * 100 / cantAlumnos;

  writeln ('La cantidad de alumnos leidos fue de: ',cantAlumnos);
  writeln ('La cantidad de alumnos con promedio mayor a 6.5 es de: ',cantAlumnosProm);
  writeln ('El porcentaje de alumnos destacados es del: ',promDestacados:2:2,'%');

end.