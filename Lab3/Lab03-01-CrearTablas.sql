-- 01 Crear base de datos Universidad
CREATE DATABASE Universidad

-- 02 Crear tabla Persona
--USE Universidad

CREATE TABLE Persona
(
    IDPersona INT IDENTITY(1,1) PRIMARY KEY, -- Definir autoincremental y llave primaria
    PrimerNombre NVARCHAR(128) NOT NULL, -- Definir campo que no permita valores nulos
    InicialSegundoNombre NVARCHAR(10),   --Permite Nulos
    PrimerApellido NVARCHAR(128) NOT NULL,
    FechaNacimiento DATE NOT NULL
)

-- 03 Crear tabla Estudiante
CREATE TABLE Estudiante
(
    Carne INT IDENTITY PRIMARY KEY,
    IDPersona INT REFERENCES Persona (IDPersona) -- Agregar una llave foránea
		ON UPDATE CASCADE    --es en cascada, si se quita esas dos lineas de codigo no se va a hacer nada, si se pone una politica se tiene que dejar indicado.
		ON DELETE CASCADE,
    Email NVARCHAR(256)
)

-- 04 Crear tabla Curso
CREATE TABLE Curso
(
    IDCurso INT IDENTITY PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
    Catedratico NVARCHAR(256) NOT NULL
)

-- 05 Crear tabla Calificación
CREATE TABLE Calificacion
(
    Carne INT REFERENCES Estudiante (Carne) -- Agregar una llave foránea
		ON UPDATE CASCADE --Regla de integridad en actualizaciones (si no se pone, sin acción)
		ON DELETE CASCADE,
    IDCurso INT REFERENCES Curso (IDCurso) -- Agregar una llave foránea
		ON UPDATE CASCADE
		ON DELETE CASCADE,
    NotaFinal DECIMAL(5,2) CHECK (NotaFinal <= 100.00 AND NotaFinal >= 0.00), -- Agregar una restricción en el dominio de la columna
    Convocatoria TINYINT,
    CONSTRAINT [PK_notaestudiante] PRIMARY KEY CLUSTERED -- Llave primaria compuesta y un índice
    (
        Carne, IDCurso, NotaFinal, Convocatoria
    )
)

-- 06 Crear tabla Catedrático
CREATE TABLE Catedratico
(
    CarneDocente INT IDENTITY PRIMARY KEY,
    PrimerNombre NVARCHAR(128) NOT NULL, -- Definir campo que no permita valores nulos
    PrimerApellido NVARCHAR(128) NOT NULL,
    Email NVARCHAR(256)
)
SELECT * FROM curso

-- 07 Eliminando una columna
ALTER TABLE Curso --DDL
DROP COLUMN Catedratico; -- Quitando la columna de Catedrático
SELECT * FROM curso

-- 08 Agregando una columna
ALTER TABLE Curso -- Agregando la llave foránea del carné del catedrático
ADD CarneDocente INT REFERENCES Catedratico (CarneDocente)
	ON UPDATE CASCADE
	ON DELETE CASCADE
SELECT * FROM curso
select * from Calificacion
select * from catedratico

-- 09 Modificar datos de las tablas
/* bcp Catedratico y Curso */
TRUNCATE TABLE Curso  -- ¿Qué ocurre?
--DELETE FROM Curso

-- 10 Reajustar el diseño de la BD
TRUNCATE TABLE Calificacion -- Borrar toda los registros de una tabla (DDL)
DROP TABLE Calificacion -- Borrar registros Y estructura de la tabla (DDL)

/* Dos formas de borrar */
TRUNCATE TABLE Curso -- Borrar toda los registros de una tabla (DDL)
-- o
DELETE FROM Curso -- Borrar todos los registros de una tabla (DML)
DBCC CHECKIDENT (Curso, RESEED, 1) -- Reinicia el valor inicial de la columna con incremento

/*bcp Cursov2*/

-- 11 Creando la tabla calificación (Otro método)
CREATE TABLE Calificacion
(
    Carne INT,
    IDCurso INT,
    NotaFinal DECIMAL(5,2) CHECK (NotaFinal <= 100.00), -- Agregar una restricción en el dominio de la columna
    Convocatoria TINYINT,
    CONSTRAINT [PK_notaestudiante] PRIMARY KEY CLUSTERED -- Llave primaria compuesta y un índice
    (
        Carne, IDCurso, NotaFinal, Convocatoria
    )
)
ALTER TABLE Calificacion  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Estudiante] FOREIGN KEY([Carne])
REFERENCES Estudiante ([Carne])
ON UPDATE CASCADE --Regla de integridad en actualizaciones (si no se pone, sin acción)
ON DELETE CASCADE
GO
ALTER TABLE Calificacion  WITH CHECK ADD  CONSTRAINT [FK_Calificacion_Curso] FOREIGN KEY([IDCurso])
REFERENCES Curso ([IDCurso])
ON UPDATE CASCADE --Regla de integridad en actualizaciones (si no se pone, sin acción)
ON DELETE CASCADE
GO

/*bcp Cursov2 y Calificacion*/






	
