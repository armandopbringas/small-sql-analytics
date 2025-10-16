SELECT t.id, c.nombre, t.fecha, t.monto, t.tipo_transaccion
FROM transacciones t
JOIN clientes c ON t.cliente_id = c.id;

-- 📁 queries/join_clientes_transacciones.sql
-- Consulta: Un JOIN entre clientes y transacciones

-- Se utiliza un INNER JOIN para unir las transacciones con los clientes que existen en ambas tablas.
-- Esto permite obtener información combinada como nombre y monto, útil para dashboards o reportes.

SELECT
  c.id_cliente,
  c.nombre,
  t.fecha,
  t.monto,
  t.tipo_transaccion
FROM
  clientes c
INNER JOIN
  transacciones t ON c.id_cliente = t.id_cliente;