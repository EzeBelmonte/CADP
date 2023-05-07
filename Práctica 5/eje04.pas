{4) Indicar los valores que imprimen los siguientes programas en Pascal. Justificar mediante prueba de
escritorio.}

{a) 

program punteros;

type
  cadena = string[50];
  puntero_cadena = ^cadena;

var
  pc: puntero_cadena;
begin
  pc^:= 'un nuevo texto';
  new(pc);
  writeln(pc^); // Error
end.}

// ===========================================
{b) 

program punteros;

type
  cadena = string[50];
  puntero_cadena = ^cadena;

var
  pc: puntero_cadena;
begin
  new(pc);
  pc^:= 'un nuevo nombre';
  writeln(sizeof(pc^), ' bytes'); // 51
  writeln(pc^); // 'un nuevo nombre'
  dispose(pc);
  pc^:= 'otro nuevo nombre'; // Error porque quiere guardar algo en un puntero borrado
end.}

// ===========================================
{c) 

program punteros;
type
  cadena = string[50];
  puntero_cadena = ^cadena;

procedure cambiarTexto(pun: puntero_cadena);
  begin
    pun^:= 'Otro texto';
  end;

var
  pc: puntero_cadena;
begin
  new(pc);
  pc^:= 'Un texto';
  writeln(pc^); // Un texto
  cambiarTexto(pc);
  writeln(pc^); // Otro texto
end.}

// ===========================================
{d) 

program punteros;
type
  cadena = string[50];
  puntero_cadena = ^cadena;

procedure cambiarTexto(pun: puntero_cadena);
  begin
    new(pun);
    pun^:= 'Otro texto';
  end;

var
  pc: puntero_cadena;
begin
  new(pc);
  pc^:= 'Un texto';
  writeln(pc^); // Un texto
  cambiarTexto(pc);
  writeln(pc^); // Un texto
end.}