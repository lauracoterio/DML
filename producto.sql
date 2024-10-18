CREATE DATABASE bd_productos_consulta_;
USE bd_productos_consulta_;

CREATE TABLE tbl_vendedor( 
    identificacion_vendedor INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono_celular VARCHAR(15) NOT NULL, 
    PRIMARY KEY (identificacion_vendedor)
);

CREATE TABLE tbl_unidad_de_medida( 
    id_unidad_de_medida INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_unidad_de_medida)
);

CREATE TABLE tbl_categoria( 
    id_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_categoria)
);

CREATE TABLE tbl_sub_categoria( 
    id_sub_categoria INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    id_categoria INT NOT NULL,
    PRIMARY KEY (id_sub_categoria),
    FOREIGN KEY (id_categoria) REFERENCES tbl_categoria(id_categoria)
);

CREATE TABLE tbl_departamento( 
    id_departamento INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    PRIMARY KEY (id_departamento)
);

CREATE TABLE tbl_ciudad( 
    codigo_postal INT NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    id_departamento INT NOT NULL,
    PRIMARY KEY (codigo_postal),
    FOREIGN KEY (id_departamento) REFERENCES tbl_departamento(id_departamento)
);

CREATE TABLE tbl_sede( 
    id_sede INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    codigo_postal INT NOT NULL,
    PRIMARY KEY (id_sede),
    FOREIGN KEY (codigo_postal) REFERENCES tbl_ciudad(codigo_postal)
);

CREATE TABLE tbl_productos( 
    codigo_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(30) NOT NULL,
    precio_costo DECIMAL(10,2) NOT NULL,
    precio_venta DECIMAL(10,2) NOT NULL,
    id_sub_categoria INT NOT NULL,
    existencia INT NOT NULL,
    id_unidad_de_medida INT NOT NULL,
    identificacion_vendedor INT NOT NULL,
    fecha_de_ultima_venta DATE,
    id_sede INT NOT NULL,
    PRIMARY KEY (codigo_producto),
    FOREIGN KEY (id_sub_categoria) REFERENCES tbl_sub_categoria(id_sub_categoria),
    FOREIGN KEY (id_unidad_de_medida) REFERENCES tbl_unidad_de_medida(id_unidad_de_medida),
    FOREIGN KEY (identificacion_vendedor) REFERENCES tbl_vendedor(identificacion_vendedor),
    FOREIGN KEY (id_sede) REFERENCES tbl_sede(id_sede)
);
