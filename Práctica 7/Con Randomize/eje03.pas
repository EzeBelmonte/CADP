{3. Una remisería dispone de información acerca de los viajes realizados durante el mes de mayo de
2020. De cada viaje se conoce: número de viaje, código de auto, dirección de origen, dirección de
destino y kilómetros recorridos durante el viaje. Esta información se encuentra ordenada por código
de auto y para un mismo código de auto pueden existir 1 o más viajes. Se pide:
a. Informar los dos códigos de auto que más kilómetros recorrieron.
b. Generar una lista nueva con los viajes de más de 5 kilómetros recorridos, ordenada por número
de viaje.}

program eje03;
uses
  sysutils; //Externo a CADP
type
  REG_viaje = record
    numViaje,codAuto,dir1S,dir2S,dir1D,dir2D: integer;
    km: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_viaje;
    sig: Lista;
  end;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_viaje);
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
        while (act <> nil) and (act^.dato.codAuto < r.codAuto) do
          begin
            ant:= act;
            act:= act^.sig;
          end;
        
        if (ant = act) then
          L:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;
  end;

procedure preguntas (var r: REG_viaje);
  begin
    with r do
      begin
        numViaje:= random (3000);
        codAuto:= random(20) + 1;
        dir1S:= random(31) + 1;
        dir2S:= random(46) + 32;
        dir2D:= random(50) + 131;
        dir2D:= random(46) + 32;
        km:= random(20) + 2;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_viaje;
    dia: integer;
  begin
    repeat
      //write ('Dia: '); readln(dia);
      dia:= random (31) + 1;
      preguntas(r);
      crearLista(L,r)
    until (dia >= 31);
  end;
// ================ CARGA LISTA

// =========== INCISOS
procedure incisoB (var ln: Lista; r: REG_viaje);
  var
    nue,ant,act: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (ln = nil) then
      ln:= nue
    else
      begin
        ant:= ln;
        act:= ln;
        while (act <> nil) and (act^.dato.numViaje < r.numViaje) do
          begin
            ant:= act;
            act:= act^.sig;
          end;
        
        if (ant = act) then
          ln:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;
  end;

procedure incisos (L: Lista; var ln: Lista);
  var
    codAux,cod1,cod2: integer;
    sumaKm,km1,km2: real;
  begin
    km1:= 0;
    km2:= 0;
    while (L <> nil) do
      begin
        sumaKm:= 0;
        codAux:= L^.dato.codAuto;
        while (L <> nil) and (codAux = L^.dato.codAuto) do
          begin
            //Inciso A
            sumaKm:= sumaKm + L^.dato.km;

            //inciso B
            if (L^.dato.km > 5) then
              incisoB(ln,L^.dato);

            L:= L^.sig;
          end;
        //Inciso A
        if (sumaKm > km1) then
          begin
            km2:= km1;
            cod2:= cod1;
            km1:= sumaKm;
            cod1:= codAux;
          end
        else
          if (sumaKm > km2) then
            begin
              km2:= sumaKm;
              cod2:= codAux;
            end;
      end;

      //Inciso A
      writeln ('Los dos codigos de auto que mas kilometros recorrieron son el ',cod1,' y el ',cod2);
  end;
// =========== INCISOS

//Programa principal
var
  L,listaNueva: Lista;
begin
  Randomize; //Externo a CADP
  L:= nil;
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  listaNueva:= nil;
  incisos(L,listaNueva);
end.