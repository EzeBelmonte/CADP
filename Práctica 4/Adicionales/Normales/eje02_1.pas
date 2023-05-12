{2. Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
utilizaremos vectores para almacenar la información ingresada por teclado. Consideraciones importantes:
- Los datos ingresados por teclado deberán almacenarse en una estructura de tipo vector apropiada.
Dado que en ninguno de los ejercicios se indica la cantidad máxima de datos a leer, para poder utilizar
un vector asumimos que en todos los casos se ingresarán a lo sumo 5000 datos (donde cada dato será
o bien una inversión, un alumno o un tanque de agua, según lo indica cada ejercicio).
- Una vez leídos y almacenados los datos, deberán procesarse (recorrer el vector) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en la práctica anterior. En la
medida de lo posible, el vector deberá recorrerse una única vez para resolver todos los incisos.
  
Actividad 1: Revisando Inversiones Realizar un programa que analice las inversiones de las empresas más grandes del país. 
Para cada empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100, que debe procesarse.

El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000}

program eje02_1;
const
  dimF = 5000;
type
  REG_empresa = record
    cod,inver: integer;
    monto: real;
  end;

  vector = array [1..dimF] of REG_empresa;

//============== CARGA VECTOR
procedure preguntas (var r: REG_empresa);
  var
    x: integer;
    mont: real;
  begin
    with r do
      begin
        write ('Codigo: '); readln(cod);
        write ('Cantidad de inversiones: '); readln(inver);
        writeln ('=== Inversiones ==');
        monto:= 0;
        for x:=1 to inver do
          begin
            write ('Inversion ',x,': '); readln(mont);
            monto:= monto + mont;
          end;
      end;
  end;

procedure cargarVector (var v: vector; var dimL: integer);
  var
    r: REG_empresa;
  begin
    repeat
      preguntas(r);
      dimL:= dimL + 1;
      v[dimL]:= r;
    until (r.cod = 100);
  end;
//============== CARGA VECTOR

//========= INCISOS
procedure incisos (v: vector; dimL: integer);
  var
    x,codMax,cantEmp: integer;
    auxMonto: real;
  begin
    auxMonto:= 0;
    cantEmp:= 0;
    for x:=1 to dimL do
      begin
        //Punto 1
        writeln ('La empresa ',v[x].cod,' tiene un promedio de: $',((v[x].monto) / v[x].inver):0:2,'.');

        //Punto 2
        if (v[x].monto > auxMonto) then
          begin
            auxMonto:= v[x].monto;
            codMax:= v[x].cod;
          end;
        
        //Punto 3
        if (v[x].monto > 50000) then
          cantEmp:= cantEmp + 1;
      end;
    
    writeln ('La empresa con mayor monto total invertido es: ',codMax,'.');
    writeln ('La cantidad de empresas con inversiones de mas de $50000 es: ',cantEmp,'.');
  end;
//========= INCISOS

//Programa principal
var
  v: vector;
  dimL: integer;
begin
  dimL:= 0;
  cargarVector(v,dimL);
  writeln ('======= FIN CARGA =======');
  incisos(v,dimL);
end.