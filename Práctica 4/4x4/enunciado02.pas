{Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 0. La información se lee ordenada por código de país.
Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país}

program enunciado02;
const
  dimF = 2000;
type
  REG_empleado = record
    cod,codPais,antiguedad: integer;
    sueldo: real;
  end;

  vector = array [1..dimF] of REG_empleado;


// =========== CARGA VECTOR
procedure pregunta (var r: REG_empleado);
  begin
    with r do
      begin
        write ('Codigo: '); readln(cod);
        if (cod <> 0) then
          begin
            write ('Cod. Pais: '); readln(codPais);
            write ('Antiguedad: '); readln(antiguedad);
            write ('Sueldo (USD): '); readln(sueldo);
          end;
      end;
  end;
procedure cargarVector (var v: vector; var dimL: integer);
  var
    r: REG_empleado;
  begin
    pregunta(r);
    while (dimL < dimF) and (r.cod <> 0) do
      begin
        dimL:= dimL + 1;
        v[dimL]:= r;
        pregunta(r);
      end;
  end;
// =========== CARGA VECTOR

procedure incisos (v: vector; dimL: integer);
  var
    x,anti10,auxPais,contador,cantEmple,emplePais,codMax: integer;
    maxSueldo: real;
  begin
    anti10:= 0;
    cantEmple:= 0;
    maxSueldo:= 0;
    x:= 1;
    while (x <= dimL) do
      begin
        contador:= 0;
        auxPais:= v[x].codPais;
        while (x <= dimL) and (auxPais = v[x].codPais) do
          begin
            //Punto 1
            contador:= contador + 1;

            //Punto 2
            if (v[x].antiguedad > 10) and (v[x].sueldo < 1500) then
              anti10:= anti10 + 1;

            //Punto 3
            if (maxSueldo < v[x].sueldo) then
              begin
                maxSueldo:= v[x].sueldo;
                codMax:= v[x].cod;
              end;

            x:= x + 1;
          end;
        //Punto 1
        if (contador > cantEmple) then
          begin
            cantEmple:= contador;
            emplePais:= auxPais;
          end;
        
        writeln ('El codigos del empleado que cobran el mejor sueldo en el pais ',auxPais,' es: ',codMax);
      end;
    writeln ('La cantidad de empleados de mas de 10 anios de antiguedad cuyo sueldo bruto no alcanza los 1500 dolares es: ',anti10);
    writeln ('El pais con mayor cantidad de empleados es: ',emplePais);
  end;


//Programa principal
var
  v: vector;
  dimL: integer;
begin
  dimL:= 0;
  cargarVector(v,dimL);
  incisos(v,dimL);
end.