{Se dispone de datos de empleados de una empresa multinacional. De cada empleado se
conoce su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y
25), la antigüedad en años y el sueldo bruto en dólares. La información se encuentra
ordenada por código de país.
Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● el código del empleado que cobra el mejor sueldo en cada país}


program enunciado03;
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
        {Forma correcta de cargar el vector
        write ('Codigo: '); readln(cod);
        write ('Cod. Pais: '); readln(codPais);
        write ('Antiguedad: '); readln(antiguedad);
        write ('Sueldo (USD): '); readln(sueldo);}

        //Para ahorrar tiempo
        cod:= random(2001);
        if (cod <> 0) then
          begin
            write ('Cod. Pais: '); readln(codPais);
            antiguedad:= random(30) + 1;
            sueldo:= random(1500) + 500;
          end;
      end;
  end;
procedure cargarVector (var v: vector);
  var
    r: REG_empleado;
    x: integer;
  begin
    for x:=1 to dimF do
      begin
        pregunta(r);
        v[x]:= r;
      end;
  end;
// =========== CARGA VECTOR

procedure incisos (v: vector);
  var
    x,anti10,auxPais,contador,cantEmple,emplePais,codMax: integer;
    maxSueldo: real;
  begin
    anti10:= 0;
    cantEmple:= 0;
    maxSueldo:= 0;
    x:= 1;
    while (x <= dimF) do
      begin
        contador:= 0;
        auxPais:= v[x].codPais;
        while (x <= dimF) and (auxPais = v[x].codPais) do
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
begin
  Randomize; //Externo a CADP
  cargarVector(v);
  incisos(v);
end.