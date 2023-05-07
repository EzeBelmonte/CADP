{2. Realice un programa modularizado que lea 10 pares de números (X,Y) e informe, para cada par de
números, la suma y el producto de todos los números entre X e Y.
Por ejemplo, dado el par (3,6), debe informar:
“La suma es 18“ (obtenido de calcular 3+4+5+6)
“El producto es 360“ (obtenido de calcular 3*4*5*6)}

program eje02;

procedure procesar (num1, num2: integer; var suma, multi: integer);
var
  x: integer;
begin
  for x:=num1 to num2 do
    begin
      suma:= suma + x;
      multi:= multi * x;
    end;
end;

procedure leer;
  var
    x, num1, num2, suma, multi: integer;
  begin
    for x:=1 to 10 do
      begin
        suma:= 0;
        multi:= 1;
        write ('Primer num: '); readln(num1);
        write ('Segundo num: '); readln(num2);
        procesar(num1,num2,suma,multi);

        writeln ('Suma de los numeros entre ',num1,' y ',num2,' es: ',suma);
        writeln ('Multiplicacion de los numeros entre ',num1,' y ',num2,' es: ',multi);
      end;
  end;

  begin
    leer;
  end.