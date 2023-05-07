{Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000}

program eje05_1;



procedure inversiones (cantInver,cod: integer; var montoMax: real; var codMax,cantEmpresa: integer);
  var
    x: integer;
    monto, monTotal: real;
    cumple: boolean;
  begin
    cumple:= true;
    monTotal:= 0;
    for x:=1 to cantInver do
      begin
        write ('Monto: '); readln(monto);
        monTotal:= monTotal + monto;
      end;
    if (montoMax < monTotal) then
      begin
        montoMax:= monTotal;
        codMax:= cod;
      end;
    
    if (cumple) and (monto > 50000) then
      begin
        cumple:= false;
        cantEmpresa:= cantEmpresa + 1;
      end;

    writeln ('Monto promedio: ',(monTotal/cantInver):1:2);
  end;



procedure leer;
  var
    cod, cantInver, codMax, cantEmpresa: integer;
    montoMax: real;
  begin
    montoMax:= 0;
    cantEmpresa:= 0;
    repeat
      write ('Codigo: '); readln(cod);
      write ('Cantidad de inversiones: '); readln(cantInver);

      inversiones(cantInver,cod,montoMax,codMax,cantEmpresa);

    until (cod = 100);

    writeln ('La empresa con mayor monto total de inversion es la ',codMax);
    writeln ('Hay ',cantEmpresa,' empresas con inversiones por más de $50000');
  end;

begin
  leer;
end.