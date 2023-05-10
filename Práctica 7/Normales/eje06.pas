{6. El Observatorio Astronómico de La Plata ha realizado un relevamiento sobre los distintos objetos
astronómicos observados durante el año 2015. Los objetos se clasifican en 7 categorías: 1: estrellas,
2: planetas, 3: satélites, 4: galaxias, 5: asteroides, 6: cometas y 7: nebulosas.
Al observar un objeto, se registran los siguientes datos: código del objeto, categoría del objeto (1..7),
nombre del objeto, distancia a la Tierra (medida en años luz), nombre del descubridor y año de su descubrimiento.

A. Desarrolle un programa que lea y almacene la información de los objetos que han sido
observados. Dicha información se lee hasta encontrar un objeto con código -1 (el cual no
debe procesarse). La estructura generada debe mantener el orden en que fueron leídos los
datos.

B. Una vez leídos y almacenados todos los datos, se pide realizar un reporte con la siguiente
información:

1. Los códigos de los dos objetos más lejanos de la tierra que se hayan observado.
2. La cantidad de planetas descubiertos por "Galileo Galilei" antes del año 1600.
3. La cantidad de objetos observados por cada categoría.
4. Los nombres de las estrellas cuyos códigos de objeto poseen más dígitos pares que
impares.}

program eje06;
const
  dimF = 7;
type
  objeto = 1..7;
  REG_objeto = record
    cod,anioDes: integer;
    categ: objeto;
    nomObj,nomDes: string[20];
    distancia: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_objeto;
    sig: Lista;
  end;

  vector = array [1..dimF] of integer;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_objeto);
  var
    nue,pos: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        pos:= L;
        while (pos^.sig <> nil) do
          pos:= pos^.sig;
        
        pos^.sig:= nue;
      end;
  end;

procedure preguntas (var r: REG_objeto);
  begin
    with r do
      begin
        write ('Codigo del objeto: '); readln(cod);
        if (cod <> - 1) then
          begin
            write ('Categoria (1 a 7): '); readln(categ);
            write ('Nombre del objeto: '); readln(nomObj);
            write ('Distancia a la tierra (anios luz): '); readln(distancia);
            write ('Nombre del descubridor: '); readln(nomDes);
            write ('Anio de su descubrimiento: '); readln(anioDes);
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_objeto;
  begin
    preguntas(r);
    while (r.cod <> - 1) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

// ========== INCISOS
function pares (cod: integer): boolean;
  var
    par,impar: integer;
  begin
    par:= 0;
    impar:= 0;
    while (cod > 0) do
      begin
        if ((cod mod 2) = 0) then
          par:= par + 1
        else
          impar:= impar + 1;
        cod:= cod div 10;
      end;  
    if (par > impar) then
      pares:= true
    else
      pares:= false;
  end;

procedure incisos (L: Lista);
  var
    x,cod1,cod2,cantPlanetas,cantEstrellas: integer;
    dis1,dis2: real;
    v: vector;
  begin
    dis1:= 0;
    dis2:= 0;
    cantPlanetas:= 0;
    cantEstrellas:= 0;
    for x:=1 to dimF do
      v[x]:= 0;

    while (L <> nil) do
      begin
        //Punto 1
        if (L^.dato.distancia > dis1) then
          begin
            dis2:= dis1;
            cod2:= cod1;
            dis1:= L^.dato.distancia;
            cod1:= L^.dato.cod;
          end
        else
          if (L^.dato.distancia > dis2) then
            begin
              dis2:= L^.dato.distancia;
              cod2:= L^.dato.cod;
            end;

        //Punto 2
        if (L^.dato.nomDes = 'Galileo Galilei') and (L^.dato.categ = 2) and (L^.dato.anioDes < 1600) then
          cantPlanetas:= cantPlanetas + 1;
        
        //Punto 3
        v[L^.dato.categ]:= v[L^.dato.categ] + 1;

        //Punto 4
        if (pares(L^.dato.cod)) and (L^.dato.categ = 1) then
          cantEstrellas:= cantEstrellas + 1;

        L:= L^.sig;
      end;
    
    writeln ('Los codigos de los dos objetos mas lejanos de la tierra que se hayan observado son: ',cod1,' y ',cod2,'.');
    writeln ('La cantidad de planetas descubiertos por Galileo Galilei antes del anio 1600 son: ',cantPlanetas,'.');
    writeln ('La cantidad de objetos observados por cada categoria:');
    for x:=1 to dimF do
      writeln ('Categoria ',x,': ',v[x]);
    writeln ('Los nombres de las estrellas cuyos codigos de objeto poseen mas digitos pares que impares son: ',cantEstrellas,'.');
  end;
// ========== INCISOS

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L);
end.