{8. Utilizando el programa del ejercicio 1, modificar el módulo armarNodo para que los elementos de la lista
queden ordenados de manera ascendente (insertar ordenado).}

program JugamosConListas;
type

  lista = ^nodo;
  nodo = record
    num : integer;
    sig : lista;
  end;

procedure armarNodo(var L: lista; v: integer);
  var
    aux,ant,act : lista;
  begin
    new(aux);
    aux^.num := v;
    aux^.sig := nil;
    
    if (L = nil) then
      L:= aux
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.num < v) do
          begin
            ant:= act;
            act:= act^.sig;
          end;
        if (ant = act) then
          L:= aux
        else
          ant^.sig:= aux;
        aux^.sig:= act;
      end;
  end;

procedure imprimir (L: lista);
  begin
    while (L <> nil) do
      begin
        writeln (L^.num);
        L:= L^.sig;
      end;
  end;

var
  pri : lista;
  valor : integer;
begin
  pri := nil;
  writeln('Ingrese un numero: '); readln(valor);
  while (valor <> 0) do 
    begin
      armarNodo(pri, valor);
      writeln('Ingrese un numero: '); readln(valor);
    end;

  writeln ('====== FIN CARGA ======');
  imprimir(pri);
end.