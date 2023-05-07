{Actividad 2: procesamiento de las autoevaluaciones de CADP
La cátedra de CADP está analizando los resultados de las autoevaluaciones que realizaron los
alumnos durante el cuatrimestre. Realizar un programa que lea, para cada alumno, su legajo, su
condición (I para INGRESANTE, R para RECURSANTE), y la nota obtenida en cada una de las 5
autoevaluaciones. Si un alumno no realizó alguna autoevaluación en tiempo y forma, se le cargará la
nota -1. La lectura finaliza al ingresar el legajo -1.

Una vez ingresados todos los datos, el programa debe informar:
- Cantidad de alumnos INGRESANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos INGRESANTES.
- Cantidad de alumnos RECURSANTES en condiciones de rendir el parcial y porcentaje sobre el
total de alumnos RECURSANTES.
- Cantidad de alumnos que aprobaron todas las autoevaluaciones
- Cantidad de alumnos cuya nota promedio fue mayor a 6.5 puntos
- Cantidad de alumnos que obtuvieron cero puntos en al menos una autoevaluación.
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez)
- Código de los dos alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero)}

program eje02;

var
	max1,max2,max3,max4,legajomax1,legajomax2,legajomax3,legajomax4,x,A,I,R,legajo,totalAI,totalAR,aprobado,nota,promedioMayor,cero,cant0,cont10:integer;
	porcientoI,porcientoR,sumaNota:real;
	condicion:char;
begin
  promedioMayor:=0;
	max1:=-1;
	max2:=-1;
	max3:=-1;
	max4:=-1;
	cant0:=0;
	A:=0;
	totalAI:=0;
	totalAR:=0;
	I:=0;
	R:=0;
	write('Ingrese el legajo: '); readln(legajo);
	while (legajo<>-1) do
		begin
			cont10:=0;
			cero:=0;
			sumaNota:=0;
			aprobado:=0;
			write('Ingrese la condicion: '); readln(condicion);
		
			for x:=1 to 5 do
				begin
					write('Ingrese nota ',x,': '); readln(nota);
					if (nota >= 4) then
						aprobado:=aprobado + 1;
					sumaNota:=sumaNota+nota;
					if (nota = 0) then
						cero:=cero + 1;
					if (nota = 10) then
						cont10:= cont10 + 1;
				end;

			if (aprobado >= 4) then
				begin
					if (condicion = 'I') then
						I:=I + 1
					else
						R:=R + 1;
				end;

			if (condicion = 'I') then
				totalAI:= totalAI+1
			else
				totalAR:= totalAR+1;

			if (aprobado = 5) then
				A:=A + 1;
			if ((sumaNota / 5) >= 6.5) then
				promedioMayor:=promedioMayor+1;
			if (cero >= 1) then
				cant0:=cant0+1;

			if (cont10 > max1) then 
				begin
					max2:=max1;
					legajomax2:=legajomax1;
					max1:=cont10;
					legajomax1:=legajo;
				end
				else if (cont10>max2) then
					begin
						max2:=cont10;
						legajomax2:=legajo;
					end;

			if (cero>max3) then
				begin
					max4:=max3;
					legajomax4:=legajomax3;
					max3:=cero;
					legajomax3:=legajo;
				end
				else if (cero>max4) then
					begin
						max4:=cero;
						legajomax4:=legajo;
					end;
			write('Ingrese el legajo: '); readln(legajo);
	end;
	porcientoI:=(I*100)/totalAI; //totalAI;
	porcientoR:=(R*100)/totalAR;
	writeln('Cantidad de alumnos ingresantes en condicion: ', I ,' y porcentaje total de alumnos : ',porcientoI:0:2);
	writeln('Cantidad de alumnos recursantes en condicion: ', R ,' y porcentaje total de alumnos : ',porcientoR:0:2);
	writeln('Cantidad de alumnos que aprobaron todas las autoevaluaciones: ',A);
	writeln('Cantidad de alumnos con nota promedio mayor a 6.5: ',promedioMayor);
	writeln('Cantidad de alumnos que obtuvieron 0 en al menos una autoevaluacion: ',cant0);
	writeln('Cantidad de alumnos con mayor cantidad de autoevaluaciones con nota 10 (diez) son: ',legajomax1,' y ',legajomax2);
	writeln('Cantidad de alumnos con mayor cantidad de autoevaluaciones con nota 0 (cero) son: ',legajomax3,' y ',legajomax4);
end.