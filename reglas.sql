CREATE DATABASE IF NOT EXISTS reglas_integridad;

#selecionar la base de datos
USE reglas_integridad;

CREATE TABLE OFICINAS (
    COD_OFICINA INT PRIMARY KEY NOT NULL, -- Clave primaria para identificar oficinas
    DESCRIPCION VARCHAR(100) NOT NULL 
);

CREATE TABLE EMPLEADOS (
    COD_EMPLEADO INT primary key NOT NULL,  -- Regla 1: Clave primaria
    NOMBRE VARCHAR(50) NOT NULL,
    APELLIDO VARCHAR(50) NOT NULL,
    TIPO_DOC VARCHAR(10) NOT NULL,
    NUMERO_DOC VARCHAR(20) NOT NULL,
    CATEGORIA VARCHAR(20) NOT NULL,
    COD_OFICINA INT NOT NULL,
    
    CONSTRAINT pk_cod_empleado PRIMARY KEY (COD_EMPLEADO),
    
    #falto constraint de clave primaria
    -- Regla 2: Valores entre 100 y 1000 para cod_emp
    CONSTRAINT ck_cod_emp CHECK (COD_EMPLEADO BETWEEN 100 AND 1000),

    -- Regla 3: Valores únicos para combinación de tipo_doc y num_doc
    UNIQUE (TIPO_DOC, NUMERO_DOC),

    -- Regla 4: Categoria debe ser uno de los valores permitidos
    CONSTRAINT ck_categoria CHECK (CATEGORIA IN ('Senior', 'Semi Senior', 'Junior')),

    -- Regla 5: cod_ofic debe existir en la tabla Oficinas
    CONSTRAINT fk_cod_ofic FOREIGN KEY (COD_OFICINA) REFERENCES OFICINAS (COD_OFICINA)
);