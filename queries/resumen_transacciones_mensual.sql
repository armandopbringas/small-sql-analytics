-- Se utiliza EXTRACT para obtener el año de la fecha y agrupar el total de montos.
-- Ideal para reportes anuales.
SELECT
  EXTRACT(YEAR FROM fecha) AS anio,
  COUNT(*) AS total_transacciones,
  SUM(monto) AS total_monto
FROM
  transacciones
GROUP BY
  anio
ORDER BY
  anio DESC;

  -- queries/resumen_transacciones_mensual.sql

-- ✅ Evita funciones sobre columnas en WHERE (como `EXTRACT(MONTH FROM fecha)` sin índice)
-- ✅ Usa BETWEEN o rangos para aprovechar índices

SELECT
    DATE_TRUNC('month', fecha_transaccion) AS mes,
    COUNT(*) AS total_transacciones,
    SUM(monto) AS monto_total
FROM transacciones
WHERE fecha_transaccion BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY mes
ORDER BY mes;