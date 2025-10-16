INSERT INTO alertas_validacion (transaccion_id, tipo_alerta, mensaje)
SELECT id, 'Monto inválido', 'Transacción con monto nulo o cero'
FROM transacciones
WHERE monto IS NULL OR monto = 0;