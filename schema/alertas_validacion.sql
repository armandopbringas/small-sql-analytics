CREATE TABLE alertas_validacion (
  id INT PRIMARY KEY AUTO_INCREMENT,
  transaccion_id INT,
  tipo_alerta VARCHAR(100),
  mensaje TEXT,
  fecha_alerta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- schema/alertas_validacion.sql

-- ✅ Agrega comentarios y asegúrate de que los índices estén correctamente definidos
CREATE TABLE IF NOT EXISTS alertas_validacion (
    id SERIAL PRIMARY KEY,
    descripcion TEXT,
    fecha TIMESTAMP DEFAULT NOW()
);