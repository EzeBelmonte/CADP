{4. a. Realizar un módulo que reciba como parámetro el radio de un círculo y retorne su diámetro y su
perímetro.
b. Utilizando el módulo anterior, realizar un programa que analice información de planetas obtenida del
Telescopio Espacial Kepler. De cada planeta se lee su nombre, su radio (medido en kilómetros) y la distancia
(medida en años luz) a la Tierra. La lectura finaliza al leer un planeta con radio 0, que no debe procesarse.
Informar:
● Nombre y distancia de los planetas que poseen un diámetro menor o igual que el de la Tierra (12.700
km) y mayor o igual que el de Marte (6.780 km).
● Cantidad de planetas con un perímetro superior al del planeta Júpiter (439.264 km).}

program eje04;

procedure circunferencia (radio: real; var diametro, perimetro: real);
  begin
    diametro:= radio * 2;
    perimetro:= 3.14 * radio * 2;
  end;

procedure leer;
var
  nombre: string[20];
  radio, distancia, diametro, perimetro: real;
  cant: integer;
begin
  cant:= 0;
  write ('Radio planeta (km): '); readln(radio);
  while (radio <> 0) do
    begin
      write ('Nombre: '); readln(nombre);
      write ('Distancia (anio luz): '); readln(distancia);

      circunferencia(radio,diametro,perimetro);

      if (diametro <= 12700) and (diametro >=6780) then
        begin
          writeln('Nombre: ',nombre,'|| Distancia: ',distancia,' anios luz.');
        end;

      if (perimetro > 439264) then
        cant:= cant + 1;
    end;
  writeln ('Los planetas con perimetro mayor a 439.264km son: ',cant);
end;

begin
  leer;
end.