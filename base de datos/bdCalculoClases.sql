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




ALTER TABLE tblclases ADD UV INT(50) NULL; 

INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('1', 'Matematicas 110', 'MM_110', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('2', 'Matematicas 111', 'MM_111', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('3', 'Introduccion a la Ingenieria en Sistemas', 'IS_110', '6', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('4', 'Sociologia', 'SC_101', '5', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('5', 'Ingles I', 'IN_101', '4', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('6', 'Ingles II', 'IN_102', '4', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('7', 'Ingles III', 'IN_103', '4', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('8', 'Filosofia', 'FF_101', '5', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('9', 'Historia de Honduras', 'HH_101', '4', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('10', 'Español General', 'EG_011', '4', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('11', 'Calculo I', 'MM_201', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('12', 'Programacion I', 'MM_314', '9', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('13', 'Vectores y Matrices', 'MM_211', '8', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('14', 'Programacion II', 'IS_210', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('15', 'Calculo II', 'MM_202', '8', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('16', 'Fisica 100', 'FS_100', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('17', 'Dibujo I', 'DQ_101', '7', '2');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('18', 'Fisica 200', 'FS_200', '9', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('19', 'Dibujo 2', 'DQ_102', '7', '2');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('20', 'Sistemas Operativos I', 'IS_412', '4', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('21', 'Algoritmos y Estructura de datos', 'IS_310', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('22', 'Ecuaciones Diferenciales', 'MM_411', '7', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('23', 'Circuitos para Ingenieria en Sistemas', 'IS_311', '7', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('24', 'Matematica Discreta', 'MM_420', '10', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('25', 'Estadistica', 'MM_401', '7', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('26', 'Programacion Orientada a Objetos', 'IS_410', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('27', 'Electronica para Ingenieria en Sistemas', 'IS_411', '8', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('28', 'Sistemas Operativos II', 'IS_512', '7', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('29', 'Bases de Datos I', 'IS_501', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('30', 'Instalaciones Electricas', 'IS_510', '6', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('31', 'Redes de Datos I', 'IS_511', '10', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('32', 'Redes de Datos II', 'IS_611', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('33', 'Bases de Datos II', 'IS_601', '10', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('34', 'Lenguajes de Programacion', 'IS_513', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('35', 'Arquitectura de Computadoras', 'IS_603', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('36', 'Administracion I', 'IS_720', '7', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('37', 'Inteligencia Artificial', 'IS_701', '9', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('38', 'Sistemas de Informacion', 'IS_602', '7', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('39', 'Analisis y Diseño de Sistemas', 'IS_702', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('40', 'Diseño Digital', 'IS_711', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('41', 'Contabilidad I', 'IS_721', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('42', 'Finanzas Administrativas', 'IS_820', '6', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('43', 'Ingenieria del Software', 'IS_802', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('44', 'Industria del Software', 'IS_902', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('45', 'Seguridad Informatica', 'IS_811', '8', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('46', 'Economia Digital', 'IS_905', '7', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('47', 'Gerencia Informatica', 'IS_904', '10', '4');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('48', 'Auditoria Informatica', 'IS_903', '10', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('49', 'Topicos Especiales y Avanzados', 'IS_906', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('50', 'Sistemas Expertos', 'IS_912', '8', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('51', 'Seminario de Investigacion', 'IS_115', '10', '5');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('52', 'Microprocesadores', 'IS_911', '8', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('53', 'Teoría de la Simulacion', 'IS_910', '8', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('54', 'Liderazgo para el Cambio', 'IS_914', '5', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('55', 'Compiladores', 'IS_913', '10', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('56', 'Educacion Ambiental', 'BL_130', '5', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('57', 'Cultura Fisica o Deportes', 'RR_171-190', '5', '3');
INSERT INTO `tblclases` (`IdClase`, `Nombre`, `Codigo`, `Peso`, `UV`) VALUES ('58', 'Curso de Ortografia', 'EO_027', '6', '3');



INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '1');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '2');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '3');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '4');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '5');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '6');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '7');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '8');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '9');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '10');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '11');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '12');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '13');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '14');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '15');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '16');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '17');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '18');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '19');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '20');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '21');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '22');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '23');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '24');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '25');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '26');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '27');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '28');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '29');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '30');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '31');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '32');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '33');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '34');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '35');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '36');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '37');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '38');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '39');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '40');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '41');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '42');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '43');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '44');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '45');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '46');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '47');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '48');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '49');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '50');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '51');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '52');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '53');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '54');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '55');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '56');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '57');
INSERT INTO `planestudioxclases` (`IdPlanEstudio`, `IdClases`) VALUES ('1', '58');

INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('1', '1', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('2', '2', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('3', '3', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('4', '4', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('5', '5', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('6', '6', '5', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('7', '7', '6', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('8', '8', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('9', '9', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('10', '10', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('11', '11', '1', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('12', '11', '2', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('13', '12', '1', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('14', '12', '3', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('15', '13', '1', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('16', '14', '12', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('17', '15', '11', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('18', '16', '11', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('19', '16', '13', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('20', '17', '13', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('21', '18', '16', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('22', '19', '17', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('23', '20', '21', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('24', '20', '24', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('25', '21', '14', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('26', '22', '15', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('27', '23', '22', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('28', '23', '16', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('29', '24', '12', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('30', '24', '8', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('31', '25', '15', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('32', '26', '21', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('33', '27', '23', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('34', '28', '20', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('35', '29', '25', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('36', '29', '26', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('37', '30', '23', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('38', '31', '27', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('39', '32', '31', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('40', '33', '29', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('41', '34', '26', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('42', '35', '31', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('43', '36', '24', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('44', '37', '33', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('45', '37', '38', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('46', '38', '34', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('47', '39', '38', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('48', '40', '35', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('49', '41', '36', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('50', '42', '41', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('51', '43', '39', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('52', '44', '43', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('53', '45', '40', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('54', '46', '42', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('55', '47', '45', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('56', '48', '45', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('57', '49', '47', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('58', '50', '37', '1');

INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('59', '51', '47', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('60', '52', '35', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('61', '53', '32', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('62', '54', '42', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('63', '55', '35', '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('64', '56', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('65', '57', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('66', '58', NULL, '1');
INSERT INTO `clasesxrequisito` (`IdClasesXRequisito`, `IdClase`, `IdClaseRequisito`, `IdPlanEstudio`) VALUES ('67', '45', '28', '1');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
