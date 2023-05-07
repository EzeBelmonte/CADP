{14. 
El repositorio de código fuente más grande en la actualidad, GitHub, desea estimar el monto invertido en
los proyectos que aloja. Para ello, dispone de una tabla con información de los desarrolladores que
participan en un proyecto de software, junto al valor promedio que se paga por hora de trabajo:

CÓDIGO        ROL DEL DESARROLLADOR                     VALOR/HORA (USD)
1             Analista Funcional                        35,20
2             Programador                               27,45
3             Administrador de bases de datos           31,03
4             Arquitecto de software                    44,28
5             Administrador de redes y seguridad        39,87

Realizar un programa que procese la información de los desarrolladores que participaron en los 1000
proyectos de software más activos durante el año 2017. De cada participante se conoce su país de
residencia, código de proyecto (1 a 1000), el nombre del proyecto en el que participó, el rol que cumplió en
dicho proyecto (1 a 5) y la cantidad de horas trabajadas. La lectura finaliza al ingresar el código de proyecto
-1, que no debe procesarse. Al finalizar la lectura, el programa debe informar:

a) El monto total invertido en desarrolladores con residencia en Argentina.
b) La cantidad total de horas trabajadas por Administradores de bases de datos.
c) El código del proyecto con menor monto invertido.
d) La cantidad de Arquitectos de software de cada proyecto.}

program eje14;
const
  dimF = 1000;
type

  REG_participante = record
    pais,nomProyecto: string;
    cod, rol: integer;
    cantHoras: real;
  end;

  REG_vector = record
    montoDesarrollador,cantHoras,menorMonto: real;
    cantRol: integer;
  end;

  vector = array [1..dimF] of REG_vector;
  vectorP = array [1..5] of real;

// ========= C. INICIALIZACION DE VECTORES ==========
procedure inicializarVector (var v: vector);
  var
    x: integer;
  begin
    for x:= 1 to dimF do
      begin
        v[x].montoDesarrollador:= 0;
        v[x].cantHoras:= 0;
        v[x].menorMonto:= 0;
        v[x].cantRol:= 0;
      end;
  end;

procedure inicializarPrecios (var vp: vectorP);
  begin        
    vp[1]:= 35.20; //Analista Funcional
    vp[2]:= 27.45; //Programador
    vp[3]:= 31.03; //Administrador de bases de datos
    vp[4]:= 44.28; //Arquitecto de software 
    vp[5]:= 39.87; //Administrador de redes y seguridad 
  end;
// ========= F. INICIALIZACION DE VECTORES ==========


// ========= C. CARGA DE VECTORES ==========
procedure cargarVector (var v: vector; r: REG_participante; vp: vectorP);
  begin
    //Inciso A
    if (r.pais = 'argentina') then
      v[r.cod].montoDesarrollador:= v[r.cod].montoDesarrollador + vp[r.rol];
    
    //Inciso B
    if (r.rol = 3) then
      v[r.cod].cantHoras:= v[r.cod].cantHoras + r.cantHoras;

    //Inciso C
    v[r.cod].menorMonto:= v[r.cod].menorMonto + vp[r.rol];

    //Inciso D
    if (r.rol = 4) then
      v[r.cod].cantRol:= v[r.cod].cantRol + 1;
  end;

procedure leer(var v: vector; vp: vectorP);
  var
    r: REG_participante;
  begin
    write ('Codigo proyecto: '); readln(r.cod);
    while (r.cod <> -1) do
      begin
        write ('Pais: '); readln(r.pais);
        write ('Nombre Proyecto: '); readln(r.nomProyecto);
        write ('Rol en el proyecto (1 a 5): '); readln(r.rol);
        write ('Cantidad de horas trabajadas: '); readln(r.cantHoras);

        cargarVector(v,r,vp);

        write ('Codigo proyecto: '); readln(r.cod);
      end;
  end;
// ========= F. CARGA DE VECTORES ==========

// ========= C. IMPRIMIR ==========
{d) La cantidad de Arquitectos de software de cada proyecto.}
procedure imprimir (v: vector);
  var
    x: integer;
    montoDesarrollador,cantHoras,menorMonto: real;
    codigo: integer;
  begin
    montoDesarrollador:= 0;
    cantHoras:= 0;
    menorMonto:= 32767;
    for x:=1 to dimF do
      begin
        montoDesarrollador:= montoDesarrollador + v[x].montoDesarrollador;
        cantHoras:= cantHoras + v[x].cantHoras;
        if (v[x].menorMonto < menorMonto) then
          begin
            menorMonto:= v[x].menorMonto;
            codigo:= x;
          end;
        writeln('La cantidad de Arquitectos de software de cada proyecto: ',v[x].cantRol,'.');
      end;
    writeln('El monto total invertido en desarrolladores con residencia en Argentina es: ',montoDesarrollador:5:2,'.');
    writeln('La cantidad total de horas trabajadas por Administradores de bases de datos: ',cantHoras:5:2,'.');
    writeln('El código del proyecto con menor monto invertido: ',codigo,'.');
  end;
// ========= F. IMPRIMIR ==========

//Programa principal
var
  v: vector;
  vp: vectorP;
begin
  inicializarPrecios(vp);
  inicializarVector(v);
  leer(v,vp);
  imprimir(v);
end.