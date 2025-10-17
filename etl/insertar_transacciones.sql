INSERT INTO transacciones (cliente_id, fecha, monto, tipo_transaccion)
VALUES 
(1, '2025-10-01', 1200.50, 'Gasto'),
(2, '2025-10-01', NULL, 'Gasto'),
(1, '2025-10-02', 0, 'Gasto');

-- etl/insertar_transacciones.sql

-- ✅ Usa validaciones antes de insertar

INSERT INTO transacciones (cliente_id, monto, tipo_transaccion, fecha_transaccion)
SELECT
    cliente_id,
    monto,
    tipo_transaccion,
    fecha_transaccion
FROM staging_transacciones
WHERE monto > 0;