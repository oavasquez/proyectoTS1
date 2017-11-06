-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 06-11-2017 a las 04:32:20
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 5.6.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bdCalculoClases`
--
CREATE DATABASE IF NOT EXISTS `bdCalculoClases` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bdCalculoClases`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ClasesXRequisito`
--

CREATE TABLE `ClasesXRequisito` (
  `IdClasesXRequisito` int(11) NOT NULL,
  `IdClase` int(11) NOT NULL,
  `IdClaseRequisito` int(11) DEFAULT NULL,
  `IdPlanEstudio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `ClasesXRequisito`
--

TRUNCATE TABLE `ClasesXRequisito`;
--
-- Volcado de datos para la tabla `ClasesXRequisito`
--

INSERT INTO `ClasesXRequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES
(1, 1, NULL, 1),
(2, 2, 1, 1),
(3, 2, 3, 1),
(4, 3, NULL, 1),
(5, 4, 5, 1),
(6, 7, 6, 2),
(7, 2, 1, 2),
(8, 3, 2, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `PlanEstudioXClases`
--

CREATE TABLE `PlanEstudioXClases` (
  `IdPlanEstudio` int(11) NOT NULL,
  `IdClases` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `PlanEstudioXClases`
--

TRUNCATE TABLE `PlanEstudioXClases`;
--
-- Volcado de datos para la tabla `PlanEstudioXClases`
--

INSERT INTO `PlanEstudioXClases` (`IdPlanEstudio`, `IdClases`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(2, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblClases`
--

CREATE TABLE `TblClases` (
  `IdClase` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Codigo` varchar(45) NOT NULL,
  `Peso` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `TblClases`
--

TRUNCATE TABLE `TblClases`;
--
-- Volcado de datos para la tabla `TblClases`
--

INSERT INTO `TblClases` (`IdClase`, `Nombre`, `Codigo`, `Peso`) VALUES
(1, 'Clase1', 'CL1', 3),
(2, 'Clase2', 'CL2', 1),
(3, 'Clase3', 'CL3', 1),
(4, 'Clase4', 'CL4', 2),
(5, 'Clase5', 'CL5', 4),
(6, 'Clase6', 'CL6', 5),
(7, 'Clase7', 'CL7', 3),
(8, 'Clase8', 'CL8', 2),
(9, 'Clase9', 'CL9', 2),
(10, 'Clase10', 'CL10', 3),
(11, 'clase11', 'CL11', 3),
(12, 'clase12', 'CL12', 4),
(13, 'clase13', 'CL13', 2),
(14, 'clase14', 'CL14', 5),
(15, 'clase15', 'CL15', 3),
(16, 'clase16', 'CL16', 3),
(17, 'clase17', 'CL17', 3),
(18, 'clase18', 'CL18', 2),
(19, 'clase19', 'CL19', 1),
(20, 'clase20', 'CL20', 3),
(21, 'clase21', 'CL21', 1),
(22, 'clase22', 'CL22', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `TblPlanEstudio`
--

CREATE TABLE `TblPlanEstudio` (
  `IdPlanEstudio` int(11) NOT NULL,
  `Nombre` varchar(45) DEFAULT NULL,
  `Carrera` varchar(45) DEFAULT NULL,
  `AñosDuracion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Truncar tablas antes de insertar `TblPlanEstudio`
--

TRUNCATE TABLE `TblPlanEstudio`;
--
-- Volcado de datos para la tabla `TblPlanEstudio`
--

INSERT INTO `TblPlanEstudio` (`IdPlanEstudio`, `Nombre`, `Carrera`, `AñosDuracion`) VALUES
(1, 'Plan IS', 'Ingeneria en sistemas', 5),
(2, 'Plan de estudio de electrica', 'Ingeneria Electrica', 5),
(3, 'Plan de estudio civil', 'Ingeniera Civil', 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ClasesXRequisito`
--
ALTER TABLE `ClasesXRequisito`
  ADD PRIMARY KEY (`IdClasesXRequisito`),
  ADD KEY `fk_TblClases_has_TblClases_TblClases2_idx` (`IdClaseRequisito`),
  ADD KEY `fk_TblClases_has_TblClases_TblClases1_idx` (`IdClase`),
  ADD KEY `fk_ClasesXRequisito_TblPlanEstudio1_idx` (`IdPlanEstudio`);

--
-- Indices de la tabla `PlanEstudioXClases`
--
ALTER TABLE `PlanEstudioXClases`
  ADD PRIMARY KEY (`IdPlanEstudio`,`IdClases`),
  ADD KEY `fk_PlanEstudioXClases_TblClases1_idx` (`IdClases`);

--
-- Indices de la tabla `TblClases`
--
ALTER TABLE `TblClases`
  ADD PRIMARY KEY (`IdClase`);

--
-- Indices de la tabla `TblPlanEstudio`
--
ALTER TABLE `TblPlanEstudio`
  ADD PRIMARY KEY (`IdPlanEstudio`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ClasesXRequisito`
--
ALTER TABLE `ClasesXRequisito`
  MODIFY `IdClasesXRequisito` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `TblClases`
--
ALTER TABLE `TblClases`
  MODIFY `IdClase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT de la tabla `TblPlanEstudio`
--
ALTER TABLE `TblPlanEstudio`
  MODIFY `IdPlanEstudio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ClasesXRequisito`
--
ALTER TABLE `ClasesXRequisito`
  ADD CONSTRAINT `fk_ClasesXRequisito_TblPlanEstudio1` FOREIGN KEY (`IdPlanEstudio`) REFERENCES `TblPlanEstudio` (`IdPlanEstudio`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TblClases_has_TblClases_TblClases1` FOREIGN KEY (`IdClase`) REFERENCES `TblClases` (`IdClase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_TblClases_has_TblClases_TblClases2` FOREIGN KEY (`IdClaseRequisito`) REFERENCES `TblClases` (`IdClase`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `PlanEstudioXClases`
--
ALTER TABLE `PlanEstudioXClases`
  ADD CONSTRAINT `fk_PlanEstudioXClases_TblClases1` FOREIGN KEY (`IdClases`) REFERENCES `TblClases` (`IdClase`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_PlanEstudioXClases_TblPlanEstudio1` FOREIGN KEY (`IdPlanEstudio`) REFERENCES `TblPlanEstudio` (`IdPlanEstudio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
