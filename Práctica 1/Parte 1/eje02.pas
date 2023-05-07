{Realizar un programa que lea un número real e imprima su valor absoluto. El valor absoluto de un
número X, se escribe |X| y se define como:
|X| = X cuando X es mayor o igual a cero
|X| = -X cuando X es menor a cero}

program eje02;

var
  num, valorAb: real;

begin
  write ('Ingresar num: '); readln(num);

  if (num < 0) then
    valorAb:= num * -1
  else
    valorAb:= num;

  writeln ('Valor absoluto de ',num:2:2,' es |',valorAb:2:2,'|');
end.