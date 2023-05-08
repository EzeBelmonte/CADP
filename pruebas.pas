program nueve;
const
  df=4;
type
  str20=string [20];
  alumno=record
    inscripcion:integer;
    dni:integer;
    apellido:str20;
    nombre:str20;
    anio:integer;
  end;
  vector=array[1..df] of alumno;
procedure Cargar (var v:vector; var dl:integer);
begin
  readln (v[dl].dni);
  while (v[dl].dni<>-1) and (dl<=df) do begin
    readln (v[dl].inscripcion);
    readln (v[dl].apellido);
    readln (v[dl].nombre);
    readln (v[dl].anio);
    dl:=dl+1;
    readln (v[dl].dni);
  end;
end;
function porcentaje (v:vector; dl:integer):real;
var
  dig, i:integer;
begin
  dig:=0;
  for i:= 1 to dl do begin
    if (v[i].dni mod 2=0) then
      dig:=dig+1;
  end;
  porcentaje:= (dig*100) div dl;
end;
procedure Mayoredad (v:vector; dl:integer; var ape1, nom1, ape2, nom2:str20);
var
  edad1, edad2, num, i:integer;
begin
  edad1:=-1;
  edad2:=-1;
  for i:= 1 to dl do begin
    num:=2020-v[i].anio;
    if (num>edad1) then begin
      edad2:=edad1;
      edad1:=num;
      ape2:=ape1;
      ape1:= v[i].apellido;
      nom2:=nom1;
      nom1:= v[i].nombre;
    end
    else
    begin
      if (num>edad2) then begin
        edad2:=num;
        ape2:=v[i].apellido;
        nom2:=v[i].nombre;
      end;
    end;
  end;
end;
var
  ape1, nom1, ape2, nom2:str20;
  v:vector;
  dl:integer;
begin
  dl:=1;
  Cargar (v,dl);
  writeln ('El porcentaje de alumnos con dni par es del : ', porcentaje (v,dl):2:2);
  Mayoredad (v, dl, ape1, nom1, ape2, nom2);
  writeln ('los 2 alumnos con mayor edad son: ', nom1,' ', ape1, ' y ', nom2,' ', ape2);
  writeln (v[2].apellido);
end.



