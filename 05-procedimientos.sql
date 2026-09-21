-- ============================================================
-- GameStore: Procedimientos almacenados, funciones y disparadores
-- ============================================================
USE GameStore;

DELIMITER $$

-- Ajusta el stock del juego automáticamente al registrar una venta
CREATE TRIGGER trg_descontar_stock
AFTER INSERT ON LineaPedido
FOR EACH ROW
BEGIN
    UPDATE Juego
    SET stock = stock - NEW.cantidad
    WHERE id = NEW.juego_id;
END$$

-- Aplica un descuento porcentual a todos los juegos de una categoría
CREATE PROCEDURE AplicarDescuento(
    IN categoriaNombre VARCHAR(50),
    IN porcentaje DECIMAL(5,2)
)
BEGIN
    UPDATE Juego j
    JOIN Categoria c ON j.categoria_id = c.id
    SET j.precio = ROUND(j.precio * (1 - porcentaje / 100), 2)
    WHERE c.nombre = categoriaNombre;
END$$

-- Devuelve el total recaudado por una plataforma concreta
CREATE FUNCTION IngresosPorPlataforma(plataformaNombre VARCHAR(50))
RETURNS DECIMAL(12,2)
DETERMINISTIC READS SQL DATA
BEGIN
    DECLARE total DECIMAL(12,2);
    SELECT COALESCE(SUM(lp.cantidad * lp.precio_unitario), 0)
    INTO total
    FROM LineaPedido lp
    JOIN Juego j ON lp.juego_id = j.id
    JOIN Plataforma p ON j.plataforma_id = p.id
    WHERE p.nombre = plataformaNombre;
    RETURN total;
END$$

DELIMITER ;

-- ============================================================
-- Ejemplos de uso
-- ============================================================

-- Descuento del 10 % en la categoría Estrategia
CALL AplicarDescuento('Estrategia', 10);

-- Ingresos totales de la plataforma PC
SELECT IngresosPorPlataforma('PC') AS ingresos_pc;

-- Probar el disparador: al registrar una venta se descuenta el stock
INSERT INTO Pedido (cliente_id, fecha, estado) VALUES (10, '2025-01-05', 'PENDIENTE');
SET @nuevo_pedido = LAST_INSERT_ID();
INSERT INTO LineaPedido (pedido_id, juego_id, cantidad, precio_unitario)
VALUES (@nuevo_pedido, 1, 1, 59.99);

-- El stock de "Aetherium Online" debería haber bajado de 12 a 11
SELECT j.titulo, j.stock
FROM Juego j
WHERE j.id = 1;