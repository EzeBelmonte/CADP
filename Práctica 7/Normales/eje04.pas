{4. Una maternidad dispone información sobre sus pacientes. De cada una se conoce: nombre, apellido y
peso registrado el primer día de cada semana de embarazo (a lo sumo 42). La maternidad necesita un
programa que analice esta información, determine e informe:
a. Para cada embarazada, la semana con mayor aumento de peso.
b. El aumento de peso total de cada embarazada durante el embarazo.}

program eje04;
const
  dimF = 42;
type
  str20 = string[20];
  
  vector = array [1..dimF] of real;

  REG_embarazada = record
    nombre,apellido: str20;
    dimL: integer;
    peso: vector;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_embarazada;
    sig: Lista;
  end;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_embarazada);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;
  end;

procedure preguntas (var r: REG_embarazada);
  var
    pesoAux: integer;
  begin
    with r do
      begin
        dimL:= 0;
        write ('Apellido: '); readln(apellido);
        write ('nombre: '); readln(nombre);
        write ('Peso: '); readln(pesoAux);
        //Como a lo sumo puede haber 42 pesos, signifca que no esta cargado si o si el vector,
        //entonces se corta si se ingresa peso 0 o la dimL > dimF
        while (dimL < dimF) and (pesoAux <> 0) do
          begin
            dimL:= dimL + 1;
            peso[dimL]:= pesoAux;
            write ('Peso: '); readln(pesoAux);
          end;
      end;  
  end;

procedure cargarLista (var L: Lista);
  var
    x: integer;
    r: REG_embarazada;
  begin
    //Como no indica hasta cuando ingresar datos, le pongo un FOR hasta 100
    for x:=1 to 100 do
      begin
        preguntas(r);
        crearLista(L,r);
      end;
  end;
// ================ CARGA LISTA

// =========== INCISOS
procedure incisos (L: Lista);
  var
    x,semanaMax: integer;
    pesoMax,pesoTotal: real;
  begin
    while (L <> nil) do
      begin
        //Inciso A y B
        pesoMax:= 0;
        pesoTotal:= 0;
        for x:=1 to L^.dato.dimL do
          begin
            //Inciso A
            if (pesoMax < L^.dato.peso[x]) then
              begin
                pesoMax:= L^.dato.peso[x];
                semanaMax:= x;
              end;
            //Inciso B
            pesoTotal:= pesoTotal + L^.dato.peso[x];
          end;

        writeln ('La semana con mayor aumento de peso fue la semana ',semanaMax);
        writeln ('El aumento de peso total durante el embarazo fue de: ',pesoTotal:0:2);
        
        L:= L^.sig;
      end;
  end;
// =========== INCISOS

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L);
end.