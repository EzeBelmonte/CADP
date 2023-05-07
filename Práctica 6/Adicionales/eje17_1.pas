{17. Continuando con los 3 ejercicios adicionales de la Guía opcional de actividades adicionales, ahora
sumaremos lo aprendido sobre listas para almacenar la información ingresada por teclado. Consideraciones
importantes:
● Los datos ingresados por teclado deberán almacenarse en una estructura de tipo lista apropiada.
● Una vez leídos y almacenados los datos, deberán procesarse (recorrer la lista) para resolver cada
inciso. Al hacerlo, deberán reutilizarse los módulos ya implementados en las prácticas anteriores. En
la medida de lo posible, la lista deberá recorrerse una única vez para resolver todos los incisos.}

{Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:

● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000}

program eje17_1;
type
  REG_empresa = record
    cod,cantInv: integer;
    montoTotal: real;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_empresa;
    sig: Lista;
  end;

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
    x: integer;
  begin
    with r do
      begin
        write ('Codigo: '); readln(cod);
        write ('Cantidad de inversiones: '); readln(cantInv);
        montoTotal:= 0;
          for x:=1 to cantInv do
            write ('Monto: '); readln(montoTotal);
      end;
  end;
procedure cargarLista (var L: Lista);
  var
    r: REG_empresa;
  begin
    repeat
      preguntas(r);
      crearLista(L,r);
    until (r.cod = 100);
  end;
// ================ CARGA LISTA

// ========= PUNTO 1
function promedio (r: REG_empresa): real;
  begin
    promedio:= r.montoTotal / r.cantInv;
  end;
// ========= PUNTO 1

// ============= INCISOS
procedure incisos (L: Lista);
  var
    codMax,cantEmp: integer;
    montoMax: real;
  begin
    montoMax:= 0;
    cantEmp:= 0;
    while (L <> nil) do
      begin
        //Punto 1
        writeln ('El monto promedio de las inversiones de la empresa ',L^.dato.cod,' es: ',promedio(L^.dato):0:2);
        //Punto 2
        if (montoMax < L^.dato.montoTotal) then
          begin
            montoMax:= L^.dato.montoTotal;
            codMax:= L^.dato.cod;
          end;
        //Punto 3
        if (L^.dato.montoTotal > 50000) then
          cantEmp:= cantEmp + 1;
        
        L:= L^.sig;
      end;
    writeln ('El codigo de la empresa con mayor monto total invertido es: ',codMax);
    writeln ('La cantidad de empresas con inversiones de mas de $50000 es: ',cantEmp);
  end;
// ============= INCISOS

//Programa principal
var
	L: Lista;
begin
	L:= nil;
  cargarLista(L);
  writeln ('========== FIN CARGA ==========');
  incisos(L);
end.