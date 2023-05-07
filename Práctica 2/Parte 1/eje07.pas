{7. Dado el siguiente programa:}
{program alcanceYFunciones;

var
  suma, cant : integer;
function calcularPromedio : real;
  var
    prom : real;
  begin
    if (cant = 0) then
      prom := -1
    else
      prom := suma / cant;
  end;

begin // programa principal 
  readln(suma);
  readln(cant);
  if (calcularPromedio <> -1) then 
    begin
      cant := 0;
      writeln('El promedio es: ',calcularPromedio)
    end
  else
    writeln('Dividir por cero no parece ser una buena idea');
end.}

program alcanceYFunciones;

var
  suma, cant : integer;
function calcularPromedio : real;
  //var
    //prom : real;
  begin
    if (cant = 0) then
      //prom := -1
      calcularPromedio:= -1
    else
      //prom := suma / cant;
      calcularPromedio:= suma / cant;
  end;

var
  aux: real;
begin { programa principal }
  readln(suma);
  readln(cant);
  aux:= calcularPromedio;
  if (aux <> -1) then 
    writeln('El promedio es: ',aux:2:2)
  else
    writeln('Dividir por cero no parece ser una buena idea');
end.

{a) La función calcularPromedio calcula y retorna el promedio entre las variables globales suma y cant, pero
parece incompleta. ¿qué debería agregarle para que funcione correctamente?

Respuesta: En vez de asignarle el valor del promedio a la variable PROM hay que guardar el resultado en la funcion.
ademas de que abria que sacar "cant:= 0".


b) En el programa principal, la función calcularPromedio es invocada dos veces, pero esto podría mejorarse.
¿cómo debería modificarse el programa principal para invocar a dicha función una única vez?

Respuesta: Se podria usar una variable auxiliar que guarde el valor de calcularPromedio y usar esa auxilar para usarla una vez.


c) Si se leen por teclado los valores 48 (variable suma) y 6 (variable cant), 
¿qué resultado imprime el programa? Considere las tres posibilidades:
i) El programa original // Imprime 0
ii) El programa luego de realizar la modificación del inciso a) //Imprime -1
iii) El programa luego de realizar las modificaciones de los incisos a) y b) //Imprime 8}