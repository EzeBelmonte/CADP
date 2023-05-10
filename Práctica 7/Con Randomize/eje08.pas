{8. Una entidad bancaria de la ciudad de La Plata solicita realizar un programa destinado a la administración de transferencias de dinero 
entre cuentas bancarias, efectuadas entre los meses de Enero y Noviembre del año 2018.
El banco dispone de una lista de transferencias realizadas entre Enero y Noviembre del 2018. De cada transferencia se conoce: 
número de cuenta origen, DNI de titular de cuenta origen, número de cuenta destino, DNI de titular de cuenta destino, fecha, hora, monto y 
el código del motivo de la transferencia (1: alquiler, 2: expensas, 3: facturas, 4: préstamo, 5: seguro, 6: honorarios y 7: varios).
Esta estructura no posee orden alguno.
Se pide:
a) Generar una nueva estructura que contenga sólo las transferencias a terceros (son aquellas en las
que las cuentas origen y destino no pertenecen al mismo titular). Esta nueva estructura debe
estar ordenada por número de cuenta origen.
Una vez generada la estructura del inciso a), utilizar dicha estructura para:
b) Calcular e informar para cada cuenta de origen el monto total transferido a terceros.
c) Calcular e informar cuál es el código de motivo que más transferencias a terceros tuvo.
d) Calcular e informar la cantidad de transferencias a terceros realizadas en el mes de Junio en las
cuales el número de cuenta destino posea menos dígitos pares que impares.}

program eje08;
const
  dimF = 7;
type
  dias = 1..31;
  meses = 1..12;
  horas = 0..23;
  mins = 0..59;
  codigo = 1..7;

  REG_fecha = record
    dia: dias;
    mes: meses; 
    anio: integer;
  end;

  REG_hora = record
    hora: horas;
    min: mins;
  end;

  REG_transferencia = record
    numOri,dniOri,numDes,dniDes: integer;
    fecha: REG_fecha; // Se puede usar un String para guardar pero no se si CADP permite hacerlo
    hora: REG_hora; // Se puede usar un String para guardar pero no se si CADP permite hacerlo
    monto: real;
    cod: integer;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_transferencia;
    sig: Lista;
  end;

  vector = array [1..dimF] of integer;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_transferencia);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;  
  end;

procedure preguntas (var r: REG_transferencia);
  begin
    with r do
      begin
        numOri:= random(2000) + 1;
        dniOri:= random(10767) + 20000;
        numDes:= random(2000) + 1;
        dniDes:= random(10767) + 20000;
        fecha.dia:= random(31) + 1;
        fecha.mes:= random(11) + 1;
        if (random(10) < 7) then
          fecha.anio:= 2018
        else
          fecha.anio:= 2000;
        if (fecha.anio = 2018) then
          begin
            hora.hora:= random(24);
            hora.min:= random(60);
            monto:= random(20000) + 1000;
            cod:= random(7) + 1;
          end;
      end;  
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_transferencia;
  begin
    preguntas(r);
    while (r.fecha.anio = 2018) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

// ========== INCISOS
procedure crearLN (var L: Lista; r: REG_transferencia);
  var
    nue,ant,act: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= nil;

    if (L = nil) then
      L:= nue
    else
      begin
        ant:= L;
        act:= L;
        while (act <> nil) and (act^.dato.numOri < r.numOri) do
          begin
            ant:= act;
            act:= act^.sig;
          end;
        
        if (ant = act) then
          L:= nue
        else
          ant^.sig:= nue;
        nue^.sig:= act;
      end;  
  end;

procedure incisoA (L: Lista; var ln: Lista);
  begin
    while (L <> nil) do
      begin
        if (L^.dato.dniOri <> L^.dato.dniDes) then
          crearLN(ln,L^.dato);
        L:= L^.sig;
      end;
  end;

function impares (numCuenta: integer): boolean;
  var
    par,impar: integer;
  begin
    par:= 0;
    impar:= 0;
    while (numCuenta > 0) do
      begin
        if ((numCuenta mod 2) = 0) then
          par:= par + 1
        else
          impar:= impar + 1;
        numCuenta:= numCuenta div 10;
      end;
    if (impar > par) then
      impares:= true
    else
      impares:= false;
  end;

procedure incisos (L: Lista);
  var
    x,auxCuenta,codMax,transMax,cantJunio: integer;
    montoTotal: real;
    v: vector;
  begin
    for x:=1 to dimF do
      v[x]:= 0;
    transMax:= 0;
    cantJunio:= 0;

    while (L <> nil) do
      begin
        //Inciso B
        auxCuenta:= L^.dato.numOri;
        montoTotal:= 0;
        while (L <> nil) and (auxCuenta = L^.dato.numOri) do
          begin
            montoTotal:= montoTotal + L^.dato.monto;

            //Inciso C
            v[L^.dato.cod]:= v[L^.dato.cod] + 1;

            //Inciso D
            if (impares(L^.dato.numDes)) and (L^.dato.fecha.mes = 6) then
              cantJunio:= cantJunio + 1;

            L:= L^.sig;
          end;
          
        writeln ('El monto total transferido a terceros es: $',montoTotal:0:2,'.');
      end;

    for x:=1 to dimF do
      if (transMax < v[x]) then
        begin
          transMax:= v[x];
          codMax:= x;
        end;
    writeln ('El codigo de motivo que mas transferencias a terceros tuvo es: ',codMax,'.');
    writeln ('La cant. de transf. a terceros realizadas en el mes de Junio en las cuales el num de cuenta destino posea menos dig pares que impares es: ',cantJunio,'.');
  end;
// ========== INCISOS

//Programa principal
var
  L: Lista;
  ln: Lista;
begin
  Randomize; //Externo a CADP
  L:= nil;
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  ln:= nil;
  incisoA(L,ln);
  incisos(ln);
end.