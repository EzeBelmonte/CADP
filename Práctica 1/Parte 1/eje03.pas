{Realizar un programa que lea 3 números enteros y los imprima en orden descendente.
Por ejemplo, si se ingresan los valores 4, -10 y 12, deberá imprimir: 12 4 -10}

program eje03;

var
  a, b, c: integer;

begin
  write ('Ingesar num: '); readln(a);
  write ('Ingesar num: '); readln(b);
  write ('Ingesar num: '); readln(c);

  if (a > b) then
    if (a > c) then
      if (b > c) then
        writeln (a,' ',b,' ',c)
      else
        writeln (a,' ',c,' ',b)
    else
      writeln (c,' ',a, ' ',b)
  else
    if (b > c) then
      if (a > c) then
        writeln (b,' ',a,' ',c)
      else
        writeln (b,' ',c,' ',a)
    else
      if (a > b) then
        writeln (c,' ',a,' ',b)
      else
        writeln (c,' ',b,' ',a);

end.