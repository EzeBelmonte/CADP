{Actividad 1: Revisando Inversiones
Realizar un programa que analice las inversiones de las empresas más grandes del país. Para cada
empresa se lee su código (un número entero), la cantidad de inversiones que tiene, y el monto
dedicado a cada una de las inversiones. La lectura finaliza al ingresar la empresa con código 100,
que debe procesarse.
El programa deberá informar:
● Para cada empresa, el monto promedio de sus inversiones
● Código de la empresa con mayor monto total invertido
● Cantidad de empresas con inversiones de más de $50000}

program eje01;
var
	i,codigodos,codigo,codigomax,cantidad,cantidadmax:integer;
	max,monto,montomax,promedio:real;
begin
	cantidadmax:=0;
	max:=-9999;
	codigomax:=-9999;
	repeat
		codigodos:=0;
		montomax:=0;
		promedio:=0;
		write('Ingrese un codigo de empresa: ');
		read(codigo);
		write('Ingrese la cantidad de inversiones: ');
		read(cantidad);
		for i:= 1 to cantidad do
		begin
			write('Ingrese el monto de cada inversion: ');
			read(monto);
			montomax:=montomax+monto;
			if (monto>50000) then
				codigodos:=codigodos+1;
		end;
		promedio:=montomax/cantidad;
		if (cantidad=codigodos) then
			cantidadmax:=cantidadmax+1;
		if (montomax>max) then begin
			max:=montomax;
			codigomax:=codigo;
		end;
		writeln('Resultado de analisis: Empresa ', codigo ,' Monto promedio ' , promedio:0:2);
	until(codigo=100);
	writeln('La empresa ', codigomax ,' es la que mayor dinero posee invertido ''( ', max:0:2 , ' ).');
	writeln('Hay ', cantidadmax ,' empresas con inversiones por mas de $50000');

  read();
end.