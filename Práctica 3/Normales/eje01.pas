{1. Dado el siguiente programa:

program Registros;
type
  str20 = string[20];

  alumno = record
    codigo : integer;
    nombre : str20;
    promedio : real;
  end;

procedure leer(var alu : alumno; var nom:str20; var mejorProm: real);
  begin
    writeln(‘Ingrese el código del alumno’);
    read(alu.codigo);
    if (alu.codigo <> 0) then 
      begin
        writeln(‘Ingrese el nombre del alumno’); read(alu.nombre);
        writeln(‘Ingrese el promedio del alumno’); read(alu.promedio);
        if (mejorProm < alu.promedio) then
          begin
            mejorProm:= alu.promedio;
            nom:= alu.nombre;
          end;
      end;
  end;

// declaración de variables del programa principal
var
a : alumno;
nom: str20;
mejorProm: real;
// cuerpo del programa principal
begin
  mejorProm:= 0;
  leer(a,nom,mejorProm);
  while (a.codigo <> 0) do
    leer(a,nom,mejorProm);
  
  writeln ('El alumno con mejor promedio fue: ',nom);
end.

a. Completar el programa principal para que lea información de alumnos (código, nombre, promedio) e informe
la cantidad de alumnos leídos. La lectura finaliza cuando ingresa un alumno con código 0, que no debe
procesarse. Nota: utilizar el módulo leer.

b. Modificar al programa anterior para que, al finalizar la lectura de todos los alumnos, se informe también el
nombre del alumno con mejor promedio.}