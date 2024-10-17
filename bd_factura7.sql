-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2024 at 04:33 PM
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
-- Database: `bd_factura7`
--

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
(2, 'Mascotas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cliente`
--

CREATE TABLE `tbl_cliente` (
  `identificacion` int(12) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cliente`
--

INSERT INTO `tbl_cliente` (`identificacion`, `nombre`, `apellidos`, `correo`, `fecha_de_nacimiento`) VALUES
(1040871090, 'Susana', 'Pérez', 'Susanaperez@gamil.com', '2000-10-30');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_factura`
--

CREATE TABLE `tbl_factura` (
  `codigo_factura` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `identificacion` int(12) NOT NULL,
  `dirección` varchar(30) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `cantidad` int(12) NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL,
  `precio_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_factura`
--

INSERT INTO `tbl_factura` (`codigo_factura`, `fecha`, `identificacion`, `dirección`, `codigo_producto`, `cantidad`, `precio_unitario`, `precio_total`) VALUES
(3, '2024-09-22', 1040871090, 'Cra 89#45-87', 2, 2, 18000.00, 36000.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_producto`
--

CREATE TABLE `tbl_producto` (
  `codigo_producto` int(11) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `id_sub_categoria` int(11) NOT NULL,
  `id_unidad_de_medida` int(11) NOT NULL,
  `Precio` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_producto`
--

INSERT INTO `tbl_producto` (`codigo_producto`, `nombres`, `id_sub_categoria`, `id_unidad_de_medida`, `Precio`) VALUES
(2, 'Shampoo', 1, 1, 18000);

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
(1, 'Baño', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_unidad_de_medida`
--

CREATE TABLE `tbl_unidad_de_medida` (
  `id_unidad_de_medida` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_unidad_de_medida`
--

INSERT INTO `tbl_unidad_de_medida` (`id_unidad_de_medida`, `nombre`) VALUES
(1, 'Litros'),
(2, 'Kilogramos');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `tbl_cliente`
--
ALTER TABLE `tbl_cliente`
  ADD PRIMARY KEY (`identificacion`);

--
-- Indexes for table `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD PRIMARY KEY (`codigo_factura`),
  ADD KEY `codigo_producto` (`codigo_producto`),
  ADD KEY `identificacion` (`identificacion`);

--
-- Indexes for table `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `id_sub_categoria` (`id_sub_categoria`),
  ADD KEY `id_unidad_de_medida` (`id_unidad_de_medida`);

--
-- Indexes for table `tbl_sub_categoria`
--
ALTER TABLE `tbl_sub_categoria`
  ADD PRIMARY KEY (`id_sub_categoria`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `tbl_unidad_de_medida`
--
ALTER TABLE `tbl_unidad_de_medida`
  ADD PRIMARY KEY (`id_unidad_de_medida`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_factura`
--
ALTER TABLE `tbl_factura`
  MODIFY `codigo_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_producto`
--
ALTER TABLE `tbl_producto`
  MODIFY `codigo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_sub_categoria`
--
ALTER TABLE `tbl_sub_categoria`
  MODIFY `id_sub_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_unidad_de_medida`
--
ALTER TABLE `tbl_unidad_de_medida`
  MODIFY `id_unidad_de_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_factura`
--
ALTER TABLE `tbl_factura`
  ADD CONSTRAINT `tbl_factura_ibfk_1` FOREIGN KEY (`codigo_producto`) REFERENCES `tbl_producto` (`codigo_producto`),
  ADD CONSTRAINT `tbl_factura_ibfk_2` FOREIGN KEY (`identificacion`) REFERENCES `tbl_cliente` (`identificacion`);

--
-- Constraints for table `tbl_producto`
--
ALTER TABLE `tbl_producto`
  ADD CONSTRAINT `tbl_producto_ibfk_1` FOREIGN KEY (`id_sub_categoria`) REFERENCES `tbl_sub_categoria` (`id_sub_categoria`),
  ADD CONSTRAINT `tbl_producto_ibfk_2` FOREIGN KEY (`id_unidad_de_medida`) REFERENCES `tbl_unidad_de_medida` (`id_unidad_de_medida`);

--
-- Constraints for table `tbl_sub_categoria`
--
ALTER TABLE `tbl_sub_categoria`
  ADD CONSTRAINT `tbl_sub_categoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
