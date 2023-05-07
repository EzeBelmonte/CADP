{Realizar un programa que lea un número real X. Luego, deberá leer números reales hasta que se
ingrese uno cuyo valor sea exactamente el doble de X (el primer número leído).}

program eje04;

var
  num, condicion: real;

begin
  write ('Num: '); readln (num);
  condicion:= num * 2;
  while num <> condicion do
    begin
      write ('Ingresar valor: '); readln (num);
    end;
end.