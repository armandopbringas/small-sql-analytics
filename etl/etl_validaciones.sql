INSERT INTO alertas_validacion (transaccion_id, tipo_alerta, mensaje)
SELECT id, 'Monto inválido', 'Transacción con monto nulo o cero'
FROM transacciones
WHERE monto IS NULL OR monto = 0;

-- etl/etl_validaciones.sql

-- ✅ Validaciones tempranas y claras

-- Revisa si hay duplicados
SELECT
    cliente_id,
    COUNT(*) AS repeticiones
FROM transacciones
GROUP BY cliente_id
HAVING COUNT(*) > 1;