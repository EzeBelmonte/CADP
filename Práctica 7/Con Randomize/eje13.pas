{13. La tienda de libros Amazon Books está analizando información de algunas editoriales. Para ello, Amazon cuenta con una tabla con las 
35 áreas temáticas utilizadas para clasificar los libros (Arte y Cultura, Historia, Literatura, etc.).
De cada libro se conoce su título, nombre de la editorial, cantidad de páginas, año de edición, cantidad de veces que fue vendido y 
código del área temática (1..35).

Realizar un programa que:

A) Invoque a un módulo que lea la información de los libros hasta ingresar el título “Relato de un
náufrago” (que debe procesarse) y devuelva en una estructura de datos adecuada para la
editorial “Planeta Libros”, con la siguiente información:
- Nombre de la editorial
- Año de edición del libro más antiguo
- Cantidad de libros editados
- Cantidad total de ventas entre todos los libros
- Detalle con título, nombre del área temática y cantidad de páginas de todos los libros con
más de 250 ventas.
B) Invoque a un módulo que reciba la estructura generada en A) e imprima el nombre de la editorial
y el título de cada libro con más de 250 ventas.}

program eje13;
uses
  sysutils; //Externo a CADP
const
  dimF = 35;
type
  str50 = string[50];
  codArea = 1..35;
  REG_libro = record
    titulo,editorial: str50;
    paginas,anioEdi,vendidos: integer;
    cod: codArea;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_libro;
    sig: Lista;
  end;

  vector = array [1..dimF] of string;

// ================ CARGA LISTA
procedure cargarVector (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      begin
        v[x]:= Concat('Area-',IntToStr(x));
      end;
  end;
procedure crearLista (var L: Lista; r: REG_libro);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_libro);
  begin
    with r do
      begin
        titulo:= Concat('Titulo-',IntToStr(random(10000)));
        editorial:= Concat('Editorial-',IntToStr(random(20000)));
        paginas:= random(400) + 100;
        anioEdi:= random(100) + 1900;
        vendidos:= random(200) + 100;
        cod:= random(35) + 1;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_libro;
    x: integer;
  begin
    for x:=1 to 200 do // Para probar el programa uso un FOR
      begin
        preguntas(r);
        crearLista(L,r);
      end;
  end;
// ================ CARGA LISTA

// =========== INCISO B
procedure incisoB (L: Lista);
  begin
    while (L <> nil) do
      begin
        writeln ('Editorial: ',L^.dato.editorial);

        if (L^.dato.vendidos > 250) then
          writeln ('Titulo: ',L^.dato.titulo);

        L:= L^.sig;
      end;
  end;
// =========== INCISO B

//Programa principal
var
  L: Lista;
  v: vector;
begin
  Randomize; //Externo a CADP
  L:= nil;
  cargarVector(v);
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisoB(L);
end.