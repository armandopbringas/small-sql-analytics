CREATE TABLE alertas_validacion (
  id INT PRIMARY KEY AUTO_INCREMENT,
  transaccion_id INT,
  tipo_alerta VARCHAR(100),
  mensaje TEXT,
  fecha_alerta TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);