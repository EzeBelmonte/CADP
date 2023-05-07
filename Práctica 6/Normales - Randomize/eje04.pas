{4. Utilizando el programa del ejercicio 1, realizar los siguientes módulos:
a. Máximo: recibe la lista como parámetro y retorna el elemento de valor máximo.
b. Mínimo: recibe la lista como parámetro y retorna el elemento de valor mínimo.
c. Múltiplos: recibe como parámetros la lista L y un valor entero A, y retorna la cantidad de elementos de la
lista que son múltiplos de A.}

program eje04;
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

function valorMax (l:lista): integer;
  begin
    valorMax:=0;
    while (l <> nil) do
      begin
        if (l^.num > valorMax) then
          valorMax:= l^.num;
        l:= l^.sig;
      end;
  end;

function valorMin (l:lista): integer;
  begin
    valorMin:=32767;
    while (l <> nil) do
      begin
        if (l^.num < valorMin) then
          valorMin:= l^.num;
        l:= l^.sig;
      end;
  end;

function multiplos (l:lista; num: integer): integer;
  begin
    multiplos:=0;
    while (l <> nil) do
      begin
        if ((l^.num mod num) = 0) then
          multiplos:= multiplos + 1;
        l:= l^.sig;
      end;
  end;

procedure incisos (l:lista);
  var
    num: integer;
  begin
    writeln ('El valor maximo es ',valorMax(l));
    writeln ('El valor minimo es ',valorMin(l));

    writeln ('Numero: '); readln(num);
    writeln ('La cantidad de multiplos de ',num,' son ',multiplos(l,num));
  end;

var
  pri : lista;
  valor : integer;
begin
  Randomize; //Externo a CADP
  pri := nil;
  valor:= random(50); //Externo a CADP
  writeln('Ingrese un numero: ',valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      valor:= random(50); //Externo a CADP
      writeln('Ingrese un numero: ',valor);
    end;
  writeln ('========== FIN CARGA ==========')
  incisos(pri);
end.