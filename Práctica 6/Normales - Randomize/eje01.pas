//1. Dado el siguiente programa:
program JugamosConListas;
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

procedure incisoC (l:lista);
  begin
    while (l <> nil) do
      begin
        writeln(l^.num);
        l:= l^.sig;
      end;
  end;

procedure incisoD (var l:lista);
  var
    num: integer;
    aux: lista;
  begin
    aux:= l;
    writeln ('Incrementar: '); readln(num);
    while (aux <> nil) do
      begin
        aux^.num:= aux^.num + num;
        aux:= aux^.sig;
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
 
  incisoC(pri);
  incisoD(pri);
end.

{
a. Indicar qué hace el programa. // Rta: Guarda numeros
b. Indicar cómo queda conformada la lista si se lee la siguiente secuencia de números: 10 21 13 48 0. //Rta: 0 48 13 21 10
c. Implementar un módulo que imprima los números enteros guardados en la lista generada.
d. Implementar un módulo que reciba la lista y un valor, e incremente con ese valor cada dato de la lista.
}