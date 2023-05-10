{5. Una empresa de transporte de cargas dispone de la información de su flota compuesta por 100
camiones. De cada camión se tiene: patente, año de fabricación y capacidad (peso máximo en
toneladas que puede transportar).

Realizar un programa que lea y almacene la información de los viajes realizados por la empresa. De
cada viaje se lee: código de viaje, código del camión que lo realizó (1..100), distancia en kilómetros
recorrida, ciudad de destino, año en que se realizó el viaje y DNI del chofer. La lectura finaliza cuando
se lee el código de viaje -1.

Una vez leída y almacenada la información, se pide:
1. Informar la patente del camión que más kilómetros recorridos posee y la patente del camión que
menos kilómetros recorridos posee.
2. Informar la cantidad de viajes que se han realizado en camiones con capacidad mayor a 30,5
toneladas y que posean una antigüedad mayor a 5 años al momento de realizar el viaje (año en
que se realizó el viaje).
3. Informar los códigos de los viajes realizados por choferes cuyo DNI tenga sólo dígitos impares.
Nota: Los códigos de viaje no se repiten.}

program eje05;
uses
  sysutils; //Externo a CADP
const
  dimF = 100;
type
  str10 = string[10];
  codigoC = 1..100;

  REG_camion = record
    patente: str10;
    anioFab: integer;
    capacidad: real;
  end;

  REG_viaje = record 
    cod,anioViaje,dni: integer;
    codCamion: codigoC;
    distancia: real;
    ciuDestino: string[30];
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_viaje;
    sig: Lista;
  end;
  
  vecCamion = array [1..dimF] of REG_camion;  

// ================ CARGA LISTA Y VECTOR
procedure crearLista(var L: Lista; r: REG_viaje);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_viaje);
  begin
    with r do
      begin
        write ('Codigo de viaje: '); readln(cod);
        if (cod <> -1) then
          begin
            codCamion:= random(100) + 1;
            distancia:= random(9000) + 1000;
            ciuDestino:= Concat('Ciudad-',IntToStr(random(32000)+767));
            anioViaje:= random(50) + 1970;
            dni:= random(767) + 30000;
          end;
      end;
  end;
procedure cargarLista (var L: Lista);
  var
    r: REG_viaje;
  begin
    preguntas(r);
    while (r.cod <> -1) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;

procedure cargarVector (var v: vecCamion);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      begin
        v[x].patente:= Concat('Patente-',IntToStr(random(3000)));
        v[x].anioFab:= random(130) + 1900;
        v[x].capacidad:= random(60) + 10;
      end;
  end;
// ================ CARGA LISTA Y VECTOR

// ========== INCISOS
function impares (dni: integer): boolean;
  begin
    impares:= true;
    while (dni > 0) and (impares) do
      begin
        if ((dni mod 2) = 0) then
          impares:= false
        else
          dni:= dni div 10;
      end;
  end;

procedure incisos (L: Lista; v: vecCamion);
  var
    kmMenos,kmMas: real;
    patMenos,patMas: str10;
    cantViajes: integer;
  begin
    kmMenos:= 32767;
    kmMas:= 0;
    cantViajes:= 0;
    while (L <> nil) do
      begin
        //Punto 1
        if (kmMenos > L^.dato.distancia) then
          begin
            kmMenos:= L^.dato.distancia;
            patMenos:= v[L^.dato.codCamion].patente;
          end;
        if (kmMas < L^.dato.distancia) then
          begin
            kmMas:= L^.dato.distancia;
            patMas:= v[L^.dato.codCamion].patente;
          end;

        //Punto 2
        if (v[L^.dato.codCamion].capacidad > 30.5) and ((2023 - L^.dato.anioViaje) > 5) then
          cantViajes:= cantViajes + 1;
        
        //Punto 3
        if (impares(L^.dato.dni)) then
          writeln ('Codigo del viaje realizados por chofer con DNI con dig impares: ',L^.dato.cod,'.');
        
        L:= L^.sig;
      end;
    
    writeln ('La patente del camion que mas km recorridos posee es: ',patMas,' y la patente del camion que menos km recorridos posee es: ',patMenos,'.');
    writeln ('La cantidad de viajes  en camiones con cap. mayor a 30,5 tl y que posean una antiguedad mayor a 5 anios al momento de realizar el viaje es: ',cantViajes,'.');
  end;
// ========== INCISOS

var
  L: Lista;
  v: vecCamion;
begin
  Randomize; //Externo a CADP
  L:= nil;
  cargarVector(v);
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L,v);
end.