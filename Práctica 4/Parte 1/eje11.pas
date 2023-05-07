{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:

a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}

program eje11;

const
  dimF = 200;
type
  REG_fotos = record
    titulo,autor: string[30];
    likes,clics,cantComent: integer;
  end;

  vector = array [1..dimF] of REG_fotos;

procedure cargarVector (var v: vector);
  var
    x: integer;
  begin
    //Cargo el vector de esta forma semi-automatica, pero los valores deberian agregarse manualmente
    for x:=1 to dimF do
      begin
        write ('Titulo: '); readln(v[x].titulo);
        write ('Autor: '); readln(v[x].autor);
        v[x].likes:= random(10000);
        writeln ('Cantidad de likes: ',v[x].likes);
        v[x].clics:= random(20000);
        writeln ('Cantidad de clics: ',v[x].clics);
        v[x].cantComent:= random(1000);
        writeln ('Cantidad de comentarios: ',v[x].cantComent);
      end;
  end;

procedure incisoA (v: vector);
  var
    titulo: string[30];
    x,likes: integer;
  begin
    likes:= 0;
    for x:=1 to dimF do
      begin
        if (likes < v[x].likes) then
          begin
            likes:= v[x].likes;
            titulo:= v[x].titulo;
          end;
      end;
    writeln ('El titulo de la foto mas vista es: ',titulo);
  end;

procedure incisoB (v: vector);
  var
    x,likesT: integer;
  begin
    likesT:= 0;
    for x:=1 to dimF do
      if (v[x].autor = 'Art Vandelay') then
        likesT:= likesT + v[x].likes;
    writeln ('La cantidad total de las fotos de Art Vandelay son: ',likesT);
  end;

procedure incisoC (v: vector);
  var
    x: integer;
  begin
    for x:=1 to dimF do
      writeln('La todo de titulo ',v[x].titulo,' tiene ',v[x].cantComent,' de comentarios.');
  end;
var
  v: vector;
begin
  Randomize; //Externo a CADP, utilizado para cargar el vector
  cargarVector(v);
  incisoA(v);
  incisoB(v);
  incisoC(v);
end.