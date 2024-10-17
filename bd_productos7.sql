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
-- Database: `bd_productos7`
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
(1, 'Alimentos frescos'),
(2, 'Bebidas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_productos`
--

CREATE TABLE `tbl_productos` (
  `codigo_producto` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `precio_costo` decimal(10,2) NOT NULL,
  `precio_venta` decimal(10,2) NOT NULL,
  `id_sub_categoria` int(11) NOT NULL,
  `existencia` int(11) NOT NULL,
  `id_unidad_de_medida` int(11) NOT NULL,
  `identificacion_vendedor` int(11) NOT NULL,
  `fecha_de_ultima_venta` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_productos`
--

INSERT INTO `tbl_productos` (`codigo_producto`, `nombre`, `precio_costo`, `precio_venta`, `id_sub_categoria`, `existencia`, `id_unidad_de_medida`, `identificacion_vendedor`, `fecha_de_ultima_venta`) VALUES
(2, 'Lechuga', 2500.00, 3000.00, 3, 50, 1, 1026515487, '2024-09-22');

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
(3, 'Frutas y verduras', 1);

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
(1, 'Kilogramos'),
(2, 'Litros');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_vendedor`
--

CREATE TABLE `tbl_vendedor` (
  `identificacion_vendedor` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellidos` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_vendedor`
--

INSERT INTO `tbl_vendedor` (`identificacion_vendedor`, `nombre`, `apellidos`) VALUES
(1026515487, 'Valentina', 'Loaiza');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD PRIMARY KEY (`codigo_producto`),
  ADD KEY `id_sub_categoria` (`id_sub_categoria`),
  ADD KEY `id_unidad_de_medida` (`id_unidad_de_medida`),
  ADD KEY `identificacion_vendedor` (`identificacion_vendedor`);

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
-- Indexes for table `tbl_vendedor`
--
ALTER TABLE `tbl_vendedor`
  ADD PRIMARY KEY (`identificacion_vendedor`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_categoria`
--
ALTER TABLE `tbl_categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_productos`
--
ALTER TABLE `tbl_productos`
  MODIFY `codigo_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_sub_categoria`
--
ALTER TABLE `tbl_sub_categoria`
  MODIFY `id_sub_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_unidad_de_medida`
--
ALTER TABLE `tbl_unidad_de_medida`
  MODIFY `id_unidad_de_medida` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_vendedor`
--
ALTER TABLE `tbl_vendedor`
  MODIFY `identificacion_vendedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1026515488;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_productos`
--
ALTER TABLE `tbl_productos`
  ADD CONSTRAINT `tbl_productos_ibfk_1` FOREIGN KEY (`id_sub_categoria`) REFERENCES `tbl_sub_categoria` (`id_sub_categoria`),
  ADD CONSTRAINT `tbl_productos_ibfk_2` FOREIGN KEY (`id_unidad_de_medida`) REFERENCES `tbl_unidad_de_medida` (`id_unidad_de_medida`),
  ADD CONSTRAINT `tbl_productos_ibfk_3` FOREIGN KEY (`identificacion_vendedor`) REFERENCES `tbl_vendedor` (`identificacion_vendedor`);

--
-- Constraints for table `tbl_sub_categoria`
--
ALTER TABLE `tbl_sub_categoria`
  ADD CONSTRAINT `tbl_sub_categoria_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `tbl_categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
