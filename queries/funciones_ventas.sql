-- 📁 queries/funciones_ventana.sql
-- Mostrar la última transacción por cliente
WITH transacciones_ordenadas AS (
  SELECT
    cliente_id,
    fecha,
    monto,
    ROW_NUMBER() OVER (PARTITION BY cliente_id ORDER BY fecha DESC) AS rn
  FROM transacciones
)
SELECT * FROM transacciones_ordenadas WHERE rn = 1;

-- Mostrar diferencia entre transacciones consecutivas con LAG()
SELECT
  cliente_id,
  fecha,
  monto,
  monto - LAG(monto) OVER (PARTITION BY cliente_id ORDER BY fecha) AS diferencia
FROM transacciones;

-- queries/funciones_ventas.sql

-- ✅ Usa funciones seguras y documenta su propósito
-- ✅ Agrega comentarios sobre retornos y parámetros

-- Devuelve el total de compras por cliente
CREATE OR REPLACE FUNCTION total_compras_cliente(cliente_id INT)
RETURNS NUMERIC AS $$
BEGIN
  RETURN (
    SELECT COALESCE(SUM(monto), 0)
    FROM transacciones
    WHERE tipo_transaccion = 'compra'
      AND cliente_id = total_compras_cliente.cliente_id
  );
END;
$$ LANGUAGE plpgsql;