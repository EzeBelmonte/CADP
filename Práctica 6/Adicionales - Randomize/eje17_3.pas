{17. Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
sumaremos lo aprendido sobre listas para almacenar la información ingresada por teclado. Consideraciones
importantes:
● Los datos ingresados por teclado deberán almacenarse en una estructura de tipo lista apropiada.
● Una vez leídos y almacenados los datos, deberán procesarse (recorrer la lista) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en las prácticas anteriores. En
la medida de lo posible, la lista deberá recorrerse una única vez para resolver todos los incisos.}

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

program eje17_3;
type
  REG_tanque = record
    tipo: char;
    a,b,c: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_tanque;
    sig: Lista;
  end;

  vecTanque = array [1..3] of char;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_tanque);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_tanque);
  var
    v: vecTanque;
  begin
    v[1]:= 'r';
    v[2]:= 'c';
    v[3]:= 'z';
    with r do
      begin
        {write ('Tanque (r/c)'); readln(tipo);
        if (tipo <> 'z') then
          begin
            if (tipo = 'r') then
              begin
                write ('Ancho: '); readln(a);
                write ('Largo: '); readln(b);
                write ('Alto: '); readln(c);
              end
            else
              if (tipo = 'c') then
                begin
                  a:= 0;
                  write ('Radio: '); readln(b);
                  write ('Largo: '); readln(c);
                end;
          end;}
        tipo:= v[random(3)+1];
        if (tipo <> 'z') then
          begin
            if (tipo = 'r') then
              begin
                a:= random(30) + 5;
                b:= random(30) + 5;
                c:= random(30) + 5;
              end
            else
              if (tipo = 'c') then
                begin
                  a:= 0;
                  b:= random(30) + 5;
                  c:= random(30) + 5;
                end;
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_tanque;
  begin
    preguntas(r);
    while (r.tipo <> 'z') do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

// ======== VOLUMEN
function volumen (r: REG_tanque): real;
  begin
    if (r.tipo = 'r') then
      volumen:= r.a * r.b * r.c
    else
      if (r.tipo = 'c') then
        volumen:= 3.1416 * (r.b * r.b) * r.c;
  end;
// ======== VOLUMEN

// ======== IMPRIMIR
procedure imprimir (volMax1,volMax2,promC,promR: real; alto,min: integer);
  begin
    writeln ('El volumen de los dos mayores tanques vendidos son: ',volMax1:0:2,' y ',volMax2:0:2);
    writeln ('El volumen promedio de todos los tanques cilindricos vendidos es: ',promC:0:2);
    writeln ('El volumen promedio de todos los tanques rectangulares vendidos es: ',promR:0:2);
    writeln ('La cantidad de tanques cuyo alto es menor a 1.40 metros es: ',alto);
    writeln ('La cantidad de tanques cuyo volumen es menor a 800 metros cubicos es: ',min);
  end;
// ======== IMPRIMIR

// =========== INCISOS
procedure incisos (L: Lista);
  var
    vol,volMax1,volMax2,promR,promC,sumaVolR,sumaVolC: real;
    cantR,cantC,alto,min: integer;
  begin
    volMax1:= 0;
    volMax2:= 0;
    sumaVolR:= 0;
    sumaVolC:= 0;
    cantR:= 0;
    cantC:= 0;
    alto:= 0;
    min:= 0;
    while (L <> nil) do
      begin
        vol:= volumen(L^.dato);
        //Punto 1
        if (volMax1 < vol) then
          volMax1:= vol
        else
          if (volMax2 < vol) then
            volMax2:= vol;
        //Punto 2
        if (L^.dato.tipo = 'r') then
          begin
            cantR:= cantR + 1;
            sumaVolR:= sumaVolR + vol;
          end;
        //Punto 3
        if (L^.dato.tipo = 'c') then
          begin
            cantC:= cantC + 1;
            sumaVolC:= sumaVolC + vol;
          end;
        //Punto 4
        if (L^.dato.c < 1.40) then
          alto:= alto + 1;
        //Punto 5
        if (vol < 800) then
          min:= min + 1;

        L:= L^.sig;
      end;
    
    //El if es para que no de error si la lista esta vacia
    if (cantC <> 0) and (cantR <> 0) then
    begin
      promR:= sumaVolR / cantR;
      promC:= sumaVolC / cantC;
    end;

    imprimir(volMax1,volMax2,promC,promR,alto,min);
  end;
// =========== INCISOS

//Programa principal
var
  L: Lista;
begin
  Randomize; //Externo a CADP
  L:= nil;
  cargarLista(L);
  writeln ('========== FIN CARGA ==========');
  incisos(L);
end.