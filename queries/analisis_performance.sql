-- 📁 queries/analisis_performance.sql
-- Versión no optimizada
EXPLAIN ANALYZE
SELECT * FROM transacciones WHERE YEAR(fecha) = 2023;

-- Versión optimizada
EXPLAIN ANALYZE
SELECT * FROM transacciones
WHERE fecha >= '2023-01-01' AND fecha < '2024-01-01';