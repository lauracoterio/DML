-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2024 at 04:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_supermercado7`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_bodega`
--

CREATE TABLE `tbl_bodega` (
  `cod_bodega` int(11) NOT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `nombre` varchar(15) NOT NULL,
  `codigo_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_bodega`
--

INSERT INTO `tbl_bodega` (`cod_bodega`, `codigo_postal`, `nombre`, `codigo_producto`) VALUES
(1, '1450', 'Punto bodega', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_categoria`
--

CREATE TABLE `tbl_categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_categoria`
--

INSERT INTO `tbl_categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Hogar y limpieza'),
(2, 'Cuidado personal');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ciudad`
--

CREATE TABLE `tbl_ciudad` (
  `codigo_postal` varchar(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `codigo_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ciudad`
--

INSERT INTO `tbl_ciudad` (`codigo_postal`, `nombre`, `codigo_departamento`) VALUES
('1450', 'Leticia', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ciudad3`
--

CREATE TABLE `tbl_ciudad3` (
  `codigo_postal` varchar(7) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `cod_depto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ciudad3`
--

INSERT INTO `tbl_ciudad3` (`codigo_postal`, `nombre`, `cod_depto`) VALUES
('2514', 'Mérida', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `id_cliente` int(12) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `codigo_pais` int(11) NOT NULL,
  `telefono` int(10) NOT NULL,
  `correo` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`id_cliente`, `nombre`, `codigo_pais`, `telefono`, `correo`) VALUES
(1265487365, 'Miryam Loaiza', 1, 2147483647, 'miryamloaizagmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departamento`
--

CREATE TABLE `tbl_departamento` (
  `codigo_departamento` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_departamento`
--

INSERT INTO `tbl_departamento` (`codigo_departamento`, `nombre`) VALUES
(1, 'Amazonas'),
(2, 'Atlántico');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_depto`
--

CREATE TABLE `tbl_depto` (
  `cod_depto` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_depto`
--

INSERT INTO `tbl_depto` (`cod_depto`, `nombre`) VALUES
(1, 'Yucatán'),
(2, 'Antioquia');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_empleados`
--

CREATE TABLE `tbl_empleados` (
  `id_empleados` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `telefono_personal` int(10) NOT NULL,
  `correo_personal` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_empleados`
--

INSERT INTO `tbl_empleados` (`id_empleados`, `nombre`, `apellidos`, `id_genero`, `telefono_personal`, `correo_personal`) VALUES
(2147483647, 'Sofía', 'González', 1, 2147483647, 'sofia@gamil.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `id_genero` int(11) NOT NULL,
  `Nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_genero`
--

INSERT INTO `tbl_genero` (`id_genero`, `Nombre`) VALUES
(1, 'Mujer'),
(2, 'Hombre');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_pais`
--

CREATE TABLE `tbl_pais` (
  `codigo_pais` int(11) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `codigo_postal` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_pais`
--

INSERT INTO `tbl_pais` (`codigo_pais`, `nombre`, `codigo_postal`) VALUES
(1, 'México', '2514');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_producto`
--

CREATE TABLE `tbl_producto` (
  `codigo_producto` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `id_sub_categoria` int(11) NOT NULL,
  `existencia` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_producto`
--

INSERT INTO `tbl_producto` (`codigo_producto`, `nombre`, `id_sub_categoria`, `existencia`) VALUES
(1, 'Jabón', 1, 70);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sede`
--

CREATE TABLE `tbl_sede` (
  `codigo_sede` int(11) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `codigo_postal` varchar(5) NOT NULL,
  `cant_empleados` int(10) NOT NULL,
  `cod_bodega` int(11) NOT NULL,
  `ingresos_mensuales` decimal(10,2) NOT NULL,
  `ingresos_anuales` decimal(10,2) NOT NULL,
  `telefono_corporativo` int(10) NOT NULL,
  `correo_corporativo` varchar(30) NOT NULL,
  `id_cliente` int(12) NOT NULL,
  `id_empleados` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sede`
--

INSERT INTO `tbl_sede` (`codigo_sede`, `direccion`, `codigo_postal`, `cant_empleados`, `cod_bodega`, `ingresos_mensuales`, `ingresos_anuales`, `telefono_corporativo`, `correo_corporativo`, `id_cliente`, `id_empleados`) VALUES
(1, 'Cra 57#24-98', '1450', 15, 1, 10000000.00, 99999999.99, 5642518, 'supermercado@gmail.com', 1265487365, 2147483647);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sub_categoria`
--

CREATE TABLE `tbl_sub_categoria` (
  `id_sub_categoria` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sub_categoria`
--

INSERT INTO `tbl_sub_categoria` (`id_sub_categoria`, `nombre`, `id_categoria`) VALUES
(1, 'Higiene personal', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_supermercado`
--

CREATE TABLE `tbl_supermercado` (
  `codigo_supermercado` int(11) NOT NULL,
  `nombre_supermercado` varchar(20) NOT NULL,
  `codigo_sede` int(11) NOT NULL,
  `direccion` varchar(30) NOT NULL,
  `bodega` int(11) NOT NULL,
  `clientes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_supermercado`
--

INSERT INTO `tbl_supermercado` (`codigo_supermercado`, `nombre_supermercado`, `codigo_sede`, `direccion`, `bodega`, `clientes`) VALUES
(1, 'supermercado surtima', 1, 'Calle 87#32-94', 0, 800);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_bodega`
--
ALTER TABLE `tbl_bodega`
  ADD PRIMARY KEY (`cod_bodega`),
  ADD KEY `codigo_postal` (`codigo_postal`),
  ADD KEY `codigo_producto` (`codigo_producto`);

--
-- Indexes for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD PRIMARY KEY (`codigo_postal`),
  ADD KEY `codigo_departamento` (`codigo_departamento`);

--
-- Indexes for table `tbl_ciudad3`
--
ALTER TABLE `tbl_ciudad3`
  ADD PRIMARY KEY (`codigo_postal`),
  ADD KEY `cod_depto` (`cod_depto`);

--
-- Indexes for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`id_cliente`),
  ADD KEY `codigo_pais` (`codigo_pais`);

--
-- Indexes for table `tbl_departamento`
--
ALTER TABLE `tbl_departamento`
  ADD PRIMARY KEY (`codigo_departamento`);

--
-- Indexes for table `tbl_depto`
--
ALTER TABLE `tbl_depto`
  ADD PRIMARY KEY (`cod_depto`);

--
-- Indexes for table `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD PRIMARY KEY (`id_empleados`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indexes for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indexes for table `tbl_pais`
--
ALTER TABLE `tbl_pais`
  ADD PRIMARY KEY (`codigo_pais`),
  ADD KEY `codigo_postal` (`codigo_postal`);

--
-- Indexes for table `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `id_sub_categoria` (`id_sub_categoria`);

--
-- Indexes for table `tbl_sede`
--
ALTER TABLE `tbl_sede`
  ADD PRIMARY KEY (`codigo_sede`),
  ADD KEY `codigo_postal` (`codigo_postal`),
  ADD KEY `cod_bodega` (`cod_bodega`),
  ADD KEY `id_cliente` (`id_cliente`),
  ADD KEY `id_empleados` (`id_empleados`);

--
-- Indexes for table `tbl_sub_categoria`
--
ALTER TABLE `tbl_sub_categoria`
  ADD PRIMARY KEY (`id_sub_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `tbl_supermercado`
--
ALTER TABLE `tbl_supermercado`
  ADD PRIMARY KEY (`codigo_supermercado`),
  ADD KEY `codigo_sede` (`codigo_sede`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_bodega`
--
ALTER TABLE `tbl_bodega`
  MODIFY `cod_bodega` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_departamento`
--
ALTER TABLE `tbl_departamento`
  MODIFY `codigo_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_depto`
--
ALTER TABLE `tbl_depto`
  MODIFY `cod_depto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_pais`
--
ALTER TABLE `tbl_pais`
  MODIFY `codigo_pais` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_producto`
--
ALTER TABLE `tbl_producto`
  MODIFY `codigo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_sede`
--
ALTER TABLE `tbl_sede`
  MODIFY `codigo_sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_sub_categoria`
--
ALTER TABLE `tbl_sub_categoria`
  MODIFY `id_sub_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_supermercado`
--
ALTER TABLE `tbl_supermercado`
  MODIFY `codigo_supermercado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_bodega`
--
ALTER TABLE `tbl_bodega`
  ADD CONSTRAINT `tbl_bodega_ibfk_1` FOREIGN KEY (`codigo_postal`) REFERENCES `tbl_ciudad` (`codigo_postal`),
  ADD CONSTRAINT `tbl_bodega_ibfk_2` FOREIGN KEY (`codigo_producto`) REFERENCES `tbl_producto` (`codigo_producto`);

--
-- Constraints for table `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD CONSTRAINT `tbl_ciudad_ibfk_1` FOREIGN KEY (`codigo_departamento`) REFERENCES `tbl_departamento` (`codigo_departamento`);

--
-- Constraints for table `tbl_ciudad3`
--
ALTER TABLE `tbl_ciudad3`
  ADD CONSTRAINT `tbl_ciudad3_ibfk_1` FOREIGN KEY (`cod_depto`) REFERENCES `tbl_depto` (`cod_depto`);

--
-- Constraints for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD CONSTRAINT `tbl_cliente_ibfk_1` FOREIGN KEY (`codigo_pais`) REFERENCES `tbl_pais` (`codigo_pais`);

--
-- Constraints for table `tbl_empleados`
--
ALTER TABLE `tbl_empleados`
  ADD CONSTRAINT `tbl_empleados_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `tbl_genero` (`id_genero`);

--
-- Constraints for table `tbl_pais`
--
ALTER TABLE `tbl_pais`
  ADD CONSTRAINT `tbl_pais_ibfk_1` FOREIGN KEY (`codigo_postal`) REFERENCES `tbl_ciudad3` (`codigo_postal`);

--
-- Constraints for table `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD CONSTRAINT `tbl_producto_ibfk_1` FOREIGN KEY (`id_sub_categoria`) REFERENCES `tbl_sub_categoria` (`id_sub_categoria`);

--
-- Constraints for table `tbl_sede`
--
ALTER TABLE `tbl_sede`
  ADD CONSTRAINT `tbl_sede_ibfk_1` FOREIGN KEY (`codigo_postal`) REFERENCES `tbl_ciudad` (`codigo_postal`),
  ADD CONSTRAINT `tbl_sede_ibfk_2` FOREIGN KEY (`cod_bodega`) REFERENCES `tbl_bodega` (`cod_bodega`),
  ADD CONSTRAINT `tbl_sede_ibfk_3` FOREIGN KEY (`id_cliente`) REFERENCES `tbl_cliente` (`id_cliente`),
  ADD CONSTRAINT `tbl_sede_ibfk_4` FOREIGN KEY (`id_empleados`) REFERENCES `tbl_empleados` (`id_empleados`);

--
-- Constraints for table `tbl_sub_categoria`
--
ALTER TABLE `tbl_sub_categoria`
  ADD CONSTRAINT `tbl_sub_categoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`);

--
-- Constraints for table `tbl_supermercado`
--
ALTER TABLE `tbl_supermercado`
  ADD CONSTRAINT `tbl_supermercado_ibfk_1` FOREIGN KEY (`codigo_sede`) REFERENCES `tbl_sede` (`codigo_sede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
