{10. Realizar un programa que lea y almacene el salario de los empleados de una empresa de turismo (a lo
sumo 300 empleados). La carga finaliza cuando se lea el salario 0 (que no debe procesarse) o cuando se
completa el vector. Una vez finalizada la carga de datos se pide:

a) Realizar un módulo que incremente el salario de cada empleado en un 15%. Para ello, implementar un
módulo que reciba como parámetro un valor real X, el vector de valores reales y su dimensión lógica y
retorne el mismo vector en el cual cada elemento fue multiplicado por el valor X.
b) Realizar un módulo que muestre en pantalla el sueldo promedio de los empleados de la empresa.}

program eje10;

const
  dimF = 300;
type
  vector = array [1..dimF] of real;

procedure cargarV(var v: vector; var dimL: integer);
  var
    salario: real;
  begin
    write ('Salario: '); readln(salario);
    while (salario <> 0) and (dimL < dimF) do
      begin
        dimL:= dimL + 1;
        v[dimL]:= salario;

        write ('Salario: '); readln(salario);
      end;
  end;

procedure incremento (var v:vector; dimL: integer; incre: real);
  var
    x: integer;
  begin
    for x:=1 to dimL do
      v[x]:= v[x] * incre;
  end;
procedure incisoA (var v: vector; dimL: integer);
  var
    incre: real;
  begin
    incre:= 1.15; //Si multiplico 1.15 por el valor, equivale al aumento del 15%
    incremento(v,dimL,incre);
  end;

function incisoB (v: vector; dimL: integer): real;
  var
    x: integer;
  begin
    incisoB:= 0;
    for x:=1 to dimL do
      incisoB:= incisoB + v[x];
    incisoB:= incisoB / dimL
  end;

//Programa principal
var
  v: vector;
  dimL: integer;
begin
  dimL:= 0;
  cargarV(v,dimL);
  incisoA(v,dimL);
  writeLn ('Sueldo promedio: ',incisoB (v,dimL):5:2);
end.