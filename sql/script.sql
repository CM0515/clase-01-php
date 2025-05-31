-- Crear base de datos
CREATE DATABASE IF NOT EXISTS sistema_escolar;
USE sistema_escolar;
SET SQL_SAFE_UPDATES = 0;


-- Tabla de estudiantes~
CREATE TABLE IF NOT EXISTS estudiantes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    edad INT,
    email VARCHAR(100)
);

-- Agregar columna tipo_documento
ALTER TABLE estudiantes
ADD COLUMN tipo_documento VARCHAR(50) NOT NULL AFTER id;

-- Agregar columna numero_documento
ALTER TABLE estudiantes
ADD COLUMN numero_documento VARCHAR(50) NOT NULL AFTER tipo_documento;

-- Hacer que numero_documento sea único
ALTER TABLE estudiantes
ADD UNIQUE (numero_documento);

DELETE FROM estudiantes WHERE numero_documento = '';

-- Tabla de profesores
CREATE TABLE IF NOT EXISTS profesores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    especialidad VARCHAR(100)
);

-- Tabla de cursos
CREATE TABLE IF NOT EXISTS cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    profesor_id INT,
    FOREIGN KEY (profesor_id) REFERENCES profesores(id)
);

-- Tabla de inscripciones
CREATE TABLE IF NOT EXISTS inscripciones (
    id INT AUTO_INCREMENT PRIMARY KEY,
    estudiante_id INT,
    curso_id INT,
    fecha DATE,
    FOREIGN KEY (estudiante_id) REFERENCES estudiantes(id),
    FOREIGN KEY (curso_id) REFERENCES cursos(id)
);


SELECT * FROM estudiantes;
SELECT * FROM cursos;
SELECT * FROM profesores;
SELECT * FROM inscripciones;

INSERT INTO `sistema_escolar`.`profesores`
(
`nombre`,
`especialidad`)
VALUES ('Ing. Mario','Programador Senior III'),('Ing. Cesar','Programador Senior II')

INSERT INTO `sistema_escolar`.`cursos`
(
`nombre`,
`descripcion`,
`profesor_id`)
VALUES ('Programacion I','Curso de programacion usando PHP',1)

INSERT INTO `sistema_escolar`.`inscripciones`
(
`estudiante_id`,
`curso_id`,
`fecha`)
VALUES (4,1,CURDATE());


SELECT e.nombre AS estudiante, e.numero_documento, c.nombre AS curso, p.nombre AS profesor FROM estudiantes e
INNER JOIN inscripciones i ON i.estudiante_id = e.id
INNER JOIN cursos c ON c.id = i.curso_id
INNER JOIN profesores p ON p.id = c.profesor_id 
ORDER BY c.nombre,e.nombre