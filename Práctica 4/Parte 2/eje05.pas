{5. La empresa Amazon Web Services (AWS) dispone de la información de sus 500 clientes monotributistas más
grandes del país. De cada cliente conoce la fecha de firma del contrato con AWS, la categoría del
monotributo (entre la A y la F), el código de la ciudad donde se encuentran las oficinales (entre 1 y 2400) y
el monto mensual acordado en el contrato. La información se ingresa ordenada por fecha de firma de
contrato (los más antiguos primero, los más recientes últimos).
Realizar un programa que lea y almacene la información de los clientes en una estructura de tipo vector.

Una vez almacenados los datos, procesar dicha estructura para obtener:

a. Cantidad de contratos por cada mes y cada año, y año en que se firmó la mayor cantidad de contratos

b. Cantidad de clientes para cada categoría de monotributo

c. Código de las 10 ciudades con mayor cantidad de clientes

d. Cantidad de clientes que superan mensualmente el monto promedio entre todos los clientes.}

program eje05;

const
  dimF = 500;

type
  REG_fecha = record
    dia,mes,anio: integer;
  end;

  REG_aws = record
    fecha: REG_fecha;
    categ: char;
    cod: integer;
    monto: real;
  end;

  REG_montoC = record
    clientes,ciudad: integer;
  end;

  vector = array [1..dimF] of REG_aws;
  vectorCateg = array ['A'..'F'] of integer;
  vectorClien = array [1..2400] of integer;
  vectorCiu = array [1..10] of REG_montoC;

// =========== COMIENZO: SE DEBERIA HACER MANUAL, PERO PARA AGILIZAR LO HAGO AUTOMATICO
procedure cargarV (var v: vector);
  var
    x,dia,mes,anio,categ: integer;
  begin
    dia:= 1;
    mes:= 1;
    anio:= 2020;
    for x:=1 to dimF do
      begin
        v[x].fecha.dia:= dia;
        v[x].fecha.mes:= mes;
        v[x].fecha.anio:= anio;
        dia:= dia + random(5);
        if (dia > 30) then
          begin
            dia:=1;
            mes:= mes + 1;
            if (mes > 12) then
              begin
                mes:= 1;
                anio:= anio + 1;
              end;
          end;
        categ:= random(6) + 1;
        case categ of
          1: v[x].categ:='A';
          2: v[x].categ:='B';
          3: v[x].categ:='C';
          4: v[x].categ:='D';
          5: v[x].categ:='E';
          6: v[x].categ:='F';
        end;
        v[x].cod:= (random(2400) + 1);
        v[x].monto:= random(60000);
      end;
    {for x:=1 to dimF do
      writeln ('Fecha: ',v[x].fecha.dia,'/',v[x].fecha.mes,'/',v[x].fecha.anio);
    writeln();}
  end;
// =========== FIN: SE DEBERIA HACER MANUAL, PERO PARA AGILIZAR LO HAGO AUTOMATICO

procedure incisoA (v: vector);
  var
    x: integer;
    mes,anio,cantMes,max,anioMax,cantMax: integer;
  begin
    x:= 1;
    max:= 0;
    while (x < dimF) do
      begin
        cantMax:= 0;
        anio:= v[x].fecha.anio;
        while (v[x].fecha.anio = anio) and (x < dimF) do
          begin
            cantMes:= 0;
            mes:= v[x].fecha.mes;
            while (v[x].fecha.mes = mes) do
              begin
                cantMes:= cantMes + 1;
                x:= x + 1;
              end;
            writeln ('Este mes tuvo ',cantMes,' contratos.');
            cantMax:= cantMax + cantMes;
          end;
        if (max < cantMax) then
          begin
            max:= cantMax;
            anioMax:= anio;
          end;
        writeln ('El anio tuvo ',cantMax,' contratos.');
      end;
    writeln ('El anio que mas contratos firmo fue el anio ',anioMax,'.');
  end;

procedure incisoB (v: vector);
  var
    x: integer;
    y: char;
    vc: vectorCateg;
  begin
    for y:= 'A' to 'F' do
      vc[y]:= 0;
    for x:= 1 to dimF do
      vc[v[x].categ]:= vc[v[x].categ] + 1;
    for y:= 'A' to 'F' do
      writeln ('La categoria ',y,' tuvo ',vc[y],' clientes.');
  end;

procedure incisoC (v: vector);
  var
    x,y,z: integer;
    vm: vectorClien;
    vc: vectorCiu;
    cumple: boolean;
  begin
    //Vector donde guardo las 10 ciudades
    for x:=1 to 10 do
      vc[x].clientes:= 0;
    
    //Vector donde voy a guardar los montos de cada ciudad;
    for x:=1 to 2400 do
      vm[x]:= 0;

    for x:=1 to dimF do
      vm[v[x].cod]:= vm[v[x].cod] + 1;
    
    {Comparo los valores de los montos guardados en VM (vector de monto por ciudad) con los valores
    guardados en VC (vector de las 10 ciudades que guarda montos)}
    for x:=1 to 2400 do
      begin
        cumple:= true;
        y:= 1;
        while (cumple) and (y <= 10) do
          begin
            if (vm[x] > vc[y].clientes) then
              begin
                for z:=9 downto y do
                  begin
                    vc[z+1].clientes:= vc[z].clientes;
                    vc[z+1].ciudad:= vc[z].ciudad;
                  end;
                vc[y].clientes:=vm[x];
                vc[y].ciudad:= x;
                cumple:= false;
              end
            else
              y:= y + 1;
          end;
      end;
    writeln ('Las ciudades que mas clientes tiene son: ');
    for x:= 1 to 10 do
      writeln (vc[x].ciudad,'.');
  end;

procedure incisoD (v: vector);
  var
    x: integer;
    prom: real;
    clientes: integer;
  begin
    clientes:= 0;
    prom:= 0;
    for x:=1 to dimF do
      prom:= prom + v[x].monto;

    prom:= prom / dimF;

    for x:=1 to dimF do
      begin
        if (prom < v[x].monto) then
          clientes:= clientes + 1;
      end;
    
    writeln ('La cantidad de clientes que superan el promedio son ',clientes,'.');
  end;

var
  v: vector;
begin
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  cargarV(v); //Para agilizar la carga lo hago de forma automatica, pero habria que hacerlo manual
  //=================================
  incisoA(v);
  incisoB(v);
  incisoC(v);
  incisoD(v);
end.