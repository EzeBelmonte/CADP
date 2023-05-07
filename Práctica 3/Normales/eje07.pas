{7. Realizar un programa que lea información de centros de investigación de Universidades Nacionales. De cada
centro se lee su nombre abreviado (ej. LIDI, LIFIA, LINTI), la universidad a la que pertenece, la cantidad de
investigadores y la cantidad de becarios que poseen. La información se lee de forma consecutiva por universidad y
la lectura finaliza al leer un centro con 0 investigadores, que no debe procesarse.

Informar:
● Cantidad total de centros para cada universidad.
● Universidad con mayor cantidad de investigadores en sus centros.
● Los dos centros con menor cantidad de becarios.}

program eje07;

type
  str20 = string[20];

  REG_centroInv = record
    centro,uni: str20;
    Investigadores,becarios: integer;
  end;

procedure leer (var r:REG_centroInv);
  begin
    write ('Nombre: '); readln(r.centro);
    write ('Universidad: '); readln(r.uni);
    write ('Cant. Investigadores: '); readln(r.investigadores);
    if (r.investigadores <> 0) then
      begin
        write ('Cant. Becarios: '); readln(r.becarios);
      end;
  end;

procedure inciso;
  var
    r: REG_centroInv;
    auxUni,uniMax,centroMin1,centroMin2: str20;
    cantCentros,max,maxInv,min,min1,min2: integer;
  begin
    leer(r);
    maxInv:= 0;
    min1:= 0;
    min2:= 0;
    while (r.investigadores <> 0) do
      begin
        auxUni:= r.uni;
        cantCentros:= 0;
        max:= 0;
        min:= 0;
        while (auxUni = r.uni) do
          begin
            cantCentros:= cantCentros + 1;
            max:= max + r.investigadores;
            min:= min + r.becarios;
            leer(r);
          end;
        
        //PUNTO 1
        writeln ('La facultad ',auxUni,' tiene ',cantCentros,' centros.');

        //PUNTO 2
        if (maxInv < max) then
          begin
            maxInv:= max;
            uniMax:= r.uni;
          end;
        
        //PUNTO 3
        if (min1 > min) then
          begin
            min2:= min1;
            centroMin2:= centroMin1;
            min1:= min;
            centroMin1:= r.centro;
          end
        else
          if (min < min2) then
            begin
              min2:= min;
              centroMin2:= r.centro;
            end;
      end;
    
    //PUNTO 2
    writeln ('La universidad con mayor cantidad de investigadores en sus centros es: ',uniMax);

    //PUNTO 3
    writeln ('Los dos centros con menor cantidad de becarios son: ',centroMin1,' y ',centroMin2);
  end;

//Programa principal
begin
  inciso;
end.