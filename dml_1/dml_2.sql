USE Ejercicio_dml_1;

INSERT INTO proveedores (NUMERO, NOMBRE, DOMICILIO, LOCALIDAD)
VALUES (101 ,"Gómez", "Nazca 920" ,"Capital"),
(102 ,"Pérez" ,"Argerich 1030" ,"Capital"),
(103 ,"Vázquez" ,"Sarmiento 450" ,"Ramos Mejía"),
(104 ,"López" ,"Alsina 720" ,"Avellaneda");

INSERT INTO productos (PNRO, PNOMBRE, PRECIO, TAMAÑO, LOCALIDAD)
VALUES (001, "Talco", 500, "Chico", "Capital"),
(002, "Cepillo", 2500, "Grande", "Avellaneda"),
(003, "Jabon", 2500, "Mediano", "Wilde");

INSERT INTO prov_prod (NUMERO, PNRO, CANTIDAD)
VALUES (101 , 001, 300),
(101 , 002, 200),
(102, 003, 100);

SELECT *
FROM productos;

SELECT *
FROM proveedores
WHERE LOCALIDAD = 'Capital';

INSERT INTO prov_prod
VALUES (104 , 001, 300);
#(101 , 002, 200),
#(102 , 001, 100);
#(103 , 001, 300);

SELECT *
FROM prov_prod
WHERE CANTIDAD >= 200 AND CANTIDAD <= 300;

#MAL
SELECT distinct PNRO
FROM PROV_PROD PP
INNER JOIN PROVEEDORES P ON PP.NUMERO = P.NUMERO
WHERE LOCALIDAD = 'Avellaneda';

SELECT SUM(CANTIDAD) AS CANTIDAD_TOTAL 
FROM prov_prod
WHERE NUMERO = 103 AND PNRO = 001;

#MAL
SELECT *
FROM productos
WHERE LOCALIDAD LIKE '_A%' OR LOCALIDAD LIKE '_a%';

SELECT P.PRECIO
FROM prov_prod PP 
INNER JOIN productos P ON PP.PNRO = P.PNRO
INNER JOIN proveedores PR ON PP.NUMERO = PR.NUMERO
WHERE PR.NUMERO = 102;


SELECT LOCALIDAD
FROM proveedores
UNION 
SELECT LOCALIDAD
FROM productos;
USE Ejercicio_dml_1;

UPDATE productos
SET TAMAÑO = 'Chico'
WHERE TAMAÑO = 'Mediano';

INSERT INTO proveedores (NUMERO, NOMBRE, DOMICILIO, LOCALIDAD)
VALUES (107 ,"Rosales", "Desconocida" ,"Wilde");
