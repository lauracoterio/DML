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
-- Database: `bd_matricula_u`
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
(1, 'Filosofía', 1),
(2, 'Matemáticas', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_curso`
--

CREATE TABLE `tbl_curso` (
  `cod_curso` int(11) NOT NULL,
  `curso` varchar(20) NOT NULL,
  `costo_curso` decimal(11,2) NOT NULL,
  `id_carrera` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_curso`
--

INSERT INTO `tbl_curso` (`cod_curso`, `curso`, `costo_curso`, `id_carrera`) VALUES
(1, 'Autores', 650000.00, 1),
(2, 'Intregrales', 930000.00, 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_depto_residencia`
--

CREATE TABLE `tbl_depto_residencia` (
  `id_depto_residencia` int(11) NOT NULL,
  `departamento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_depto_residencia`
--

INSERT INTO `tbl_depto_residencia` (`id_depto_residencia`, `departamento`) VALUES
(1, 'Antioquia'),
(2, 'Antioquia');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_depto_sede`
--

CREATE TABLE `tbl_depto_sede` (
  `id_departamento` int(11) NOT NULL,
  `departamento` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_depto_sede`
--

INSERT INTO `tbl_depto_sede` (`id_departamento`, `departamento`) VALUES
(1, 'Antioquia'),
(2, 'Cundinamarca');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_docente`
--

CREATE TABLE `tbl_docente` (
  `cod_docente` int(11) NOT NULL,
  `nombre_docente` varchar(20) NOT NULL,
  `cod_curso` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_docente`
--

INSERT INTO `tbl_docente` (`cod_docente`, `nombre_docente`, `cod_curso`) VALUES
(1, 'William', 1),
(2, 'Marcela', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_estudiante`
--

CREATE TABLE `tbl_estudiante` (
  `id_estudiante` int(11) NOT NULL,
  `nombres` varchar(20) NOT NULL,
  `apellidos` varchar(20) NOT NULL,
  `id_genero` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `id_residencia` int(11) NOT NULL,
  `tel_personal` int(11) NOT NULL,
  `correo_personal` varchar(30) NOT NULL,
  `cod_docente` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_estudiante`
--

INSERT INTO `tbl_estudiante` (`id_estudiante`, `nombres`, `apellidos`, `id_genero`, `fecha_nacimiento`, `id_residencia`, `tel_personal`, `correo_personal`, `cod_docente`) VALUES
(1040874521, 'Laura', 'Coterio', 1, '2004-09-30', 2, 300125458, 'lauracoterio@gmail.com', 2);

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
(1, 'Humanidades'),
(2, 'Ciencias exactas');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_genero`
--

INSERT INTO `tbl_genero` (`id_genero`, `nombre`) VALUES
(1, 'Mujer'),
(2, 'Hombre');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_matricula`
--

CREATE TABLE `tbl_matricula` (
  `id_matricula` int(11) NOT NULL,
  `id_estudiante` int(11) NOT NULL,
  `cod_universidad` int(11) NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `costo_curso` decimal(11,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_matricula`
--

INSERT INTO `tbl_matricula` (`id_matricula`, `id_estudiante`, `cod_universidad`, `fecha_ingreso`, `costo_curso`) VALUES
(1, 1040874521, 2, '2024-07-22', 650000.00);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_residencia`
--

CREATE TABLE `tbl_residencia` (
  `id_residencia` int(11) NOT NULL,
  `ciudad` varchar(25) NOT NULL,
  `id_depto_residencia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_residencia`
--

INSERT INTO `tbl_residencia` (`id_residencia`, `ciudad`, `id_depto_residencia`) VALUES
(1, 'Medellín', 1),
(2, 'El Carmen', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_sede_u`
--

CREATE TABLE `tbl_sede_u` (
  `cod_universidad` int(11) NOT NULL,
  `ciudad` varchar(20) NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_sede_u`
--

INSERT INTO `tbl_sede_u` (`cod_universidad`, `ciudad`, `id_departamento`) VALUES
(1, 'Medellín', 1),
(2, 'Bogotá', 2);

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
-- Indexes for table `tbl_curso`
--
ALTER TABLE `tbl_curso`
  ADD PRIMARY KEY (`cod_curso`),
  ADD KEY `id_carrera` (`id_carrera`);

--
-- Indexes for table `tbl_depto_residencia`
--
ALTER TABLE `tbl_depto_residencia`
  ADD PRIMARY KEY (`id_depto_residencia`);

--
-- Indexes for table `tbl_depto_sede`
--
ALTER TABLE `tbl_depto_sede`
  ADD PRIMARY KEY (`id_departamento`);

--
-- Indexes for table `tbl_docente`
--
ALTER TABLE `tbl_docente`
  ADD PRIMARY KEY (`cod_docente`),
  ADD KEY `cod_curso` (`cod_curso`);

--
-- Indexes for table `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD PRIMARY KEY (`id_estudiante`),
  ADD KEY `id_genero` (`id_genero`),
  ADD KEY `id_residencia` (`id_residencia`),
  ADD KEY `cod_docente` (`cod_docente`);

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
-- Indexes for table `tbl_matricula`
--
ALTER TABLE `tbl_matricula`
  ADD PRIMARY KEY (`id_matricula`),
  ADD KEY `id_estudiante` (`id_estudiante`),
  ADD KEY `cod_universidad` (`cod_universidad`);

--
-- Indexes for table `tbl_residencia`
--
ALTER TABLE `tbl_residencia`
  ADD PRIMARY KEY (`id_residencia`),
  ADD KEY `id_depto_residencia` (`id_depto_residencia`);

--
-- Indexes for table `tbl_sede_u`
--
ALTER TABLE `tbl_sede_u`
  ADD PRIMARY KEY (`cod_universidad`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  MODIFY `id_carrera` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_curso`
--
ALTER TABLE `tbl_curso`
  MODIFY `cod_curso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_depto_residencia`
--
ALTER TABLE `tbl_depto_residencia`
  MODIFY `id_depto_residencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_depto_sede`
--
ALTER TABLE `tbl_depto_sede`
  MODIFY `id_departamento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_docente`
--
ALTER TABLE `tbl_docente`
  MODIFY `cod_docente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  MODIFY `id_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1040874522;

--
-- AUTO_INCREMENT for table `tbl_facultad`
--
ALTER TABLE `tbl_facultad`
  MODIFY `id_facultad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_matricula`
--
ALTER TABLE `tbl_matricula`
  MODIFY `id_matricula` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_residencia`
--
ALTER TABLE `tbl_residencia`
  MODIFY `id_residencia` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_sede_u`
--
ALTER TABLE `tbl_sede_u`
  MODIFY `cod_universidad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_carrera`
--
ALTER TABLE `tbl_carrera`
  ADD CONSTRAINT `tbl_carrera_ibfk_1` FOREIGN KEY (`id_facultad`) REFERENCES `tbl_facultad` (`id_facultad`);

--
-- Constraints for table `tbl_curso`
--
ALTER TABLE `tbl_curso`
  ADD CONSTRAINT `tbl_curso_ibfk_1` FOREIGN KEY (`id_carrera`) REFERENCES `tbl_carrera` (`id_carrera`);

--
-- Constraints for table `tbl_docente`
--
ALTER TABLE `tbl_docente`
  ADD CONSTRAINT `tbl_docente_ibfk_1` FOREIGN KEY (`cod_curso`) REFERENCES `tbl_curso` (`cod_curso`);

--
-- Constraints for table `tbl_estudiante`
--
ALTER TABLE `tbl_estudiante`
  ADD CONSTRAINT `tbl_estudiante_ibfk_1` FOREIGN KEY (`id_genero`) REFERENCES `tbl_genero` (`id_genero`),
  ADD CONSTRAINT `tbl_estudiante_ibfk_2` FOREIGN KEY (`id_residencia`) REFERENCES `tbl_residencia` (`id_residencia`),
  ADD CONSTRAINT `tbl_estudiante_ibfk_3` FOREIGN KEY (`cod_docente`) REFERENCES `tbl_docente` (`cod_docente`);

--
-- Constraints for table `tbl_matricula`
--
ALTER TABLE `tbl_matricula`
  ADD CONSTRAINT `tbl_matricula_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `tbl_estudiante` (`id_estudiante`),
  ADD CONSTRAINT `tbl_matricula_ibfk_2` FOREIGN KEY (`cod_universidad`) REFERENCES `tbl_sede_u` (`cod_universidad`);

--
-- Constraints for table `tbl_residencia`
--
ALTER TABLE `tbl_residencia`
  ADD CONSTRAINT `tbl_residencia_ibfk_1` FOREIGN KEY (`id_depto_residencia`) REFERENCES `tbl_depto_residencia` (`id_depto_residencia`);

--
-- Constraints for table `tbl_sede_u`
--
ALTER TABLE `tbl_sede_u`
  ADD CONSTRAINT `tbl_sede_u_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `tbl_depto_sede` (`id_departamento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
