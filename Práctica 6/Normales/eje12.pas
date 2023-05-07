{12. Una empresa desarrolladora de juegos para teléfonos celulares con Android dispone de información de
todos los dispositivos que poseen sus juegos instalados. De cada dispositivo se conoce la versión de Android
instalada, el tamaño de la pantalla (en pulgadas) y la cantidad de memoria RAM que posee (medida en GB).
La información disponible se encuentra ordenada por versión de Android. Realizar un programa que procese
la información disponible de todos los dispositivos e informe:

a. La cantidad de dispositivos para cada versión de Android.
b. La cantidad de dispositivos con más de 3 GB de memoria y pantallas de a lo sumo a 5 pulgadas.
c. El tamaño promedio de las pantallas de todos los dispositivos.}

program eje12;
type
  REG_celular = record
    version,pulgadas,memoria: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_celular;
    sig: Lista;
  end;

// ================ CARGA LISTA
procedure crearLista(var L: Lista; r: REG_celular);
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
        while (act <> nil) and (act^.dato.version < r.version) do
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

procedure preguntas (var r: REG_celular);
  begin
    with r do
      begin
        writeln ('Version: '); readln(version);
        if (version <> 0) then
          begin
            writeln ('Pulgadas: '); readln(pulgadas);
            writeln ('RAM: '); readln(memoria);
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_celular;
  begin
    preguntas(r);
    while (r.version <> 0) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

// ==== INCISOS B
function incisoB (r: REG_celular): integer;
  begin
    if (r.pulgadas <= 5) and (r.memoria > 3) then
      incisoB:=  1
    else
      incisoB:= 0;
  end;
// ==== INCISOS B

// ==== INCISOS
procedure incisos (L: Lista);
  var
    cant,cantB,cantC: integer;
    ver,prom: real;
  begin
    cantB:= 0;
    cantC:= 0;
    prom:= 0;
    while (L <> nil) do
      begin
        cant:= 0;
        ver:= L^.dato.version;
        while (L <> nil) and (L^.dato.version = ver) do
          begin
            cant:= cant + 1;

            cantB:= cantB + incisoB(L^.dato);
            prom:= prom + L^.dato.pulgadas;
            L:= L^.sig;
          end;
        writeln ('La version ',ver:0:2,' tiene ',cant,' dispositivos.');
        cantC:= cantC + cant;
      end;
    writeln ('La cantidad de dispositivos con mas de 3 GB de memoria y pantallas de a lo sumo  5 pulgadas es: ',cantB);
    prom:= prom / cantC;
    writeln ('El tamaño promedio de las pantallas de todos los dispositivos es: ',prom:0:2);
  end;
// ==== INCISOS

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  writeln ('========== FIN CARGA ==========');
  incisos(L);
end.