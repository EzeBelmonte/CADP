{3. Utilizando el programa del ejercicio 1, realizar los siguientes cambios:
a. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados (agregar atrás).
b. Modificar el módulo armarNodo para que los elementos se guarden en la lista en el orden en que fueron
ingresados, manteniendo un puntero al último ingresado.}


//INCISO A
{program eje03;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;

procedure armarNodo(var L: lista; v: integer);
  var
    aux, pos: lista;
  begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;
    if (L = nil) then
      L:=aux
    else
      begin
        pos:= L;
        while (pos^.sig <> nil) do
          pos:= pos^.sig;
        pos^.sig:= aux;
      end;
  end;

procedure imprimir (l:lista);
  begin
    while (l <> nil) do
      begin
        writeln(l^.num);
        l:= l^.sig;
      end;
  end;

var
  pri : lista;
  valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero');
      read(valor);
    end;
  imprimir(pri);
end.}

//INCISO B
program eje03;
type
  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;

procedure armarNodo(var L,ultimo: lista; v: integer);
  var
    aux, pos: lista;
  begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;
    ultimo:= aux;
    if (L = nil) then
      L:=aux
    else
      begin
        pos:= L;
        while (pos^.sig <> nil) do
          pos:= pos^.sig;
        pos^.sig:= aux;
      end;
  end;

procedure imprimir (l,ultimo:lista);
  begin
    while (l <> nil) do
      begin
        writeln(l^.num);
        l:= l^.sig;
      end;
    writeln(ultimo^.num);
  end;

var
  pri,ultimo : lista;
  valor : integer;
begin
  pri:= nil;
  ultimo:= nil;
  writeln('Ingrese un numero');
  read(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri,ultimo, valor);
      writeln('Ingrese un numero');
      read(valor);
    end;
  writeln('=========== FIN CARGA ===========');
  imprimir(pri,ultimo);
end.