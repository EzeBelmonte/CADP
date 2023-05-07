{16. La empresa distribuidora de una app móvil para corredores ha organizado una competencia mundial, en
la que corredores de todos los países participantes salen a correr en el mismo momento en distintos puntos
del planeta. La app registra, para cada corredor, el nombre y apellido, la distancia recorrida (en kilómetros), el
tiempo (en minutos) durante el que corrió, el país y la ciudad desde donde partió, y la ciudad donde finalizó
su recorrido. Realizar un programa que permita leer y almacenar toda la información registrada durante la
competencia. La lectura finaliza al ingresar la distancia -1.

Una vez que se han almacenado todos los datos, informar:
o La cantidad total de corredores, la distancia total recorrida y el tiempo total de carrera de todos
los corredores.
o El nombre de la ciudad que convocó la mayor cantidad de corredores y la cantidad total de
kilómetros recorridos por los corredores de esa ciudad.
o La distancia promedio recorrida por corredores de Brasil.
o La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad.
o El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston.}

program eje16;
type
  REG_app = record
    nombre,apellido,pais,ciudadS,ciudadF: string[30];
    km,mins: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_app;
    sig: Lista;
  end;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_app);
  var
    nue,ant,act: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.dato.pais < r.pais) do
          begin
              if (act^.dato.pais = r.pais) then
                begin
                  while (act <> nil) and (act^.dato.pais = r.pais) and (act^.dato.ciudadS < r.ciudadS) do
                    begin
                      ant:= act;
                      act:= act^.sig;
                    end;
                end
              else
                begin
                  ant:= act;
                  act:= act^.sig;
                end;
          end;
        
        if (ant = act) then
          L:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;
  end;

procedure preguntas (var r: REG_app);
  begin
    with r do
      begin
        write ('Nombre: '); readln(nombre);
        write ('Apellido: '); readln(apellido);
        write ('Km: '); readln(km);
        if (km > -1) then
          begin
            write ('Minutos: '); readln(mins);
            write ('Pais: '); readln(pais);
            write ('Ciudad salida: '); readln(ciudadS);
            write ('Ciudad Finalizo: '); readln(ciudadF);
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_app;
  begin
    preguntas(r);
    while (r.km > -1) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

procedure imprimir (totalCor,ciudadSF: integer; totalKm,totalTiem,cantKm,promKm,pasosProm: real; ciuMax: string);
  begin
    writeln ('La cantidad total de corredores es: ',totalCor,'.');
    writeln ('La distancia total recorrida es: ',totalKm:0:2,'.');
    writeln ('El tiempo total de carrera de los corredores es: ',totalTiem:0:2,'.');
    writeln ('La ciudad ',ciuMax,' convoco la mayor cantidad de corredores y la cantidad total de Km recorridos por los corredores es: ',cantKm:0:2,'.');
    writeln ('La distancia promedio recorrida por corredores de Brasil es: ',promKm:0:2,'.');
    writeln ('La cantidad de corredores que partieron de una ciudad y finalizaron en otra ciudad es: ',ciudadSF,'.');
    writeln ('El paso (cantidad de minutos por km) promedio de los corredores de la ciudad de Boston es: ',pasosProm:0:2);
  end;

// ===============  INCISOS
procedure incisos (L: Lista);
  var
    totalCor,sumaCor,maxCor,ciudadSF: integer;
    totalKm,sumaKm,cantKm,sumaMins,totalTiem,promKm,pasosProm: real;
    ciudad,pais,ciuMax: string[30];
  begin
    maxCor:= 0;
    totalCor:= 0;
    totalKm:= 0;
    totalTiem:= 0;
    promKm:= 0;
    ciudadSF:= 0;
    pasosProm:= 0;
    while (L <> nil) do
      begin
        ciudad:= L^.dato.ciudadS;
        pais:= L^.dato.pais;
        sumaCor:= 0;
        sumaKm:= 0;
        sumaMins:= 0;
        while (L <> nil) and (ciudad = L^.dato.ciudadS) do
          begin
            //Punto 1
            sumaMins:= sumaMins + L^.dato.mins;
            //Punto 2
            sumaCor:= sumaCor + 1;
            sumaKm:= sumaKm + L^.dato.km;
            //Punto 4
            if (L^.dato.ciudadS <> L^.dato.ciudadF) then
              ciudadSF:= ciudadSF + 1;
            L:= L^.sig;
          end;
        //Punto 1
        totalCor:= totalCor + sumaCor;
        totalKm:= totalKm + sumaKm;
        totalTiem:= totalTiem + sumaMins;

        //Punto 2
        if (maxCor < sumaCor) then
          begin
            maxCor:= sumaCor;
            ciuMax:= ciudad;
            cantKm:= sumaKm;
          end;
        //Punto 3;
        if (pais = 'Brasil') then
          begin
            promKm:= sumaKm / sumaCor;
          end;
        
        //Punto 5
        if (ciudad = 'Boston') then
          pasosProm:= sumaKm / sumaMins;
      end;

    imprimir(totalCor,ciudadSF,totalKm,totalTiem,cantKm,promKm,pasosProm,ciuMax);
  end;
// ===============  INCISOS

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  writeln ('========== FIN CARGA ==========');
  // INCISOS
  incisos(L);
  // INCISOS
end.