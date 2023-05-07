{Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques
‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los
tanques vendidos por la empresa. La lectura finaliza al ingresar un tanque de tipo ‘Z’. 

Al finalizar la lectura, el programa debe informar:
- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos.

Volumen Cubo V = a.b.c
Volumen Cilindro V = pi . r^2 . h }

program eje12_3;

type
  REG_tanque = record
    tipo: char;
    ancho,largo,alto,radio: real;
  end;

procedure imprimir (vol1,vol2,promC,promR: real; altoM,volM: integer);
  begin
    writeln ('Los 2 volumen mayores vendidos son: ',vol1:5:2,' y ',vol2:5:2);
    writeln ('Volumen promedio de todos los tanques cilindricos vendidos es: ',promC:5:2);
    writeln ('Volumen promedio de todos los tanques rectangulares vendidos es: ',promR:5:2);
    writeln ('La cantidad de tanques cuyo alto sea menor a 1.40 metros es: ',altoM);
    writeln ('La cantidad de tanques cuyo volumen sea menor a 800 metros cubicos es: ',volM);
  end;

procedure leer (var t: REG_tanque);
  begin
    write ('Tipo de tanque (r/c): '); readln(t.tipo);
    if (t.tipo <> 'z') then
      begin
        write ('Alto: '); readln(t.alto);
        if (t.tipo = 'r') then
          begin
            write ('Ancho: '); readln(t.ancho);
            write ('Largo: '); readln(t.largo);
          end
        else
          if (t.tipo = 'c') then
            begin
              write ('Radio: '); readln(t.radio);
            end;
      end;
  end;

procedure inciso;
  var
    t: REG_tanque;
    vol,vol1,vol2,promR,promC: real;
    cantR,cantC,altoM,volM: integer;
  begin
    vol1:= 0;
    vol2:= 0;
    cantR:= 0;
    cantC:= 0;
    promR:= 0;
    promC:= 0;
    altoM:= 0;
    volM:= 0;

    leer(t);
    while (t.tipo <> 'z') do
      begin
        //========= PUNTO 1
        if (t.tipo = 'r') then
          begin
            vol:= t.ancho * t.largo * t.alto;
            cantR:= cantR + 1; //PUNTO 3
            promR:= promR + vol; //PUNTO 3
          end
        else
          begin
            vol:= 3.15 * t.radio * t.radio * t.alto;
            cantC:= cantC + 1; //PUNTO 2
            promC:= promC + vol; //PUNTO 12
          end;

        if (vol1 < vol) then
          begin
            vol2:= vol1;
            vol1:= vol;
          end
        else
          if (vol2 < vol) then
            vol2:= vol;

        //========= PUNTO 4
        if (t.alto < 1.40) then
          altoM:= altoM + 1;
        
        //========= PUNTO 5
        if (vol < 800) then
          volM:= volM + 1;

        leer(t);
      end;

    //========= PUNTO 2
    promC:= promC / cantC;
    //========= PUNTO 3
    promR:= promR / cantR;
    
    imprimir(vol1,vol2,promC,promR,altoM,volM);

  end;

//Programa principal
begin
  inciso;
end.