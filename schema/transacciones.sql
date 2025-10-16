CREATE TABLE transacciones (
  id INT PRIMARY KEY AUTO_INCREMENT,
  cliente_id INT,
  fecha DATE,
  monto DECIMAL(10, 2),
  tipo_transaccion VARCHAR(50),
  banco VARCHAR(50),
  FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);