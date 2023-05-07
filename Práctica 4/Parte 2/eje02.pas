{2. Realice un programa que resuelva los siguientes incisos:

a. Lea nombres de alumnos y los almacene en un vector de a lo sumo 500 elementos. La lectura finaliza
cuando se lee el nombre ‘ZZZ’, que no debe procesarse.

b. Lea un nombre y elimine la primera ocurrencia de dicho nombre en el vector.

c. Lea un nombre y lo inserte en la posición 4 del vector.

d. Lea un nombre y lo agregue al vector.

Nota: Realizar todas las validaciones necesarias.}

program eje02;

const
  dimF = 500;

type
  str20 = string[20];
  vector = array [1..dimF] of str20;

procedure incisoA (var v: vector; var dimL: integer);
  var
    nom: str20;
  begin
    write ('Nombre: '); readln(nom);
    while (nom <> 'zzz') and (dimL < dimF) do
      begin
        dimL:= dimL + 1;
        v[dimL]:= nom;
        write ('Nombre: '); readln(nom);
      end;
  end;

procedure incisoB (var v: vector; var dimL: integer);
  var
    nom: str20;
    cumple: boolean;
    pos,x: integer;
  begin
    if (dimL > 0) then
      begin
        cumple:= false;
        pos:= 1;
        write ('Nombre a borrar: '); readln(nom);
        while (pos <= dimL) and not(cumple) do
          begin
            if (v[pos] = nom) then
              cumple:= true
            else
              pos:= pos + 1;
          end;
        
        if (cumple) then
          begin
            for x:= pos to dimL - 1 do
              v[x]:= v[x+1];
            dimL:= dimL - 1;
          end;
      end;
  end;

procedure incisoC (var v: vector; dimL: integer);
  var
    nom: str20;
  begin
    if (dimL <= 4) then
      begin
        write ('Nombre para agregar Pos 4: '); readln(nom);
        v[4]:= nom;
      end;
  end;

procedure incisoD (var v: vector; var dimL: integer);
  var
    nom: str20;
  begin
    if (dimL < dimF) then
      begin
        write ('Nombre para agregar: '); readln(nom);
        dimL:= dimL + 1;
        v[dimL]:= nom;
      end;
  end;

//Programa principal
var
  v: vector;
  dimL: integer;
begin
  dimL:= 0;
  incisoA(v,dimL);
  incisoB(v,dimL);
  incisoC(v,dimL);
  incisoD(v,dimL);
end.