{10. Una empresa de sistemas está desarrollando un software para organizar listas de espera de clientes. Su
funcionamiento es muy sencillo: cuando un cliente ingresa al local, se registra su DNI y se le entrega un
número (que es el siguiente al último número entregado). El cliente quedará esperando a ser llamado por su
número, en cuyo caso sale de la lista de espera. 

Se pide:
a. Definir una estructura de datos apropiada para representar la lista de espera de clientes.
b. Implementar el módulo RecibirCliente, que recibe como parámetro el DNI del cliente y la lista de clientes
en espera, asigna un número al cliente y retorna la lista de espera actualizada.
c. Implementar el módulo AtenderCliente, que recibe como parámetro la lista de clientes en espera, y retorna
el número y DNI del cliente a ser atendido y la lista actualizada. El cliente atendido debe eliminarse de la lista
de espera.
d. Implementar un programa que simule la atención de los clientes. En dicho programa, primero llegarán
todos los clientes juntos, se les dará un número de espera a cada uno de ellos, y luego se los atenderá de a
uno por vez. El ingreso de clientes se realiza hasta que se lee el DNI 0, que no debe procesarse.}

program eje10;
type
  REG_cliente = record
    dni,num: integer;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_cliente;
    sig: Lista;
  end;

// ================ CARGA LISTA //INCISO A y B
procedure crearLista (var L: Lista; r: REG_cliente);
  var
    nue,aux: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;
    
    if (L = nil) then
      L:= nue
    else
      begin
        aux:= L;
        while (aux^.sig <> nil) do
          aux:= aux^.sig;
        aux^.sig:= nue;
      end;
  end;

procedure RecibirCliente (var L: Lista);
  var
    r: REG_cliente;
  begin
    r.num:= 0;
    write ('D.N.I: '); readln(r.dni);
    while (r.dni <> 0) do
      begin
        r.num:= r.num + 1;
        writeln ('El cliente con de D.N.I ',r.dni,' recibe el numero: ',r.num);
        crearLista(L,r);
        write ('D.N.I: '); readln(r.dni);
      end;
  end;
// ================ CARGA LISTA //INCISO A y B

//INCISO C
procedure AtenderCliente (var L: Lista);
  var
    r: REG_cliente;
    aux: Lista;
  begin
    while (L <> nil) do
      begin
        if (L <> nil) then
          begin
            r:= L^.dato;
            aux:= L;
            L:= L^.sig;
            dispose(aux);
          end;
        writeln ('El cliente con D.N.I ',r.dni,' con numero ',r.num,' fue atendido.');
        writeln ('Apretar ENTER para que pase el siguiente cliente...'); readln();
      end;
  end;
//INCISO C

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  //INCISO A y B
  RecibirCliente(L);
  //INCISO A y B

  //INCISO C
  AtenderCliente(L);
  //INCISO C
end.