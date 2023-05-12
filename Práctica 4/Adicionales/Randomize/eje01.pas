{1. La compañía Canonical Llt. desea obtener estadísticas acerca del uso de Ubuntu Linux en La Plata. Para ello, debe realizar 
un programa que lea y almacene información sobre las computadoras con este sistema operativo (a lo sumo 10.000). 
De cada computadora se conoce código de computadora, la versión de Ubuntu que utilizan (18.04, 17.10, 17.04, etc.), 
la cantidad de paquetes instalados y la cantidad de cuentas de usuario que poseen. La información debe almacenarse ordenada por código de
computadora de manera ascendente. La lectura finaliza al ingresar el código de computadora -1, que no debe procesarse.

Una vez almacenados todos los datos, se pide:
a. Informar la cantidad de computadoras que utilizan las versiones 18.04 o 16.04.
b. Informar el promedio de cuentas de usuario por computadora.
c. Informar la versión de Ubuntu de la computadora con mayor cantidad de paquetes instalados.
d. Eliminar la información de las computadoras con código entre 0 y 500.}

program eje01;
const
  dimF = 10000;
type
  REG_compu = record
    cod,paquetes,cuentas: integer;
    version: real;
  end;

  vector = array [1..dimF] of REG_compu;

//============== CARGA VECTOR
procedure preguntas (var r: REG_compu);
  begin
    with r do
      begin
        cod:= random(32767) + 1;
        if (cod <> -1) then
          begin
            version:= random(3000) + 1000;
            paquetes:= random(100) + 20;
            cuentas:= random(10) + 1;
          end;
      end;
  end;

procedure cargarVector (var v: vector; var dimL: integer);
  var
    r: REG_compu;
    x,y: integer;
  begin
    for x:=1 to dimF do
      v[x].cod:= 0;

    preguntas(r);
    while (r.cod <> -1) and (dimL < dimF) do
      begin
        dimL:= dimL + 1;
        x:= 1;
        while (x <= dimF) and (v[x].cod < r.cod) and (v[x].cod <> 0) do
          x:= x + 1;
        if (x <= dimF) then
          if (x < dimF) then
            for y:= dimF downto x do
              v[y]:= v[y - 1];
          v[x]:= r;
        
        preguntas(r);
      end;
  end;
//============== CARGA VECTOR

//========= INCISOS
procedure incisos (v: vector; dimL: integer);
  var
    x,incA,cantCuentas,cantPaq: integer;
    promB,verC: real;
  begin
    incA:= 0;
    cantCuentas:= 0;
    cantPaq:= 0;

    for x:=1 to dimL do
      begin
        //Inciso A
        if (v[x].version = 16.04) or (v[x].version = 18.04) then
          incA:= incA + 1;

        //Inciso B
        cantCuentas:= cantCuentas + v[x].cuentas;

        //Inciso C
        if (v[x].paquetes > cantPaq) then
          begin
            cantPaq:= v[x].paquetes;
            verC:= v[x].version;
          end;
      end;
    
    writeln ('La cantidad de computadoras que utilizan las versiones 18.04 o 16.04 es: ',incA,'.');
    writeln ('El promedio de cuentas de usuario por computadora es: ',(cantCuentas / dimL):0:2,'.');
    writeln ('La version de Ubuntu de la computadora con mayor cantidad de paquetes instalados es: ',verC:0:2,'.');
  end;

procedure borrar (var v: vector; var dimL: integer);
  var
    x,y: integer;
  begin
    for x:=1 to dimL do
      if (v[x].cod >= 0) and (v[x].cod <= 500) then
        begin
          for y:= x to dimL do
            v[y]:= v[y + 1];
          dimL:= dimL - 1;
        end;
  end;
//========= INCISOS

//Programa principal
var
  v: vector;
  dimL: integer;
begin
  Randomize; // Externo a CADP
  dimL:= 0;
  cargarVector(v,dimL);
  writeln ('======= FIN CARGA =======');
  incisos(v,dimL);
  borrar(v,dimL);
end.