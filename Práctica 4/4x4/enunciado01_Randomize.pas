{Se leen datos de empleados de una empresa multinacional. De cada empleado se conoce
su código de empleado (entre 1 y 2000), el código de país donde trabaja (entre 1 y 25), la
antigüedad en años y el sueldo bruto en dólares. La lectura finaliza al ingresar el código de
empleado 1, el cual debe procesarse.
Realizar un programa que procese la información de los empleados, e informe:
● el país con mayor cantidad de empleados
● la cantidad de empleados de más de 10 años de antigüedad cuyo sueldo bruto no
alcance los 1500 dólares
● los códigos de los empleados que cobran el mejor sueldo en cada país}

program enunciado01;
const
  dimF = 2000;
  dimFPais = 25;
type
  REG_empleado = record
    cod,codPais,antiguedad: integer;
    sueldo: real;
  end;

  REG_incisos = record
    cantEmple,cod1,cod2: integer;
    sueldo1,sueldo2: real;
  end;

  vector = array [1..dimF] of REG_empleado;
  vectorIncisos = array [1..25] of REG_incisos;


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
            codPais:= random(25) + 1;
            antiguedad:= random(30) + 1;
            sueldo:= random(1500) + 500;
          end;
      end;
  end;
procedure cargarVector (var v: vector; var dimL: integer);
  var
    r: REG_empleado;
  begin
    repeat
      pregunta(r);
      dimL:= dimL + 1;
      v[dimL]:= r;
    until (r.cod = 1) or (dimL = dimF);
  end;
// =========== CARGA VECTOR

procedure incisos (v: vector; dimL: integer; var vecIn: vectorIncisos);
  var
    x,anti10: integer;
  begin
    anti10:= 0;
    for x:=1 to dimL do
      begin
        //Punto 2
        if (v[x].antiguedad > 10) and (v[x].sueldo < 1500) then
          anti10:= anti10 + 1;
        //Punto 1
        vecIn[v[x].codPais].cantEmple:= vecIn[v[x].codPais].cantEmple + 1;
        //Punto 3
        if (vecIn[v[x].codPais].sueldo1 < v[x].sueldo) then
          begin
            vecIn[v[x].codPais].sueldo2:= vecIn[v[x].codPais].sueldo1;
            vecIn[v[x].codPais].cod2:= vecIn[v[x].codPais].cod1;
            vecIn[v[x].codPais].sueldo1:= v[x].sueldo;
            vecIn[v[x].codPais].cod1:= v[x].cod;
          end
        else
          if (vecIn[v[x].codPais].sueldo2 < v[x].sueldo) then
            begin
              vecIn[v[x].codPais].sueldo2:= v[x].sueldo;
              vecIn[v[x].codPais].cod2:= v[x].cod;
            end;
      end;
    writeln ('La cantidad de empleados de mas de 10 anios de antiguedad cuyo sueldo bruto no alcanza los 1500 dolares es: ',anti10);
  end;

procedure imprimir (vecIn: vectorIncisos);
  var
    x: integer;
  begin
    for x:=1 to dimFPais do
      begin
        writeln ('=== PAIS ',x,' ===');
        writeln ('La cantidad de empleados: ',vecIn[x].cantEmple);
        writeln ('Los codigos de los empleados que cobran el mejor sueldo es: ',vecIn[x].cod1,' y ',vecIn[x].cod2);
      end;
  end;

//Programa principal
var
  v: vector;
  vecIn: vectorIncisos;
  x,dimL: integer;
begin
  Randomize; //Externo a CADP
  dimL:= 0;
  cargarVector(v,dimL);

  for x:=1 to dimFPais do
    begin
      vecIn[x].cantEmple:= 0;
      vecIn[x].sueldo1:= 0;
      vecIn[x].sueldo2:= 0;
    end;
  incisos(v,dimL,vecIn);
  imprimir(vecIn);
end.