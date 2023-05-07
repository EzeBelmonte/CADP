{13. El Grupo Intergubernamental de Expertos sobre el Cambio Climático de la ONU (IPCC) realiza todos los
años mediciones de temperatura en 100 puntos diferentes del planeta y, para cada uno de estos lugares,
obtiene un promedio anual. Este relevamiento se viene realizando desde hace 50 años, y con todos los
datos recolectados, el IPCC se encuentra en condiciones de realizar análisis estadísticos. Realizar un
programa que lea y almacene los datos correspondientes a las mediciones de los últimos 50 años (la
información se ingresa ordenada por año). Una vez finalizada la carga de la información, obtener:

a) el año con mayor temperatura promedio a nivel mundial.
b) el año con la mayor temperatura detectada en algún punto del planeta en los últimos 50 años.}

program eje13;
const
  dimF = 50;
type
  REG_temp = record
    tempAlta: real;
    tempProm: real;
  end;

  vector = array [1..dimF] of REG_temp;


function incisoA (v: vector): integer;
  var
    x: integer;
    tempProm: real;
  begin
    tempProm:= 0;
    for x:= 1 to dimF do
      if (tempProm < v[x].tempProm) then
        begin
          tempProm:= v[x].tempProm;
          incisoA:= x;
        end;
  end;

function incisoB (v: vector): integer;
  var
    x: integer;
    tempAlta: real;
  begin
    tempAlta:= 0;
    for x:= 1 to dimF do
      if (tempAlta < v[x].tempAlta) then
        begin
          tempAlta:= v[x].tempAlta;
          incisoB:= x;
        end;
  end;

procedure cargarV (var v: vector );
  var
    x,y: integer;
    lugar: string[30];
    temp,tempProm,tempAlta: real;
  begin
    tempProm:= 0;
    tempAlta:= 0;
    for x:=1 to dimF do
      begin
        for y:=1 to 100 do
          begin
            write ('Lugar: '); readln(lugar); // No es necesario, pero para darle sentido al programa
            write ('Temperatura: '); readln(temp);

            if (tempAlta < temp) then
              tempAlta:= temp;

            tempProm:= tempProm + temp;
          end;
        tempProm:= tempProm / 100;
        v[x].tempAlta:= tempAlta;
        v[x].tempProm:= tempProm;
      end;
  end;

var
  v: vector;
begin
  cargarV(v);
  writeln ('El anio con mayor temperatura promedio fue: ',incisoA(v));
  writeln ('El anio con mayor temperatura en algun punto fue: ',incisoB(v));
end.
