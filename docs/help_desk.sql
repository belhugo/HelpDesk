-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 09-01-2024 a las 20:12:31
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `help_desk`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `td_ticketdetalle`
--

CREATE TABLE `td_ticketdetalle` (
  `tickd_id` int(11) NOT NULL,
  `tick_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `tickd_descrip` text NOT NULL,
  `fech_crea` datetime NOT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `td_ticketdetalle`
--

INSERT INTO `td_ticketdetalle` (`tickd_id`, `tick_id`, `usu_id`, `tickd_descrip`, `fech_crea`, `est`) VALUES
(1, 1, 2, 'Te respondo', '2024-01-04 23:58:13', 1),
(2, 1, 1, 'Soy el usuario respondiendo', '2024-01-04 23:59:38', 1),
(3, 1, 2, 'Para resolver tu problema reinicia tu equipo.', '2024-01-04 23:59:53', 1),
(4, 1, 1, 'Si con eso se resolvió, gracias!', '2024-01-05 00:01:08', 1),
(5, 1, 2, 'Gracias por la confirmación, por favor cerrar el ticket.', '2024-01-05 00:02:21', 1),
(6, 2, 1, '<p>dasdhaskdha</p><p>asdasd</p><p>asdasdasd</p><p>aaasdddas</p>', '2024-01-05 00:13:25', 1),
(7, 2, 2, '<p>Lo veré a a brevedad.</p>', '2024-01-05 00:15:27', 1),
(8, 1, 1, 'Ticket Cerrado.', '2024-01-07 19:34:24', 1),
(9, 4, 4, 'Ticket Cerrado.', '2024-01-08 19:06:09', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_categoria`
--

CREATE TABLE `tm_categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_nom` varchar(150) NOT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_categoria`
--

INSERT INTO `tm_categoria` (`cat_id`, `cat_nom`, `est`) VALUES
(1, 'Hardware', 1),
(2, 'Software', 1),
(3, 'Incidencia', 1),
(4, 'Petición de Servicio', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_ticket`
--

CREATE TABLE `tm_ticket` (
  `tick_id` int(11) NOT NULL,
  `usu_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `tick_titulo` varchar(250) NOT NULL,
  `tick_descrip` mediumtext NOT NULL,
  `tick_estado` varchar(15) DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `tm_ticket`
--

INSERT INTO `tm_ticket` (`tick_id`, `usu_id`, `cat_id`, `tick_titulo`, `tick_descrip`, `tick_estado`, `fech_crea`, `est`) VALUES
(1, 1, 1, 'Test', '<p>Test</p>', 'Cerrado', '2023-12-30 19:12:10', 1),
(2, 1, 3, 'Test', '<p>ajsdhasjhdaksdhasjbl&lt;afhskhdkfjnsakjlasdhfk</p>', 'Abierto', '2024-01-01 19:12:20', 1),
(3, 1, 4, 'Solicito Mouse', '<p>Necesito un nuevo mouse</p>', 'Abierto', '2024-01-01 19:24:21', 1),
(4, 4, 2, 'AAAA', '<p>aaaaaaa</p>', 'Cerrado', '2024-01-08 19:05:22', 1),
(5, 4, 4, 'AAA', '<p>aaa</p>', 'Abierto', '2024-01-08 19:05:32', 1),
(6, 4, 3, 'AA', '<p>aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</p>', 'Abierto', '2024-01-08 19:05:47', 1),
(7, 4, 2, 'AAAA', '<p>aaaaaaaaaaaaaaa</p>', 'Abierto', '2024-01-08 19:06:49', 1),
(8, 5, 4, 'BB', '<p>bbbbbbbbbbbbbbbbbbbb</p>', 'Abierto', '2024-01-08 19:07:12', 1),
(9, 1, 4, 'Service', '<p>Camioneta</p>', 'Abierto', '2024-01-08 19:07:58', 1),
(10, 1, 3, 'Hilos', '<p>Marioneta</p>', 'Abierto', '2024-01-08 19:08:17', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tm_usuario`
--

CREATE TABLE `tm_usuario` (
  `usu_id` int(11) NOT NULL,
  `usu_nom` varchar(150) DEFAULT NULL,
  `usu_ape` varchar(150) DEFAULT NULL,
  `usu_correo` varchar(150) NOT NULL,
  `usu_pass` varchar(32) NOT NULL,
  `rol_id` int(11) DEFAULT NULL,
  `fech_crea` datetime DEFAULT NULL,
  `fech_modi` date DEFAULT NULL,
  `fech_elim` datetime DEFAULT NULL,
  `est` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci COMMENT='Tabla Mantenedor de Usuarios';

--
-- Volcado de datos para la tabla `tm_usuario`
--

INSERT INTO `tm_usuario` (`usu_id`, `usu_nom`, `usu_ape`, `usu_correo`, `usu_pass`, `rol_id`, `fech_crea`, `fech_modi`, `fech_elim`, `est`) VALUES
(1, 'Mario', 'Neta', 'mario@neta.com', 'e10adc3949ba59abbe56e057f20f883e', 1, '2024-01-01 23:03:42', NULL, NULL, 1),
(2, 'Hugo', 'Bel', 'hugobel.nqn@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', 2, '2024-01-01 23:03:48', NULL, NULL, 1),
(3, 'c', 'C', 'c@c.com', '4a8a08f09d37b73795649038408b5f33', 1, '2024-01-07 23:02:32', NULL, NULL, 1),
(4, 'a', 'A', 'a@a.com', '0cc175b9c0f1b6a831c399e269772661', 1, '2024-01-08 16:19:11', NULL, NULL, 1),
(5, 'b', 'B', 'b@b.com', '92eb5ffee6ae2fec3ad71c777531578f', 1, '2024-01-08 16:23:46', NULL, NULL, 1),
(6, 'd', 'D', 'd@d.com', '8277e0910d750195b448797616e091ad', 1, '2024-01-08 16:26:39', NULL, NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `td_ticketdetalle`
--
ALTER TABLE `td_ticketdetalle`
  ADD PRIMARY KEY (`tickd_id`);

--
-- Indices de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `tm_ticket`
--
ALTER TABLE `tm_ticket`
  ADD PRIMARY KEY (`tick_id`);

--
-- Indices de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `td_ticketdetalle`
--
ALTER TABLE `td_ticketdetalle`
  MODIFY `tickd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `tm_categoria`
--
ALTER TABLE `tm_categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tm_ticket`
--
ALTER TABLE `tm_ticket`
  MODIFY `tick_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tm_usuario`
--
ALTER TABLE `tm_usuario`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
