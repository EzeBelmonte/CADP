{12. 
a. Realizar un módulo que calcule el rendimiento económico de una plantación de soja. El módulo debe
recibir la cantidad de hectáreas (ha) sembradas, el tipo de zona de siembra (1: zona muy fértil, 2: zona estándar,
3: zona árida) y el precio en U$S de la tonelada de soja; y devolver el rendimiento económico esperado de dicha
plantación.
Para calcular el rendimiento económico esperado debe considerar el siguiente rendimiento por tipo de zona:

Tipo de zona  Rendimiento por ha
1             6 toneladas por ha
2             2,6 toneladas por ha
3             1,4 toneladas por ha
}

program eje12a;

procedure rendimiento (cantHA, tipo: integer; precio: real; var renEconomico: real);
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
  cantHA, tipo: integer;
  precio, renEconomico: real;

begin
  write ('Cantidad hectarias: '); readln(cantHA);
  write ('Tipo (1,2,3): '); readln(tipo);
  write ('Precio: '); readln(precio);

  rendimiento(cantHA,tipo,precio,renEconomico);
  write ('Rendimiento economico es: ',renEconomico:5:2);

end;

//Programa principal
begin
  leer;
end.