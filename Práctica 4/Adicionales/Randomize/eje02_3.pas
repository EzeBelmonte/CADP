{2. Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
utilizaremos vectores para almacenar la información ingresada por teclado. Consideraciones importantes:
- Los datos ingresados por teclado deberán almacenarse en una estructura de tipo vector apropiada.
Dado que en ninguno de los ejercicios se indica la cantidad máxima de datos a leer, para poder utilizar
un vector asumimos que en todos los casos se ingresarán a lo sumo 5000 datos (donde cada dato será
o bien una inversión, un alumno o un tanque de agua, según lo indica cada ejercicio).
- Una vez leídos y almacenados los datos, deberán procesarse (recorrer el vector) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en la práctica anterior. En la
medida de lo posible, el vector deberá recorrerse una única vez para resolver todos los incisos.

Actividad 3: Un fabricante de tanques de agua está analizando las ventas de sus tanques durante el 2020. La
empresa fabrica tanques a medida, que pueden ser rectangulares (tanques ‘R’) o cilíndricos (tanques ‘C’) .
- De cada tanque R se conoce su ancho (A), su largo (B) y su alto (C)
- De cada tanque C se conoce su radio y su alto
Todas las medidas se ingresan en metros. Realizar un programa que lea la información de los tanques vendidos por la empresa. 
La lectura finaliza al ingresar un tanque de tipo ‘Z’. Al finalizar la lectura, el programa debe informar:

- Volumen de los dos mayores tanques vendidos
- Volumen promedio de todos los tanques cilíndricos vendidos
- Volumen promedio de todos los tanques rectangulares vendidos
- Cantidad de tanques cuyo alto sea menor a 1.40 metros
- Cantidad de tanques cuyo volumen sea menor a 800 metros cúbicos.

Volumen Cubo V = a.b.c
Volumen Cilindro V = pi . r^2 . h }

program eje02_3;
const
  dimF = 5000;
type
  REG_tanque = record
    tipo: char;
    ancho,largoRad,alto: real;
  end;

  vector = array [1..dimF] of REG_tanque;
  vecT = array [1..2] of char;

//============== CARGA VECTOR
procedure preguntas (var r: REG_tanque);
  var
    vt: vecT;
  begin
    vt[1]:= 'r';
    vt[2]:= 'c';

    with r do
      begin
        //write ('Tipo de tanque (r/c): '); readln(tipo);
        tipo:= vt[random(2) + 1];
        if (tipo <> 'z') then
          begin
            //write ('Alto: '); readln(alto);
            //write ('Largo: '); readln(largoRad);
            alto:= random(7) + 1;
            largoRad:= random(7) + 3;
            if (tipo = 'r') then
              begin
                //write ('Ancho: '); readln(ancho);
                ancho:= random(7) + 3;
              end;
          end;
      end;
  end;

procedure cargarVector (var v: vector; var dimL: integer);
  var
    r: REG_tanque;
  begin
    preguntas(r);
    while (r.tipo <> 'z') and (dimL < dimF) do
      begin
        dimL:= dimL + 1;
        v[dimL]:= r;
        preguntas(r);
      end;
  end;
//============== CARGA VECTOR

//========= INCISOS
function cantTanques (v: vector; dimL: integer): integer;
  var
    x: integer;
  begin
    cantTanques:= 0;
    for x:=1 to dimL do
      cantTanques:= cantTanques + 1;
  end;

function volumen (r: REG_tanque): real;
  begin
    if (r.tipo = 'r') then
      volumen:= (r.ancho * r.largoRad * r.alto)
    else
      volumen:= (3.14 * (r.largoRad * r.largoRad) * r.alto);   
  end;

procedure incisos (v: vector; dimL: integer);
  var
    x,totalTanq,cant140,cant800: integer;
    vol,volMax1,volMax2,sumaVR,sumaVC: real;
  begin
    totalTanq:= cantTanques(v,dimL);
    volMax1:= 0;
    volMax2:= 0;
    sumaVR:= 0;
    sumaVC:= 0;
    cant140:= 0;
    cant800:= 0;

    for x:=1 to dimL do
      begin
        vol:= volumen(v[x]);

        //Punto 1
        if (vol > volMax1) then
          begin
            volMax2:= volMax1;
            volMax1:= vol;
          end
        else
          if (vol > volMax2) then
            volMax2:= vol;

        //Punto 2 y 3
        if (v[x].tipo = 'r') then
          sumaVR:= sumaVR + vol
        else
          sumaVC:= sumaVC + vol;
        
        //Punto 4
        if (v[x].alto < 1.40) then
          cant140:= cant140 + 1;

        //Punto 5
        if (vol < 800) then
          cant800:= cant800 + 1;
      end;

    writeln ('Los Volume de los dos mayores tanques vendidos es: ',volMax1:0:2, ' y ',volMax2:0:2,'.');
    writeln ('El volumen promedio de todos los tanques cilindricos vendidos es: ',(sumaVC / totalTanq):0:2,'.');
    writeln ('El volumen promedio de todos los tanques rectangulares vendidos es: ',(sumaVR / totalTanq):0:2,'.');
    writeln ('La cantidad de tanques cuyo alto es menor a 1.40 metros es: ',cant140,'.');
    writeln ('La antidad de tanques cuyo volumen es menor a 800 metros cubicos es: ',cant800,'.');
  end;
//========= INCISOS

//Programa principal
var
  v: vector;
  dimL: integer;
begin
  Randomize; // Externo a CADP
  dimL:= 0;
  cargarVector(v,dimL);
  writeln ('======= FIN CARGA =======');
  incisos(v,dimL);
end.