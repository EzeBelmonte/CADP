{b. ARBA desea procesar información obtenida de imágenes satelitales de campos sembrados con soja en la
provincia de Buenos Aires. De cada campo se lee: localidad, cantidad de hectáreas sembradas y el tipo de zona
(1, 2 ó 3). La lectura finaliza al leer un campo de 900 ha en la localidad ‘Saladillo’, que debe procesarse. El precio
de la soja es de U$S320 por tn. Informar:
● La cantidad de campos de la localidad Tres de Febrero con rendimiento estimado superior a U$S 10.000.
● La localidad del campo con mayor rendimiento económico esperado.
● La localidad del campo con menor rendimiento económico esperado.
● El rendimiento económico promedio.}

program eje12b;

procedure imprimir (cantCampos: integer; localMax, localMin: string; promedio: real);
  begin
    writeln ('Campos con rendimiento economico sup. a u$s: 10.000: ',cantCampos);
    writeln ('La localidad del campo con mayor rendimiento economico es: ',localMax);
    writeln ('La localidad del campo con menor rendimiento economico es: ',localMin);
    writeln ('El rendimiento economico promedio es: ',promedio:2:2);
  end;

procedure rendimiento (cantHA, tipo: integer; precio: real; renEconomico: real);
begin
  if (tipo = 1) then
    renEconomico:= cantHA * precio * 6
  else
    if (tipo = 2) then
      renEconomico:= cantHA * precio * 2.6
    else
      renEconomico:= cantHA * precio * 1.4;
end;

procedure leer;
var
  localidad,localMin, localMax: string[30];
  cantHA, tipo, cantCampos, contador: integer;
  precio, renEconomico, promedio, min,max: real;

begin
  precio:= 320;
  min:= 32707;
  max:= 0;
  promedio:= 0;
  contador:= 0;
  cantCampos:= 0;
  repeat
    write ('Localidad: '); readln(localidad);
    write ('Cantidad hectarias: '); readln(cantHA);
    write ('Tipo (1,2,3): '); readln(tipo);

    rendimiento(cantHA,tipo,precio,renEconomico);
    if (localidad = 'tres de febrero') and (renEconomico > 10000) then
      cantCampos:= cantCampos + 1;
    
    if (renEconomico > max) then
      begin
        max:= renEconomico;
        localMax:= localidad;
      end;
    
    if (renEconomico < min) then
      begin
        min:= renEconomico;
        localMin:= localidad;
      end;

    contador:= contador + 1;
    promedio:= promedio + renEconomico;

  until ((cantHA = 900) and (localidad = 'saladillo'));

  promedio:= promedio / contador;

  imprimir (cantCampos,localMax,localMin,promedio);
end;

//Programa principal
begin
  leer;
end.