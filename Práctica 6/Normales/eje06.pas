{6. La Agencia Espacial Europea (ESA) está realizando un relevamiento de todas las sondas espaciales lanzadas
al espacio en la última década. De cada sonda se conoce su nombre, duración estimada de la misión
(cantidad de meses que permanecerá activa), el costo de construcción, el costo de mantenimiento mensual y
rango del espectro electromagnético sobre el que realizará estudios. Dicho rango se divide en 7 categorías:
1. radio; 2. microondas; 3.infrarrojo; 4. luz visible; 5. ultravioleta; 6. rayos X; 7. rayos gamma.

Realizar un programa que lea y almacene la información de todas las sondas espaciales. La lectura finaliza al
ingresar la sonda llamada “GAIA”, que debe procesarse.
Una vez finalizada la lectura, informar:
a. El nombre de la sonda más costosa (considerando su costo de construcción y de mantenimiento).
b. La cantidad de sondas que realizarán estudios en cada rango del espectro electromagnético.
c. La cantidad de sondas cuya duración estimada supera la duración promedio de todas las sondas.
d. El nombre de las sondas cuyo costo de construcción supera el costo promedio entre todas las sondas.
Nota: para resolver los incisos a), b), c) y d), la lista debe recorrerse la menor cantidad de veces posible}

program eje06;
type
  REG_esa = record
    nom: string;
    duracion,rango: integer;
    costoCons,costoMan: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_esa;
    sig: Lista;
  end;

  vector = array [1..7] of integer;
// ================ CARGA LISTA
procedure crearLista (var L: lista; r: REG_esa);
  var
    aux: lista;
  begin
    New(aux);
    aux^.dato:= r;
    aux^.sig:= L;
    L:= aux;
  end;

procedure preguntas (var r: REG_esa);
  begin
    with r do
      begin
        //La funcion random es EXTERNA a CADP
        write ('Nombre: '); readln(nom);
        writeln ('Duracion en meses: '); readln(duracion);
        writeln ('Costo construccion: '); readln(costoCons);
        writeln ('Costo mantenimiento: '); readln(costoMan);
        writeln ('Rango del espectro electromagnetico: '); readln(rango);
      end;
  end;
procedure cargarLista (var L: lista);
  var
    r: REG_esa;
  begin
    repeat
      preguntas(r);
      crearLista(L,r);
    until r.nom = 'GAIA';
  end;
// ================ CARGA LISTA

// ==== INCISOS A
procedure incisoA (r: REG_esa; var masCosto: real; var sonda: string);
  begin
    if ((r.costoCons + r.costoMan) > masCosto) then
      begin
        masCosto:= r.costoCons + r.costoMan;
        sonda:= r.nom;
      end;
  end;
// ==== INCISOS A

// ==== INCISOS C
function incisoC (duracion,duracionProm: real) : integer;
  begin
    if (duracion > duracionProm) then
      incisoC:= 1
    else
      incisoC:= 0;
  end;
// ==== INCISOS C

// ==== INCISOS C y D - SUMAR DURACION Y COSTOS
procedure sacarPromedio(L: Lista; var sondasTotal: integer; var duracionProm,costoProm: real);
  begin
    while (L <> nil) do
      begin
        sondasTotal:= sondasTotal + 1;
        duracionProm:= duracionProm + L^.dato.duracion;
        costoProm:= costoProm + L^.dato.costoCons;
        L:= L^.sig;
      end;
  end;
// ==== INCISOS C y D - SUMAR DURACION Y COSTOS

// ==== INCISOS
procedure incisos (var L: lista; var v: vector);
  var
    x,sondasTotal,cantSondas: integer;
    duracionProm,costoProm,masCosto: real; 
    sonda: string;
  begin
    cantSondas:= 0;
    masCosto:= 0;
    // INCISO C y D
    sondasTotal:= 0;
    duracionProm:= 0;
    costoProm:= 0;
    sacarPromedio(L,sondasTotal,duracionProm,costoProm);
    duracionProm:= duracionProm / sondasTotal;
    costoProm:= costoProm / sondasTotal;
    // INCISO C y D

    while (L <> nil) do
      begin
        incisoA(L^.dato,masCosto,sonda);
        // INCISO B
        v[L^.dato.rango]:= v[L^.dato.rango] + 1;
        // INCISO C
        cantSondas:= cantSondas + incisoC(L^.dato.duracion,duracionProm);
        // INCISO D
        if (L^.dato.costoCons > costoProm) then
          writeln('La sonda ',L^.dato.nom,' supera el costo de construccion promedio');
        // INCISO D
        L:= L^.sig;
      end;
    
    writeln ('El nombre de la sonda mas costosa (considerando su costo de construccion y de mantenimiento) es: ',sonda);
    writeln ('La cantidad de sondas que realizaran estudios en cada rango del espectro electromagnetico: ');
    for x:=1 to 7 do
      writeln ('En en rango ',x,' la cantidad de sondas que realizaran estudios es: ',v[x]);
    writeln ('La cantidad de sondas cuya duracion estimada supera la duración promedio de todas las sondas es: ',cantSondas);
  end;
// ==== INCISOS

//Programa principal
var
  L: lista;
    v: vector;
    x: integer;
begin
  for x:=1 to 7 do
    v[x]:= 0;

  L:= nil;
  cargarLista(L);
  incisos(L,v);
end.