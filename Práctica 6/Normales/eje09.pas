{9. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:

a. EstáOrdenada: recibe la lista como parámetro y retorna true si la misma se encuentra ordenada, o false en
caso contrario.
b. Eliminar: recibe como parámetros la lista y un valor entero, y elimina dicho valor de la lista (si existe). Nota:
la lista podría no estar ordenada.
c. Sublista: recibe como parámetros la lista L y dos valores enteros A y B, y retorna una nueva lista con todos
los elementos de la lista L mayores que A y menores que B.
d. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera ascendente.
e. Modifique el módulo Sublista del inciso anterior, suponiendo que la lista L se encuentra ordenada de
manera descendente.}

program eje09;
type

  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;

procedure armarNodo(var L: lista; v: integer);
  var
    aux : lista;
  begin
    new(aux);
    aux^.num := v;
    aux^.sig := L;
    L := aux;
  end;

// ================ INCISO A
function estaOrdenada (L: lista): boolean;
  var
    x: integer;
    aux: lista;
  begin
    aux:= L^.sig;
    if (aux <> nil) then
      begin
        if (aux^.num > L^.num) then
          begin
            x:= 0;
            while (L <> nil) and (L^.num > x) do
              begin
                x:= L^.num;
                L:= L^.sig;
              end;
          end
        else
          begin
            x:= 32767;
            while (L <> nil) and (L^.num < x) do
              begin
                x:= L^.num;
                L:= L^.sig;
              end;
          end
      end;
    estaOrdenada:= (L = nil);
  end;
// ================ INCISO A

// ================ INCISO B
procedure eliminar (var L: lista; num: integer);
  var
    aux,ant,act: lista;
  begin
    ant:= L;
    act:= L;
    while (act <> nil) and (act^.num <> num) do
      begin
        ant:= act;
        act:= act^.sig;
      end;
    if (act^.num = num) then 
      begin
        if (ant = act) then
          begin
            aux:= L;
            L:= L^.sig;
          end
        else
          begin
            aux:= act;
            ant^.sig:= act^.sig;
          end;
        dispose(aux);
      end;
  end;
// ================ INCISO B

// ================ INCISO C,D y E
procedure crearSublista (var L: lista; n: integer);
  var
    nue: lista;
  begin
    New(nue);
    nue^.num:= n;
    nue^.sig:= L;
    L:= nue;
  end;
// ================ INCISO C,D y E

// ================ INCISO C
procedure sublista (L: lista; var listaSub: lista);
  var
    a,b: integer;
  begin
    write ('Numero A: '); readln(a);
    write ('Numero B: '); readln(b);
    while (L <> nil) do
      begin
        if (L^.num > a) and (L^.num < b) then
          crearSublista(listaSub,L^.num);
        L:= L^.sig;
      end;
  end;
// ================ INCISO C

// ================ INCISO D
procedure sublistaAscendente (L: lista; var listaSub: lista);
  var
    b: integer;
  begin
    write ('Numero B: '); readln(b);
    while (L <> nil) and (L^.num < b) do
      begin
        crearSublista(listaSub,L^.num);
        L:= L^.sig;
      end;
  end;
// ================ INCISO D

// ================ INCISO E
procedure sublistaDescendente (L: lista; var listaSub: lista);
  var
    a: integer;
  begin
    write ('Numero A: '); readln(a);
    while (L <> nil) and (L^.num > a) do
      begin
        crearSublista(listaSub,L^.num);
        L:= L^.sig;
      end;
  end;
// ================ INCISO E

//Programa principal
var
  pri,listaSub : lista;
  valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero: '); readln(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero: '); readln(valor);
    end;
  writeln ('========== FIN CARGA ==========');

  listaSub:=nil;
  //INCISO C
  sublista(pri,listaSub);
  //INCISO C

  //INCISO D
  sublistaAscendente(pri,listaSub);
  //INCISO D

  //INCISO E
  sublistaDescendente(pri,listaSub);
  //INCISO E
end.