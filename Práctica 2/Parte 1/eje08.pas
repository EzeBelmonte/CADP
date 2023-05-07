{8 Dado el siguiente programa:}
{program anidamientos;


procedure leer;
  var
    letra : char;

  function analizarLetra : boolean;
    begin
      if (letra >= 'a') and (letra <= 'z') then
        analizarLetra := true
      else
        if (letra >= 'A') and (letra <= 'Z') then
          analizarletra := false;
    end; // fin de la funcion analizarLetra 
  begin
    readln(letra);
    if (analizarLetra) then
      writeln('Se trata de una minúscula')
    else
      writeln('Se trata de una mayúscula');
  end; // fin del procedure leer

var
  ok : boolean;
begin // programa principal
  leer;
  ok:= analizarLetra;
  if ok then
    writeln('Gracias, vuelva prontosss');
end.}

program anidamientos;
var
  letra: char;
  especial: boolean;
function analizarLetra : boolean;
    begin
      if (letra >= 'a') and (letra <= 'z') then
        analizarLetra := true
      else
        if (letra >= 'A') and (letra <= 'Z') then
          analizarletra := false
        else
          especial:=true;
    end; { fin de la funcion analizarLetra }
procedure leer;
  begin
    especial:= false;
    readln(letra);
    if (analizarLetra) and not(especial) then
      if (analizarLetra) then
        writeln('Se trata de una minúscula')
      else
        writeln('Se trata de una mayúscula')
     else
      writeln('Se trata de un caracter especial o numero');
  end; { fin del procedure leer}

var
  ok : boolean;
begin { programa principal }
  leer;
  ok:= analizarLetra;
  if ok then
    writeln('Gracias, vuelva prontosss');
end.

{a) La función analizarLetra fue declarada como un submódulo dentro del procedimiento leer. Pero esto
puede traer problemas en el código del programa principal.

i) ¿qué clase de problema encuentra? /// La funcion solo puede ser accedida por el proceso, el programa principal
no puede "comunicarse" directamente.

ii) ¿cómo se puede resolver el problema para que el programa compile y funcione correctamente? /// Hace que la funcion
este fuera del proceso, ademas de que la variable LEER deberia ser global o ser mandada desde el proceso a la funcion.

b) La función analizarLetra parece incompleta, ya que no cubre algunos valores posibles de la variable letra.
i) ¿De qué valores se trata? ///De los numeros o simbolos.

ii) ¿Qué sucede en nuestro programa si se ingresa uno de estos valores? ///Da una respuesta incorrecta ya que la 
variable boobleana estaria como verdadera o falsa, en este caso me toma el valor de verdadera e imprime el mensaje
de que es una letra minuscula.

iii) ¿Cómo se puede resolver este problema? /// Creando una varialbe boolean global el cual es inicializada en FALSE
y si se ingresa un valor especial, se actualiza a TRUE, entonces en el proceso, si la funcion da verdadera y la variable
booleana da FALSE, se trata de una minuscula o mayuscula, pero si la variable da TRUE, significa que es un caracter
especial.}