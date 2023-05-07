{14. La oficina de becas y subsidios desea optimizar los distintos tipos de ayuda financiera que se brinda a
alumnos de la UNLP. Para ello, esta oficina cuenta con un registro detallado de todos los viajes realizados por
una muestra de 1300 alumnos durante el mes de marzo. De cada viaje se conoce el código de alumno (entre
1 y 1300), día del mes, Facultad a la que pertenece y medio de transporte (1. colectivo urbano; 2. colectivo
interurbano; 3. tren universitario; 4. tren Roca; 5. bicicleta). Tener en cuenta que un alumno puede utilizar
más de un medio de transporte en un mismo día.
Además, esta oficina cuenta con una tabla con información sobre el precio de cada tipo de viaje.
Realizar un programa que lea la información de los viajes de los alumnos y los almacene en una estructura de
datos apropiada. La lectura finaliza al ingresarse el código de alumno -1, que no debe procesarse.

Una vez finalizada la lectura, informar:
a. La cantidad de alumnos que realizan más de 6 viajes por día
b. La cantidad de alumnos que gastan en transporte más de $80 por día
c. Los dos medios de transporte más utilizados.
d. La cantidad de alumnos que combinan bicicleta con algún otro medio de transporte.}

program eje14;
Uses
  sysutils; //Externo a CADP
const
  dimF = 5;
type
  REG_fecha = record
    dia,mes: integer;
  end;

  REG_viaje = record
     cod: integer;
     fecha: REG_fecha;
     facultad: string[30];
     medTransporte: array [1..dimF] of integer;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_viaje;
    sig: Lista;
  end;

  vector = array [1..dimF] of real;

// ================ CARGA LISTA y VECTOR
procedure crearLista (var L: Lista; r: REG_viaje);
  var
    nue,aux: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        aux:= L;
        while (aux^.sig <> nil) do
          aux:= aux^.sig;
        aux^.sig:= nue;
      end;
  end;

procedure preguntas (var r: REG_viaje; x: integer);
  var
    y: integer;
  begin
    with r do
      begin
        cod:= x;
        writeln ('Codigo: ',x);
        fecha.dia:= random(31) + 1;
        fecha.mes:= random(12) + 1;
        facultad:= Concat('Facultad-',IntToStr(random(30000)));

        for y:=1 to dimF do
          medTransporte[y]:= 0;

        y:= random(7);
        writeln ('Medio de transporte (1 a 5, con 0 finaliza): ',y);
        while (y >= 1) and (y <=5) do
          begin
            medTransporte[y]:= medTransporte[y] + 1;
            y:= random(7);
            writeln ('Medio de transporte (1 a 5, con 0 finaliza): ',y);
          end;
      end;
  end;
procedure cargarLista (var L:Lista);
  var
    r: REG_viaje;
    cod: integer;
  begin
    cod:=1;
    repeat
      preguntas(r,cod);
      crearLista(L,r);
      cod:= cod + 1;
    until (cod = 20);

  end;

procedure cargarVector (var v: vector);
  begin
    v[1]:= 125.50; //1. colectivo urbano.
    v[2]:= 119.25; //2. colectivo interurbano.
    v[3]:= 115.50; //3. tren universitario.
    v[4]:= 112.20; //4. tren Roca.
    v[5]:= 117.00; //5. bicicleta.
  end;
// ================ CARGA LISTA y VECTOR


// ==== INCISOS A y B
function incisoA (r: REG_viaje): integer;
  var
    suma,x: integer;
  begin
    suma:= 0;
    x:= 1;
    while (x <= 5) and (suma < 6) do
      begin
        suma:= suma + r.medTransporte[x];
        x:= x + 1;
      end;
    if (suma > 6) then
      incisoA:= 1
    else
      incisoA:= 0;
  end;
// ==== ========= ========== ========== =========
function incisoB (r: REG_viaje; v: vector): integer;
  var
    x: integer;
    suma: real;
  begin
    suma:= 0;
    x:= 1;
    while (x <= 5) and (suma < 80) do
      begin
        suma:= suma + (r.medTransporte[x] * v[x]);
        x:= x + 1;
      end;
    if (suma > 6) then
      incisoB:= 1
    else
      incisoB:= 0;
  end;
// ==== ========= ========== ========== =========
function incisoD (r: REG_viaje): integer;
  var
    x: integer;
    cumple: boolean;
  begin
    incisoD:= 0;
    cumple:= (r.medTransporte[5] > 0);
    if (cumple) then
      begin
        x:= 1;
        cumple:= false;
        while (x < 5) and not(cumple) do
          begin
            if (r.medTransporte[x] > 0) then
              begin
                cumple:= true;
                incisoD:= 1;
              end
            else
              x:= x + 1;
          end;
      end;
  end;
// ==== INCISOS A y B

// ==== INCISOS C
procedure incisoC (r: REG_viaje; var transp1,transp2,cant1,cant2: integer);
  var
    x: integer;
  begin
    for x:= 1 to dimF do
      begin
        if (cant1 < r.medTransporte[x]) then
          begin
            cant2:= cant1;
            transp2:= transp1;
            cant1:= r.medTransporte[x];
            transp1:= x;
          end
        else
          if (cant2 < r.medTransporte[x]) then
            begin
              cant2:= r.medTransporte[x];
              transp2:= x;
            end;
      end;
  end;
// ==== INCISOS C

// ==== INCISOS 
procedure imprimir (cantA,cantB,cantD,transp1,transp2: integer);
  begin
    writeln ('La cantidad de alumnos que realizan mas de 6 viajes por dia es: ',cantA);
    writeln ('La cantidad de alumnos que gastan en transporte mas de $80 por dia es: ',cantB);
    writeln ('Los dos medios de transporte mas utilizados son el ',transp1,' y el ',transp2);
    writeln ('La cantidad de alumnos que combinan bicicleta con algun otro medio de transporte es: ',cantD);
  end;
procedure incisos (L: Lista; v:vector);
  var
    cantA,cantB,cantD,transp1,transp2,cant1,cant2: integer;
  begin
    cantA:= 0;
    cantB:= 0;
    cantD:= 0;
    cant1:= 0;
    cant2:= 0;
    while (L <> nil) do
      begin
        //INCISO A
        cantA:= cantA + incisoA(L^.dato);
        //INCISO B
        cantB:= cantB + incisoB(L^.dato,v);
        //INCISO C
        incisoC (L^.dato,transp1,transp2,cant1,cant2);
        //INCISO D
        cantD:= cantD + incisoD(L^.dato);

        L:= L^.sig;
      end;
    imprimir(cantA,cantB,cantD,transp1,transp2);
  end;
// ==== INCISOS 

//Programa principal
var
  L: Lista;
  v: vector;
begin
  Randomize; //Externo a CADP
  L:= nil;
  cargarVector(v);
  cargarLista(L);
  writeln ('========== FIN CARGA ==========');
  incisos(L,v);
end.