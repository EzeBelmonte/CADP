{8. Realizar un programa que lea y almacene la información de 400 alumnos ingresantes a la Facultad de
Informática de la UNLP en el año 2020. De cada alumno se lee: nro de inscripción, DNI, apellido, nombre y
año de nacimiento. Una vez leída y almacenada toda la información, calcular e informar:
a) El porcentaje de alumnos con DNI compuesto sólo por dígitos pares.
b) Apellido y nombre de los dos alumnos de mayor edad.}

program eje08;

const
  dimF = 400;
type
  REG_alumnos = record
    num,dni,naci: integer;
    apellido,nombre: string; //Podria ser variable nombreApellido, pero no se si dejan guardarlo todo en uno
  end;

  vector = array [1..dimF] of REG_alumnos;

procedure cargarV (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      begin
        write ('Inscripcion: '); readln(v[x].num);
        write ('DNI: '); readln(v[x].dni);
        write ('Apellido: '); readln(v[x].apellido);
        write ('Nombre: '); readln(v[x].nombre);
        write ('Anio de nacimiento: '); readln(v[x].naci);
      end;
  end;

function digPares (num: integer): boolean;
  begin
    digPares:= true;
    while (num > 0) and (digPares) do
      begin
        if ((num mod 10) mod 2 = 0) then
          num:= num div 10
        else
          digPares:= false;
      end;
  end;

procedure incisoA (v: vector);
  var
    x: integer;
    porcen: real;
  begin
    porcen:= 0;
    for x:=1 to dimF do
      begin
        if (digPares(v[x].dni)) then
          porcen:= porcen + 1;
      end;

    writeln ('El porcentaje de alumnos con DNI con dig. pares es: ',((porcen * 100) / dimF):3:2,'%.');
  end;

procedure incisoB (v: vector);
  var
    nom1,nom2,ape1,ape2: string;
    x,edad1,edad2: integer;
  begin
    edad1:= 32767;
    edad2:= 32767;
    for x:=1 to dimF do
      begin
        if (v[x].naci < edad1) then
          begin
            edad2:= edad1;
            nom2:= nom1;
            ape2:= ape1;
            edad1:= v[x].naci;
            nom1:= v[x].nombre;
            ape1:= v[x].apellido;
          end
        else
          if (v[x].naci < edad2) then
            begin
              edad2:= v[x].naci;
              nom2:= v[x].nombre;
              ape2:= v[x].apellido;
            end;
      end;

    writeln ('Los 2 alumnos de mayor edad son: ',ape1,' ',nom1,' y ',ape2,' ',nom2,'.');
  end;

//Programa principal
var
  v: vector;
begin
  cargarV(v);
  incisoA(v);
  incisoB(v);
end.