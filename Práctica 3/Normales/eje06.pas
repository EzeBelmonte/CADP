{6. Una empresa importadora de microprocesadores desea implementar un sistema de software para analizar la
información de los productos que mantiene actualmente en stock. Para ello, se conoce la siguiente información de
los microprocesadores: marca (Intel, AMD, NVidia, etc), línea (Xeon, Core i7, Opteron, Atom, Centrino, etc.),
cantidad de cores o núcleos de procesamiento (1, 2, 4, 8), velocidad del reloj (medida en Ghz) y tamaño en
nanómetros (nm) de los transistores (14, 22, 32, 45, etc.). La información de los microprocesadores se lee de
forma consecutiva por marca de procesador y la lectura finaliza al ingresar un procesador con 0 cores (que no
debe procesarse). Se pide implementar un programa que lea información de los microprocesadores de la empresa
importadora e informe:
● Marca y línea de todos los procesadores de más de 2 cores con transistores de a lo sumo 22 nm.
● Las dos marcas con mayor cantidad de procesadores con transistores de 14 nm.
● Cantidad de procesadores multicore (de más de un core) de Intel o AMD, cuyos relojes alcancen velocidades de
al menos 2 Ghz.}

program eje06;

type
  str20 = string[20];

  REG_procesadore = record
    marca,linea: str20;
    cores,nm: integer;
    reloj: real;
  end;

procedure leer(var r:REG_procesadore);
  begin
    write ('Marca: '); readln(r.marca);
    write ('Linea: '); readln(r.linea);
    write ('Cant de nucleos (cores): '); readln(r.cores);
    if (r.cores <> 0) then
      begin
        write ('Velocidad del reloj(Ghz): '); readln(r.reloj);
        write ('Nanometros: '); readln(r.nm);
      end;
  end;

procedure inciso;
  var
    r: REG_procesadore;
    auxMarca,marcaMax1,marcaMax2: str20;
    max,max1, max2,cantMultiCore: integer;
  begin
    max1:= 0;
    max2:= 0;
    cantMultiCore:= 0;
    leer(r);
    while (r.cores <> 0) do
      begin
        auxMarca:= r.marca;
        max:= 0;
        while (auxMarca = r.marca) and (r.cores <> 0) do
          begin
            //PUNTO 1
            if (r.cores > 2) and (r.nm <= 22) then
              writeln ('Procesador con mas de 2 cores y menor o igual a 22nm: ',r.marca,' ',r.linea);
            
            //PUNTO 2
            if (r.nm = 14) then
              max:= max + 1;
            
            //PUNTO 3
            if ((r.marca = 'intel') or (r.marca = 'amd')) and (r.cores > 1) and (r.reloj >= 2) then
              cantMultiCore:= cantMultiCore + 1;
            leer(r);
          end;
        //PUNTO 2
        if (max > max1) then
          begin
            max2:= max1;
            marcaMax2:= marcaMax1;
            max1:= max;
            marcaMax1:= auxMarca;
          end
        else
          if (max > max2) then
            begin
              max2:= max;
              marcaMax2:= auxMarca;
            end;
      end;
    
    writeln ('Las 2 marcas con mayor cantidad de procesadores con transistores de 14 nm son: ',marcaMax1,' y ',marcaMax2);
    writeln ('Cantidad de procesadores multicore de Intel o AMD, cuyos relojes alcancen velocidades de al menos 2 Ghz son: ',cantMultiCore);
  end;

//Programa principal
begin
  inciso;
end.
