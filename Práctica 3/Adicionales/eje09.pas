{9. Realizar un programa que lea información de los candidatos ganadores de las últimas elecciones a intendente de
la provincia de Buenos Aires. Para cada candidato se lee: localidad, apellido del candidato, cantidad de votos
obtenidos y cantidad de votantes de la localidad. La lectura finaliza al leer la localidad ‘Zárate’, que debe procesarse.
Informar:
● El intendente que obtuvo la mayor cantidad de votos en la elección.
● El intendente que obtuvo el mayor porcentaje de votos de la elección.}

program eje09;

type
  str30 = string[30];
  REG_candidatos = record
    localidad,apellido: str30;
    cantVotos,votantes: integer;
  end;

procedure leer(var r: REG_candidatos);
  begin
    write ('Localidad: '); readln(r.localidad);
    write ('Apellido: '); readln(r.apellido);
    write ('Votos obtenidos: '); readln(r.cantVotos);
    write ('Votantes: '); readln(r.votantes);
  end;

procedure inciso;
  var
    r: REG_candidatos;
    intenMax: integer;
    porcentaje: real;
    apeMax,apePorcen: str30;
  begin
    intenMax:= 0;
    porcentaje:= 0;
    repeat
      leer(r);
      //PUNTO 1
      if (intenMax < r.cantVotos) then
        begin
          intenMax:= r.cantVotos;
          apeMax:= r.apellido;
        end;

      //PUNTO 2
      if (porcentaje < ((r.cantVotos * 100) / r.votantes)) then
        begin
          porcentaje:= (r.cantVotos * 100) / r.votantes;
          apePorcen:= r.apellido;
        end;

    until r.localidad = 'Zarate';

    writeln ('El intendente que obtuvo la mayor cantidad de votos en la elección fue: ',apeMax,'.');
    writeln ('El intendente que obtuvo el mayor porcentaje de votos de la elección fue: ',apePorcen,'.');
  end;

//Programa principal
begin
  inciso;
end.