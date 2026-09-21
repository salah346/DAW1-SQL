# Ejercicios de SQL - GameStore

Guía de ejercicios para practicar sobre la base de datos `GameStore`.
Carga antes el esquema y los datos (`01-schema.sql` y `02-datos.sql`).

## Nivel básico

1. Muestra el catálogo completo de juegos (título, plataforma, categoría,
   precio), ordenado por título.
2. Lista los clientes ordenados por fecha de alta, del más antiguo al más
   reciente.
3. Muestra los juegos de la categoría "Aventura" publicados a partir de 2024.
4. Cuenta cuántos juegos hay en cada plataforma.

## Nivel intermedio

5. Lista los juegos de rol ordenados de mayor a menor precio.
6. Calcula el importe total de cada pedido realizado.
7. Muestra los clientes que han hecho más de un pedido.
8. Encuentra los juegos de los que quedan 5 unidades o menos (stock bajo).

## Nivel avanzado

9. Obtén el ranking de los 5 juegos más vendidos por unidades.
10. Calcula los ingresos totales por plataforma.
11. Muestra los clientes que han gastado más de 100 € en total.
12. Encuentra los juegos que nunca se han vendido.
13. Devuelve los juegos con un precio superior a la media de toda la tienda.
14. Crea una vista con el gasto acumulado por cliente.
15. Escribe un procedimiento que aplique un descuento a una categoría y un
    disparador que descuente stock al registrar una línea de pedido.

## Pistas

- Los JOIN entre `Juego`-`Categoria`-`Plataforma` y `Pedido`-`Cliente`-
  `LineaPedido` te dan acceso a toda la información.
- Usa `GROUP BY` con funciones de agregación (`SUM`, `COUNT`, `AVG`) y filtra
  los grupos con `HAVING`.
- En `05-procedimientos.sql` tienes las soluciones del nivel avanzado.