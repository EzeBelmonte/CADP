{6) Realizar un programa que ocupe 50 KB de memoria en total. Para ello:

a) El programa debe utilizar sólo memoria estática

writeln(sizeof( )}

program eje06a;
// Externo a CADP
Uses
  sysutils;
// Externo a CADP

type
  REG_Fecha = record
    dia,mes,anio: integer;
  end;

  REG_personas = record
    nombre,apellido,pais: string[29];
    edad,dni,tel: integer;
    fecha: REG_Fecha;
  end;
  vector = array [1..49] of REG_personas;

procedure leer(var v: vector);
  var
    r: REG_personas;
  begin
    // Externo a CADP
    r.dni:= random(32767);
    r.nombre:= Concat('Nombre-',IntToStr(r.dni));
    r.apellido:= Concat('Apellido-',IntToStr(r.dni));
    r.pais:= Concat('Pais-',IntToStr(r.dni));
    r.edad:= random(80) + 1;
    r.fecha.dia:= random(31) + 1;
    r.fecha.mes:= random(12) + 1;
    r.fecha.anio:= random (100) + 1900;
    r.tel:= random(32767);
    // Externo a CADP
    writeln ('Nombre: ',r.nombre);
    writeln ('Apellido: ',r.apellido);
    writeln ('D.N.I: ',r.dni);
    writeln ('Edad: ',r.edad);
    writeln ('Pais origen: ',r.pais);
    writeln ('Fecha de nacimiento:');
    writeln ('Dia: ',r.fecha.dia);
    writeln ('Mes: ',r.fecha.mes);
    writeln ('Anio: ',r.fecha.anio);
    writeln ('Tel: ',r.tel);
  end;
  
var
  v: vector;
  x: integer;
begin
  Randomize; //No tener en cuenta, Externo a CADP
  for x:=1 to 49 do
    begin
      writeln('=================');
      leer(v);
    end;
  writeln(sizeof(x),' bytes.');
  writeln(sizeof(v),' bytes.');
end.