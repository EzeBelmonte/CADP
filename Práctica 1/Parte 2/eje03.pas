{Realizar un programa que lea desde teclado la información de alumnos ingresantes a la carrera
Analista en TIC. De cada alumno se lee nombre y nota obtenida en el módulo EPA (la nota es un
número entre 1 y 10). La lectura finaliza cuando se lee el nombre “Zidane Zinedine“, que debe
procesarse. Al finalizar la lectura informar:
- La cantidad de alumnos aprobados (nota 8 o mayor) y
- la cantidad de alumnos que obtuvieron un 7 como nota.}

program eje03;

var
  nom: string;
  nota, nota7, notaMayor: integer;

begin
  nota7:= 0;
  notaMayor:= 0;

  repeat
    write ('Nombre: '); readln (nom);
    write ('Nota: '); readln (nota);
    if (nota >= 8) then
      notaMayor:=  notaMayor + 1
    else
      if (nota = 7) then
        nota7:= nota7 + 1;
  until nom = 'Zidane Zinedine';

  writeln ('Los alumnos con nota 8 o sup. fueron: ',notaMayor);
  writeln ('Los alumnos con nota igual a 7 fueron: ',nota7);
end.