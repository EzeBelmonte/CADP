{2. El registro civil de La Plata ha solicitado un programa para analizar la distribución de casamientos durante 
el año 2019. Para ello, cuenta con información de las fechas de todos los casamientos realizados durante ese año.

a) Analizar y definir un tipo de dato adecuado para almacenar la información de la fecha de cada casamiento.

b) Implementar un módulo que lea una fecha desde teclado y la retorne en un parámetro cuyo tipo es el definido
en el inciso a).

c) Implementar un programa que lea la fecha de todos los casamientos realizados en 2019. La lectura finaliza al
ingresar el año 2020, que no debe procesarse, e informe la cantidad de casamientos realizados durante los
meses de verano (enero, febrero y marzo) y la cantidad de casamientos realizados en los primeros 10 días de
cada mes. Nota: utilizar el módulo realizado en b) para la lectura de fecha.}

program eje02;

type
  registroC = record
    dia,mes,anio: integer;
  end;

procedure leer (var r: registroC);
  begin
    write ('Anio: '); readln(r.anio);
    if (r.anio <> 2019) then
      begin
        write ('Mes (1 a 12): '); readln(r.mes);
        write ('Dia: '); readln(r.dia);
      end;
  end;

procedure inciso;
  var
    r: registroC;
    auxMes,casamientoV, primeros10: integer;
  begin
    casamientoV:= 0;
    leer(r);
    auxMes:= r.mes;
    while (r.anio = 2019) do
      begin
        //Para poder inicializar en 0 primeros10
        if (auxMes <> r.mes) then
          begin
            auxMes:= r.mes;
            primeros10:= 0;
          end;
        if (r.mes = 1) or (r.mes = 2) or (r.mes = 3) then
          casamientoV:= casamientoV + 1;
        //Todos los casamientos transcurridos en los primeros 10 dias
        if (r.dia <= 10) then
          primeros10:= primeros10 + 1;
        leer(r);
        writeln ('La cantidad de casamiendo de los primeros 10 dias fueron: ',primeros10);
      end;
    writeln ('La cantidad de casamientos que hubo en el verano fueron: ',casamientoV);
  end;

//Programa principal
begin
  inciso;
end.


//Opcion 2:

{program eje02;

type
  str10 = string[10];

  registroC = record
    dia,anio: integer;
    mes: str10;
  end;

procedure leer;
  var
    r: registroC;
    casamientoV, primeros10: integer;
    auxMes: str10;
  begin
    casamientoV:= 0;
    write ('Anio: '); readln(r.anio);
    while (r.anio = 2019) do
      begin
        write ('Mes: '); readln(r.mes);
        auxMes:= r.mes;
        while (auxMes = r.mes) and (r.anio = 2019) do
          begin
            primeros10:= 0;
            write ('Dia: '); readln(r.dia);
            //Para simplificar todos los dias tiene 31
            while (auxMes = r.mes) do
              begin

                //Todos los casamientos de los meses de verano
                if (r.mes = 'enero') or (r.mes = 'febrero') or (r.mes = 'marzo') then
                  casamientoV:= casamientoV + 1;
                
                //Todos los casamientos transcurridos en los primeros 10 dias
                if (r.dia <= 10) then
                  primeros10:= primeros10 + 1;

                write ('Dia: '); readln(r.dia);
                write ('Mes: '); readln(r.mes);
              end;
            writeln ('La cantidad de casamiendo de los primeros 10 dias del mes de ',auxMes,' fueron: ',primeros10);
            auxMes:= r.mes;
            write ('Anio: '); readln(r.anio);
          end;
      end;

      writeln ('La cantidad de casamientos que hubo en el verano fueron: ',casamientoV);
  end;

//Programa principal
begin
  leer;
end.}