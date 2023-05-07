{3. Encontrar los 6 errores que existen en el siguiente programa. Utilizar los comentarios entre llaves como guía,
indicar en qué línea se encuentra cada error y en qué consiste:}

1. program ejercicio5;
2. { suma los números entre a y b, y retorna el resultado en c }
3. procedure sumar(a, b, c : integer) //Esta recibiendo un valor como variable
4.  var
5.    suma : integer;
6.  begin
7.
8.    for i := a to b do // Si A es mas grande que B ya el for esta mal, deberia ser un downto
9.      suma := suma + i;
10.   c := c + suma; // Se quiere guardar un resultado en un numero
11.   end;
12. var
13.   result : integer;
14. begin
15.   result := 0;
16.   readln(a); readln(b); //Las variables a y b no estan definidas
17.   sumar(a, b, 0); //Se está mandando un numero como variable
18.   write('La suma total es ',result);
19.   { averigua si el resultado final estuvo entre 10 y 30}
20.   ok := (result >= 10) or (result <= 30); //La variable OK no esta declarada como boolean, ademas deberia compara con un AND
21.   if (not ok) then
22.     write ('La suma no quedó entre 10 y 30');
23. end.