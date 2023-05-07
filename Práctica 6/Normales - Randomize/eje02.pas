{2. Dado el siguiente código que lee información de personas hasta que se ingresa la persona con dni 0 y luego
imprime dicha información en el orden inverso al que fue leída, identificar los 9 errores.}
program ejercicio2;
type
  lista = ^nodo;
  persona = record
    dni: integer;
    nombre: string;
    apellido: string;
  end;

  nodo = record
    dato: persona;
    sig: lista;
  end;

procedure leerPersona(p: persona); // P es de un tipo diferente al que se mando desde generarLista y esta pasada por valor
  begin
    read(p.dni);
    if (p.dni <> 0)then  //Falta en END del IF;
    begin
      read(p.nombre);
      read(p.apellido); 
  end;

{Carga la lista hasta que llega el dni 0}
procedure generarLista(var l:lista);
  var
    p:nodo; // Nodo no se puede asignar a una variable, es para la lista
  begin
    leerPersona(p);
    while (p.dni <> 0) do // Falta que siga leyendo personas
      begin
        agregarAdelante(l,p);
      end;
  end;

procedure imprimirInformacion(var l:lista); // No se tiene que pasar por referencia porque se pierde el inicio.
  begin
    while (l <> nil) do 
      begin
        writeln('DNI: ', l^.dato.dni, 'Nombre:',l^.nombre, 'Apellido:', l^.apellido); // Falta el .dato a nombre y apellido
        l:= l^.sig;
      end;
  end;