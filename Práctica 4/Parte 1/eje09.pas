{9. Modificar la solución del punto anterior considerando que el programa lea y almacene la información de a
lo sumo 400 alumnos. La lectura finaliza cuando se ingresa el DNI -1 (que no debe procesarse).}

program eje09;

const
  dimF = 400;
type
  REG_alumnos = record
    num,dni,naci: integer;
    apellido,nombre: string; //Podria ser variable nombreApellido, pero no se si dejan guardarlo todo en uno
  end;

  vector = array [1..dimF] of REG_alumnos;

procedure cargarV (var v: vector; var dimL: integer);
  var
    dni: integer;
  begin
    write ('DNI: '); readln(dni);
    while (dimL < dimF) and (dni <> -1) do
      begin
        dimL:= dimL + 1;
        v[dimL].dni:= dni;
        write ('Inscripcion: '); readln(v[dimL].num);
        write ('Apellido: '); readln(v[dimL].apellido);
        write ('Nombre: '); readln(v[dimL].nombre);
        write ('Anio de nacimiento: '); readln(v[dimL].naci);

        write ('DNI: '); readln(dni);
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
  dimL: integer;
begin
  dimL:= 0;
  cargarV(v,dimL);
  incisoA(v);
  incisoB(v);
end.