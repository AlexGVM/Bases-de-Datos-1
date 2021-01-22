/*JOIN*/
--inner join
--left join
--right join
--full outer join

SELECT * FROM Curso
SELECT * FROM Catedratico

SELECT 
 cur.Nombre as 'Nombre Curso',
 cat.PrimerNombre + '' + cat.PrimerApellido as 'Nombre Catedratico' --en esta parte saca el nombre del curso y el nombre catedratico
 
FROM Curso cur --ese cur es un aleas o una variable que guarda los datos de la tabla cur
	inner join Catedratico cat --ese cat es un aleas o una variable que guarda los datos de la tabla cat
	on cur.CarneDocente = cat.CarneDocente --se tiene que dejar indicado el lugar en donde esta el atributo

WHERE cur.Nombre LIKE 'Intro%'

SELECT * FROM Calificacion

/*Nombre de estudiante, correo, el curso, la nota y un mensaje que diga si lo gano o no*/

SELECT 
Per.PrimerNombre + ' ' + Per.InicialSegundoNombre + '. ' + Per.PrimerApellido as 'Nombre estudiante',
Est.email as 'Correo Electronico',
cur.nombre as 'Nombre Curso',
cal.NotaFinal,
Case 
	WHEN cal.NotaFinal >= 65 then 'Aprobado'
	WHEN cal.NotaFinal < 65 then 'Reprobado'
	else 'Desconocido'
end as 'Estao del Curso'

FROM Persona Per
	inner join Estudiante Est
	on Per.IDPersona = Est.IDPersona
	inner join Calificacion cal
	on cal.Carne = est.Carne
	inner join Curso cur
	on cal.IDCurso = cur.IDCurso
	inner join Catedratico cat 
	on cur.CarneDocente = cat.CarneDocente
	WHERE Cat.CarneDocente = (SELECT CarneDocente From Catedratico WHERE PrimerNombre = 'Jaxon' AND PrimerApellido = 'Moon'	)

