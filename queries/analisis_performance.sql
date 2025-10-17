-- 📁 queries/analisis_performance.sql
-- Versión no optimizada
EXPLAIN ANALYZE
SELECT * FROM transacciones WHERE YEAR(fecha) = 2023;

-- Versión optimizada
EXPLAIN ANALYZE
SELECT * FROM transacciones
WHERE fecha >= '2023-01-01' AND fecha < '2024-01-01';

-- queries/analisis_performance.sql

-- ✅ Usa índice al evitar LIKE con % al inicio
-- ❌ SELECT * → evitarlo en producción
-- ✅ Usa WHERE lo más pronto posible
-- ✅ Agrega LIMIT si solo estás explorando

SELECT
    cliente_id,
    COUNT(*) AS total_transacciones,
    SUM(monto) AS total_monto
FROM transacciones
WHERE fecha_transaccion >= '2023-01-01'
  AND tipo_transaccion = 'compra' -- ✅ filtro específico
GROUP BY cliente_id
ORDER BY total_monto DESC
LIMIT 50; -- ✅ ideal para exploración