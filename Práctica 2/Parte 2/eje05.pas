{5. 
a. Realizar un módulo que reciba un par de números (numA,numB) y retorne si numB es el doble de numA.
b. Utilizando el módulo realizado en el inciso a., realizar un programa que lea secuencias de pares de
números hasta encontrar el par (0,0), e informe la cantidad total de pares de números leídos y la cantidad de
pares en las que numB es el doble de numA.
Ejemplo: si se lee la siguiente secuencia: (1,2) (3,4) (9,3) (7,14) (0,0) el programa debe informar los valores
4 (cantidad de pares leídos) y 2 (cantidad de pares en los que numB es el doble de numA).}

program eje05;

function incisoA(numA, numB: integer): boolean;
  begin
    if (numA*2 = numB) then
      incisoA:= true
    else
      incisoA:= false;
  end;

procedure incisoB;
  var
    numA, numB, cantPares, cantDobles: integer;
  begin
    cantDobles:= 0;
    cantPares:= 0;
    write('Numero A: '); readln(numA);
    write('Numero B: '); readln(numB);
    while (numA <> 0) or (numB <> 0) do
      begin
        cantPares:= cantPares + 1;
        if (incisoA(numA,numB)) then
          cantDobles:= cantDobles + 1;
        write('Numero A: '); readln(numA);
        write('Numero B: '); readln(numB);
      end;
    writeln('La cantidad de pares leidos fueron ',cantPares);
    writeln('La cantidad donde numB era doble que numA fueron ',cantDobles);
  end;

//Programa principal
begin
  incisoB;
end.