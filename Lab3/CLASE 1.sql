--SELECT

SELECT * FROM Persona

Select 
		--PrimerNombre + '' + InicialSegundoNombre + '' + PrimerApellido AS [Nombre Completo]
		PrimerApellido + '' + PrimerNombre + '' + InicialSegundoNombre AS [Nombre Completo],
		FechaNacimiento

from Persona
--WHERE FechaNacimiento >= '20050101' AND FechaNacimiento <= '20051231'
WHERE FechaNacimiento between '20050101' AND  '20051231'
--AND PrimerApellido LIKE 'PA%' --% OMITE TODO LO QUE ESTA DESPUED DE ESE PA --%0 inciso b *como saber el ultimo 0*
AND PrimerApellido LIKE '%er%' -- % no importa que tiene antes o despues de ese er --shipping
ORDER BY PrimerApellido ASC 
--AND PrimerApellido Like 'ROAD'


SELECT * FROM Calificacion
--10 notas mas bajas(carne,curso,nota)

select carne,idcurso,NotaFinal
from Calificacion

select top 10 carne,idcurso,NotaFinal --inciso A
from Calificacion
Order BY NotaFinal ASC --DESC

------GROUP BY

--JOIN 