{4. El siguiente programa intenta resolver un enunciado. Sin embargo, el código posee 5 errores. Indicar en
qué línea se encuentra cada error y en qué consiste el error.
Enunciado: Realice un programa que lea datos de 130 programadores Java de una empresa. De cada
programador se lee el número de legajo y el salario actual. El programa debe imprimir el total del dinero
destinado por mes al pago de salarios, y el salario del empleado mayor legajo.}

1. program programadores;

2. procedure leerDatos(var legajo: integer; salario : real); //Salario no esta pasada por referencia
  3. begin
    4. writeln('Ingrese el nro de legajo y el salario');
    5. read(legajo);
    6. read(salario);
  7. end;
8. procedure actualizarMaximo(nuevoLegajo:integer; nuevoSalario:real; var maxLegajo:integer);
9. var
10.   maxSalario : real;
11. begin
  12. if (nuevoLegajo > maxLegajo) then begin //maxlegajo no se inicializo y no se puede comparar
      13. maxLegajo:= nuevoLegajo;
      14. maxSalario := nuevoSalario //falta ; y ademas el resultado se guarda en una variable local del proceso y se pierde.
    15. end;
  16. end;
17. var
  18. legajo, maxLegajo, i : integer;
  19. salario, maxSalario : real;
20. begin
  21. sumaSalarios := 0; //maxlegajo no esta inicializada
  22. for i := 1 to 130 do begin
    23. leerDatos(salario, legajo);
    24. actualizarMaximo(legajo, salario, maxLegajo);
    25. sumaSalarios := sumaSalarios + salario; // como salario no fue pasada como referencia, no se guarda el salario
  26. end;
  27. writeln('En todo el mes se gastan ', sumaSalarios, ' pesos');
  28. writeln('El salario del empleado más nuevo es ',maxSalario);
29. end.