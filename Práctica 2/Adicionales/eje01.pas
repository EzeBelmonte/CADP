{1. Dado el siguiente programa:
program Ejercicio1_ad;

procedure intercambio(var num1,num2 : integer);
  var
    aux : integer;
  begin
    aux := num1;
    num1 := num2;
    num2 := aux;
  end;

procedure sumar(num1 : integer; var num2 : integer);
  begin
    num2 := num1 + num2;
  end;

var
  i, num1, num2 : integer;
begin
  read(num1);
  read(num2);
  for i := 1 to 3 do
    begin
      intercambio(num1,num2);
      sumar(i,num1); 
  end;

  writeln(num1);
end.
//a. ¿Qué imprime si se leen los valores num1=10 y num2=5 ? 9
//b. ¿Qué imprime si se leen los valores num1=5 y num2=10 ? 14
}