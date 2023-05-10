{7. La Facultad de Informática desea procesar la información de los alumnos que finalizaron la carrera de
Analista Programador Universitario. Para ello se deberá leer la información de cada alumno, a saber:
número de alumno, apellido, nombres, dirección de correo electrónico, año de ingreso, año de egreso
y las notas obtenidas en cada una de las 24 materias que aprobó (los aplazos no se registran).

1. Realizar un módulo que lea y almacene la información de los alumnos hasta que se ingrese el
alumno con número de alumno -1, el cual no debe procesarse. Las 24 notas correspondientes a
cada alumno deben quedar ordenadas de forma descendente.

2. Una vez leída y almacenada la información del inciso 1, se solicita calcular e informar:
a. El promedio de notas obtenido por cada alumno.
b. La cantidad de alumnos ingresantes 2012 cuyo número de alumno está compuesto
únicamente por dígitos impares.
c. El apellido, nombres y dirección de correo electrónico de los dos alumnos que más rápido
se recibieron (o sea, que tardaron menos años)

3. Realizar un módulo que, dado un número de alumno leído desde teclado, lo busque y elimine de
la estructura generada en el inciso 1. El alumno puede no existir}

program eje07;
const
  dimF = 24;
type
  str30 = string[30];
  vecNotas = array [1..dimF] of real;
  
  REG_alumno = record
    numAlumno,anioIngreso,anioEgreso: integer;
    apellido,nombres,correo: str30;
    notas: vecNotas;
  end;

  Lista = ^Nodo;
  Nodo = record
    dato: REG_alumno;
    sig: Lista;
  end;

// ================ CARGA LISTA
procedure crearLista (var L: Lista; r: REG_alumno);
  var
    nue: Lista;
  begin
    New(nue);
    nue^.dato:= r;
    nue^.sig:= L;
    L:= nue;  
  end;

procedure preguntas (var r: REG_alumno);
  var
    x,y,dimL: integer;
    nota: real;
  begin
    with r do
      begin
        for x:=1 to dimF do
          notas[x]:= 0;
        write ('Numero alumno: '); readln(numAlumno);
        if (numAlumno <> - 1) then
          begin
            write ('Apellido: '); readln(apellido);
            write ('Nombres: '); readln(nombres);
            write ('Correo: '); readln(correo);
            write ('Anio Ingreso: '); readln(anioIngreso);
            write ('Anio Egreso: '); readln(anioEgreso);
            writeln ('Notas:');
            for x:=1 to dimF do
              begin
                write ('Nota: '); readln(nota);
                dimL:= 1;
                while (notas[dimL] > nota) do
                  dimL:= dimL + 1;
                for y:= dimF downto dimL do
                  notas[y]:= notas[y - 1];
                notas[dimL]:= nota;
              end;
          end;
      end;
  end;

procedure cargarLista (var L: Lista);
  var
    r: REG_alumno;
  begin
    preguntas(r);
    while (r.numAlumno <> - 1) do
      begin
        crearLista(L,r);
        preguntas(r);
      end;
  end;
// ================ CARGA LISTA

// =========== INCISOS
function impares (numAlumno: integer): boolean;
  begin
    impares:= true;
    while (numAlumno > 0) and (impares) do
      begin
        if ((numAlumno mod 2) = 0) then
          impares:= false
        else
          numAlumno:= numAlumno div 10;
      end;
  end;

procedure incisos (L: Lista);
  var
    x,cantAlum,anio1,anio2: integer;
    promNotas: real;
    p1,p2: Lista;
  begin
    cantAlum:= 0;
    anio1:= 100;
    anio2:= 100;
    while (L <> nil) do
      begin
        //Inciso 2_a
        promNotas:= 0;
        for x:=1 to dimF do
          promNotas:= promNotas + L^.dato.notas[x];
        promNotas:= promNotas / 24;
        writeln ('El promedio de notas obtenido es: ',promNotas:0:2,'.');

        //Inciso 2_b
        if (impares(L^.dato.numAlumno)) and (L^.dato.anioIngreso = 2012) then
          cantAlum:= cantAlum + 1;

        //Inciso 2_c
        if (anio1 > (L^.dato.anioEgreso - L^.dato.anioIngreso)) then
          begin
            anio2:= anio1;
            p2:= p1;
            anio1:= (L^.dato.anioEgreso - L^.dato.anioIngreso);
            p1:= L;
          end
        else
          if (anio2 > (L^.dato.anioEgreso - L^.dato.anioIngreso)) then
            begin
              anio2:= (L^.dato.anioEgreso - L^.dato.anioIngreso);
              p2:= L;
            end;

        L:= L^.sig;
      end;

    writeln ('La cantidad de alumnos ingresantes 2012 cuyo num. de alumno esta compuesto unicamente por dig impares es: ',cantAlum,'.');
    writeln ('El apellido, nombres y direccion de correo electronico de los dos alumnos que mas rapido se recibieron son:');
    writeln ('Apellido: ',p1^.dato.apellido,' | Nombres: ',p1^.dato.nombres,' | Correo: ',p1^.dato.correo);
    writeln ('Apellido: ',p2^.dato.apellido,' | Nombres: ',p2^.dato.nombres,' | Correo: ',p2^.dato.correo);
  end;
// =========== INCISOS

procedure borrarElem (var L: Lista);
  var
    numAlumno: integer;
    ant,act: Lista;
  begin
    write ('Num alumno: '); readln(numAlumno);
    ant:= L;
    act:= L;
    while (act <> nil) and (act^.dato.numAlumno <> numAlumno) do
      begin
        ant:= act;
        act:= act^.sig;
      end;
    
    if (act^.dato.numAlumno = numAlumno) then
      begin
        if (ant = act) then
          L:= act^.sig
        else
          ant^.sig:= act^.sig;
        dispose(act);
      end;
  end;

//Programa principal
var
  L: Lista;
begin
  L:= nil;
  cargarLista(L);
  writeln ('======= FIN CARGA =======');
  incisos(L);
  borrarElem(L);
end.