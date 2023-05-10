{10. Una compañía de venta de insumos agrícolas desea procesar la información de las empresas a las que les provee sus productos. 
De cada empresa se conoce su código, nombre, si es estatal o privada, nombre de la ciudad donde está radicada y los cultivos que realiza 
(a lo sumo 20). Para cada cultivo de la empresa se registra: tipo de cultivo (trigo, maíz, soja, girasol, etc.), 
cantidad de hectáreas dedicadas y la cantidad de meses que lleva el ciclo de cultivo.

a. Realizar un programa que lea la información de las empresas y sus cultivos. Dicha información se ingresa hasta que llegue una 
empresa con código -1 (la cual no debe procesarse). Para cada empresa se leen todos sus cultivos, 
hasta que se ingrese un cultivo con 0 hectáreas (que no debe procesarse).
Una vez leída y almacenada la información, calcular e informar:

b. Nombres de las empresas radicadas en “San Miguel del Monte” que cultivan trigo y cuyo código
de empresa posee al menos dos ceros.
c. La cantidad de hectáreas dedicadas al cultivo de soja y qué porcentaje representa con respecto
al total de hectáreas.
d. La empresa que dedica más tiempo al cultivo de maíz
e. Realizar un módulo que incremente en un mes los tiempos de cultivos de girasol de menos de 5
hectáreas de todas las empresas que no son estatales.}

program eje10;
uses
  sysutils; //Externo a CADP
const
  dimF = 20;
type
  str25 = string[25];

  REG_cultivo = record
    tipo: str25;
    hectareas: real;
    meses: integer;
  end;

  vecCultivo = array [1..dimF] of REG_cultivo;

  REG_empresa = record
    cod,dimL: integer;
    nombre, privEsta,ciudad: str25;
    cultivo: vecCultivo;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_empresa;
    sig: Lista;
  end;

  vecEmpre = array [1..2] of string;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_empresa);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_empresa);
  var
    v: vecEmpre;
    x: integer;
  begin
    v[1]:= 'privada';
    v[2]:= 'estatal';
    with r do
      begin
        cod:= random(500) - 15;
        if (cod <> -1) then
          begin
            nombre:= Concat('Nombre-',IntToStr(random(3000)));
            privEsta:= v[random(2)+1];
            ciudad:= Concat('Ciudad-',IntToStr(random(20000)));
            for x:=1 to 20 do
              begin
                cultivo[x].tipo:= Concat('Tipo-',IntToStr(random(1000)));
                cultivo[x].hectareas:= random(10)+1;
                cultivo[x].meses:= random(100)+1;
              end;
            dimL:= x;
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_empresa;
  begin
    preguntas(r);
    while (r.cod <> -1) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

// ========== INCISOS
function incisoB (cod: integer; v: vecCultivo; dimL: integer): boolean;
  var
    x,dig,cant0: integer;
  begin
    incisoB:= false;
    x:= 1;
    while (x <= dimL) and not(incisoB) do
      begin
        if (v[x].tipo = 'trigo') then
          incisoB:= true
        else
          x:= x + 1;
      end;

    cant0:= 0;
    while (cod > 0) and (cant0 <> 2) and (incisoB) do
      begin
        dig:= cod mod 10;
        if (dig = 0) then
          cant0:= cant0 + 1;
        cod:= cod div 10;
      end;
    if (cant0 <> 2) then
      incisoB:= false;
  end;

procedure incisoC (v: vecCultivo; dimL: integer; var cantHa: real; var incC: integer);
  var
    x: integer;
  begin
    for x:=1 to dimL do
      if (v[x].tipo = 'soja') then
        begin
          cantHa:= cantHa + 1;
          incC:= incC + 1;
        end
      else
        cantHa:= cantHa + 1;
  end;

procedure incisoD (v: vecCultivo; dimL: integer; nom: str25; var mesesMax: integer; var nomEmp: str25);
  var
    x: integer;
  begin
    x:= 1;
    while (x <= dimL) and (v[x].tipo <> 'maiz') do
      x:= x + 1;
    if (v[x].tipo = 'maiz') then
      if (mesesMax < v[x].meses) then
        begin
          mesesMax:= v[x].meses;
          nomEmp:= nom;
        end;
  end;

procedure incisoE (var v:vecCultivo; dimL: integer);
  var
    x: integer;
    cumple: boolean;
  begin
    cumple:= false;
    x:=1;
    while (x <= dimL) and not(cumple) do
      begin
        if (v[x].tipo = 'girasol') and (v[x].hectareas < 5) then
          begin
            v[x].meses:= v[x].meses + 1;
            cumple:= true;
          end
        else
          x:= x + 1;
      end;
  end;

procedure incisos (L: Lista);
  var
    incC,mesesMax: integer;
    cantHa: real;
    nomEmp: str25;
  begin
    incC:= 0;
    cantHa:= 0;
    mesesMax:= 0;
    while (L <> nil) do
      begin
        //Inciso B
        if (L^.dato.ciudad = 'San Miguel del Monte') and (incisoB(L^.dato.cod,L^.dato.cultivo,L^.dato.dimL)) then
          writeln ('Empresa: ',L^.dato.nombre);
        
        //Inciso C
        incisoC(L^.dato.cultivo,L^.dato.dimL,cantHa,incC);

        //Inciso D
        incisoD(L^.dato.cultivo,L^.dato.dimL,L^.dato.nombre,mesesMax,nomEmp);

        //Inciso E
        if (L^.dato.privEsta = 'estatal') then
          incisoE(L^.dato.cultivo,L^.dato.dimL);

        L:= L^.sig;
      end;
    
    //Inciso C
    writeln ('La cantidad de hectarias dedicadas al cultivo de sojas son: ',incC,' y esto representa el ',((incC * 100) / cantHa):0:2,'%.');
  end;
// ========== INCISOS

//Programa principal
var
  L: Lista;
begin
  Randomize; //Externo a CADP
  L:= nil;
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L);
end.