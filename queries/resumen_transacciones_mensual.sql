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