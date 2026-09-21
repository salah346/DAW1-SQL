-- ============================================================
-- GameStore: Consultas de ejemplo
-- ============================================================
USE GameStore;

-- 1. Catálogo completo: cada juego con su categoría y plataforma
SELECT j.titulo, c.nombre AS categoria, p.nombre AS plataforma,
       j.precio, j.pegi
FROM Juego j
JOIN Categoria c   ON j.categoria_id = c.id
JOIN Plataforma p  ON j.plataforma_id = p.id
ORDER BY j.titulo;

-- 2. Juegos con stock bajo (hay que reponer)
SELECT titulo, stock
FROM Juego
WHERE stock <= 5
ORDER BY stock;

-- 3. Número de juegos por categoría
SELECT c.nombre AS categoria, COUNT(*) AS total_juegos
FROM Juego j
JOIN Categoria c ON j.categoria_id = c.id
GROUP BY c.nombre
ORDER BY total_juegos DESC;

-- 4. Juegos de rol más caros primero
SELECT titulo, precio
FROM Juego
WHERE categoria_id = (SELECT id FROM Categoria WHERE nombre = 'Rol')
ORDER BY precio DESC;

-- 5. Importe total de cada pedido (no cancelado)
SELECT p.id AS pedido, CONCAT(cl.nombre, ' ', cl.apellidos) AS cliente,
       SUM(lp.cantidad * lp.precio_unitario) AS importe
FROM Pedido p
JOIN Cliente cl      ON p.cliente_id = cl.id
JOIN LineaPedido lp  ON lp.pedido_id = p.id
WHERE p.estado <> 'CANCELADO'
GROUP BY p.id, cliente
ORDER BY importe DESC;

-- 6. Top 5 juegos más vendidos
SELECT j.titulo, SUM(lp.cantidad) AS unidades_vendidas
FROM LineaPedido lp
JOIN Juego j ON lp.juego_id = j.id
GROUP BY j.titulo
ORDER BY unidades_vendidas DESC
LIMIT 5;

-- 7. Clientes que han gastado más de 100 euros en total
SELECT cl.id, cl.nombre, cl.apellidos,
       SUM(lp.cantidad * lp.precio_unitario) AS gasto_total
FROM Cliente cl
JOIN Pedido p     ON p.cliente_id = cl.id
JOIN LineaPedido lp ON lp.pedido_id = p.id
WHERE p.estado <> 'CANCELADO'
GROUP BY cl.id, cl.nombre, cl.apellidos
HAVING gasto_total > 100
ORDER BY gasto_total DESC;

-- 8. Clientes que aún no han hecho ningún pedido
SELECT cl.nombre, cl.apellidos, cl.email
FROM Cliente cl
LEFT JOIN Pedido p ON p.cliente_id = cl.id
WHERE p.id IS NULL;

-- 9. Juegos que nunca se han vendido
SELECT j.titulo
FROM Juego j
LEFT JOIN LineaPedido lp ON lp.juego_id = j.id
WHERE lp.juego_id IS NULL;

-- 10. Juegos con precio por encima de la media
SELECT titulo, precio
FROM Juego
WHERE precio > (SELECT AVG(precio) FROM Juego)
ORDER BY precio DESC;

-- 11. Pedidos pendientes y su importe
SELECT p.id AS pedido, CONCAT(cl.nombre, ' ', cl.apellidos) AS cliente,
       p.fecha, SUM(lp.cantidad * lp.precio_unitario) AS importe
FROM Pedido p
JOIN Cliente cl     ON p.cliente_id = cl.id
JOIN LineaPedido lp ON lp.pedido_id = p.id
WHERE p.estado = 'PENDIENTE'
GROUP BY p.id, cliente, p.fecha;

-- 12. Pedidos realizados durante las navidades (diciembre)
SELECT p.id AS pedido, cl.nombre, cl.apellidos, p.fecha, p.estado
FROM Pedido p
JOIN Cliente cl ON p.cliente_id = cl.id
WHERE p.fecha BETWEEN '2024-12-01' AND '2024-12-31'
ORDER BY p.fecha;