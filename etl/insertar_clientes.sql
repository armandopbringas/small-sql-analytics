INSERT INTO clientes (nombre, email, pais)
VALUES 
('Juan Pérez', 'juan@example.com', 'México'),
('Ana Gómez', 'ana@example.com', 'México');

-- etl/insertar_clientes.sql

-- ✅ Usa INSERT con validaciones para evitar errores
-- ✅ Agrega comentarios

INSERT INTO clientes (nombre, correo)
SELECT DISTINCT
    nombre, correo
FROM staging_clientes
WHERE correo IS NOT NULL;