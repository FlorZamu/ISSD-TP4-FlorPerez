-- 1. Crear la Base de Datos
CREATE DATABASE GestionDeportiva_2025;
GO

USE GestionDeportiva_2025;
GO

-- 2. Crear la tabla de Equipos
CREATE TABLE Equipos (
    IdEquipo INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Ciudad VARCHAR(100)
);

-- 3. Crear la tabla de Partidos (Relacionada con Equipos)
CREATE TABLE Partidos (
    IdPartido INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATETIME NOT NULL,
    IdEquipoLocal INT,
    IdEquipoVisitante INT,
    Resultado VARCHAR(20) DEFAULT 'Pendiente',
    FOREIGN KEY (IdEquipoLocal) REFERENCES Equipos(IdEquipo),
    FOREIGN KEY (IdEquipoVisitante) REFERENCES Equipos(IdEquipo)
);

-- 4. Crear la tabla de Eventos del Partido (Goles, faltas, etc.)
CREATE TABLE EventosPartido (
    IdEvento INT PRIMARY KEY IDENTITY(1,1),
    IdPartido INT,
    Minuto INT,
    Descripcion VARCHAR(255),
    FOREIGN KEY (IdPartido) REFERENCES Partidos(IdPartido)
);

-- 5. Cargar algunos datos de prueba (como hace el profe)
INSERT INTO Equipos (Nombre, Ciudad) VALUES ('Moreno FC', 'Moreno'), ('Atlas', 'General Rodriguez');
INSERT INTO Partidos (Fecha, IdEquipoLocal, IdEquipoVisitante, Resultado) 
VALUES (GETDATE(), 1, 2, '2-1');