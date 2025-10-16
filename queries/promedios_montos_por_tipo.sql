SELECT tipo_transaccion, AVG(monto) AS promedio_monto
FROM transacciones
WHERE monto > 0
GROUP BY tipo_transaccion;

-- Esta consulta utiliza GROUP BY para segmentar por tipo_transaccion y calcular su promedio.
SELECT
  tipo_transaccion,
  ROUND(AVG(monto), 2) AS promedio_monto
FROM
  transacciones
GROUP BY
  tipo_transaccion;

  -- ✅ Filtro lo antes posible para reducir el volumen de datos
-- ✅ Uso alias claros
-- ❌ Evito LIKE '%...%' porque no usa índice

WITH montos_cte AS (
  SELECT 
    tipo_transaccion,
    monto,
    ROW_NUMBER() OVER (PARTITION BY tipo_transaccion ORDER BY monto DESC) AS row_num
  FROM transacciones
  WHERE fecha >= '2022-01-01'  -- ✅ Filtro temprano
)

SELECT 
  tipo_transaccion,
  AVG(monto) AS promedio_monto
FROM montos_cte
WHERE row_num <= 10
GROUP BY tipo_transaccion;