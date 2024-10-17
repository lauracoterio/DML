-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 24, 2024 at 03:30 PM
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
-- Database: `bd_empleados`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_area`
--

CREATE TABLE `tbl_area` (
  `id_area` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_area`
--

INSERT INTO `tbl_area` (`id_area`, `nombre`) VALUES
(1, 'Administración'),
(2, 'Finanzas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cargo`
--

CREATE TABLE `tbl_cargo` (
  `id_cargo` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_area` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_cargo`
--

INSERT INTO `tbl_cargo` (`id_cargo`, `nombre`, `id_area`) VALUES
(1, 'Contabilidad', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_ciudad`
--

CREATE TABLE `tbl_ciudad` (
  `codigo_postal` int(5) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_ciudad`
--

INSERT INTO `tbl_ciudad` (`codigo_postal`, `nombre`, `id_departamento`) VALUES
(24597, 'Bogotá', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_departamento`
--

CREATE TABLE `tbl_departamento` (
  `id_departamento` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_departamento`
--

INSERT INTO `tbl_departamento` (`id_departamento`, `nombre`) VALUES
(1, 'Antioquia'),
(2, 'Cundinamarca');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_empleado`
--

CREATE TABLE `tbl_empleado` (
  `id` int(11) NOT NULL,
  `nombres` varchar(25) NOT NULL,
  `apellidos` varchar(30) NOT NULL,
  `dirección` varchar(30) DEFAULT NULL,
  `codigo_postal` int(5) NOT NULL,
  `salario` decimal(10,2) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `codigo_genero` int(11) NOT NULL,
  `id_cargo` int(11) NOT NULL,
  `email_personal` varchar(30) NOT NULL,
  `email_corporativo` varchar(30) NOT NULL,
  `telefono_celular` int(10) NOT NULL,
  `telefono_fijo` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_empleado`
--

INSERT INTO `tbl_empleado` (`id`, `nombres`, `apellidos`, `dirección`, `codigo_postal`, `salario`, `fecha_de_nacimiento`, `codigo_genero`, `id_cargo`, `email_personal`, `email_corporativo`, `telefono_celular`, `telefono_fijo`) VALUES
(1254154741, 'Sara', 'Monsalve', 'Calle 45#45-90', 24597, 1700000.00, '2000-04-12', 1, 1, 'sara@gmail.com', 'sarasupermercado@gmail.com', 2147483647, 5441578);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `codigo_genero` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_genero`
--

INSERT INTO `tbl_genero` (`codigo_genero`, `nombre`) VALUES
(1, 'Mujer'),
(2, 'Hombre');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_area`
--
ALTER TABLE `tbl_area`
  ADD PRIMARY KEY (`id_area`);

--
-- Indexes for table `tbl_cargo`
--
ALTER TABLE `tbl_cargo`
  ADD PRIMARY KEY (`id_cargo`),
  ADD KEY `id_area` (`id_area`);

--
-- Indexes for table `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD PRIMARY KEY (`codigo_postal`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indexes for table `tbl_departamento`
--
ALTER TABLE `tbl_departamento`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indexes for table `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_postal` (`codigo_postal`),
  ADD KEY `codigo_genero` (`codigo_genero`),
  ADD KEY `id_cargo` (`id_cargo`);

--
-- Indexes for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`codigo_genero`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_area`
--
ALTER TABLE `tbl_area`
  MODIFY `id_area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_cargo`
--
ALTER TABLE `tbl_cargo`
  MODIFY `id_cargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_departamento`
--
ALTER TABLE `tbl_departamento`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1254154742;

--
-- AUTO_INCREMENT for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `codigo_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_cargo`
--
ALTER TABLE `tbl_cargo`
  ADD CONSTRAINT `tbl_cargo_ibfk_1` FOREIGN KEY (`id_area`) REFERENCES `tbl_area` (`id_area`);

--
-- Constraints for table `tbl_ciudad`
--
ALTER TABLE `tbl_ciudad`
  ADD CONSTRAINT `tbl_ciudad_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_departamento` (`id_departamento`);

--
-- Constraints for table `tbl_empleado`
--
ALTER TABLE `tbl_empleado`
  ADD CONSTRAINT `tbl_empleado_ibfk_1` FOREIGN KEY (`codigo_postal`) REFERENCES `tbl_ciudad` (`codigo_postal`),
  ADD CONSTRAINT `tbl_empleado_ibfk_2` FOREIGN KEY (`codigo_genero`) REFERENCES `tbl_genero` (`codigo_genero`),
  ADD CONSTRAINT `tbl_empleado_ibfk_3` FOREIGN KEY (`id_cargo`) REFERENCES `tbl_cargo` (`id_cargo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
