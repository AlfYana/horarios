-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-05-2023 a las 21:09:26
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
(3, 3, 3, 'default', '08:00:00', '17:00:00', 1, NULL),
(4, 3, 3, 'sabado', '10:00:00', '12:00:00', 1, NULL),
(5, 4, 4, 'default', '08:30:00', '17:30:00', 1, NULL),
(6, 4, 4, 'sabado', '08:30:00', '10:30:00', 1, NULL),
(7, 5, 5, 'default', '09:00:00', '16:00:00', 1, NULL),
(8, 5, 5, 'sabado', '09:00:00', '13:00:00', 1, NULL),
(9, 6, 7, 'default,lunes,martes,miercoles,jueves', '09:00:00', '15:00:00', 1, NULL),
(10, 6, 7, 'viernes', '09:00:00', '16:30:00', 1, NULL),
(11, 7, 8, 'default', '13:00:00', '15:30:00', 1, NULL),
(12, 7, 8, 'lunes,miercoles', '13:15:00', '15:30:00', 1, NULL),
(13, 7, 8, 'martes,jueves,viernes', '09:30:00', '16:30:00', 1, NULL),
(14, 8, 9, 'default', '10:00:00', '14:00:00', 1, NULL),
(15, 9, 10, 'default', '08:30:00', '20:00:00', 1, NULL),
(16, 10, 14, 'default', '08:30:00', '20:00:00', 1, NULL),
(17, 11, 19, 'default', '08:30:00', '20:00:00', 1, NULL),
(18, 12, 22, 'default', '08:30:00', '20:00:00', 1, NULL),
(19, 13, 28, 'default', '08:30:00', '12:30:00', 1, NULL),
(20, 14, 29, 'default', '08:30:00', '20:00:00', 1, NULL),
(21, 15, 30, 'default', '09:30:00', '13:00:00', 1, NULL),
(22, 16, 31, 'default', '08:30:00', '20:00:00', 1, NULL),
(23, 17, 33, 'default', '08:30:00', '00:00:00', 1, NULL),
(24, 18, 35, 'default', '08:00:00', '20:00:00', 1, NULL),
(25, 19, 36, 'default', '08:30:00', '20:00:00', 1, NULL),
(26, 20, 37, 'default', '08:30:00', '20:00:00', 1, NULL),
(27, 21, 38, 'default', '08:30:00', '20:00:00', 1, NULL),
(28, 22, 40, 'default', '09:00:00', '18:00:00', 1, NULL),
(29, 22, 40, 'viernes', '10:00:00', '19:00:00', 1, NULL),
(30, 22, 40, 'sabado', '09:00:00', '13:00:00', 1, NULL),
(31, 23, 41, 'default', '08:30:00', '20:00:00', 1, NULL),
(32, 24, 42, 'lunes,miercoles', '08:40:00', '15:00:00', 1, NULL),
(33, 24, 42, 'martes,jueves', '12:00:00', '16:30:00', 1, NULL),
(34, 24, 42, 'viernes', '08:40:00', '16:30:00', 1, NULL),
(35, 25, 45, 'default', '08:30:00', '20:00:00', 1, NULL),
(36, 25, 45, 'martes', '14:00:00', '00:00:00', 1, NULL),
(37, 26, 46, 'default', '17:00:00', '20:00:00', 1, NULL),
(38, 27, 47, 'default', '14:00:00', '20:00:00', 1, NULL),
(39, 27, 47, 'sabado', '09:00:00', '20:00:00', 1, NULL),
(40, 28, 48, 'default', '08:30:00', '20:00:00', 1, NULL),
(41, 29, 49, 'default', '12:00:00', '17:00:00', 1, NULL),
(42, 29, 49, 'sabado', '10:00:00', '13:00:00', 1, NULL),
(43, 31, 51, 'default', '08:30:00', '20:00:00', 1, NULL),
(44, 36, 62, 'default', '08:00:00', '13:00:00', 1, NULL),
(45, 36, 62, 'sabado', '08:30:00', '18:00:00', 1, NULL),
(46, 36, 62, 'domingo', '08:00:00', '00:00:00', 1, NULL),
(47, 37, 68, 'default', '08:00:00', '13:00:00', 1, NULL),
(48, 37, 68, 'domingo', '08:00:00', '00:00:00', 1, NULL),
(49, 38, 69, 'default', '14:00:00', '20:00:00', 1, NULL),
(50, 39, 18, 'default', '08:30:00', '16:00:00', 1, NULL),
(51, 39, 18, 'sabado', '08:30:00', '13:00:00', 1, NULL),
(52, 40, 70, 'default,domingo', '08:15:00', '13:30:00', 1, NULL),
(53, 41, 71, 'default', '08:30:00', '20:00:00', 1, NULL),
(54, 41, 71, 'sabado', '13:00:00', '00:00:00', 1, NULL),
(55, 42, 72, 'default', '08:30:00', '14:00:00', 1, NULL),
(56, 42, 72, 'sabado', '14:00:00', '18:00:00', 1, NULL),
(57, 46, 25, 'default', '15:15:00', '18:00:00', 1, NULL),
(58, 46, 25, 'sabado', '09:00:00', '14:00:00', 1, NULL),
(59, 51, 15, 'default', '08:30:00', '20:00:00', 1, NULL),
(60, 55, 26, 'default', '08:30:00', '12:00:00', 1, NULL),
(61, 56, 27, 'default', '09:00:00', '18:00:00', 1, NULL),
(62, 57, 32, 'default', '08:30:00', '13:30:00', 1, NULL),
(63, 60, 74, 'lunes', '11:00:00', '16:00:00', 1, NULL),
(64, 60, 74, 'martes,miercoles', '11:00:00', '18:00:00', 1, NULL),
(65, 60, 74, 'jueves', '11:00:00', '14:00:00', 1, NULL),
(66, 61, 75, 'default', '08:30:00', '18:00:00', 1, NULL),
(67, 62, 100, 'default', '13:30:00', '17:30:00', 1, NULL),
(68, 62, 100, 'sabado', '09:00:00', '13:00:00', 1, NULL),
(69, 63, 101, 'default', '14:30:00', '19:00:00', 1, NULL),
(70, 64, 102, 'default', '14:30:00', '18:00:00', 1, NULL),
(71, 64, 102, 'sabado', '13:00:00', '00:00:00', 1, NULL),
(72, 65, 103, 'default,lunes,martes,miercoles,viernes', '14:00:00', '17:00:00', 1, NULL),
(73, 66, 104, 'default', '14:30:00', '19:00:00', 1, NULL),
(74, 67, 105, 'default,martes,miercoles,jueves', '14:30:00', '17:00:00', 1, NULL),
(75, 68, 106, 'default', '14:00:00', '21:00:00', 1, NULL),
(76, 69, 107, 'default', '17:00:00', '20:00:00', 1, NULL),
(77, 70, 108, 'default', '15:00:00', '21:00:00', 1, NULL),
(78, 71, 170, 'default', '14:30:00', '20:00:00', 1, NULL),
(79, 72, 76, 'default', '13:00:00', '17:00:00', 1, NULL),
(80, 72, 76, 'sabado', '09:00:00', '13:00:00', 1, NULL),
(81, 73, 77, 'default', '09:00:00', '13:00:00', 1, NULL),
(82, 74, 109, 'default', '15:00:00', '20:00:00', 1, NULL),
(83, 75, 110, 'default', '15:30:00', '18:30:00', 1, NULL),
(84, 76, 78, 'default', '14:00:00', '19:00:00', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personal`
--

CREATE TABLE `personal` (
  `id` int(11) NOT NULL,
  `emp_id` int(11) DEFAULT NULL,
  `emp_code` int(11) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `depto` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1,
  `modify_Ult` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personal`
--

INSERT INTO `personal` (`id`, `emp_id`, `emp_code`, `nombre`, `apellido`, `depto`, `activo`, `modify_Ult`) VALUES
(1, 1, 1, 'Jose Luis', 'Mamani', 'Administracion', 1, '2023-05-16 14:53:22'),
(2, 2, 2, 'Willer', 'Lima', 'Sistemas', 1, '2023-05-16 14:53:22'),
(3, 3, 3, 'Eduardo', 'Espinoza', 'Post-Produccion', 1, '2023-05-16 14:53:22'),
(4, 4, 4, 'Bryan', 'Miranda', 'Post-Produccion', 1, '2023-05-16 14:53:22'),
(5, 5, 5, 'Jhon Cristian', 'Calle', 'Post-Produccion', 1, '2023-05-16 14:53:22'),
(6, 6, 7, 'Jade Adriana', 'Mamani Mamani', 'Administracion', 1, '2023-05-16 14:53:22'),
(7, 7, 8, 'Jenny Lizeth', 'Mamani Aduviri', 'Administracion', 1, '2023-05-16 14:53:22'),
(8, 8, 9, 'Melanie ', 'Sanchez Paucara', 'Administracion', 1, '2023-05-16 14:53:22'),
(9, 9, 10, 'Christian', 'Arauco', 'Produccion', 1, '2023-05-16 14:53:22'),
(10, 10, 14, 'Angela', 'Mayta', 'Produccion', 1, '2023-05-16 14:53:22'),
(11, 11, 19, 'Manuel Jose', 'Crespo Robles', 'Tecnica', 1, '2023-05-16 14:53:22'),
(12, 12, 22, 'Carol', 'Guzman', 'Produccion', 1, '2023-05-16 14:53:22'),
(13, 13, 28, 'Jaime', 'Bravo Sandoval', 'Planificacion', 1, '2023-05-16 14:53:22'),
(14, 14, 29, 'Jhonatan', 'Quispe Hidalgo', 'Tecnica', 1, '2023-05-16 14:53:22'),
(15, 15, 30, 'Boris', 'Flores Herrera', 'Comercial', 1, '2023-05-16 14:53:22'),
(16, 16, 31, 'Juan Alberto', 'Laura Sierra', 'Produccion', 1, '2023-05-16 14:53:22'),
(17, 17, 33, 'Alejandro', 'Pinedo', 'Gerencia', 1, '2023-05-16 14:53:22'),
(18, 18, 35, 'Carlos', 'Chambi Yana', 'Produccion', 1, '2023-05-16 14:53:22'),
(19, 19, 36, 'Eloy', 'Mayta Nina', 'Logistica', 1, '2023-05-16 14:53:22'),
(20, 20, 37, 'Wendy Stephanie', 'Zambrana Monasterio', 'Produccion', 1, '2023-05-16 14:53:22'),
(21, 21, 38, 'Wilbert', 'Leon Moscoso', 'Produccion', 1, '2023-05-16 14:53:22'),
(22, 22, 40, 'Jhanira Laura', 'Condori', 'Comercial', 1, '2023-05-16 14:53:22'),
(23, 23, 41, 'Jason', 'Beltran', 'Tecnica', 1, '2023-05-16 14:53:22'),
(24, 24, 42, 'Paula ', 'Conza Sejas', 'Comercial', 1, '2023-05-16 14:53:22'),
(25, 25, 45, 'Wendy', 'Limachi Copana', 'Produccion', 1, '2023-05-16 14:53:22'),
(26, 26, 46, 'Harold Abel', 'Quispe Aiza', 'Produccion', 1, '2023-05-16 14:53:22'),
(27, 27, 47, 'Veronica', 'Choque Gutierrez', 'Produccion', 1, '2023-05-16 14:53:22'),
(28, 28, 48, 'Freddy', 'Choque Ulloa', 'Produccion', 1, '2023-05-16 14:53:22'),
(29, 29, 49, 'Bryan Orlando', 'Marin Duran', 'Comercial', 1, '2023-05-16 14:53:22'),
(30, 31, 51, 'Wilmer', 'Paucara Jimenez', 'Prensa', 1, '2023-05-16 14:53:22'),
(31, 36, 62, 'Beimar', 'Quispe Medrano', 'Produccion', 1, '2023-05-16 14:53:22'),
(32, 37, 68, 'Barbara', 'Palacios Mendoza', 'Produccion', 1, '2023-05-16 14:53:22'),
(33, 38, 69, 'Rafael', NULL, 'Produccion', 1, '2023-05-16 14:53:22'),
(34, 39, 18, 'Betty', NULL, 'Logistica', 1, '2023-05-16 14:53:22'),
(35, 40, 70, 'Henry', 'Aruquipa Jarandilla', 'Post-Produccion', 1, '2023-05-16 14:53:22'),
(36, 41, 71, 'Ruth', 'Huanca Atahuachi', 'Produccion', 1, '2023-05-16 14:53:22'),
(37, 42, 72, 'Gherabi', 'Ramos Mendoza', 'Produccion', 1, '2023-05-16 14:53:22'),
(38, 46, 25, 'Daniel', 'Juarez', 'Produccion', 1, '2023-05-16 14:53:22'),
(39, 51, 15, 'Belen Naydelin', 'Chino Quisbert', 'Produccion', 1, '2023-05-16 14:53:22'),
(40, 55, 26, 'Jonatan', 'Quinto Lima', 'Produccion', 1, '2023-05-16 14:53:22'),
(41, 56, 27, 'Cesar', 'Marino Sanchez', 'Post-Produccion', 1, '2023-05-16 14:53:22'),
(42, 57, 32, 'Katerine', 'Cabrera Rojas', 'Prensa', 1, '2023-05-16 14:53:22'),
(43, 60, 74, 'Jazmin', 'Quisbert Sanchez', 'Produccion', 1, '2023-05-16 14:53:22'),
(44, 61, 75, 'Vladimir', 'Condori', 'Prensa', 1, '2023-05-16 14:53:22'),
(45, 62, 100, 'Alfredo', 'Yana', 'Sistemas', 1, '2023-05-16 14:53:22'),
(46, 63, 101, 'Ivan', 'Quispe Chambi', 'Produccion', 1, '2023-05-16 14:53:22'),
(47, 64, 102, 'Janny Jhanitza', 'Caceres Alanoca', 'Produccion', 1, '2023-05-16 14:53:22'),
(48, 65, 103, 'Giovanna ', 'Cruz', 'Produccion', 1, '2023-05-16 14:53:22'),
(49, 66, 104, 'Leyla', 'Calle Colque', 'Produccion', 1, '2023-05-16 14:53:22'),
(50, 67, 105, 'Kati', 'Conde', 'Produccion', 1, '2023-05-16 14:53:22'),
(51, 68, 106, 'Andrea Mayden', 'Carani Calderon', 'Produccion', 1, '2023-05-16 14:53:22'),
(52, 69, 107, 'Ambar', 'Villanueva', 'Produccion', 1, '2023-05-16 14:53:22'),
(53, 70, 108, 'Rosmery', 'Mamani', 'Produccion', 1, '2023-05-16 14:53:22'),
(54, 71, 170, 'Cinthia', 'Huayhua', 'Producion', 1, '2023-05-16 14:53:22'),
(55, 72, 76, 'Celia', 'Lisarraga', 'Comercial', 1, '2023-05-16 14:53:22'),
(56, 73, 77, 'Adrian', 'Pillco', 'Comercial', 1, '2023-05-16 14:53:22'),
(57, 74, 109, 'Viviana', 'Machaca', 'Produccion', 1, '2023-05-16 14:53:22'),
(58, 75, 110, 'Willy', 'Quito', 'Prensa', 1, '2023-05-16 14:53:22'),
(59, 76, 78, 'Keila', 'Huanca Alvarado', NULL, 1, '2023-05-16 14:53:22');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT de la tabla `personal`
--
ALTER TABLE `personal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
