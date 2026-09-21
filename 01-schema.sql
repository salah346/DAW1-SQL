-- ============================================================
-- GameStore: Base de datos de una tienda de videojuegos en línea
-- Esquema de datos (MySQL 8 / MariaDB)
-- ============================================================

DROP DATABASE IF EXISTS GameStore;
CREATE DATABASE GameStore;
USE GameStore;

CREATE TABLE Plataforma (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Categoria (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL UNIQUE
) ENGINE=InnoDB;

CREATE TABLE Juego (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    plataforma_id INT NOT NULL,
    categoria_id INT NOT NULL,
    precio DECIMAL(8,2) NOT NULL CHECK (precio > 0),
    stock INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    anio_lanzamiento YEAR,
    pegi TINYINT CHECK (pegi IN (3, 7, 12, 16, 18)),
    CONSTRAINT fk_juego_plataforma FOREIGN KEY (plataforma_id)
        REFERENCES Plataforma (id),
    CONSTRAINT fk_juego_categoria FOREIGN KEY (categoria_id)
        REFERENCES Categoria (id)
) ENGINE=InnoDB;

CREATE TABLE Cliente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(80) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefono VARCHAR(15),
    fecha_alta DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Pedido (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    fecha DATE NOT NULL,
    estado ENUM('PENDIENTE', 'ENVIADO', 'ENTREGADO', 'CANCELADO')
        NOT NULL DEFAULT 'PENDIENTE',
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (cliente_id)
        REFERENCES Cliente (id)
) ENGINE=InnoDB;

CREATE TABLE LineaPedido (
    pedido_id INT NOT NULL,
    juego_id INT NOT NULL,
    cantidad INT NOT NULL CHECK (cantidad > 0),
    precio_unitario DECIMAL(8,2) NOT NULL CHECK (precio_unitario > 0),
    PRIMARY KEY (pedido_id, juego_id),
    CONSTRAINT fk_linea_pedido FOREIGN KEY (pedido_id)
        REFERENCES Pedido (id) ON DELETE CASCADE,
    CONSTRAINT fk_linea_juego FOREIGN KEY (juego_id)
        REFERENCES Juego (id)
) ENGINE=InnoDB;

CREATE INDEX idx_juego_titulo ON Juego (titulo);
CREATE INDEX idx_pedido_fecha ON Pedido (fecha);
CREATE INDEX idx_juego_stock ON Juego (stock);