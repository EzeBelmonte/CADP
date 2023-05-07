{4. Una cátedra dispone de información de sus alumnos (a lo sumo 1000). De cada alumno se conoce nro de
alumno, apellido y nombre y cantidad de asistencias a clase. Dicha información se encuentra ordenada por
nro de alumno de manera ascendente. Se pide:

a. Un módulo que retorne la posición del alumno con un nro de alumno recibido por parámetro. El
alumno seguro existe.

b. Un módulo que reciba un alumno y lo inserte en el vector.

c. Un módulo que reciba la posición de un alumno dentro del vector y lo elimine.

d. Un módulo que reciba un nro de alumno y elimine dicho alumno del vector

e. Un módulo que elimine del vector todos los alumnos con cantidad de asistencias en 0.
Nota: Realizar el programa}

program eje04;

Uses
  sysutils;

const
  dimF = 1000;

type
  str30 = string[30];

  REG_alumno = record
    num,asistencia: integer;
    apellido,nombre: str30;
  end;

  vector = array [1..dimF] of REG_alumno;

// =========== COMIENZO: SE DEBERIA HACER MANUAL, PERO PARA AGILIZAR LO HAGO AUTOMATICO
procedure cargarV (var v: vector; var dimL: integer);
  var
    num: integer;
  begin
    num:= 100;
    while (dimL < dimF) and (num < 1000) do
      begin
        dimL:= dimL + 1;
        num:= num + (random(50) + 1);
        v[dimL].num:= num;
        v[dimL].apellido:= Concat('Apellido-',IntToStr(num));
        v[dimL].nombre:= Concat('Nombre-',IntToStr(num));
        v[dimL].asistencia:= random(30);

        num:= num + 1;
      end;
  end;
// =========== FIN: SE DEBERIA HACER MANUAL, PERO PARA AGILIZAR LO HAGO AUTOMATICO

function incisoAF (v: vector; dimL,num: integer): integer;
  var
    x: integer;
  begin
    x:= 1;
    while (num <> v[x].num) and (x <= dimL) do
      x:= x + 1;
    if (x <= dimL) then
      incisoAF:= x;
  end;

procedure incisoA (v: vector; dimL: integer);
  var
    num: integer;
  begin
    write ('Numero de alumno: '); readln(num);
    writeln ('El alumno con numero ',num,' se encuentra en la posicion: ',incisoAF(v,dimL,num));
  end;

procedure incisoB (var v: vector; var dimL: integer);
  var
    x: integer;
    r: REG_alumno;
  begin
    write ('Numero alumno: '); readln(r.num);
    write ('Apellido: '); readln(r.apellido);
    write ('Nombre: '); readln(r.nombre);
    write ('Cant. asistencia: '); readln(r.asistencia);
    if (dimL < dimF) then
      begin
        x:= dimL;
        while (r.num < v[x].num) do
          begin
            v[x + 1]:= v[x];
            x:= x - 1;
          end;
        v[x+1]:= r;
      end;
    dimL:= dimL + 1;
  end;

procedure incisoC (var v: vector; var dimL: integer);
  var
    x,pos: integer;
  begin
    write ('Posicion a eliminar: '); readln(pos);
    if (pos > 0) then
      if(pos < dimL) then
        for x:= pos to dimL - 1 do
          v[x]:= v[x + 1];
      dimL:= dimL - 1;
  end;

procedure incisoD (var v: vector; var dimL: integer);
  var
  x,y,restar: integer;
  begin
    restar:= 0;
    x:= 1;
    while (x < dimL) do
      begin
        if (v[x].asistencia = 0) then
          begin
            y:= x;
            while (y < dimL) do
              begin
                v[y]:= v[y + 1];
                y:= y + 1;
              end;
            restar:= restar + 1;
          end
        else
          x:= x + 1;
      end;
    dimL:= dimL - restar;
  end;

var
  v: vector;
  dimL: integer;
begin
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  dimL:= 0;
  cargarV(v,dimL); //No lo pide el enunciado, lo hice por mi cuenta
  //=================================
  incisoA(v,dimL); 
  incisoB(v,dimL);
  incisoC(v,dimL);
  incisoD(v,dimL);
end.