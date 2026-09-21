# DAW1-SQL

Base de datos **GameStore** de ejemplo para una tienda de videojuegos en
línea, creada como material de práctica de SQL de primer año de
**Desarrollo de Aplicaciones Web (DAW)**.

Incluye el esquema completo, datos de ejemplo, más de una docena de consultas
(`JOIN`, agregaciones, subconsultas), vistas, un procedimiento almacenado, una
función y un disparador, además de una batería de ejercicios.

## Estructura de datos

```
Plataforma 1---* Juego *---1 Categoria
Cliente 1---* Pedido 1---* LineaPedido *---1 Juego
```

- `Plataforma`: consolas/plataformas donde se comercializa cada juego.
- `Categoria`: acción, rol, aventura, deportes o estrategia.
- `Juego`: título, precio, stock, año de lanzamiento y clasificación PEGI.
- `Cliente`: datos personales y fecha de alta.
- `Pedido` + `LineaPedido`: pedidos con su detalle (los pedidos validan el
  estado: `PENDIENTE`, `ENVIADO`, `ENTREGADO`, `CANCELADO`).

## Archivos

| Archivo | Contenido |
|---|---|
| `01-schema.sql` | Creación de la base de datos, tablas, claves y restricciones |
| `02-datos.sql` | Datos de ejemplo (16 juegos, 10 clientes, 10 pedidos) |
| `03-consultas.sql` | 12 consultas: JOINs, agregaciones, subconsultas, LEFT JOIN |
| `04-vistas.sql` | Vistas de stock bajo, ventas por juego y gasto por cliente |
| `05-procedimientos.sql` | Disparador, procedimiento de descuento y función de ingresos |
| `06-ejercicios.md` | 15 ejercicios de práctica por niveles |

## Cómo usarla

Con MySQL o MariaDB, carga los archivos en orden:

```bash
mysql -u root -p < 01-schema.sql
mysql -u root -p < 02-datos.sql
mysql -u root -p < 03-consultas.sql
```

O directamente dentro del cliente interactivo:

```sql
mysql> source 01-schema.sql;
mysql> source 02-datos.sql;
```

## Licencia

Proyecto con fines educativos.