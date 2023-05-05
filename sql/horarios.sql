-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2023 a las 00:07:56
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `horarios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_empleado`
--

CREATE TABLE `horario_empleado` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `code_emp` int(11) DEFAULT NULL,
  `dias` varchar(255) DEFAULT NULL,
  `entrada` time DEFAULT NULL,
  `salida` time DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `modify_ult` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `horario_empleado`
--

INSERT INTO `horario_empleado` (`id`, `emp_id`, `code_emp`, `dias`, `entrada`, `salida`, `activo`, `modify_ult`) VALUES
(1, 1, 1, 'default', '08:30:00', '17:30:00', 1, NULL),
(2, 2, 2, 'default,sabado', '09:00:00', '13:00:00', 1, NULL),
(3, 34, 3, 'default', '08:00:00', '17:00:00', 1, NULL),
(4, 34, 3, 'sabado', '10:00:00', '12:00:00', 1, NULL),
(5, 35, 4, 'default', '08:30:00', '17:30:00', 1, NULL),
(6, 35, 4, 'sabado', '08:30:00', '10:30:00', 1, NULL),
(7, 36, 5, 'default', '09:00:00', '18:00:00', 1, NULL),
(8, 36, 5, 'sabado', '09:00:00', '13:00:00', 1, NULL),
(9, 38, 7, 'default,lunes,martes,miercoles,jueves', '09:00:00', '15:00:00', 1, NULL),
(10, 38, 7, 'viernes', '09:00:00', '16:30:00', 1, NULL),
(11, 39, 8, 'default', '13:00:00', '15:30:00', 1, NULL),
(12, 39, 8, 'lunes,miercoles', '13:15:00', '15:30:00', 1, NULL),
(13, 39, 8, 'martes,jueves,viernes', '09:30:00', '16:30:00', 1, NULL),
(14, 40, 9, 'default', '10:00:00', '14:00:00', 1, NULL),
(15, 41, 10, 'default', '08:30:00', '20:00:00', 1, NULL),
(16, 45, 14, 'default', '08:30:00', '20:00:00', 1, NULL),
(17, 46, 15, 'default', '08:30:00', '20:00:00', 1, NULL),
(18, 50, 19, 'default', '08:30:00', '20:00:00', 1, NULL),
(19, 51, 20, 'default', '08:30:00', '20:00:00', 1, NULL),
(20, 53, 22, 'default', '08:30:00', '20:00:00', 1, NULL),
(21, 88, 28, 'default', '08:30:00', '12:30:00', 1, NULL),
(22, 89, 29, 'default', '08:30:00', '20:00:00', 1, NULL),
(23, 90, 30, 'default', '09:30:00', '13:00:00', 1, NULL),
(24, 91, 31, 'default', '08:30:00', '20:00:00', 1, NULL),
(25, 93, 33, 'default', '08:30:00', '00:00:00', 1, NULL),
(26, 95, 35, 'default', '08:00:00', '20:00:00', 1, NULL),
(27, 96, 36, 'default', '08:30:00', '20:00:00', 1, NULL),
(28, 97, 37, 'default', '08:30:00', '20:00:00', 1, NULL),
(29, 98, 38, 'default', '08:30:00', '20:00:00', 1, NULL),
(30, 100, 40, 'default', '09:00:00', '18:00:00', 1, NULL),
(31, 100, 40, 'viernes', '10:00:00', '19:00:00', 1, NULL),
(32, 100, 40, 'sabado', '09:00:00', '13:00:00', 1, NULL),
(33, 101, 41, 'default', '08:30:00', '20:00:00', 1, NULL),
(34, 102, 42, 'lunes,miercoles', '08:40:00', '15:00:00', 1, NULL),
(35, 102, 42, 'martes,jueves', '12:00:00', '16:30:00', 1, NULL),
(36, 102, 42, 'viernes', '08:40:00', '16:30:00', 1, NULL),
(37, 105, 45, 'default', '08:30:00', '20:00:00', 1, NULL),
(38, 105, 45, 'martes', '14:00:00', '00:00:00', 1, NULL),
(39, 106, 46, 'default', '17:00:00', '20:00:00', 1, NULL),
(40, 107, 47, 'default', '14:00:00', '20:00:00', 1, NULL),
(41, 108, 48, 'default', '08:30:00', '20:00:00', 1, NULL),
(42, 109, 49, 'default', '12:00:00', '17:00:00', 1, NULL),
(43, 109, 49, 'sabado', '10:00:00', '13:00:00', 1, NULL),
(44, 111, 51, 'default', '08:30:00', '20:00:00', 1, NULL),
(45, 122, 62, 'default,domingo', '08:00:00', '00:00:00', 1, NULL),
(46, 128, 68, 'default', '08:00:00', '13:00:00', 1, NULL),
(47, 128, 68, 'domingo', '08:00:00', '00:00:00', 1, NULL),
(48, 129, 69, 'default', '14:00:00', '20:00:00', 1, NULL),
(49, 130, 18, 'default', '08:30:00', '16:00:00', 1, NULL),
(50, 130, 18, 'sabado', '08:30:00', '13:00:00', 1, NULL),
(51, 131, 70, 'default,domingo', '08:15:00', '13:30:00', 1, NULL),
(52, 132, 71, 'default', '08:30:00', '20:00:00', 1, NULL),
(53, 132, 71, 'sabado', '13:00:00', '00:00:00', 1, NULL),
(54, 133, 72, 'default', '08:30:00', '14:00:00', 1, NULL),
(55, 133, 72, 'sabado', '14:00:00', '18:00:00', 1, NULL),
(56, 137, 25, 'default', '15:15:00', '18:00:00', 1, NULL),
(57, 137, 25, 'sabado', '09:00:00', '14:00:00', 1, NULL),
(58, 138, 26, 'default', '08:30:00', '12:00:00', 1, NULL),
(59, 139, 27, 'default', '09:00:00', '18:00:00', 1, NULL),
(60, 140, 32, 'default', '08:30:00', '13:30:00', 1, NULL),
(61, 141, 74, 'lunes', '11:00:00', '16:00:00', 1, NULL),
(62, 141, 74, 'martes,miercoles', '11:00:00', '18:00:00', 1, NULL),
(63, 141, 74, 'jueves', '11:00:00', '14:00:00', 1, NULL),
(64, 142, 75, 'default', '08:30:00', '18:00:00', 1, NULL),
(65, 143, 100, 'default', '13:30:00', '17:30:00', 1, NULL),
(66, 143, 100, 'sabado', '09:00:00', '13:00:00', 1, NULL),
(67, 144, 101, 'default', '14:30:00', '19:00:00', 1, NULL),
(68, 145, 102, 'default', '14:30:00', '18:00:00', 1, NULL),
(69, 145, 102, 'sabado', '13:00:00', '00:00:00', 1, NULL),
(70, 146, 103, 'default,lunes,martes,miercoles,viernes', '14:00:00', '17:00:00', 1, NULL),
(71, 147, 104, 'default', '14:30:00', '19:00:00', 1, NULL),
(72, 148, 105, 'default,martes,miercoles,jueves', '14:30:00', '17:00:00', 1, NULL),
(73, 149, 106, 'default', '14:00:00', '21:00:00', 1, NULL),
(74, 150, 107, 'default', '17:00:00', '20:00:00', 1, NULL),
(75, 151, 108, 'default', '15:00:00', '21:00:00', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `code_emp` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` time DEFAULT NULL,
  `activo` tinyint(1) DEFAULT NULL,
  `modify_Ult` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `horario_empleado`
--
ALTER TABLE `horario_empleado`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `horario_empleado`
--
ALTER TABLE `horario_empleado`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
