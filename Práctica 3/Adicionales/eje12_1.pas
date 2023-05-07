{Actividad 1: Revisando Inversiones

Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000}

program eje12_1;

type
  REG_empresa = record
    cod,inversiones: integer;
    monto: real;
  end;

procedure leer (var r: REG_empresa; var montoTotal: real; var inver50: integer);
  var
    x: integer;
    cumple: boolean;
  begin
    cumple:= true;
    write ('Codigo: '); readln(r.cod);
    write ('Cant inversiones: '); readln(r.inversiones);
    for x:=1 to r.inversiones do
      begin
        write ('Monto: '); readln(r.monto);
        montoTotal:= montoTotal + r.monto;
        if (cumple) and (r.monto < 50000) then
          cumple:= false;
      end;
    if (cumple) then
      inver50:= inver50 + 1;
  end;

procedure inciso;
  var
    r: REG_empresa;
    codigo,inver50: integer;
    montoTotal,promedio,mayorMonto: real;
  begin
    mayorMonto:= 0;
    inver50:= 0;
    repeat
      montoTotal:= 0;
      leer(r,montoTotal,inver50);
      //========= PUNTO 1
      promedio:= montoTotal / r.inversiones;
      writeln ('El monto promedio de las inversiones de la empresa ',r.cod,' es de: ',promedio:5:2,'$.');

      //========= PUNTO 2
      if (mayorMonto < montoTotal) then
        begin
          mayorMonto:= montoTotal;
          codigo:= r.cod;
        end;

    until r.cod = 100;

    writeln ('El codigo de la empresa con mayor monto total invertido es: ',codigo); //PUNTO 2
    writeln ('La cantidad de empresas con inversiones de mas de $50000 es de: ',inver50) //PUNTO 3

  end;

//Programa principal
begin
  inciso;
end.