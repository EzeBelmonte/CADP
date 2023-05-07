{8. La Comisión Provincial por la Memoria desea analizar la información de los proyectos presentados en el programa
Jóvenes y Memoria durante la convocatoria 2020. Cada proyecto posee un código único, un título, el docente
coordinador (DNI, nombre y apellido, email), la cantidad de alumnos que participan del proyecto, el nombre de la
escuela y la localidad a la que pertenecen. Cada escuela puede presentar más de un proyecto. La información se
ingresa ordenada consecutivamente por localidad y, para cada localidad, por escuela. Realizar un programa que
lea la información de los proyectos hasta que se ingrese el proyecto con código -1 (que no debe procesarse), e
informe:
● Cantidad total de escuelas que participan en la convocatoria 2020 y cantidad de escuelas por cada localidad.
● Nombres de las dos escuelas con mayor cantidad de alumnos participantes.
● Título de los proyectos de la localidad de Daireaux cuyo código posee igual cantidad de dígitos pares e impares.}

program eje08;

type
  str30 = string[30];
  REG_docente = record
    dni: integer;
    nombre,apellido,email: str30;
  end;

  REG_comision = record
    cod,cantAlumnos: integer;
    titulo,escuela,localidad: str30;
    docente: REG_docente;
  end;

function analizarCod (cod: integer): integer;
  var
    par,impar: integer;
  begin
    par:= 0;
    impar:= 0;
    while (cod <> 0) do
      begin
        if (((cod mod 10) mod 2) = 0) then
          par:= par + 1
        else
          impar:= impar + 1;
        cod:= cod div 10;
      end;
      analizarCod:= par - impar;
  end;

procedure leer(var r: REG_comision);
  begin
    write ('Codigo: '); readln(r.cod);
    if (r.cod <> -1) then
      begin
        write ('Titulo: '); readln(r.titulo);
        write ('DNI docente: '); readln(r.docente.dni);
        write ('Nombre docente: '); readln(r.docente.nombre);
        write ('Apellido docente: '); readln(r.docente.apellido);
        write ('Email doncente: '); readln(r.docente.email);
        write ('Cant. alumnos que participaron: '); readln(r.cantAlumnos);
        write ('Escuela: '); readln(r.escuela);
        write ('Localidad: '); readln(r.localidad);
      end;
  end;

procedure inciso;
  var
    r: REG_comision;
    auxLocalidad,escMax1,escMax2: str30;
    escTotales,escLocalidad,cantAlum1,cantAlum2: integer;
  begin
    leer(r);
    escTotales:= 0;
    cantAlum1:= 0;
    cantAlum2:= 0;
    while (r.cod <> - 1) do
      begin
        escLocalidad:= 0;
        auxLocalidad:= r.localidad;
        while (auxLocalidad = r.localidad) and (r.cod <> - 1) do
          begin
            escTotales:= escTotales + 1;
            escLocalidad:= escLocalidad + 1;

            //PUNTO 2
            if (cantAlum1 < r.cantAlumnos) then
              begin
                cantAlum2:= cantAlum1;
                escMax2:= escMax1;
                cantAlum1:= r.cantAlumnos;
                escMax1:= r.escuela;
              end
            else
              if (cantAlum2 < r.cantAlumnos) then
                begin
                  cantAlum2:= r.cantAlumnos;
                  escMax2:= r.escuela;
                end;
            
            //PUNTO 3
            if (r.localidad = 'Daireaux') then
              if (analizarCod(r.cod) = 0) then
                writeln ('Titulo del proyecto: ',r.titulo);

            leer(r);
          end;
        //PUNTO 1
        writeln ('En la localidad de ',auxLocalidad,' participaron: ',escLocalidad);
      end;
    //PUNTO 1
    writeln ('La cantidad total de escuelas que participaron en la convocatoria 2020 fueron: ',escTotales);

    //PUNTO 2
    writeln ('Las dos escuelas con mayor cantidad de alumnos participantes fueron: ',escMax1,' y ',escMax2);
  end;

//Programa principal
begin
  inciso;
end.