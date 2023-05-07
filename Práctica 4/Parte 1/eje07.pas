{7. Realizar un programa que lea números enteros desde teclado hasta que se ingrese el valor -1 (que no
debe procesarse) e informe:
a. la cantidad de ocurrencias de cada dígito procesado.
b. el dígito más leído.
c. los dígitos que no tuvieron ocurrencias.
Por ejemplo, si la secuencia que se lee es: 63 34 99 94 96 -1, el programa deberá informar:
Número 3: 2 veces
Número 4: 2 veces
Número 6: 2 veces
Número 9: 4 veces
El dígito más leído fue el 9.
Los dígitos que no tuvieron ocurrencias son: 0, 1, 2, 5, 7, 8}

program eje07;

type
  vector = array [1..10] of integer;

procedure cargarV (var v: vector; num: integer);
  begin
    while (num > 0) do
      begin
        v[(num mod 10) + 1]:= v[(num mod 10) + 1] + 1;
        num:= num div 10;
      end;
  end;

procedure inciso (var v: vector);
  var
    x,num: integer;
  begin
    //Inicializo el vector
    for x:=1 to 10 do
      v[x]:= 0;
    write ('Numero: '); readln(num);
    while (num <> -1) do
      begin
        cargarV(v,num);
        write ('Numero: '); readln(num);
      end;
    
  end;

procedure imprimir (v:vector);
  var
    x: integer;
    masLeido,num: integer;
  begin
    masLeido:=0;
    for x:=1 to 10 do
      begin
        if (v[x] <> 0) then
          writeln ('El numero ',x - 1,': ',v[x],' veces.');
        if (masLeido < v[x]) then
          begin
            masLeido:= v[x];
            num:= x - 1;
          end;
      end;
    writeln ('El numero mas leido es el ',num);

    writeln('Los digitos que no tuvieron ocurrencias son:');
    for x:=1 to 10 do
      begin
        if (v[x] = 0) then
          writeln ('El numero: ',x - 1);
        end;
  end;

//Programa principal
var
  v: vector;
begin
  inciso(v);
  imprimir(v);
end.