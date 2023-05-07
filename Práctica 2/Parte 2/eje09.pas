{9. Realizar un programa modularizado que lea información de alumnos de una facultad. Para cada alumno se
lee: número de inscripción, apellido y nombre. La lectura finaliza cuando se ingresa el alumno con número de
inscripción 1200, que debe procesarse. Se pide calcular e informar:
● Apellido de los dos alumnos con número de inscripción más chico.
● Nombre de los dos alumnos con número de inscripción más grande.
● Porcentaje de alumnos con nro de inscripción par.}

program eje09;

procedure imprimir (apeMin1,apeMin2,nomMax1,nomMax2: string; porcentaje: real);
  begin
    writeln ('Los 2 alumnos con numero de inscripcion mas BAJA fueron: ',apeMin1,' y ',apeMin2);
    writeln ('Los 2 alumnos con numero de inscripcion mas ALTA fueron: ',nomMax1,' y ',nomMax2);
    writeln ('El porcentaje de alumnos con numero de inscripcion es del ',porcentaje:2:2,'%.');
  end;

procedure facultad(var inscripcion: integer; var apellido, nombre: string);
begin
  write ('Numero inscripcion: '); readln(inscripcion);
  write ('Apellido: '); readln(apellido);
  write ('Nombre: '); readln(nombre);
end;

procedure procesar;
var
  inscripcion, min1,min2, max1,max2, cantAlumnos: integer;
  nombre, apellido, apeMin1, apeMin2, nomMax1, nomMax2: string[20];
  porcentaje: real;
begin
  min1:= 32767;
  min2:= min1;
  max1:= 0;
  max2:= max1;
  porcentaje:= 0;
  cantAlumnos:= 0;
  repeat
    cantAlumnos:= cantAlumnos + 1;

    facultad(inscripcion,apellido,nombre);
    
    //Guardar apellido de los 2 alumnos con num de inscripcion mas BAJA
    if (inscripcion < min1) then
      begin
        min2:= min1;
        apeMin2:= apeMin1;
        min1:= inscripcion;
        apeMin1:= apellido;
      end
    else
      if (inscripcion < min2) then
        begin
          min2:= inscripcion;
          apeMin2:= apellido;
        end;
    //Guardar nombre de los 2 alumnos con num de inscripcion mas ALTA
    if (inscripcion > max1) then
      begin
        max2:= max1;
        nomMax2:= nomMax1;
        max1:= inscripcion;
        nomMax1:= nombre;
      end
    else
      if (inscripcion > max2) then
        begin
          max2:= inscripcion;
          nomMax2:= nombre;
        end;
      
    if (inscripcion mod 2 = 0) then
      porcentaje:= porcentaje + 1;
  until (inscripcion = 1200);

  porcentaje:= (porcentaje * 100) / cantAlumnos;
  
  imprimir (apeMin1,apeMin2,nomMax1,nomMax2,porcentaje);
end;

//Programa principal
begin
  procesar;
end.