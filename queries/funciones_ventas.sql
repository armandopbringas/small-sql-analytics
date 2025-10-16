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