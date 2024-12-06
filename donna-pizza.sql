-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2024 a las 00:34:13
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
-- Base de datos: `donna-pizza`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id_cliente` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos`
--

CREATE TABLE `contactos` (
  `id_contactos` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `telefono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedido`
--

CREATE TABLE `detalles_pedido` (
  `id_detalle` bigint(20) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_pizza` int(11) DEFAULT NULL,
  `id_pizza_familiar` int(11) DEFAULT NULL,
  `id_pasta` int(11) DEFAULT NULL,
  `id_entrada` int(11) DEFAULT NULL,
  `cantidad` int(11) NOT NULL,
  `precio_unitario` double DEFAULT NULL,
  `subtotal` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `documentos`
--

CREATE TABLE `documentos` (
  `id_documento` int(11) NOT NULL,
  `tipo_documento` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas`
--

CREATE TABLE `entradas` (
  `id_entrada` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forgot_password`
--

CREATE TABLE `forgot_password` (
  `fp_id` int(11) NOT NULL,
  `otp` int(11) NOT NULL,
  `tiempo_expiracion` datetime(6) NOT NULL,
  `user_id_usuario` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `forgot_password`
--

INSERT INTO `forgot_password` (`fp_id`, `otp`, `tiempo_expiracion`, `user_id_usuario`) VALUES
(19, 590218, '2024-11-27 21:33:09.000000', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id_ingrediente` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `cantidad_disponible` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id_ingrediente`, `nombre`, `cantidad_disponible`) VALUES
(1, 'Queso mozzarella', 100),
(2, 'Jamón', 100),
(3, 'Piña', 50),
(4, 'Aceituna', 70),
(5, 'Pimiento', 60),
(6, 'Salsa pizzera', 80),
(7, 'Pepperoni', 40),
(8, 'Pollo', 30),
(9, 'Carne de res', 20),
(10, 'Tocino ahumado', 50),
(11, 'Chorizo', 40),
(12, 'Salame', 30),
(13, 'Hot dog', 20),
(14, 'Durazno', 25),
(15, 'Champiñones', 35),
(16, 'Cebolla blanca', 40),
(17, 'Orégano', 10),
(18, 'Rodajas de tomate', 30),
(19, 'Chorizo parrillero', 20),
(20, 'Salchicha Frankfurt', 15),
(21, 'Jamón inglés', 30),
(22, 'Fettuccini', 40),
(23, 'Macarrones', 40),
(24, 'Carne molida', 25),
(25, 'Salsa Alfredo', 50),
(26, 'Salsa bolognesa', 50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_entrada`
--

CREATE TABLE `ingredientes_entrada` (
  `id_entrada` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad_necesaria` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_pasta`
--

CREATE TABLE `ingredientes_pasta` (
  `id_pasta` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad_necesaria` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_pizza`
--

CREATE TABLE `ingredientes_pizza` (
  `id_pizza` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad_necesaria` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ingredientes_pizza`
--

INSERT INTO `ingredientes_pizza` (`id_pizza`, `id_ingrediente`, `cantidad_necesaria`) VALUES
(1, 1, 0.20),
(1, 2, 0.15),
(1, 3, 0.10),
(1, 4, 0.05),
(1, 5, 0.05),
(1, 6, 0.10),
(2, 1, 0.40),
(2, 2, 0.30),
(2, 3, 0.20),
(2, 4, 0.10),
(2, 5, 0.10),
(2, 6, 0.20),
(3, 1, 0.20),
(3, 4, 0.05),
(3, 5, 0.05),
(3, 6, 0.10),
(3, 7, 0.15),
(4, 1, 0.40),
(4, 4, 0.10),
(4, 5, 0.10),
(4, 6, 0.20),
(4, 7, 0.30),
(5, 1, 0.20),
(5, 3, 0.10),
(5, 4, 0.05),
(5, 5, 0.05),
(5, 6, 0.10),
(5, 7, 0.15),
(6, 1, 0.40),
(6, 3, 0.20),
(6, 4, 0.10),
(6, 5, 0.10),
(6, 6, 0.20),
(6, 7, 0.30),
(7, 1, 0.20),
(7, 2, 0.10),
(7, 4, 0.05),
(7, 5, 0.05),
(7, 6, 0.10),
(7, 8, 0.10),
(7, 9, 0.10),
(7, 10, 0.05),
(7, 11, 0.05),
(8, 1, 0.40),
(8, 2, 0.20),
(8, 4, 0.10),
(8, 5, 0.10),
(8, 6, 0.20),
(8, 8, 0.20),
(8, 9, 0.20),
(8, 10, 0.10),
(8, 11, 0.10),
(9, 1, 0.20),
(9, 2, 0.10),
(9, 4, 0.05),
(9, 5, 0.05),
(9, 6, 0.10),
(9, 10, 0.05),
(9, 11, 0.05),
(9, 12, 0.05),
(9, 13, 0.05),
(10, 1, 0.40),
(10, 2, 0.20),
(10, 4, 0.10),
(10, 5, 0.10),
(10, 6, 0.20),
(10, 10, 0.10),
(10, 11, 0.10),
(10, 12, 0.10),
(10, 13, 0.10),
(11, 1, 0.20),
(11, 4, 0.05),
(11, 5, 0.05),
(11, 6, 0.10),
(11, 13, 0.10),
(11, 20, 0.15),
(12, 1, 0.40),
(12, 4, 0.10),
(12, 5, 0.10),
(12, 6, 0.20),
(12, 13, 0.20),
(12, 20, 0.30),
(13, 1, 0.20),
(13, 4, 0.05),
(13, 5, 0.05),
(13, 6, 0.10),
(13, 8, 0.15),
(13, 16, 0.10),
(14, 1, 0.40),
(14, 4, 0.10),
(14, 5, 0.10),
(14, 6, 0.20),
(14, 8, 0.30),
(14, 16, 0.20),
(15, 1, 0.20),
(15, 2, 0.10),
(15, 4, 0.05),
(15, 5, 0.05),
(15, 6, 0.10),
(15, 15, 0.15),
(16, 1, 0.40),
(16, 2, 0.20),
(16, 4, 0.10),
(16, 5, 0.10),
(16, 6, 0.20),
(16, 15, 0.30),
(17, 1, 0.20),
(17, 4, 0.05),
(17, 5, 0.05),
(17, 6, 0.10),
(17, 14, 0.15),
(17, 20, 0.10),
(18, 1, 0.40),
(18, 4, 0.10),
(18, 5, 0.10),
(18, 6, 0.20),
(18, 14, 0.30),
(18, 20, 0.20),
(19, 1, 0.20),
(19, 4, 0.05),
(19, 5, 0.05),
(19, 6, 0.10),
(19, 8, 0.15),
(19, 19, 0.10),
(20, 1, 0.40),
(20, 4, 0.10),
(20, 5, 0.10),
(20, 6, 0.20),
(20, 8, 0.30),
(20, 19, 0.20),
(21, 1, 0.20),
(21, 4, 0.05),
(21, 5, 0.05),
(21, 6, 0.10),
(21, 19, 0.15),
(21, 20, 0.10),
(22, 1, 0.40),
(22, 4, 0.10),
(22, 5, 0.10),
(22, 6, 0.20),
(22, 19, 0.30),
(22, 20, 0.20),
(23, 1, 0.20),
(23, 4, 0.05),
(23, 5, 0.05),
(23, 6, 0.10),
(23, 17, 0.10),
(23, 18, 0.15),
(24, 1, 0.40),
(24, 4, 0.10),
(24, 5, 0.10),
(24, 6, 0.20),
(24, 17, 0.20),
(24, 18, 0.30),
(25, 1, 0.20),
(25, 2, 0.10),
(25, 4, 0.05),
(25, 5, 0.05),
(25, 6, 0.10),
(25, 21, 0.15),
(26, 1, 0.40),
(26, 2, 0.20),
(26, 4, 0.10),
(26, 5, 0.10),
(26, 6, 0.20),
(26, 21, 0.30),
(27, 1, 0.20),
(27, 3, 0.10),
(27, 4, 0.05),
(27, 5, 0.05),
(27, 6, 0.10),
(27, 9, 0.10),
(27, 10, 0.05),
(27, 11, 0.05),
(28, 1, 0.40),
(28, 3, 0.20),
(28, 4, 0.10),
(28, 5, 0.10),
(28, 6, 0.20),
(28, 9, 0.20),
(28, 10, 0.10),
(28, 11, 0.10),
(29, 1, 0.20),
(29, 4, 0.05),
(29, 5, 0.05),
(29, 6, 0.10),
(29, 10, 0.10),
(29, 11, 0.05),
(29, 12, 0.15),
(30, 1, 0.40),
(30, 4, 0.10),
(30, 5, 0.10),
(30, 6, 0.20),
(30, 10, 0.20),
(30, 11, 0.10),
(30, 12, 0.30),
(31, 1, 0.20),
(31, 3, 0.10),
(31, 4, 0.05),
(31, 6, 0.10),
(31, 10, 0.05),
(31, 11, 0.05),
(31, 13, 0.10),
(31, 14, 0.10),
(31, 20, 0.05),
(31, 21, 0.10),
(32, 1, 0.40),
(32, 3, 0.20),
(32, 4, 0.10),
(32, 6, 0.20),
(32, 10, 0.10),
(32, 11, 0.10),
(32, 13, 0.20),
(32, 14, 0.20),
(32, 20, 0.10),
(32, 21, 0.20),
(33, 1, 0.20),
(33, 4, 0.05),
(33, 5, 0.05),
(33, 6, 0.10),
(33, 11, 0.10),
(33, 21, 0.15),
(34, 1, 0.40),
(34, 4, 0.10),
(34, 5, 0.10),
(34, 6, 0.20),
(34, 11, 0.20),
(34, 21, 0.30),
(35, 1, 0.20),
(35, 4, 0.05),
(35, 5, 0.05),
(35, 6, 0.10),
(35, 11, 0.10),
(35, 13, 0.15),
(36, 1, 0.40),
(36, 4, 0.10),
(36, 5, 0.10),
(36, 6, 0.20),
(36, 11, 0.20),
(36, 13, 0.30),
(37, 1, 0.20),
(37, 4, 0.05),
(37, 5, 0.05),
(37, 6, 0.10),
(37, 11, 0.05),
(37, 13, 0.10),
(37, 21, 0.10),
(38, 1, 0.40),
(38, 4, 0.10),
(38, 5, 0.10),
(38, 6, 0.20),
(38, 11, 0.10),
(38, 13, 0.20),
(38, 21, 0.20),
(39, 1, 0.20),
(39, 3, 0.10),
(39, 4, 0.05),
(39, 6, 0.10),
(39, 11, 0.05),
(39, 15, 0.10),
(39, 18, 0.10),
(39, 20, 0.05),
(40, 1, 0.40),
(40, 3, 0.20),
(40, 4, 0.10),
(40, 6, 0.20),
(40, 11, 0.10),
(40, 15, 0.20),
(40, 18, 0.20),
(40, 20, 0.10),
(41, 1, 0.20),
(41, 4, 0.05),
(41, 6, 0.10),
(41, 9, 0.05),
(41, 11, 0.05),
(41, 13, 0.10),
(41, 20, 0.10),
(42, 1, 0.40),
(42, 4, 0.10),
(42, 6, 0.20),
(42, 9, 0.10),
(42, 11, 0.10),
(42, 13, 0.20),
(42, 20, 0.20),
(43, 1, 0.20),
(43, 4, 0.05),
(43, 5, 0.05),
(43, 6, 0.10),
(43, 7, 0.05),
(43, 13, 0.05),
(43, 14, 0.05),
(43, 21, 0.05),
(44, 1, 0.40),
(44, 4, 0.10),
(44, 5, 0.10),
(44, 6, 0.20),
(44, 7, 0.10),
(44, 13, 0.10),
(44, 14, 0.10),
(44, 21, 0.10),
(45, 1, 0.20),
(45, 3, 0.10),
(45, 4, 0.05),
(45, 6, 0.10),
(45, 10, 0.05),
(45, 13, 0.10),
(45, 14, 0.05),
(45, 19, 0.05),
(45, 20, 0.05),
(46, 1, 0.40),
(46, 3, 0.20),
(46, 4, 0.10),
(46, 6, 0.20),
(46, 10, 0.10),
(46, 13, 0.20),
(46, 14, 0.10),
(46, 19, 0.10),
(46, 20, 0.10),
(47, 1, 0.20),
(47, 4, 0.05),
(47, 5, 0.05),
(47, 6, 0.10),
(47, 11, 0.05),
(47, 15, 0.10),
(47, 21, 0.15),
(48, 1, 0.40),
(48, 4, 0.10),
(48, 5, 0.10),
(48, 6, 0.20),
(48, 11, 0.10),
(48, 15, 0.20),
(48, 21, 0.30),
(49, 1, 0.20),
(49, 2, 0.20),
(50, 1, 0.20),
(50, 3, 0.20),
(50, 21, 0.15),
(51, 1, 0.20),
(51, 3, 0.20),
(51, 15, 0.10),
(51, 20, 0.10),
(52, 1, 0.20),
(52, 3, 0.10),
(52, 13, 0.15),
(52, 21, 0.10),
(53, 1, 0.20),
(53, 3, 0.10),
(53, 15, 0.10),
(53, 16, 0.10),
(53, 21, 0.10),
(54, 1, 0.20),
(54, 3, 0.20),
(54, 21, 0.15),
(55, 1, 0.20),
(55, 3, 0.20),
(55, 21, 0.15),
(56, 1, 0.20),
(56, 3, 0.20),
(56, 9, 0.10),
(56, 18, 0.10),
(57, 1, 0.20),
(57, 2, 0.10),
(57, 3, 0.10),
(57, 12, 0.20),
(58, 1, 0.20),
(58, 3, 0.20),
(58, 21, 0.10),
(59, 1, 0.20),
(59, 3, 0.20),
(59, 21, 0.10),
(60, 1, 0.20),
(60, 3, 0.20),
(60, 21, 0.10),
(60, 22, 0.20),
(61, 1, 0.20),
(61, 12, 0.10),
(61, 22, 0.20),
(62, 1, 0.20),
(62, 9, 0.10),
(62, 22, 0.20),
(63, 1, 0.20),
(63, 18, 0.10),
(63, 20, 0.10),
(63, 22, 0.20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes_pizza_familiar`
--

CREATE TABLE `ingredientes_pizza_familiar` (
  `id_pizza_familiar` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  `cantidad_necesaria` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago`
--

CREATE TABLE `metodos_pago` (
  `id_metodo_pago` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `id_pago` bigint(20) NOT NULL,
  `id_pedido` int(11) DEFAULT NULL,
  `id_metodo_pago` int(11) DEFAULT NULL,
  `monto` double DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pastas`
--

CREATE TABLE `pastas` (
  `id_pasta` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_cliente` int(11) DEFAULT NULL,
  `fecha` datetime DEFAULT current_timestamp(),
  `total` double DEFAULT NULL,
  `id_documento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizzas`
--

CREATE TABLE `pizzas` (
  `id_pizza` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` bigint(20) DEFAULT NULL,
  `disponible` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pizzas`
--

INSERT INTO `pizzas` (`id_pizza`, `nombre`, `descripcion`, `precio`, `disponible`) VALUES
(1, 'Hawaiana (Mediana)', 'Queso mozzarella, jamón, piña, aceituna, pimiento y salsa pizzera', 17, '1'),
(2, 'Hawaiana (Familiar)', 'Queso mozzarella, jamón, piña, aceituna, pimiento y salsa pizzera', 33, '1'),
(3, 'Pepperoni (Mediana)', 'Queso mozzarella, pepperoni, aceituna, pimiento y salsa pizzera', 17, '1'),
(4, 'Pepperoni (Familiar)', 'Queso mozzarella, pepperoni, aceituna, pimiento y salsa pizzera', 32, '1'),
(5, 'Pepperoni 2 (Mediana)', 'Queso mozzarella, pepperoni, piña, aceituna, pimiento y salsa pizzera', 18, '1'),
(6, 'Pepperoni 2 (Familiar)', 'Queso mozzarella, pepperoni, piña, aceituna, pimiento y salsa pizzera', 35, '1'),
(7, 'Suprema (Mediana)', 'Queso mozzarella, jamón, pollo, carne de res, tocino ahumado, chorizo, aceituna, pimiento y salsa pizzera', 20, '1'),
(8, 'Suprema (Familiar)', 'Queso mozzarella, jamón, pollo, carne de res, tocino ahumado, chorizo, aceituna, pimiento y salsa pizzera', 39, '1'),
(9, 'Portuguesa (Mediana)', 'Queso mozzarella, jamón, chorizo, tocino, hot dog, salame, aceituna, pimiento y salsa pizzera (todo picadito)', 20, '1'),
(10, 'Portuguesa (Familiar)', 'Queso mozzarella, jamón, chorizo, tocino, hot dog, salame, aceituna, pimiento y salsa pizzera (todo picadito)', 39, '1'),
(11, 'Alemana (Mediana)', 'Queso mozzarella, salchicha Frankfurt, hot dog de ternera, pimiento, aceituna y salsa pizzera', 16, '1'),
(12, 'Alemana (Familiar)', 'Queso mozzarella, salchicha Frankfurt, hot dog de ternera, pimiento, aceituna y salsa pizzera', 31, '1'),
(13, 'Donna Pizza (Mediana)', 'Queso mozzarella, pechuga de pollo deshilachada, cebolla blanca, aceituna, pimiento y salsa pizzera', 18, '1'),
(14, 'Donna Pizza (Familiar)', 'Queso mozzarella, pechuga de pollo deshilachada, cebolla blanca, aceituna, pimiento y salsa pizzera', 34, '1'),
(15, 'Tropical (Mediana)', 'Queso mozzarella, jamón, piña, durazno, aceituna, pimiento y salsa pizzera', 16, '1'),
(16, 'Tropical (Familiar)', 'Queso mozzarella, jamón, piña, durazno, aceituna, pimiento y salsa pizzera', 31, '1'),
(17, 'Italiana (Mediana)', 'Queso mozzarella, salame, pimiento, aceituna y salsa pizzera', 16, '1'),
(18, 'Italiana (Familiar)', 'Queso mozzarella, salame, pimiento, aceituna y salsa pizzera', 32, '1'),
(19, 'Napolitana (Mediana)', 'Queso mozzarella, rodajas de tomate, orégano, aceituna, pimiento y salsa pizzera', 14, '1'),
(20, 'Napolitana (Familiar)', 'Queso mozzarella, rodajas de tomate, orégano, aceituna, pimiento y salsa pizzera', 26, '1'),
(21, 'Parrillera (Mediana)', 'Queso mozzarella, chorizo parrillero, cebolla blanca, aceituna, pimiento y salsa pizzera', 22, '1'),
(22, 'Parrillera (Familiar)', 'Queso mozzarella, chorizo parrillero, cebolla blanca, aceituna, pimiento y salsa pizzera', 40, '1'),
(23, 'Limeña (Mediana)', 'Queso mozzarella, jamón inglés, salchicha hot dog, chorizo español, carne de res molida, cebolla blanca, aceituna y pimiento', 21, '1'),
(24, 'Limeña (Familiar)', 'Queso mozzarella, jamón inglés, salchicha hot dog, chorizo español, carne de res molida, cebolla blanca, aceituna y pimiento', 40, '1'),
(25, 'Continental (Mediana)', 'Queso mozzarella, jamón, champiñones, cebolla, aceituna, pimiento y salsa pizzera', 17, '1'),
(26, 'Continental (Familiar)', 'Queso mozzarella, jamón, champiñones, cebolla, aceituna, pimiento y salsa pizzera', 31, '1'),
(27, 'Vegetariana (Mediana)', 'Queso mozzarella, rodajas de tomate, champiñones, cebolla a la pluma, pimiento, aceituna y salsa pizzera', 16, '1'),
(28, 'Vegetariana (Familiar)', 'Queso mozzarella, rodajas de tomate, champiñones, cebolla a la pluma, pimiento, aceituna y salsa pizzera', 30, '1'),
(29, 'Gaucha (Mediana)', 'Queso mozzarella, carne de res, cebolla blanca, aceituna, pimiento y salsa pizzera', 16, '1'),
(30, 'Gaucha (Familiar)', 'Queso mozzarella, carne de res, cebolla blanca, aceituna, pimiento y salsa pizzera', 30, '1'),
(31, 'Fogosita (Mediana)', 'Queso mozzarella, jamón inglés, salame, champiñones, chorizo español, tocino ahumado, aceituna, cebolla blanca, pimiento y salsa pizzera', 20, '1'),
(32, 'Fogosita (Familiar)', 'Queso mozzarella, jamón inglés, salame, champiñones, chorizo español, tocino ahumado, aceituna, cebolla blanca, pimiento y salsa pizzera', 39, '1'),
(33, 'Americana (Mediana)', 'Queso mozzarella, jamón inglés, aceituna, pimiento y salsa pizzera', 15, '1'),
(34, 'Americana (Familiar)', 'Queso mozzarella, jamón inglés, aceituna, pimiento y salsa pizzera', 29, '1'),
(35, 'Española 1 (Mediana)', 'Queso mozzarella, chorizo español, aceituna, pimiento y salsa pizzera', 16, '1'),
(36, 'Española 1 (Familiar)', 'Queso mozzarella, chorizo español, aceituna, pimiento y salsa pizzera', 30, '1'),
(37, 'Española 2 (Mediana)', 'Queso mozzarella, jamón, chorizo español, aceituna, pimiento y salsa pizzera', 16, '1'),
(38, 'Española 2 (Familiar)', 'Queso mozzarella, jamón, chorizo español, aceituna, pimiento y salsa pizzera', 30, '1'),
(39, 'Oriental (Mediana)', 'Queso mozzarella, pollo al mení, piña, champiñones, tocino ahumado, pimiento, aceituna y salsa pizzera', 18, '1'),
(40, 'Oriental (Familiar)', 'Queso mozzarella, pollo al mení, piña, champiñones, tocino ahumado, pimiento, aceituna y salsa pizzera', 35, '1'),
(41, 'Irlandesa (Mediana)', 'Queso mozzarella, chorizo ahumado, tocino ahumado, cebolla, aceituna, pimiento y salsa pizzera', 18, '1'),
(42, 'Irlandesa (Familiar)', 'Queso mozzarella, chorizo ahumado, tocino ahumado, cebolla, aceituna, pimiento y salsa pizzera', 33, '1'),
(43, '4 en 1 (Mediana)', 'Americana + Hawaiana + Pepperoni + Española', 18, '1'),
(44, '4 en 1 (Familiar)', 'Americana + Hawaiana + Pepperoni + Española', 35, '1'),
(45, 'Mexicana (Mediana)', 'Queso mozzarella, chorizo español, champiñones, tocino ahumado, cabanossi, cebolla blanca, aceituna, pimiento y salsa pizzera', 18, '1'),
(46, 'Mexicana (Familiar)', 'Queso mozzarella, chorizo español, champiñones, tocino ahumado, cabanossi, cebolla blanca, aceituna, pimiento y salsa pizzera', 35, '1'),
(47, 'Llanera (Mediana)', 'Maíz dulce, jamón inglés, queso mozzarella, aceituna, pimiento y salsa pizzera', 16, '1'),
(48, 'Llanera (Familiar)', 'Maíz dulce, jamón inglés, queso mozzarella, aceituna, pimiento y salsa pizzera', 32, '1'),
(49, 'Lasagna de Carne y Queso', 'Lasagna de salsa roja con carne y queso mozzarella', 14, '1'),
(50, 'Lasagna de Jamón y Queso en Salsa Pomodoro', 'Lasagna en salsa pomodoro, jamón inglés y queso mozzarella', 14, '1'),
(51, 'Lasagna Toscana', 'Lasagna de Alfredo, champiñones, tocino ahumado y queso mozzarella', 17, '1'),
(52, 'Lasagna 3 Sabores', 'Salsa bolognesa, salsa blanca a lo Alfredo, jamón y queso mozzarella', 16, '1'),
(53, 'Lasagna Florentina', 'Salsa pomodoro, piña, durazno, champiñones, jamón y queso mozzarella', 16, '1'),
(54, 'Canelones de Jamón y Queso en Salsa Pomodoro', 'Salsa pomodoro, jamón inglés y queso mozzarella', 15, '1'),
(55, 'Canelones de Jamón y Queso en Salsa a lo Alfredo', 'Salsa a lo Alfredo, jamón inglés y queso mozzarella', 16, '1'),
(56, 'Canelones de Pollo, Champiñones y Queso en Salsa a lo Alfredo', 'Salsa a lo Alfredo, jamón inglés, queso mozzarella y champiñones', 17, '1'),
(57, 'Ravioles de Carne a la Bolognesa', 'Salsa bolognesa con queso mozzarella y carne molida', 14, '1'),
(58, 'Ravioles de Jamón y Queso a lo Alfredo', 'Salsa a lo Alfredo con jamón y queso mozzarella', 14, '1'),
(59, 'Macarrones', 'Salsa pomodoro con jamón inglés y queso mozzarella', 14, '1'),
(60, 'Fettuccini a lo Alfredo', 'Fettuccini en salsa a lo Alfredo con jamón inglés y queso mozzarella', 15, '1'),
(61, 'Fettuccini a la Bolognesa', 'Fettuccini en salsa bolognesa con queso mozzarella', 15, '1'),
(62, 'Fettuccini en Salsa Blanca con Champiñones', 'Fettuccini en salsa blanca con champiñones y queso mozzarella', 15, '1'),
(63, 'Fettuccini a la Reina', 'Fettuccini en salsa a lo Alfredo, pollo deshilachado, tocino ahumado y queso mozzarella', 17, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizzas_familiares`
--

CREATE TABLE `pizzas_familiares` (
  `id_pizza_familiar` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `disponible` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones`
--

CREATE TABLE `promociones` (
  `id_promocion` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `descuento` double DEFAULT NULL,
  `requisitos` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `promociones_usuarios`
--

CREATE TABLE `promociones_usuarios` (
  `id_promocion_usuario` bigint(20) NOT NULL,
  `id_usuario` int(11) DEFAULT NULL,
  `id_promocion` int(11) DEFAULT NULL,
  `fecha_aplicacion` datetime DEFAULT current_timestamp(),
  `estado` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `role`
--

CREATE TABLE `role` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `role`
--

INSERT INTO `role` (`id`, `name`) VALUES
(1, 'USER'),
(2, 'USER'),
(3, 'USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sugerencias`
--

CREATE TABLE `sugerencias` (
  `cod_suge` bigint(20) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_roles`
--

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user_roles`
--

INSERT INTO `user_roles` (`user_id`, `role_id`) VALUES
(1, 1),
(3, 2),
(4, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `contraseña` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `contraseña`) VALUES
(1, 'Julian', 'Camacho Calle', 'julian@gmail.com', '946515230', 'Enrique Milla', '$2a$10$5bj5ImBQybIf8Cl/KX6JWuSi82CDTMQAIbTl2D1mRY9vsnzpH9JRW'),
(3, 'Julian Fernando', 'Camacho Calle', 'julian1@gmail.com', '946515230', 'Enrique Milla', '$2a$10$TTlvL6LK5wBIleDKKMA3p.N45PKSZ5Z0t6GXi7k8Dnnq2wRfjCbUS'),
(4, 'Julian', 'Camacho Calle', 'julian123@gmail.com', '946515230', 'Enrique Milla', '$2a$10$uc0T.HQ69JJtqW/xy6f6S.xBOJp99bkjqRHmtf419uqKyBetOwOW6');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id_cliente`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indices de la tabla `contactos`
--
ALTER TABLE `contactos`
  ADD PRIMARY KEY (`id_contactos`);

--
-- Indices de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_pasta` (`id_pasta`),
  ADD KEY `id_pizza_familiar` (`id_pizza_familiar`),
  ADD KEY `id_entrada` (`id_entrada`),
  ADD KEY `detalles_pedido_ibfk_2` (`id_pizza`);

--
-- Indices de la tabla `documentos`
--
ALTER TABLE `documentos`
  ADD PRIMARY KEY (`id_documento`);

--
-- Indices de la tabla `entradas`
--
ALTER TABLE `entradas`
  ADD PRIMARY KEY (`id_entrada`);

--
-- Indices de la tabla `forgot_password`
--
ALTER TABLE `forgot_password`
  ADD PRIMARY KEY (`fp_id`),
  ADD UNIQUE KEY `UKbk0sh5g0ja0dbfeucy0t6vy00` (`user_id_usuario`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id_ingrediente`);

--
-- Indices de la tabla `ingredientes_entrada`
--
ALTER TABLE `ingredientes_entrada`
  ADD PRIMARY KEY (`id_entrada`,`id_ingrediente`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indices de la tabla `ingredientes_pasta`
--
ALTER TABLE `ingredientes_pasta`
  ADD PRIMARY KEY (`id_pasta`,`id_ingrediente`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indices de la tabla `ingredientes_pizza`
--
ALTER TABLE `ingredientes_pizza`
  ADD PRIMARY KEY (`id_pizza`,`id_ingrediente`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indices de la tabla `ingredientes_pizza_familiar`
--
ALTER TABLE `ingredientes_pizza_familiar`
  ADD PRIMARY KEY (`id_pizza_familiar`,`id_ingrediente`),
  ADD KEY `id_ingrediente` (`id_ingrediente`);

--
-- Indices de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  ADD PRIMARY KEY (`id_metodo_pago`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pago`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_metodo_pago` (`id_metodo_pago`);

--
-- Indices de la tabla `pastas`
--
ALTER TABLE `pastas`
  ADD PRIMARY KEY (`id_pasta`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`id_pizza`);

--
-- Indices de la tabla `pizzas_familiares`
--
ALTER TABLE `pizzas_familiares`
  ADD PRIMARY KEY (`id_pizza_familiar`);

--
-- Indices de la tabla `promociones`
--
ALTER TABLE `promociones`
  ADD PRIMARY KEY (`id_promocion`);

--
-- Indices de la tabla `promociones_usuarios`
--
ALTER TABLE `promociones_usuarios`
  ADD PRIMARY KEY (`id_promocion_usuario`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_promocion` (`id_promocion`);

--
-- Indices de la tabla `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  ADD PRIMARY KEY (`cod_suge`);

--
-- Indices de la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD KEY `FKrhfovtciq1l558cw6udg0h0d3` (`role_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id_cliente` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `contactos`
--
ALTER TABLE `contactos`
  MODIFY `id_contactos` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  MODIFY `id_detalle` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `documentos`
--
ALTER TABLE `documentos`
  MODIFY `id_documento` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradas`
--
ALTER TABLE `entradas`
  MODIFY `id_entrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forgot_password`
--
ALTER TABLE `forgot_password`
  MODIFY `fp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `metodos_pago`
--
ALTER TABLE `metodos_pago`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pago` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pastas`
--
ALTER TABLE `pastas`
  MODIFY `id_pasta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `id_pizza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT de la tabla `pizzas_familiares`
--
ALTER TABLE `pizzas_familiares`
  MODIFY `id_pizza_familiar` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promociones`
--
ALTER TABLE `promociones`
  MODIFY `id_promocion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `promociones_usuarios`
--
ALTER TABLE `promociones_usuarios`
  MODIFY `id_promocion_usuario` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `role`
--
ALTER TABLE `role`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `sugerencias`
--
ALTER TABLE `sugerencias`
  MODIFY `cod_suge` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalles_pedido`
--
ALTER TABLE `detalles_pedido`
  ADD CONSTRAINT `detalles_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `detalles_pedido_ibfk_2` FOREIGN KEY (`id_pizza`) REFERENCES `pizzas` (`id_pizza`),
  ADD CONSTRAINT `detalles_pedido_ibfk_3` FOREIGN KEY (`id_pizza_familiar`) REFERENCES `pizzas_familiares` (`id_pizza_familiar`),
  ADD CONSTRAINT `detalles_pedido_ibfk_4` FOREIGN KEY (`id_pasta`) REFERENCES `pastas` (`id_pasta`),
  ADD CONSTRAINT `detalles_pedido_ibfk_5` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`);

--
-- Filtros para la tabla `ingredientes_entrada`
--
ALTER TABLE `ingredientes_entrada`
  ADD CONSTRAINT `ingredientes_entrada_ibfk_1` FOREIGN KEY (`id_entrada`) REFERENCES `entradas` (`id_entrada`),
  ADD CONSTRAINT `ingredientes_entrada_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`);

--
-- Filtros para la tabla `ingredientes_pasta`
--
ALTER TABLE `ingredientes_pasta`
  ADD CONSTRAINT `ingredientes_pasta_ibfk_1` FOREIGN KEY (`id_pasta`) REFERENCES `pastas` (`id_pasta`),
  ADD CONSTRAINT `ingredientes_pasta_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`);

--
-- Filtros para la tabla `ingredientes_pizza`
--
ALTER TABLE `ingredientes_pizza`
  ADD CONSTRAINT `ingredientes_pizza_ibfk_1` FOREIGN KEY (`id_pizza`) REFERENCES `pizzas` (`id_pizza`),
  ADD CONSTRAINT `ingredientes_pizza_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`);

--
-- Filtros para la tabla `ingredientes_pizza_familiar`
--
ALTER TABLE `ingredientes_pizza_familiar`
  ADD CONSTRAINT `ingredientes_pizza_familiar_ibfk_1` FOREIGN KEY (`id_pizza_familiar`) REFERENCES `pizzas_familiares` (`id_pizza_familiar`),
  ADD CONSTRAINT `ingredientes_pizza_familiar_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id_ingrediente`);

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id_pedido`),
  ADD CONSTRAINT `pagos_ibfk_2` FOREIGN KEY (`id_metodo_pago`) REFERENCES `metodos_pago` (`id_metodo_pago`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  ADD CONSTRAINT `pedidos_ibfk_3` FOREIGN KEY (`id_documento`) REFERENCES `documentos` (`id_documento`);

--
-- Filtros para la tabla `promociones_usuarios`
--
ALTER TABLE `promociones_usuarios`
  ADD CONSTRAINT `promociones_usuarios_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `promociones_usuarios_ibfk_2` FOREIGN KEY (`id_promocion`) REFERENCES `promociones` (`id_promocion`);

--
-- Filtros para la tabla `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `FKrhfovtciq1l558cw6udg0h0d3` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
