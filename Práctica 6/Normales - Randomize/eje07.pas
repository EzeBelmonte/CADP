{7. El Programa Horizonte 2020 (H2020) de la Unión Europea ha publicado los criterios para financiar
proyectos de investigación avanzada. Para los proyectos de sondas espaciales vistos en el ejercicio anterior, se
han determinado los siguientes criterios:
- sólo se financiarán proyectos cuyo costo de mantenimiento no supere el costo de construcción.
- no se financiarán proyectos espaciales que analicen ondas de radio, ya que esto puede realizarse desde la
superficie terrestre con grandes antenas.

A partir de la información disponible de las sondas espaciales (la lista generada en ejercicio 6), implementar
un programa que:
a. Invoque un módulo que reciba la información de una sonda espacial, y retorne si cumple o no con los
nuevos criterios H2020.
b. Utilizando el módulo desarrollado en a) implemente un módulo que procese la lista de sondas de la ESA y
retorne dos listados, uno con los proyectos que cumplen con los nuevos criterios y otro con aquellos que no
los cumplen.
c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.}

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
        duracion:= random(3000);
        writeln ('Duracion en meses: ',duracion);
        costoCons:= random(10000) + 22000;
        writeln ('Costo construccion: ',costoCons:0:2);
        costoMan:= random(10000)+22000;
        writeln ('Costo mantenimiento: ',costoMan:0:2);
        rango:= random(7) + 1;
        writeln ('Rango del espectro electromagnetico: ',rango);
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

// ================ INCISO A
function incisoA (r: REG_esa): boolean;
  begin
    if (r.costoMan < r.costoCons) and (r.rango <> 1) then
      incisoA:= true
    else
      incisoA:= false;
  end;
// ================ INCISO A

// ================ INCISO B
procedure crearListaCumple (var L: lista; r: REG_esa);
  var
    aux: lista;
  begin
    New(aux);
    aux^.dato:= r;
    aux^.sig:= L;
    L:= aux;
  end;

procedure crearListaNoCumple (var L: lista; r: REG_esa);
  var
    aux: lista;
  begin
    New(aux);
    aux^.dato:= r;
    aux^.sig:= L;
    L:= aux;
  end;

procedure incisoB (L: lista; var listaCumple,listaNoCumple: lista);
  begin
    while (L <> nil) do
      begin
        if (incisoA(L^.dato)) then
          crearListaCumple(listaCumple,L^.dato)
        else
          crearListaNoCumple(listaNoCumple,L^.dato);
      end;
  end;
// ================ INCISO B

{c. Invoque a un módulo que reciba una lista de proyectos de sondas espaciales e informe la cantidad y el
costo total (construcción y mantenimiento) de los proyectos que no serán financiados por H2020. Para ello,
utilice el módulo realizado en b.}
// ================ INCISO C
procedure incisoC (L: lista);
  var
    cantidad: integer;
    sumaCostos: real;
  begin
    cantidad:= 0;
    while (L <> nil) do
      begin
        sumaCostos:= 0;
        cantidad:= cantidad + 1;
        sumaCostos:= L^.dato.costoCons + L^.dato.costoMan;
        writeln ('Costo total del la sonsa ',L^.dato.nom,' es de: $',sumaCostos:0:2);
        L:= L^.sig;
      end;
    writeln ('La cantidad proyectos que no seran financiados es :',cantidad);
  end;
// ================ INCISO C

//Programa principal
var
  L,listaCumple,listaNoCumple: lista;
begin
  Randomize; //Externo a CADP
  L:= nil;
  cargarLista(L);

  //INCISO B
  listaCumple:= nil;
  listaNoCumple:= nil;
  incisoB(L,listaCumple,listaNoCumple);
  //INCISO B
  incisoC(listaNoCumple);
end.