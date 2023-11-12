-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-11-2023 a las 18:26:31
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `desafio_3_tablas`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `dni` varchar(20) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `apellido` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`dni`, `nombre`, `apellido`) VALUES
('17645890', 'Raquel', 'Miranda'),
('33589746', 'Pedro', 'Ruiz'),
('35328796', 'Claudia', 'Martinez'),
('35678989', 'Camilo', 'Suarez'),
('36355909', 'Juan', 'Lopez'),
('37374496', 'Agustina', 'Florines'),
('38979865', 'Mariano', 'Gimenez'),
('39897523', 'Diego', 'Gonzalez'),
('6589231', 'Claudia', 'Dominguez'),
('7896541', 'Raul', 'Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `clientes_dni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `clientes_dni`) VALUES
(100, 'Compra', '33589746'),
(125, 'Compra', '17645890'),
(150, 'Compra', '6589231'),
(155, 'Compra', '6589231'),
(200, 'Compra', '36355909'),
(250, 'Compra', '37374496'),
(255, 'Compra', '36355909'),
(300, 'Compra', '35328796'),
(350, 'Compra', '35678989'),
(400, 'Compra', '7896541');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineascompra`
--

CREATE TABLE `lineascompra` (
  `numero` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineascompra`
--

INSERT INTO `lineascompra` (`numero`, `compras_id`, `producto`, `importe`) VALUES
(1, 100, 'Chocolate blanco', 500),
(8, 125, 'Chocolate c leche', 350),
(4, 150, 'Chocolate c almendra', 500),
(9, 155, 'Chocolate kinder', 900),
(2, 200, 'Chocolate amargo', 600),
(5, 250, 'Chocolate nevado', 600),
(10, 255, 'Chocotorta', 1000),
(3, 300, 'Chocolate suizo', 700),
(6, 350, 'Chocolate', 350),
(7, 400, 'Chocolate con pasas', 700);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`),
  ADD KEY `clientes_dni` (`clientes_dni`);

--
-- Indices de la tabla `lineascompra`
--
ALTER TABLE `lineascompra`
  ADD PRIMARY KEY (`compras_id`),
  ADD KEY `numero` (`numero`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`id`) REFERENCES `lineascompra` (`compras_id`),
  ADD CONSTRAINT `compras_ibfk_2` FOREIGN KEY (`clientes_dni`) REFERENCES `clientes` (`dni`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
