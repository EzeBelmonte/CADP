{3. Una empresa de transporte de caudales desea optimizar el servicio que brinda a sus clientes. Para ello,
cuenta con información sobre todos los viajes realizados durante el mes de marzo. De cada viaje se cuenta
con la siguiente información: día del mes (de 1 a 31), monto de dinero transportado y distancia recorrida
por el camión (medida en kilómetros).

a. Realizar un programa que lea y almacene la información de los viajes (a lo sumo 200). La lectura finaliza
cuando se ingresa una distancia recorrida igual a 0 km, que no debe procesarse.

b. Realizar un módulo que reciba el vector generado en a) e informe:
- El monto promedio transportado de los viajes realizados
- La distancia recorrida y el día del mes en que se realizó el viaje que transportó menos dinero.
- La cantidad de viajes realizados cada día del mes.

c. Realizar un módulo que reciba el vector generado en a) y elimine todos los viajes cuya distancia
recorrida sea igual a 100 km.

Nota: para realizar el inciso b, el vector debe recorrerse una única vez.}

program eje03;

const
  dimF = 200;

type
  dias = 1..31;
  REG_caudal = record
    dia: dias;
    monto,km: real;
  end;

  vector = array [1..dimF] of REG_caudal;
  vectorDia = array [1..31] of integer;

// =========== COMIENZO: COMIENZO: SE DEBERIA HACER MANUAL, PERO PARA AGILIZAR LO HAGO AUTOMATICO
procedure incisoA (var v: vector; var dimL: integer);
  var
    km: real;
  begin
    write ('Km: '); readln(km);
    while (dimL < dimF) and (km > 0) do
      begin
        dimL:= dimL + 1;
        v[dimL].km:= km;
        //write ('Dia: '); readln(v[dimL].dia);
        v[dimL].dia:= random(31) + 1;
        //write ('Monto: '); readln(v[dimL].monto);
        v[dimL].monto:= random(30000) + 2000;

        write ('Km: '); readln(km);
      end;
  end;
// =========== FIN: COMIENZO: SE DEBERIA HACER MANUAL, PERO PARA AGILIZAR LO HAGO AUTOMATICO

procedure incisoB (v: vector; dimL: integer);
  var
    x: integer;
    prom,kmMin,diaMin,min: real;
    //Como no aclara que el vector esta cargado en orden por dias, uso un vector para guardar el PUNTO 3
    vD: vectorDia;
  begin
    prom:= 0;
    min:= 32767;
    for x:=1 to 31 do
      vD[x]:= 0;

    for x:=1 to dimL do
      begin
        prom:= prom + v[x].monto; //PUNTO 1

        if (min > v[x].monto) then //PUNTO 2
          begin
            min:= v[x].monto;
            kmMin:= v[x].km;
            diaMin:= v[x].dia;
          end;

        vD[v[x].dia]:= vD[v[x].dia] + 1; //PUNTO 3
      end;
    prom:= prom / dimL;
    writeln ('El monto promedio es :',prom:0:2,'$.');
    writeln ('El dia ',diaMin,'/03 se recorrio ',kmMin,'km y fue el dia que menos se recaudo.');
    for x:=1 to 31 do
      writeln ('El dia ',x,' se realizaron ',vd[x],' viajes.');
  end;

procedure incisoC (var v: vector; var dimL: integer);
  var
    x,pos,cont: integer;
  begin
    cont:= 0;
    pos:= 1;
    x:= 1;
    while (x < dimL) do
      begin
        if (v[x].km = 100) then
          begin
            pos:= x;
            while (v[pos].km = 100) and (pos < dimL) do
              pos:= pos + 1;
            v[x]:= v[pos];
          end
        else
          x:= x + pos;
      end;
    dimL:= dimL - pos;
  end;

var
  v: vector;
  dimL: integer;
begin
  dimL:= 0;
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  incisoA(v,dimL); //No lo pide el enunciado, lo hice por mi cuenta
  //=================================
  incisoB(v,dimL);
  incisoc(v,dimL);
end.