{5. Realizar un programa que lea información de autos que están a la venta en una concesionaria. De cada auto se lee:
marca, modelo y precio. La lectura finaliza cuando se ingresa la marca “ZZZ” que no debe procesarse. La
información se ingresa ordenada por marca. Se pide calcular e informar:
a. El precio promedio por marca.
b. Marca y modelo del auto más caro.}

program eje05;

type
  str20 = string[20];

  REG_auto = record
    marca,modelo: str20;
    precio: real;
  end;

procedure leer (var r:REG_auto);
  begin
    write ('Marca: '); readln(r.marca);
    if (r.marca <> 'zzz') then
      begin
        write ('Modelo: '); readln(r.modelo);
        write ('Precio: ');readln(r.precio);
      end;
  end;

procedure inciso;
  var
    r: REG_auto;
    aux,marcaCara,modeloCaro: str20;
    promedioMarca,precioCaro: real;
    cantAutos: integer;
  begin
    precioCaro:= 0;
    leer(r);
    while (r.marca <> 'zzz') do
      begin
        cantAutos:= 0;
        promedioMarca:= 0;
        aux:= r.marca;
        while (aux = r.marca) do
          begin
            //INCISO A
            cantAutos:= cantAutos + 1;
            promedioMarca:= promedioMarca + r.precio;

            //INCISO B
            if (precioCaro < r.precio) then
              begin
                modeloCaro:= r.modelo;
                marcaCara:= r.marca;
              end;

            leer(r);
          end;
        writeln ('Precio promedio de la marca ',aux,' es: ',(promedioMarca/cantAutos):5:2);
      end;
    writeln ('El auto mas caro fue el ',marcaCara,' modelo: ',modeloCaro);
  end;

begin
  inciso;
end.