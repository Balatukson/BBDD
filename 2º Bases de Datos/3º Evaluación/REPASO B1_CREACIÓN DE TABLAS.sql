DROP DATABASE IF EXISTS B1_COMPRADORES;
CREATE DATABASE IF NOT EXISTS B1_COMPRADORES;
USE B1_COMPRADORES;

CREATE TABLE IF NOT EXISTS COMPRADORES(
CIF_comprador char(11),
Nombre_social varchar(30),
Domicilio_social varchar(30),
Localidad varchar(30),
C_postal char(5),
Telefono char(9)
);

CREATE TABLE IF NOT EXISTS COMPRADORES_2(
CIF_comprador char(11) PRIMARY KEY,
Nombre_social varchar(30) UNIQUE,
Telefono char(9) NOT NULL,
Localidad varchar(30),
C_postal char(5),
Telefono char(9)
);

CREATE TABLE IF NOT EXISTS ARTICULOS(
Referencia_articulo char(12),
Descripción_articulo varchar(30),
Precio_unidad decimal(8,2),
IVA int(2),
Existencias_actuales int(5)
);

CREATE TABLE IF NOT EXISTS ARTICULOS_2(
Referencia_articulo char(12) PRIMARY KEY,
Descripción_articulo varchar(30),
Precio_unidad decimal(8,2),
IVA int(2) CHECK (IVA BETWEEN 5 AND 25),
Existencias_actuales int(5) DEFAULT 0
);

CREATE TABLE IF NOT EXISTS FACTURAS(
Factura_no INT(6),
Fecha_factura date,
CIF_cliente char(11)
);

CREATE TABLE IF NOT EXISTS FACTURAS_2(
Factura_no INT(6) PRIMARY KEY,
Fecha_factura date,
CIF_cliente char(11),

FOREIGN KEY (CIF_cliente) REFERENCES COMPRADORES_2(CIF_comprador)
);

CREATE TABLE IF NOT EXISTS LINEAS_FACTURA(
Factura_no INT(6),
Referencia_articulo char(12),
Unidades INT(3)
);