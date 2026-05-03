CREATE DATABASE [ISSD-TP4-202601];
GO
USE [ISSD-TP4-202601];
GO

-- Tabla 1: Equipos (Maestra)
CREATE TABLE Equipos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL
);

-- Tabla 2: Partidos (Relacionada con Equipos)
CREATE TABLE Partidos (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE NOT NULL,
    idEquipo1 INT NOT NULL,
    idEquipo2 INT NOT NULL,
    FOREIGN KEY (idEquipo1) REFERENCES Equipos(id),
    FOREIGN KEY (idEquipo2) REFERENCES Equipos(id)
);

-- Tabla 3: EventosPartido (Detalle de goles/tarjetas)
CREATE TABLE EventosPartido (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipo INT NOT NULL, -- 1: Gol, 2: Tarjeta Amarilla, 3: Tarjeta Roja
    idEquipo INT NOT NULL,
    momento TIME NOT NULL,
    FOREIGN KEY (idEquipo) REFERENCES Equipos(id)
);