{11. Una compañía de vuelos internacionales está analizando la información de todos los vuelos realizados por sus
aviones durante todo el año 2019. De cada vuelo se conoce el código de avión, país de salida, país de llegada,
cantidad de kilómetros recorridos y porcentaje de ocupación del avión. La información se ingresa ordenada por
código de avión y, para cada avión, por país de salida. La lectura finaliza al ingresar el código 44. 

Informar:
● Los dos aviones que más kilómetros recorrieron y los dos aviones que menos kilómetros recorrieron.
● El avión que salió desde más países diferentes.
● La cantidad de vuelos de más de 5.000 km que no alcanzaron el 60% de ocupación del avión.
● La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda.}

program eje11;

type
  REG_vuelos = record
    cod: integer;
    salida,entrada: string[30];
    km,ocupado: real;
  end;

procedure imprimir (avMin1,avMin2,avMax1,avMax2,avMasPais,vuelos5k,vuelos10k: integer);
  begin
    writeln ('Los 2 aviones que menos kilometros recorrieron fueron el: ',avMin1,' y ',avMin2);
    writeln ('Los 2 aviones que mas kilometros recorrieron fueron el: ',avMax1,' y ',avMax2);
    writeln ('El avión que salio desde mas paises diferentes es el: ',avMasPais);
    writeln ('La cantidad de vuelos de mas de 5.000 km que no alcanzaron el 60% de ocupacion del avion fueron: ',vuelos5k);
    writeln ('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda fueron: ',vuelos10k);
  end;

procedure leer (var r: REG_vuelos);
  begin
    write ('Codigo de vuelo:'); readln(r.cod);
    write ('Pais de salida: '); readln(r.salida);
    write ('Pais de entrada: '); readln(r.entrada);
    write ('Cant. Km recorridos: '); readln(r.km);
    write ('Porcentaje de ocupacion: '); readln(r.ocupado);
  end;
procedure minimos (sumaKm: real; cod: integer; var min1,min2: real; var avMin1,avMin2: integer);
  begin
    if (sumaKm < min1) then
      begin
        min2:= min1;
        avMin2:= avMin1;
        min1:= sumaKm;
        avMin1:= cod;
      end
    else
      if (sumaKm < min2) then
        begin
          min2:= sumaKm;
          avMin2:= cod;
        end;
  end;
procedure maximos (sumaKm: real; cod: integer; var max1,max2: real; var avMax1,avMax2: integer);
  begin
    if (sumaKm > max1) then
      begin
        max2:= max1;
        avMax2:= avMax1;
        max1:= sumaKm;
        avMax1:= cod;
      end
    else
      if (sumaKm > max2) then
        begin
          max2:= sumaKm;
          avMax2:= cod;
        end;
  end;

procedure inciso;
  var
    r: REG_vuelos;
    min1,min2,max1,max2,sumaKm: real;
    cont,cont1,auxCod,avMin1,avMin2,avMax1,avMax2,avMasPais,vuelos5k,vuelos10k: integer;
    auxPais: string;
  begin
    min1:= 327767;
    min2:= min1;
    max1:= 0;
    max2:= 0;
    cont1:= 0; //Guardo el valor mas alto de la variable cont para poder guardar el avion que mas salio
    vuelos10k:= 0;
    vuelos5k:= 0;
    leer(r);
    while (r.cod <> 44) do
      begin
        auxCod:= r.cod;
        cont:= 0;
        sumaKm:= 0;
        while (auxCod = r.cod) do
          begin
            cont:= cont + 1; //Cuento cuantas veces salio el avion de diferentes paises
            auxPais:= r.salida;
            while (auxPais = r.salida) and (r.cod = auxCod) do
              begin
                //========== PUNTO 1
                sumaKm:= sumaKm + r.km;
                //========== PUNTO 1

                //========== PUNTO 3
                if (r.km > 5000) and (r.ocupado < 60) then
                  vuelos5k:= vuelos5k + 1;

                //========== PUNTO 4
                if (r.km < 10000) and ((r.entrada = 'Australia') or (r.entrada = 'Nueva Zelanda') ) then
                  vuelos10k:= vuelos10k + 1;
                leer(r);
              end;
            
            //========== PUNTO 2
            if (cont1 < cont) then
              begin
                cont1:= cont;
                avMasPais:= auxCod;
              end;
        end;
        //========== PUNTO 1
        maximos (sumaKm,r.cod,max1,max2,avMax1,avMax2);
        minimos (sumaKm,r.cod,min1,min2,avMin1,avMin2);
        //========== PUNTO 1
    end;

    imprimir (avMin1,avMin2,avMax1,avMax2,avMasPais,vuelos5k,vuelos10k);
  end;

//Programa principal
begin
  inciso;
end.

{program eje11;

type
  REG_vuelos = record
    cod: integer;
    salida,entrada: string[30];
    km,ocupado: real;
  end;

procedure imprimir (avMin1,avMin2,avMax1,avMax2,avMasPais,vuelos5k,vuelos10k: integer);
  begin
    writeln ('Los 2 aviones que menos kilometros recorrieron fueron el: ',avMin1,' y ',avMin2);
    writeln ('Los 2 aviones que mas kilometros recorrieron fueron el: ',avMax1,' y ',avMax2);
    writeln ('El avión que salio desde mas paises diferentes es el: ',avMasPais);
    writeln ('La cantidad de vuelos de mas de 5.000 km que no alcanzaron el 60% de ocupacion del avion fueron: ',vuelos5k);
    writeln ('La cantidad de vuelos de menos de 10.000 km que llegaron a Australia o a Nueva Zelanda fueron: ',vuelos10k);
  end;

procedure leer (var r: REG_vuelos);
  begin
    write ('Codigo de vuelo:'); readln(r.cod);
    write ('Pais de salida: '); readln(r.salida);
    write ('Pais de entrada: '); readln(r.entrada);
    write ('Cant. Km recorridos: '); readln(r.km);
    write ('Porcentaje de ocupacion: '); readln(r.ocupado);
  end;

procedure inciso;
  var
    r: REG_vuelos;
    min1,min2,max1,max2: real;
    cont,cont1,auxCod,avMin1,avMin2,avMax1,avMax2,avMasPais,vuelos5k,vuelos10k: integer;
    auxPais: string;
  begin
    min1:= 327767;
    min2:= min1;
    max1:= 0;
    max2:= 0;
    cont1:= 0; //Guardo el valor mas alto de la variable cont para poder guardar el avion que mas salio
    vuelos10k:= 0;
    vuelos5k:= 0;
    leer(r);
    while (r.cod <> 44) do
      begin
        auxCod:= r.cod;
        cont:= 0;
        while (auxCod = r.cod) do
          begin
            cont:= cont + 1; //Cuento cuantas veces salio el avion de diferentes paises
            auxPais:= r.salida;
            while (auxPais = r.salida) and (r.cod = auxCod) do
              begin
                //========== PUNTO 1
                sumaKm:= sumaKm + r.km
                if (r.km < min1) then
                  begin
                    min2:= min1;
                    avMin2:= avMin1;
                    min1:= r.km;
                    avMin1:= r.cod;
                  end
                else
                  if (r.km < min2) then
                    begin
                      min2:= r.km;
                      avMin2:= r.cod;
                    end;
                if (r.km > max1) then
                  begin
                    max2:= max1;
                    avMax2:= avMax1;
                    max1:= r.km;
                    avMax1:= r.cod;
                  end
                else
                  if (r.km > max2) then
                    begin
                      max2:= r.km;
                      avMax2:= r.cod;
                    end;
                //========== PUNTO 1

                //========== PUNTO 3
                if (r.km > 5000) and (r.ocupado < 60) then
                  vuelos5k:= vuelos5k + 1;

                //========== PUNTO 4
                if (r.km < 10000) and ((r.entrada = 'Australia') or (r.entrada = 'Nueva Zelanda') ) then
                  vuelos10k:= vuelos10k + 1;
                leer(r);
              end;
            
            //========== PUNTO 2
            if (cont1 < cont) then
              begin
                cont1:= cont;
                avMasPais:= auxCod;
              end;
        end;
    end;

    imprimir (avMin1,avMin2,avMax1,avMax2,avMasPais,vuelos5k,vuelos10k);
  end;

//Programa principal
begin
  inciso;
end.}