-- ============================================================
-- GameStore: Vistas
-- ============================================================
USE GameStore;

-- Juegos que se están quedando sin stock
CREATE OR REPLACE VIEW v_stock_bajo AS
SELECT j.titulo, j.stock, c.nombre AS categoria, p.nombre AS plataforma
FROM Juego j
JOIN Categoria c  ON j.categoria_id = c.id
JOIN Plataforma p ON j.plataforma_id = p.id
WHERE j.stock <= 5;

-- Unidades vendidas e ingresos por juego
CREATE OR REPLACE VIEW v_ventas_por_juego AS
SELECT j.id, j.titulo,
       SUM(lp.cantidad) AS unidades_vendidas,
       SUM(lp.cantidad * lp.precio_unitario) AS ingresos
FROM Juego j
LEFT JOIN LineaPedido lp ON lp.juego_id = j.id
GROUP BY j.id, j.titulo;

-- Gasto acumulado de cada cliente (sin pedidos cancelados)
CREATE OR REPLACE VIEW v_gasto_por_cliente AS
SELECT cl.id, cl.nombre, cl.apellidos,
       COUNT(p.id) AS total_pedidos,
       COALESCE(SUM(lp.cantidad * lp.precio_unitario), 0) AS gasto_total
FROM Cliente cl
LEFT JOIN Pedido p     ON p.cliente_id = cl.id AND p.estado <> 'CANCELADO'
LEFT JOIN LineaPedido lp ON lp.pedido_id = p.id
GROUP BY cl.id, cl.nombre, cl.apellidos;

-- Consultas de ejemplo sobre las vistas
SELECT * FROM v_stock_bajo;
SELECT * FROM v_ventas_por_juego ORDER BY ingresos DESC LIMIT 5;
SELECT * FROM v_gasto_por_cliente ORDER BY gasto_total DESC LIMIT 5;