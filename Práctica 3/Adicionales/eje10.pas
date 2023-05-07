{10. Un centro de investigación de la UNLP está organizando la información de las 320 especies de plantas con las
que trabajan. Para cada especie se ingresa su nombre científico, tiempo promedio de vida (en meses), tipo de
planta (por ej. árbol, conífera, arbusto, helecho, musgo, etc.), clima (templado, continental, subtropical, desértico,
etc.) y países en el mundo donde se las encuentra. La información de las plantas se ingresa ordenada por tipo de
planta y, para cada planta, la lectura de países donde se las encuentra finaliza al ingresar el país 'zzz'. 

Al finalizar la lectura, informar:
● El tipo de planta con menor cantidad de plantas.
● El tiempo promedio de vida de las plantas de cada tipo.
● El nombre científico de las dos plantas más longevas.
● Los nombres de las plantas nativas de Argentina que se encuentran en regiones con clima subtropical.
● El nombre de la planta que se encuentra en más países.}

program eje10;

type
  str50 = string[50];

  REG_centro = record
    nombre,tipo,clima,pais: str50;
    tiempoProm: real;
  end;

procedure leer(var r: REG_centro);
  begin
    write ('Nombre cientifico: '); readln(r.nombre);
    write ('Tiempo prom de vida (en meses): '); readln(r.tiempoProm);
    write ('Tipo de planta: '); readln(r.tipo);
    write ('Clima: '); readln(r.clima);
    write ('Pais: '); readln(r.pais);
  end;

procedure inciso;
  var
    x,min,contador,contadorPais,contMax: integer;
    r: REG_centro;
    auxTipo,tipoMin,nomLong1,nomLong2,nomMax: str50;
    tiempoPromedio,max1,max2: real;
    cumple: boolean;
  begin
    min:= 32767;
    max1:= 0;
    max2:= 0;
    contMax:= 0;

    leer(r);
    for x:= 1 to 320 do
      begin
        contador:= 0;
        tiempoPromedio:= 0;
        auxTipo:= r.tipo;
        contadorPais:= 0;
        while (auxTipo = r.tipo) do
          begin
            cumple:= false;
            contador:= contador + 1;
            tiempoPromedio:= tiempoPromedio + r.tiempoProm;
            
            while (r.pais <> 'zzz') do
              begin
                contadorPais:= contadorPais + 1;
                write ('Pais: '); readln(r.pais);
                if (r.clima = 'subtropical') and (r.pais = 'argentina') and not(cumple) then
                  cumple:= true;
              end;
            //PUNTO 4
            if (cumple) then
              writeln (r.nombre,' es nativas de Argentina que se encuentran en regiones con clima subtropical.');

            //PUNTO 5
            if (contadorPais > contMax) then
              begin
                contMax:= contadorPais;
                nomMax:= r.nombre;  
              end;

            leer(r);
          end;

        //PUNTO 1
        if (min > contador) then
          begin
            min:= contador;
            tipoMin:= auxTipo;
          end;
        
        //PUNTO 2
        tiempoPromedio:= tiempoPromedio / contador;
        writeln ('El tiempo promedio de vida de las plantas de cada tipo ',auxTipo,' es: ',tiempoPromedio:3:2,'meses.');

        //PUNTO 3
        if (max1 < r.tiempoProm) then
          begin
            max2:= max1;
            nomLong2:= nomLong1;
            max1:= r.tiempoProm;
            nomLong1:= r.nombre;
          end
        else
          if (max2 < r.tiempoProm) then
            begin
              max2:= r.tiempoProm;
              nomLong2:= r.nombre;
            end;
      end;
    
    writeln ('El tipo de planta con menor cantidad de plantas es: ',tipoMin);
    writeln ('El nombre científico de las dos plantas más longevas son: ',nomLong1,' y ',nomLong2);
    writeln ('El nombre de la planta que se encuentra en más países es: ',nomMax);
  end;

//Programa principal
begin
  inciso;
end.