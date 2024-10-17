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
-- Database: `bd_estudiante`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_carrera`
--

CREATE TABLE `tbl_carrera` (
  `id_carrera` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `id_facultad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_carrera`
--

INSERT INTO `tbl_carrera` (`id_carrera`, `nombre`, `id_facultad`) VALUES
(1, 'Enfermería', 2),
(8, 'Matemáticas', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estudiantes`
--

CREATE TABLE `tbl_estudiantes` (
  `identificacion` int(10) NOT NULL,
  `nombres` varchar(30) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `id_carrera` int(11) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `telefono_celular` bigint(20) NOT NULL,
  `telefono_fijo` bigint(20) DEFAULT NULL,
  `fecha_de_ingreso` date NOT NULL,
  `saldo_en_deuda` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_estudiantes`
--

INSERT INTO `tbl_estudiantes` (`identificacion`, `nombres`, `apellidos`, `id_carrera`, `id_genero`, `semestre`, `telefono_celular`, `telefono_fijo`, `fecha_de_ingreso`, `saldo_en_deuda`) VALUES
(1040587452, 'Laura', 'Coterio Loaiza', 1, 1, 6, 32515425445, 5448574, '2024-09-17', 500000.00),
(1052487196, 'Mariana', 'Ramirez', 8, 2, 4, 3251254865, 8456525, '2024-09-17', 150000.00),
(1204587465, 'Sofía', 'Martinez', 1, 1, 6, 30565412524, 5448532, '2023-05-25', 600000.00),
(2147483647, 'Fabián', 'Ramirez', 8, 2, 4, 3251254865, 8456525, '2024-09-17', 50000.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_facultad`
--

CREATE TABLE `tbl_facultad` (
  `id_facultad` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_facultad`
--

INSERT INTO `tbl_facultad` (`id_facultad`, `nombre`) VALUES
(1, 'Artes'),
(2, 'Medicina'),
(3, 'Humanidades'),
(4, 'Idiomas'),
(5, 'Ciencias exactas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_genero`
--

INSERT INTO `tbl_genero` (`id_genero`, `nombre`) VALUES
(1, 'Mujer'),
(2, 'Hombre');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  ADD PRIMARY KEY (`id_carrera`),
  ADD KEY `id_facultad` (`id_facultad`);

--
-- Indexes for table `tbl_estudiantes`
--
ALTER TABLE `tbl_estudiantes`
  ADD PRIMARY KEY (`identificacion`),
  ADD KEY `id_carrera` (`id_carrera`),
  ADD KEY `id_genero` (`id_genero`);

--
-- Indexes for table `tbl_facultad`
--
ALTER TABLE `tbl_facultad`
  ADD PRIMARY KEY (`id_facultad`);

--
-- Indexes for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_facultad`
--
ALTER TABLE `tbl_facultad`
  MODIFY `id_facultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  ADD CONSTRAINT `tbl_carrera_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `tbl_facultad` (`id_facultad`);

--
-- Constraints for table `tbl_estudiantes`
--
ALTER TABLE `tbl_estudiantes`
  ADD CONSTRAINT `tbl_estudiantes_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `tbl_carrera` (`id_carrera`),
  ADD CONSTRAINT `tbl_estudiantes_ibfk_2` FOREIGN KEY (`id_genero`) REFERENCES `tbl_genero` (`id_genero`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
