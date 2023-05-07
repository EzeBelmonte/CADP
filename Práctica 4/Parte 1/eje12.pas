{12. En astrofísica, una galaxia se identifica por su nombre, su tipo (1. elíptica; 2. espiral; 3. lenticular; 4.
irregular), su masa (medida en kg) y la distancia en pársecs (pc) medida desde la Tierra. La Unión
Astronómica Internacional cuenta con datos correspondientes a las 53 galaxias que componen el Grupo Local. 

Realizar un programa que lea y almacene estos datos y, una vez finalizada la carga, informe:
a) la cantidad de galaxias de cada tipo.
b) la masa total acumulada de las 3 galaxias principales (la Vía Láctea, Andrómeda y Triángulo) y el
porcentaje que esto representa respecto a la masa de todas las galaxias.
c) la cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc.
d) el nombre de las dos galaxias con mayor masa y el de las dos galaxias con menor masa.}

program eje12;

const
  dimF = 53;
type
  REG_galaxias = record
    nombre: string[20];
    tipo: integer;
    masa,pc: real;
  end;

  vector = array [1..dimF] of REG_galaxias;
  vectorTipo = array [1..4] of integer;

// =========== COMIENZO: COMO SE SUPONE QUE SE DISPONE EL VECTOR
procedure cargarVector (var v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      begin
        write ('Nombre: '); readln(v[x].nombre);
        v[x].tipo:= random(4) + 1;
        write ('Tipo: ',v[x].tipo);
        v[x].masa:= random(32767);
        writeln ('Masa: ',v[x].masa);
        v[x].pc:= random(32767);
        writeln ('Distancia en parsecs: ',v[x].pc);
      end;
  end;
// =========== FIN: COMO SE SUPONE QUE SE DISPONE EL VECTOR

procedure incisoA (v: vector);
  var
    x: integer;
    tipo: vectorTipo;
  begin
    for x:=1 to 4 do
      tipo[x]:= 0;
    //(1. elíptica; 2. espiral; 3. lenticular; 4. irregular)
    for x:=1 to dimF do
      tipo[v[x].tipo]:= tipo[v[x].tipo] + 1;
    
    for x:=1 to 4 do
      begin
        case x of
          1: writeln ('Hay ',tipo[x],' del tipo eliptica');
          2: writeln ('Hay ',tipo[x],' del tipo espiral');
          3: writeln ('Hay ',tipo[x],' del tipo lenticular');
          4: writeln ('Hay ',tipo[x],' del tipo irregular');
        end;
      end;
  end;

procedure incisoB (v: vector);
  var
    x: integer;
    galaxia3,masaTotal,porcen: real;
  begin
    galaxia3:= 0;
    masaTotal:= 0;
    for x:=1 to dimF do
      begin
        if (v[x].nombre = 'la Via Lactea') or (v[x].nombre = 'Andromeda') or (v[x].nombre = 'Triangulo') then
          galaxia3:= galaxia3 + v[x].masa;
        masaTotal:= masaTotal + v[x].masa;
      end;
    porcen:= (galaxia3 * 100) / dimF;
    writeln ('la masa total acumulada de las 3 galaxias principales es ',galaxia3,'kg y el porcentaje que esto representa es ',porcen:3:2,' a la masa de todas las galaxias.');
  end;

procedure incisoC (v: vector);
  var
    x,cant: integer;
  begin
    cant:= 0;
    for x:=1 to dimF do
      if (v[x].tipo <> 4) and (v[x].pc < 1000) then
          cant:=cant + 1;
    
    writeln ('La cantidad de galaxias no irregulares que se encuentran a menos de 1000 pc es: ',cant);
  end;

procedure incisoD (v: vector);
  var
    x: integer;
    nomMax1,nomMax2,nomMin1,nomMin2: string[20];
    max1,max2,min1,min2: real;
  begin
    min1:= 32767;
    min2:= min1;
    max1:= 0;
    max2:= 0;
    for x:=1 to dimF do
      begin
        if (v[x].masa > max1) then
          begin
            max2:= max1;
            nomMax2:= nomMax1;
            max1:= v[x].masa;
            nomMax1:= v[x].nombre;
          end
        else
          if (v[x].masa > max2) then
            begin
              max2:= v[x].masa;
              nomMax2:= v[x].nombre;
            end;

        if (v[x].masa < min1) then
          begin
            min2:= min1;
            nomMin2:= nomMin1;
            min1:= v[x].masa;
            nomMin1:= v[x].nombre;
          end
        else
          if (v[x].masa < min2) then
            begin
              min2:= v[x].masa;
              nomMin2:= v[x].nombre;
            end;
      end;
    
    writeln ('El nombre de las dos galaxias con mayor masa son: ',nomMax1,' y ',nomMax2,'.');
    writeln ('El nombre de las dos galaxias con menor masa son: ',nomMin1,' y ',nomMin2,'.');
  end;
var
  v: vector;
begin
  //=================================
  Randomize; //Externo a CADP, utilizado para cargar el vector
  cargarVector(v);
  incisoA(v);
  incisoB(v);
  incisoC(v);
  incisoD(v);
end.