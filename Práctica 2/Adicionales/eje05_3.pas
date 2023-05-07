{Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques
‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los
tanques vendidos por la empresa. La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la
lectura, el programa debe informar:
- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos.

Volumen Cubo V = a.b.c
Volumen Cilindro V = pi . r^2 . h }

program eje05_3;

procedure volumenes (tipo: char; var volumen: real; var cantAltoMenor,cantVolMenor: integer);
  var
    ancho, largo, alto, radio: real;
  begin
    if (tipo = 'c') then
      begin
        write ('Anchura: '); readln (ancho);
        write ('Largo: '); readln (largo);
        write ('Altura: '); readln (alto);
        volumen:= ancho * largo * alto;
      end
    else
      begin
        write ('Radio: '); readln (radio);
        write ('Altura: '); readln (alto);
        volumen:= 3.14 * (radio * radio) * alto;
      end;

    if (alto < 1.40) then
      cantAltoMenor:= cantAltoMenor + 1;
    if (volumen < 800) then
      cantVolMenor:= cantVolMenor + 1;
  end;

procedure mayoresTanque(volumen: real; var volMax1,volMax2: real);
  begin
    if (volMax1 < volumen) then
      begin
        volMax2:= volMax1;
        volMax1:= volumen;
      end
    else
      if (volMax2 < volumen) then
        volMax2:= volumen;
  end;

function promTanques (volumen:real; cantidad:integer): real;
  begin
    promTanques:= volumen / cantidad;
  end;

procedure informar (volMax1,volMax2,volC,volR: real;cantAltoMenor,cantVolMenor: integer);
  begin
    writeln ('Los 2 tanques con mas volumen vendidos fuero de ',volMax1,' y ',volMax2);
    writeln ('Volumen promedio de los tanques tipo rectangular es ',volC);
    writeln ('Volumen promedio de los tanques tipo cilindro es ',volR);
    writeln ('Cantidad de tanques cuyo alto sea menor a 1.40 metros: ',cantAltoMenor);
    writeln ('Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos: ',cantVolMenor);
  end;

procedure leer;
  var
    dia, mes, cantC, cantR, cantAltoMenor, cantVolMenor: integer;
    volumen, volMax1, volMax2, volC, volR: real;
    tipo: char;

  begin
    volMax1:= 0;
    volMax2:= 0;
    cantC:= 0;
    cantR:= 0;
    volC:= 0;
    volR:= 0;
    cantAltoMenor:= 0;
    cantVolMenor:= 0;

    for mes:=1 to 12 do
      begin
        for dia:=1 to 31 do
          begin
            write ('Tipo de tanque (C o R): '); readln (tipo);
            while (tipo <> 'z') do
              begin
                volumenes(tipo,volumen,cantAltoMenor,cantVolMenor);
                if (tipo = 'c') then
                  begin
                    cantC:=  cantC + 1;
                    volC:= volC + volumen;
                  end
                else
                  if (tipo = 'r') then
                    begin
                      cantR:=  cantR + 1;
                      volC:= volC + volumen;
                    end;
                
                mayoresTanque(volumen,volMax1,volMax2);

                write ('Tipo de tanque (C o R): '); readln (tipo);
              end;
          end;  
      end;

    informar(volMax1,volMax2,promTanques(volC,cantC),promTanques(volR,cantR),cantAltoMenor,cantVolMenor);
  end;

//Programa principal
begin
  leer;
end.