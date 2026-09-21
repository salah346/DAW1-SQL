-- ============================================================
-- GameStore: Datos de ejemplo
-- ============================================================
USE GameStore;

-- Plataformas
INSERT INTO Plataforma (nombre) VALUES
    ('PC'),
    ('PlayStation 5'),
    ('Xbox Series X'),
    ('Nintendo Switch');

-- Categorías
INSERT INTO Categoria (nombre) VALUES
    ('Accion'),
    ('Rol'),
    ('Aventura'),
    ('Deportes'),
    ('Estrategia');

-- Juegos
INSERT INTO Juego (titulo, plataforma_id, categoria_id, precio, stock, anio_lanzamiento, pegi) VALUES
    ('Aetherium Online',    1, 2, 59.99,  12, 2024, 16),
    ('Espadas del Vacio',   1, 2, 49.99,   4, 2023, 16),
    ('Carreras Imposibles', 2, 4, 39.99,  20, 2024, 3),
    ('Torneo Urbano',       2, 4, 29.99,   8, 2022, 7),
    ('Bosque de Susurros',  4, 3, 44.99,   3, 2023, 7),
    ('La Ciudad Flotante',  3, 3, 54.99,  15, 2024, 12),
    ('Brazadas de Hierro',  3, 4, 24.99,   9, 2021, 3),
    ('Imperios de Ceniza',  1, 5, 34.99,   7, 2023, 12),
    ('Combate Final',       1, 1, 69.99,   2, 2025, 18),
    ('Senderos del Alba',   4, 1, 59.99,   6, 2024, 16),
    ('Nave Estelar Nova',   2, 5, 47.99,  11, 2022, 7),
    ('Sombras del Reino',   4, 3, 64.99,   1, 2025, 12),
    ('Copa Mundial Virtual', 3, 4, 49.99, 18, 2024, 3),
    ('Rex Alfa',            2, 1, 42.99,   5, 2021, 12),
    ('El Ultimo Bastion',   1, 5, 35.99,   0, 2023, 16),
    ('Misterios del Atlas', 4, 2, 52.99,  10, 2025, 12);

-- Clientes
INSERT INTO Cliente (nombre, apellidos, email, telefono, fecha_alta) VALUES
    ('Lucia',     'Martinez Ruiz',    'lucia.martinez@correo.es',     '600111222', '2024-01-10'),
    ('Marcos',    'Garcia Lopez',     'marcos.garcia@correo.es',      '600222333', '2024-02-03'),
    ('Elena',     'Fernandez Soler',  'elena.fernandez@correo.es',    '600333444', '2024-03-15'),
    ('Diego',     'Sanchez Medina',   'diego.sanchez@correo.es',      '600444555', '2024-04-22'),
    ('Paula',     'Torres Navarro',   'paula.torres@correo.es',       '600555666', '2024-05-05'),
    ('Adrian',    'Ramirez Gil',      'adrian.ramirez@correo.es',     '600666777', '2024-06-18'),
    ('Sara',      'Ortega Molina',    'sara.ortega@correo.es',        '600777888', '2024-07-30'),
    ('Hugo',      'Vega Castillo',    'hugo.vega@correo.es',          '600888999', '2024-08-12'),
    ('Nuria',     'Perez Delgado',    'nuria.perez@correo.es',        '600999000', '2024-09-25'),
    ('Ivan',      'Mora Serrano',     'ivan.mora@correo.es',          '601000111', '2024-10-14');

-- Pedidos
INSERT INTO Pedido (cliente_id, fecha, estado) VALUES
    (1, '2024-11-02', 'ENTREGADO'),
    (2, '2024-11-10', 'ENTREGADO'),
    (3, '2024-11-15', 'ENVIADO'),
    (4, '2024-11-20', 'ENTREGADO'),
    (5, '2024-11-27', 'PENDIENTE'),
    (6, '2024-12-01', 'CANCELADO'),
    (7, '2024-12-05', 'ENTREGADO'),
    (8, '2024-12-12', 'ENVIADO'),
    (9, '2024-12-18', 'PENDIENTE'),
    (10, '2024-12-23', 'ENTREGADO');

-- Líneas de pedido
INSERT INTO LineaPedido (pedido_id, juego_id, cantidad, precio_unitario) VALUES
    (1,  1, 1, 59.99),
    (1,  5, 2, 44.99),
    (2,  3, 1, 39.99),
    (3,  9, 1, 69.99),
    (3, 13, 1, 49.99),
    (4,  2, 1, 49.99),
    (4, 10, 1, 59.99),
    (5,  8, 2, 34.99),
    (6, 11, 1, 47.99),
    (7,  6, 1, 54.99),
    (7, 16, 2, 52.99),
    (8, 14, 1, 42.99),
    (9, 12, 1, 64.99),
    (10, 4, 3, 29.99),
    (10, 7, 1, 24.99);