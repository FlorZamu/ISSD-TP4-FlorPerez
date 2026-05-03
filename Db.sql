-- 1. LIMPIEZA DE TABLAS (Por si quedaron restos de pruebas anteriores)
IF OBJECT_ID('EventosPartido', 'U') IS NOT NULL DROP TABLE EventosPartido;
IF OBJECT_ID('Partidos', 'U') IS NOT NULL DROP TABLE Partidos;
IF OBJECT_ID('Equipos', 'U') IS NOT NULL DROP TABLE Equipos;

-- 2. CREACIÓN DE TABLA EQUIPOS
CREATE TABLE Equipos (
    id INT PRIMARY KEY IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL
);

-- 3. CREACIÓN DE TABLA PARTIDOS
-- Relaciona dos equipos y una fecha
CREATE TABLE Partidos (
    id INT PRIMARY KEY IDENTITY(1,1),
    fecha DATE NOT NULL,
    idEquipo1 INT NOT NULL,
    idEquipo2 INT NOT NULL,
    CONSTRAINT FK_EquipoLocal FOREIGN KEY (idEquipo1) REFERENCES Equipos(id),
    CONSTRAINT FK_EquipoVisitante FOREIGN KEY (idEquipo2) REFERENCES Equipos(id)
);

-- 4. CREACIÓN DE TABLA EVENTOS (Goles, Tarjetas, etc.)
CREATE TABLE EventosPartido (
    id INT PRIMARY KEY IDENTITY(1,1),
    idPartido INT NOT NULL,
    idEquipo INT NOT NULL,
    tipo INT NOT NULL, -- 1: Gol, 2: Tarjeta Amarilla, 3: Tarjeta Roja
    momento TIME NOT NULL,
    CONSTRAINT FK_Evento_Partido FOREIGN KEY (idPartido) REFERENCES Partidos(id),
    CONSTRAINT FK_Evento_Equipo FOREIGN KEY (idEquipo) REFERENCES Equipos(id)
);

-- 5. CARGA DE DATOS INICIALES (Para que el botón "Ver Detalles" funcione ya mismo)
-- Insertamos los equipos que me pediste[cite: 2]
INSERT INTO Equipos (nombre) VALUES ('Moreno FC');  -- Se le asignará ID 1
INSERT INTO Equipos (nombre) VALUES ('ISSD United'); -- Se le asignará ID 2
INSERT INTO Equipos (nombre) VALUES ('Sistemas FC'); -- Se le asignará ID 3

-- Insertamos un partido de prueba entre Moreno FC e ISSD United[cite: 2]
INSERT INTO Partidos (fecha, idEquipo1, idEquipo2) 
VALUES ('2026-05-15', 1, 2);

-- Insertamos un evento (un gol de Moreno FC a los 15 minutos)
INSERT INTO EventosPartido (idPartido, idEquipo, tipo, momento) 
VALUES (1, 1, 1, '00:15:00');