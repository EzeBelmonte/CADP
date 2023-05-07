{3. El Ministerio de Educación desea realizar un relevamiento de las 2400 escuelas primarias de la provincia de Bs. As,
con el objetivo de evaluar si se cumple la proporción de alumnos por docente calculada por la UNESCO para el año
2015 (1 docente cada 23,435 alumnos). Para ello, se cuenta con información de: CUE (código único de
establecimiento), nombre del establecimiento, cantidad de docentes, cantidad de alumnos, localidad. 
Se pide implementar un programa que procese la información y determine:

● Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida por UNESCO.
● CUE y nombre de las dos escuelas con mejor relación entre docentes y alumnos.

El programa debe utilizar:
a) Un módulo para la lectura de la información de la escuela.
b) Un módulo para determinar la relación docente-alumno (esa relación se obtiene del cociente entre la cantidad
de alumnos y la cantidad de docentes).}

program eje03;

type
  //La cantidad de alumnos y docentes los puse como "real" ya que la relacion docente-alumno es (23,435)
  REG_escuela = record
    CUE: integer;
    cantDocentes,cantAlumnos: integer;
    nombre,localidad: string;
  end;

function relacion (cantDocentes,cantAlumnos: integer): real;
  begin
    relacion:= cantAlumnos / cantDocentes;
  end;

procedure imprimir (cantEscuelas,cue1,cue2: integer; nombre1,nombre2: string);
  begin
    writeln ('Cantidad de escuelas de La Plata con una relación de alumnos por docente superior a la sugerida es: ',cantEscuelas);
    writeln ('Las dos escuelas con mejor relación entre docentes y alumnos son:');
    writeln ('CUE: ',cue1,' Escuela: ',nombre1,' y CUE: ',cue2,' Escuela: ',nombre2);
  end;

procedure leer (var r: REG_escuela);
  begin
    write ('CUE: '); readln(r.CUE);
    write ('Nombre establecimiento: '); readln(r.nombre);
    write ('Cantidad de doncetes: '); readln(r.cantDocentes);
    write ('Cantidad de alumnos: '); readln(r.cantAlumnos);
    write ('Localidad: '); readln(r.localidad);
  end;

procedure inciso;
  var
    r: REG_escuela;
    x,cue1,cue2,cantEscuelas: integer;
    nombre1, nombre2: string;
    relacionDA,relacion1,relacion2: real;
  begin
    cantEscuelas:= 0; //Punto 1
    relacion1:= 0; //Punto 2
    relacion2:= 0; //Punto 2
    for x:=1 to 2400 do
      begin
        leer(r);
        relacionDA:= relacion(r.cantDocentes,r.cantAlumnos);

        //PUNTO 1
        if (relacionDA > 23.435) and (r.localidad = 'la plata') then
          cantEscuelas:= cantEscuelas + 1;
        //PUNTO 2
        if (relacion1 < relacionDA) then
          begin
            cue2:= cue1;
            nombre2:= nombre1;
            cue1:= r.CUE;
            nombre1:= r.nombre;
          end
        else
          if (relacion2 < relacionDA) then
            begin
              cue2:= r.CUE;
              nombre2:= r.nombre;
            end;
      end;
    
    imprimir(cantEscuelas,cue1,cue2,nombre1,nombre2);
  end;

//Programa principal
begin
  inciso;
end.