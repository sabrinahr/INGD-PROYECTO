
-- ASESOR
DROP TABLE test_asesor CASCADE CONSTRAINTS;
CREATE TABLE test_asesor (
    asesor_id NUMBER PRIMARY KEY,
    nombre_asesor VARCHAR2(100)
);

INSERT INTO test_asesor (asesor_id, nombre_asesor) VALUES (101, 'Lucía Gutiérrez');
INSERT INTO test_asesor (asesor_id, nombre_asesor) VALUES (102, 'Marco Cárdenas');

-- EMPRESARIA
DROP TABLE test_empresaria CASCADE CONSTRAINTS;
CREATE TABLE test_empresaria (
    empresaria_id NUMBER PRIMARY KEY,
    nombres VARCHAR2(100),
    departamento VARCHAR2(50),
    asesor_id NUMBER,
    FOREIGN KEY (asesor_id) REFERENCES test_asesor(asesor_id)
);

INSERT INTO test_empresaria (empresaria_id, nombres, departamento, asesor_id) VALUES (201, 'Juana Ríos', 'Lima', 101);
INSERT INTO test_empresaria (empresaria_id, nombres, departamento, asesor_id) VALUES (202, 'Mariela Suárez', 'Cusco', 101);
INSERT INTO test_empresaria (empresaria_id, nombres, departamento, asesor_id) VALUES (203, 'Karla Herrera', 'Arequipa', 102);
INSERT INTO test_empresaria (empresaria_id, nombres, departamento, asesor_id) VALUES (204, 'Diana López', 'Lima', 102);

-- PRODUCTOS
DROP TABLE test_productos CASCADE CONSTRAINTS;
CREATE TABLE test_productos (
    productos_id NUMBER PRIMARY KEY,
    nombre_producto VARCHAR2(100),
    categoria VARCHAR2(50),
    precio NUMBER(10, 2),
    stock NUMBER
);

INSERT INTO test_productos (productos_id, nombre_producto, categoria, precio, stock) VALUES (301, 'Shampoo Herbal', 'Cuidado Personal', 25.90, 50);
INSERT INTO test_productos (productos_id, nombre_producto, categoria, precio, stock) VALUES (302, 'Crema Facial Noche', 'Cosméticos', 40.00, 35);
INSERT INTO test_productos (productos_id, nombre_producto, categoria, precio, stock) VALUES (303, 'Perfume Dama Primavera', 'Perfumería', 89.99, 20);
INSERT INTO test_productos (productos_id, nombre_producto, categoria, precio, stock) VALUES (304, 'Base Líquida Tono Medio', 'Maquillaje', 55.50, 15);

-- PEDIDO
DROP TABLE test_pedido CASCADE CONSTRAINTS;
CREATE TABLE test_pedido (
    pedido_id NUMBER PRIMARY KEY,
    fecha DATE,
    costo_envio NUMBER(10, 2),
    estado VARCHAR2(50),
    monto_comision NUMBER(10, 2),
    monto_pago NUMBER(10, 2),
    empresaria_id NUMBER,
    FOREIGN KEY (empresaria_id) REFERENCES test_empresaria(empresaria_id)
);

INSERT INTO test_pedido (pedido_id, fecha, costo_envio, estado, monto_comision, monto_pago, empresaria_id) 
VALUES (401, TO_DATE('2024-05-01', 'YYYY-MM-DD'), 10.5, 'Completado', 120.00, 600.00, 201);

INSERT INTO test_pedido (pedido_id, fecha, costo_envio, estado, monto_comision, monto_pago, empresaria_id) 
VALUES (402, TO_DATE('2024-05-03', 'YYYY-MM-DD'), 15.0, 'Completado', 150.00, 750.00, 202);

-- PEDIDO_PRODUCTO
DROP TABLE test_pedido_producto CASCADE CONSTRAINTS;
CREATE TABLE test_pedido_producto (
    pedido_producto_id NUMBER PRIMARY KEY,
    pedido_id NUMBER,
    productos_id NUMBER,
    cantidad NUMBER,
    importe NUMBER(10, 2),
    FOREIGN KEY (pedido_id) REFERENCES test_pedido(pedido_id),
    FOREIGN KEY (productos_id) REFERENCES test_productos(productos_id)
);

INSERT INTO test_pedido_producto (pedido_producto_id, pedido_id, productos_id, cantidad, importe)
SELECT 501, 401, 301, 2, 2 * p.precio FROM test_productos p WHERE productos_id = 301;

INSERT INTO test_pedido_producto (pedido_producto_id, pedido_id, productos_id, cantidad, importe)
SELECT 502, 402, 303, 1, 1 * p.precio FROM test_productos p WHERE productos_id = 303;

COMMIT;



