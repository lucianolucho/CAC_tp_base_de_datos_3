-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 12-11-2023 a las 04:09:43
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `base_cac_tp3`
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
('01234567', 'Isabel', 'Jiménez'),
('12345678', 'Juan', 'Pérez'),
('23456789', 'María', 'Gómez'),
('34567890', 'Carlos', 'López'),
('45678901', 'Ana', 'Martínez'),
('56789012', 'Pedro', 'Rodríguez'),
('67890123', 'Laura', 'Sánchez'),
('78901234', 'Francisco', 'Hernández'),
('89012345', 'Elena', 'Fernández'),
('90123456', 'Miguel', 'Díaz');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `concepto` varchar(20) NOT NULL,
  `cliente_dni` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `concepto`, `cliente_dni`) VALUES
(1, 'Varios A', '12345678'),
(2, 'Varios B', '23456789'),
(3, 'Varios C', '34567890'),
(4, 'Varios D', '45678901'),
(5, 'Varios E', '56789012'),
(6, 'Varios F', '67890123'),
(7, 'Varios G', '78901234'),
(8, 'Varios H', '89012345'),
(9, 'Varios I', '90123456'),
(10, 'Varios J', '01234567');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `lineasCompra`
--

CREATE TABLE `lineasCompra` (
  `id` int(20) NOT NULL,
  `compras_id` int(20) NOT NULL,
  `producto` varchar(20) NOT NULL,
  `importe` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `lineasCompra`
--

INSERT INTO `lineasCompra` (`id`, `compras_id`, `producto`, `importe`) VALUES
(1, 1, 'carne', 25.98),
(1, 2, 'zapatillas', 80),
(2, 1, 'fruta', 23.7),
(2, 2, 'medias', 254.76),
(3, 1, 'queso', 35.68),
(3, 2, 'pantalon corto', 15.38),
(4, 1, 'verdura', 89.99),
(4, 2, 'remera', 26.5),
(5, 1, 'miel', 42.15),
(5, 2, 'gorro', 9.98);

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
  ADD KEY `cliente_dni` (`cliente_dni`);

--
-- Indices de la tabla `lineasCompra`
--
ALTER TABLE `lineasCompra`
  ADD PRIMARY KEY (`id`,`compras_id`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`cliente_dni`) REFERENCES `clientes` (`dni`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `lineasCompra`
--
ALTER TABLE `lineasCompra`
  ADD CONSTRAINT `lineasCompra_ibfk_1` FOREIGN KEY (`compras_id`) REFERENCES `compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
