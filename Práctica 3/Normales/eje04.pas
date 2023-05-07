{4. Una compañía de telefonía celular debe realizar la facturación mensual de sus 9300 clientes con planes de
consumo ilimitados (clientes que pagan por lo que consumen). Para cada cliente se conoce su código de cliente y
cantidad de líneas a su nombre. De cada línea se tiene el número de teléfono, la cantidad de minutos consumidos
y la cantidad de MB consumidos en el mes. Se pide implementar un programa que lea los datos de los clientes de
la compañía e informe el monto total a facturar para cada uno. Para ello, se requiere:

a. Realizar un módulo que lea la información de una línea de teléfono.
b. Realizar un módulo que reciba los datos de un cliente, lea la información de todas sus líneas (utilizando el
módulo desarrollado en el inciso a. ) y retorne la cantidad total de minutos y la cantidad total de MB a facturar
del cliente.
Nota: para realizar los cálculos tener en cuenta que cada minuto cuesta $3,40 y cada MB consumido cuesta $1,35.}

program eje04;

type
  REG_linea = record
    num: integer;
    cantMinutos,cantMB: real;
  end;

  REG_compania = record
    cod,cantLineas: integer;
    lineas: REG_linea;
  end;

procedure procesarLineas (var linea: REG_linea);
  begin
    write ('Numero: '); readln(linea.num);
    write ('Cantidad minutos: '); readln(linea.cantMinutos);
    write ('Cantidad MB: '); readln(linea.cantMB);
  end;

procedure inciso;
  var
    x,y: integer;
    totalMin,totalMB: real;
    r: REG_compania;
  begin
    for x:=1 to 9300 do
      begin
        totalMin:= 0;
        totalMB:= 0;
        write ('Cod: '); readln(r.cod);
        write ('Cantidad de lineas: '); readln(r.cantLineas);
        for y:=1 to r.cantLineas do
          begin
            procesarLineas(r.lineas);
            totalMin:= totalMin + r.lineas.cantMinutos;
            totalMB:= totalMB + r.lineas.cantMB;
          end;
        
        writeln ('Total minutos a facturar: ',(totalMin * 3.40):5:2);
        writeln ('Total MB a facturar: ',(totalMB * 1.35):5:2);
      end;
  end;

//Programa principal
begin
  inciso;
end.