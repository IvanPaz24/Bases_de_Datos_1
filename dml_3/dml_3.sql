CREATE DATABASE IF NOT EXISTS Ejercicio_dml_3;

USE Ejercicio_dml_3;

CREATE TABLE DOCUMENTOS (
    COD_DOCUMENTO INT PRIMARY KEY,
    DESCRIPCION VARCHAR(255)
);

CREATE TABLE OFICINAS (
    COD_OFICINA INT PRIMARY KEY,
    CODIGO_DIRECTOR INT,
    DESCRIPCION VARCHAR(255)
);

CREATE TABLE EMPLEADOS (
    COD_EMPLEADO INT PRIMARY KEY,
    APELLIDO VARCHAR(255),
    NOMBRE VARCHAR(255),
    FECHA_NACIMIENTO DATE,
    NUM_DOC VARCHAR(50),
    COD_JEFE INT,
    COD_OFICINA INT,
    COD_DOCUMENTO INT,
    FOREIGN KEY (COD_OFICINA) REFERENCES OFICINAS(COD_OFICINA),
    FOREIGN KEY (COD_DOCUMENTO) REFERENCES DOCUMENTOS(COD_DOCUMENTO)
);

CREATE TABLE DATOS_CONTRATOS (
    COD_EMPLEADO INT,
    FECHA_CONTRATO DATE,
    CUOTA DECIMAL(10, 2),
    VENTAS DECIMAL(10, 2),
    PRIMARY KEY (COD_EMPLEADO, FECHA_CONTRATO),
    FOREIGN KEY (COD_EMPLEADO) REFERENCES EMPLEADOS(COD_EMPLEADO)
);

CREATE TABLE FABRICANTES (
    COD_FABRICANTE INT PRIMARY KEY,
    RAZON_SOCIAL VARCHAR(255)
);

CREATE TABLE LISTAS (
    COD_LISTA INT PRIMARY KEY,
    DESCRIPCION VARCHAR(255),
    GANANCIA DECIMAL(10, 2)
);

CREATE TABLE PRODUCTOS (
    COD_PRODUCTO INT PRIMARY KEY,
    DESCRIPCION VARCHAR(255),
    PRECIO DECIMAL(10, 2),
    CANTIDAD_STOCK INT,
    PUNTO_REPOSICION INT,
    COD_FABRICANTE INT,
    FOREIGN KEY (COD_FABRICANTE) REFERENCES FABRICANTES(COD_FABRICANTE)
);

CREATE TABLE PRECIOS (
    COD_PRODUCTO INT,
    COD_LISTA INT,
    PRECIO DECIMAL(10, 2),
    PRIMARY KEY (COD_PRODUCTO, COD_LISTA),
    FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTOS(COD_PRODUCTO),
    FOREIGN KEY (COD_LISTA) REFERENCES LISTAS(COD_LISTA)
);

CREATE TABLE CLIENTES (
    COD_CLIENTE INT PRIMARY KEY,
    COD_LISTA INT,
    RAZON_SOCIAL VARCHAR(255),
    FOREIGN KEY (COD_LISTA) REFERENCES LISTAS(COD_LISTA)
);

CREATE TABLE PEDIDOS (
    COD_PEDIDO INT PRIMARY KEY,
    FECHA_PEDIDO DATE,
    COD_EMPLEADO INT,
    COD_CLIENTE INT,
    FOREIGN KEY (COD_EMPLEADO) REFERENCES EMPLEADOS(COD_EMPLEADO),
    FOREIGN KEY (COD_CLIENTE) REFERENCES CLIENTES(COD_CLIENTE)
);

CREATE TABLE DETALLE_PEDIDOS (
    COD_PEDIDO INT,
    NUMERO_LINEA INT,
    COD_PRODUCTO INT,
    CANTIDAD INT,
    PRIMARY KEY (COD_PEDIDO, NUMERO_LINEA),
    FOREIGN KEY (COD_PEDIDO) REFERENCES PEDIDOS(COD_PEDIDO),
    FOREIGN KEY (COD_PRODUCTO) REFERENCES PRODUCTOS(COD_PRODUCTO)
);
INSERT INTO DOCUMENTOS (COD_DOCUMENTO, DESCRIPCION) VALUES 
(1, 'DNI'),
(2, 'Pasaporte'),
(3, 'Licencia de Conducir'),
(4, 'Cédula de Identidad'),
(5, 'Tarjeta de Residencia');

-- INSERT para OFICINAS
INSERT INTO OFICINAS (COD_OFICINA, CODIGO_DIRECTOR, DESCRIPCION) VALUES 
(1, 1001, 'Oficina Central'),
(2, 1002, 'Sucursal Norte'),
(3, NULL, 'Sucursal Sur'),  
(4, 1003, 'Sucursal Este'),
(5, 1004, 'Sucursal Oeste');

-- INSERT para EMPLEADOS 
INSERT INTO EMPLEADOS (COD_EMPLEADO, APELLIDO, NOMBRE, FECHA_NACIMIENTO, NUM_DOC, COD_JEFE, COD_OFICINA, COD_DOCUMENTO) VALUES 
(1, 'González', 'María', '1990-05-10', '12345678', NULL, 1, 1),
(2, 'Pérez', 'Juan', '1985-07-20', '87654321', NULL, 2, 2),
(3, 'López', 'María', '1992-08-15', '23456789', 1, 3, 3),
(4, 'Rodríguez', 'Ana', '1991-09-25', '34567890', 2, 4, 2),
(5, 'Fernández', 'Pedro', '1980-03-30', '45678901', 3, 5, 4);


INSERT INTO DATOS_CONTRATOS (COD_EMPLEADO, FECHA_CONTRATO, CUOTA, VENTAS) 
VALUES (1, '2015-06-15', 500.00, 10000.00),
(2, '2016-07-18', 600.00, 12000.00),
(3, '2017-08-22', 700.00, 14000.00),
(4, '2018-09-30', 800.00, 16000.00),
(5, '2019-10-10', 900.00, 18000.00);

-- INSERT para FABRICANTES (una razón social que empieza con L)
INSERT INTO FABRICANTES (COD_FABRICANTE, RAZON_SOCIAL) VALUES 
(1, 'Lácteos del Sur'),
(2, 'Frutas Frescas'),
(3, 'Carnes del Campo'),
(4, 'Panadería Central'),
(5, 'Bebidas Artesanales');

-- INSERT para LISTAS
INSERT INTO LISTAS (COD_LISTA, DESCRIPCION, GANANCIA) VALUES 
(1, 'Lista de Precios A', 10.00),
(2, 'Lista de Precios B', 15.00),
(3, 'Lista de Precios C', 12.00),
(4, 'Lista de Precios D', 8.00),
(5, 'Lista de Precios E', 20.00);

-- INSERT para PRODUCTOS
INSERT INTO PRODUCTOS (COD_PRODUCTO, DESCRIPCION, PRECIO, CANTIDAD_STOCK, PUNTO_REPOSICION, COD_FABRICANTE) VALUES 
(1, 'Leche', 50.00, 100, 20, 1),
(2, 'Manzanas', 30.00, 200, 50, 2),
(3, 'Carne', 150.00, 50, 10, 3),
(4, 'Pan', 25.00, 300, 100, 4),
(5, 'Cerveza', 120.00, 80, 30, 5);

-- INSERT para PRECIOS
INSERT INTO PRECIOS (COD_PRODUCTO, COD_LISTA, PRECIO) VALUES 
(1, 1, 55.00),
(2, 2, 35.00),
(3, 3, 160.00),
(4, 4, 28.00),
(5, 5, 130.00);

-- INSERT para CLIENTES
INSERT INTO CLIENTES (COD_CLIENTE, COD_LISTA, RAZON_SOCIAL) VALUES 
(1, 1, 'Lácteos Distribuidos S.A.'),
(2, 2, 'Supermercado Norte'),
(3, 3, 'Almacén de la Esquina'),
(4, 4, 'Tienda Familiar'),
(5, 5, 'Frutería La Huerta');

-- INSERT para PEDIDOS 
INSERT INTO PEDIDOS (COD_PEDIDO, FECHA_PEDIDO, COD_EMPLEADO, COD_CLIENTE) VALUES 
(1, '2024-03-15', 1, 1),  -- Pedido en marzo
(2, '2024-02-28', 2, 2),
(3, '2024-01-10', 3, 3),
(4, '2024-04-05', 4, 4),
(5, '2024-05-22', 5, 5);

-- INSERT para DETALLE_PEDIDOS
INSERT INTO DETALLE_PEDIDOS (COD_PEDIDO, NUMERO_LINEA, COD_PRODUCTO, CANTIDAD) VALUES 
(1, 1, 1, 10),
(2, 1, 2, 5),
(3, 1, 3, 20),
(4, 1, 4, 15),
(5, 1, 5, 8);

#1) Obtener una lista con los nombres de las distintas oficinas de la empresa.
SELECT DESCRIPCION
FROM OFICINAS;

SELECT DESCRIPCION,
PRECIO AS COSTO_PRECIO,
(PRECIO * 1.21) AS PRECIO_IVA
FROM PRODUCTOS;

SELECT APELLIDO, NOMBRE, 
FECHA_NACIMIENTO,
TIMESTAMPDIFF(YEAR, FECHA_NACIMIENTO, CURDATE()) AS EDAD
FROM EMPLEADOS;

SELECT *
FROM EMPLEADOS
WHERE COD_JEFE != NULL OR COD_JEFE != 0;

SELECT *
FROM EMPLEADOS
WHERE NOMBRE = 'MARIA'
ORDER BY APELLIDO ASC;

SELECT *
FROM CLIENTES
WHERE RAZON_SOCIAL LIKE 'L%'
ORDER BY COD_CLIENTE ASC; 

#7) Listar toda la información de los pedidos de Marzo ordenado por fecha de pedido.
SELECT * 
FROM PEDIDOS
WHERE MONTH(FECHA_PEDIDO) = 3
ORDER BY FECHA_PEDIDO ASC;

#8) Listar las oficinas que no tienen asignado director.
SELECT * 
FROM OFICINAS
WHERE CODIGO_DIRECTOR != NULL OR CODIGO_DIRECTOR != 0;

#9) Listar los 4 productos de menor precio de costo.
SELECT *
FROM PRODUCTOS
ORDER BY PRECIO ASC
LIMIT 4;

#10) Listar los códigos de empleados de los tres que tengan la mayor cuota.
SELECT *
FROM DATOS_CONTRATOS
ORDER BY CUOTA DESC
LIMIT 3;

#1) De cada producto listar descripción, razón social del fabricante y stock ordenado por razón social y
#descripción.

SELECT P.DESCRIPCION, F.RAZON_SOCIAL
FROM PRODUCTOS p
INNER JOIN FABRICANTES F ON P.COD_FABRICANTE = F.COD_FABRICANTE
ORDER BY P.DESCRIPCION, F.RAZON_SOCIAL;

#2) De cada pedido listar código de pedido, fecha de pedido, apellido del empleado y razón social del
#cliente.

SELECT P.COD_PEDIDO, P.FECHA_PEDIDO,
E.APELLIDO,
C.RAZON_SOCIAL
FROM PEDIDOS P
INNER JOIN EMPLEADOS E ON P.COD_EMPLEADO = E.COD_EMPLEADO
INNER JOIN CLIENTES C ON P.COD_CLIENTE = C.COD_CLIENTE;

#3) Listar por cada empleado apellido, cuota asignada, oficina a la que pertenece ordenado en forma
#descendente por cuota.

SELECT E.APELLIDO,
DC.CUOTA AS CUOTA_ASIGNADA,
O.DESCRIPCION AS OFICINA
FROM EMPLEADOS E
INNER JOIN DATOS_CONTRATOS DC ON E.COD_EMPLEADO = DC.COD_EMPLEADO
INNER JOIN OFICINAS O ON E.COD_OFICINA = O.COD_OFICINA
ORDER BY CUOTA_ASIGNADA DESC;

#4) Listar sin repetir la razón social de todos aquellos clientes que hicieron pedidos en Abril.
SELECT DISTINCT (C.RAZON_SOCIAL)
FROM PEDIDOS P
INNER JOIN CLIENTES C ON P.COD_CLIENTE = C.COD_CLIENTE
WHERE MONTH(P.FECHA_PEDIDO) = 4;

#5) Listar sin repetir los productos que fueron pedidos en Marzo.
SELECT DISTINCT(PROC.DESCRIPCION)
FROM PEDIDOS P 
INNER JOIN DETALLE_PEDIDOS DP ON P.COD_PEDIDO = DP.COD_PEDIDO
INNER JOIN PRODUCTOS PROC ON DP.COD_PRODUCTO = PROC.COD_PRODUCTO
WHERE MONTH(P.FECHA_PEDIDO) = 3;

#6) Listar aquellos empleados que están contratados por más de 10 años ordenado por cantidad de años en
#forma descendente.

SELECT *,
TIMESTAMPDIFF(YEAR, DC.FECHA_CONTRATO, CURDATE()) AS AÑOS_CONTRATADO
FROM EMPLEADOS E
INNER JOIN DATOS_CONTRATOS DC ON E.COD_EMPLEADO = DC.COD_EMPLEADO
WHERE TIMESTAMPDIFF(YEAR, DC.FECHA_CONTRATO, CURDATE()) > 10
ORDER BY AÑOS_CONTRATADO DESC; 

#7) Obtener una lista de los clientes mayoristas ordenada por razón social.
UPDATE LISTAS
SET DESCRIPCION = 'Mayorista'
WHERE COD_LISTA <= 3;

SELECT *
FROM CLIENTES C 
INNER JOIN LISTAS L ON C.COD_LISTA = L.COD_LISTA
WHERE L.DESCRIPCION = 'Mayorista'
ORDER BY C.RAZON_SOCIAL;

#8) Obtener una lista sin repetir que indique qué productos compró cada cliente, ordenada por razón social
#y descripción.

SELECT DISTINCT PROC.DESCRIPCION,
C.RAZON_SOCIAL
FROM PEDIDOS P
INNER JOIN CLIENTES C ON P.COD_CLIENTE = C.COD_CLIENTE
INNER JOIN DETALLE_PEDIDOS DP ON P.COD_PEDIDO = DP.COD_PEDIDO
INNER JOIN PRODUCTOS PROC ON DP.COD_PRODUCTO = PROC.COD_PRODUCTO
ORDER BY C.RAZON_SOCIAL, PROC.DESCRIPCION;

/*
9) Obtener una lista con la descripción de aquellos productos cuyo stock está por debajo del punto de
reposición indicando cantidad a comprar y razón social del fabricante ordenada por razón social y
descripción.
*/

UPDATE PRODUCTOS
SET CANTIDAD_STOCK = 50
WHERE COD_PRODUCTO = 4;

SELECT PROC.DESCRIPCION, 
F.RAZON_SOCIAL,
(PROC.PUNTO_REPOSICION - PROC.CANTIDAD_STOCK) AS REPONER
FROM PRODUCTOS PROC
INNER JOIN FABRICANTES F ON PROC.COD_FABRICANTE = F.COD_FABRICANTE
WHERE PROC.PUNTO_REPOSICION > PROC.CANTIDAD_STOCK
ORDER BY PROC.DESCRIPCION, F.RAZON_SOCIAL;

#10) Listar aquellos empleados cuya cuota es menor a 50000 o mayor a 100000.

SELECT E.*
FROM EMPLEADOS E
INNER JOIN DATOS_CONTRATOS DC ON E.COD_EMPLEADO = DC.COD_EMPLEADO
WHERE DC.CUOTA < 50000 OR DC.CUOTA > 100000;
