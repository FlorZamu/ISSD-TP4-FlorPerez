CREATE DATABASE [ISSD-TP4-202601];
GO
USE [ISSD-TP4-202601];
GO

CREATE TABLE Equipos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Partidos (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE,
    idEquipo1 INT NOT NULL,
    idEquipo2 INT NOT NULL,
    FOREIGN KEY (idEquipo1) REFERENCES Equipos(id),
    FOREIGN KEY (idEquipo2) REFERENCES Equipos(id)
);

CREATE TABLE EventosPartido (
    id INT PRIMARY KEY IDENTITY(1,1),
    tipo INT, -- Ejemplo: 1=Gol, 2=Amarilla, 3=Roja
    idEquipo INT NOT NULL,
    momento TIME,
    FOREIGN KEY (idEquipo) REFERENCES Equipos(id)
);
