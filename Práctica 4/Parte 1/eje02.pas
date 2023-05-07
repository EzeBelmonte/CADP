{2. Dado el siguiente programa, complete las líneas indicadas, considerando que:

a) El módulo cargarVector debe leer números reales y almacenarlos en el vector que se pasa como
parámetro. Al finalizar, debe retornar el vector y su dimensión lógica. La lectura finaliza cuando se ingresa
el valor 0 (que no debe procesarse) o cuando el vector está completo.

b) El módulo modificarVectorySumar debe devolver el vector con todos sus elementos incrementados con
el valor n y también debe devolver la suma de todos los elementos del vector.
}

program Vectores;

const
  cant_datos = 150;

type
  vdatos = array[1..cant_datos] of real;

procedure cargarVector(var v:vdatos; var dimL : integer);
var
  num: real;{ completar }
begin
{ completar }
  write ('Numero: '); readln(num);
  while (num <> 0) and (dimL < 150) do
    begin
      dimL:= dimL + 1;
      v[dimL]:= num;
      write ('Numero: '); readln(num);
    end;
end;

procedure modificarVectorySumar(var v:vdatos; dimL : integer; n: real; var suma: real);
var
{ completar }
  x: integer;
begin
{ completar }
  for x:=1 to dimL do
    begin
      v[x]:= v[x] + n;
      suma:= suma + v[x];
    end;
end;

{ programa principal }
var
  datos : vdatos;
  {i,} dim : integer; // La variable i no se usa, asi que la saco
  num, suma : real;
begin
  dim := 0;
  //sumaTotam:= 0 <-- Cambie esta variable por la de SUMA
  suma:= 0;
  cargarVector(datos,dim); { completar }
  writeln('Ingrese un valor a sumar');
  readln(num);
  modificarVectorySumar(datos,dim,num,suma);{completar}
  writeln('La suma de los valores es: ', suma);
  writeln('Se procesaron: ',dim,' números');
end.