{9. Un cine posee la lista de películas que proyectará durante el mes de Febrero. De cada película se tiene: 
código de película, título de la película, código de género (1: acción, 2: aventura, 3: drama, 4: suspenso, 5: comedia, 6: bélica, 
7: documental y 8: terror) y puntaje promedio otorgado por las críticas. Dicha estructura no posee orden alguno.
Se pide:
a) Actualizar (en la lista que se dispone) el puntaje promedio otorgado por las críticas. Para ello se
debe leer desde teclado las críticas que han realizado críticos de cine, de cada crítica se lee: DNI
del crítico, apellido y nombre del crítico, código de película y el puntaje otorgado. La lectura
finaliza cuando se lee el código de película -1 y la información viene ordenada por código de
película.
b) Informar el código de género que más puntaje obtuvo entre todas las críticas.
c) Informar el apellido y nombre de aquellos críticos que posean la misma cantidad de dígitos pares
que impares en su DNI.
d) Realizar un módulo que elimine de la lista que se dispone una película cuyo código se recibe
como parámetro (el mismo puede no existir).}

program eje09;
type
  str20 = string[20];
  codG = 1..8;
  REG_critico = record
    dni,cod: integer;
    apellido,nombre: str20;
    puntaje: real;
  end;

  REG_pelicula = record
    codPeli: integer;
    codGen: codG;
    titulo: str20;
    puntaje: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_pelicula;
    sig: Lista;
  end;

// ================ CARGA LISTA
procedure crearListaP (var L: Lista; r: REG_pelicula);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;  
  end;

procedure preguntas (var r: REG_pelicula);
  begin
    with r do
      begin
        write ('Cod de pelicula: '); readln(codPeli);
        write ('Titulo: '); readln(titulo);
        write ('Cod de genero: '); readln(codGen);
        write ('Puntaje promedio: '); readln(puntaje);
      end;
  end;

procedure cargarListaPeli (var L: Lista);
  var
    x: integer;
    r: REG_pelicula;
  begin
    for x:=1 to 100 do //Como no aclara hasta cuando se carga la lista, creo una de 100 elementos
      begin
        preguntas(r);
        crearListaP(L,r);
      end;
  end;
// ================ CARGA LISTA

// ========== INCISOS
function imparPar (dni: integer): boolean;
  var
    par, impar: integer;
  begin
    par:= 0;
    impar:= 0;
    while (dni > 0) do
      begin
        if ((dni mod 2) = 0) then
          par:= par + 1
        else
          impar:= impar + 1;
        dni:= dni div 10;
      end;
    if (par = impar) then
      imparPar:= true
    else
      imparPar:= false;
  end;

procedure leerCrit (var r: REG_critico);
  begin
    with r do
      begin
        write ('D.N.I: '); readln(dni);
        write ('Apellido: '); readln(apellido);
        write ('Nombre: '); readln(nombre);
        write ('Cod de pelicula: '); readln(cod);
        write ('Puntaje: '); readln(puntaje);
      end;
  end;

procedure incisos (var L: Lista);
  var
    r: REG_critico;
    auxL: Lista;
    genMax,codAux,contador: integer;
    promMax,promedio: real;
  begin
    promMax:= 0;
    leerCrit(r);
    while (r.cod <> -1) do
      begin
        codAux:= r.cod;
        contador:= 0;
        promedio:= 0;
        while (r.cod <> -1) and (codAux = r.cod) do
          begin
            //Inciso A
            promedio:= promedio + r.puntaje;
            contador:= contador + 1;

            //Inciso C
            if (imparPar(r.dni)) then
              writeln (r.apellido,' ',r.nombre,' posee la misma cantidad de digitos pares que impares en su DNI.');
            
            leerCrit(r);
          end;
        //Inciso A
        promedio:= promedio / contador;
        auxL:= L;
        while (auxL <> nil) and (auxL^.dato.codPeli <> codAux) do
          auxL:= auxL^.sig;
        auxL^.dato.puntaje:= promedio;

        //Inciso B
        if (promMax < promedio) then
          begin
            promMax:= promedio;
            genMax:= auxL^.dato.codGen;
          end;
      end;
    
    writeln ('El codigo de genero que mas puntaje obtuvo entre todas las criticas fue: ',genMax,'.');
  end;

procedure borrarPeli (var L: Lista);
  var
    ant,act: Lista;
    cod: integer;
  begin
    write ('Cod. de pelicula a borrar: '); readln(cod);
    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.codPeli <> cod) do
      begin
        ant:= act;
        act:= act^.sig;
      end;
    if (act <> nil) then
      begin
        if (ant = act) then
          L:= L^.sig
        else
          ant^.sig:= act^.sig;
        dispose(act);
      end;
  end;
// ========== INCISOS

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarListaPeli(L);
  writeln ('======= FIN CARGA =======');
  incisos(L);
  borrarPeli(L);
end.