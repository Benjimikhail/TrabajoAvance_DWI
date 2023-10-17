-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 17-10-2023 a las 16:04:56
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
-- Base de datos: `proyectosistemaventa`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sprod` ()   SELECT p.Nombre AS Nombre_prod, p.Precio AS precio
from productos p JOIN categorias c on p.CategoriaID=c.CategoriaID
group by p.Nombre, p.Precio$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `CategoriaID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`CategoriaID`, `Nombre`) VALUES
(1, 'Electronica'),
(2, 'Ropa'),
(3, 'Alimentos'),
(4, 'Muebles'),
(5, 'Juguetes'),
(6, 'Belleza'),
(7, 'Deportes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ClienteID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL,
  `Contraseña` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ClienteID`, `Nombre`, `Apellido`, `Email`, `Telefono`, `Contraseña`) VALUES
(1, 'Juan', 'Perez', 'juancito@gmail.com', '123-456-7890', '1234'),
(2, 'Mar a', 'Gonz lez', 'marimar@gmail.com', '987-654-3210', '4567'),
(3, 'Carlos', 'Rodriguez', 'carlos@gmail.com', '555-555-5555', '7890'),
(4, 'Luisa', 'Martínez', 'luisa@gmail.com', '333-333-3333', '2468'),
(5, 'Ana', 'López', 'ana@gmail.com', '111-111-1111', '1357'),
(6, 'Pedro', 'Sánchez', 'pedro@gmail.com', '999-999-9999', '9876'),
(7, 'Lucía', 'Fernández', 'lucia@gmail.com', '777-777-7777', '8023'),
(8, 'Manuel', 'García', 'manuel@gmail.com', '444-444-4444', '5555'),
(9, 'Laura', 'Díaz', 'laura@gmail.com', '666-666-6666', '9090'),
(10, 'Jorge', 'Ramírez', 'jorge@gmail.com', '222-222-2222', '2222');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallespedido`
--

CREATE TABLE `detallespedido` (
  `DetalleID` int(11) NOT NULL,
  `PedidoID` int(11) DEFAULT NULL,
  `ProductoID` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `PrecioUnitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `EmpleadoID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Cargo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `enviosseguimiento`
--

CREATE TABLE `enviosseguimiento` (
  `EnvioID` int(11) NOT NULL,
  `PedidoID` int(11) DEFAULT NULL,
  `FechaEnvio` datetime DEFAULT NULL,
  `EstadoEnvio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodopago`
--

CREATE TABLE `metodopago` (
  `MetodoPagoID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `metodopago`
--

INSERT INTO `metodopago` (`MetodoPagoID`, `Nombre`) VALUES
(1, 'Tarjeta de Cr dito'),
(2, 'YAPE'),
(3, 'Transferencia Bancaria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `PedidoID` int(11) NOT NULL,
  `ClienteID` int(11) DEFAULT NULL,
  `FechaPedido` datetime DEFAULT NULL,
  `MetodoPagoID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `ProductoID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `Precio` decimal(10,2) DEFAULT NULL,
  `CategoriaID` int(11) DEFAULT NULL,
  `ProveedorID` int(11) DEFAULT NULL,
  `imagen` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`ProductoID`, `Nombre`, `Descripcion`, `Precio`, `CategoriaID`, `ProveedorID`, `imagen`) VALUES
(1, 'Xiaomi Redmi Note', 'Celular', 49.99, 1, 1, 'asdasd'),
(2, 'Leche', 'Deslactosada', 29.99, 2, 2, 'asdsa'),
(4, 'Camiseta', 'Algodón', 19.99, 2, 2, 'asda'),
(5, 'Manzanas', 'Rojas', 1.99, 3, 1, 'asdas'),
(6, 'Sofá', 'Cuero', 599.99, 4, 3, 'asdsad'),
(7, 'Laptop HP', 'Portátil', 799.99, 1, 2, 'asdsad'),
(8, 'Cereales', 'Integral', 4.99, 3, 2, 'adsasd'),
(9, 'Zapatos', 'Deportivos', 59.99, 2, 2, 'adssad'),
(10, 'TV Samsung', 'LED 4K', 699.99, 1, 1, 'asdsad'),
(11, 'Toallas', 'Algodón', 9.99, 2, 1, 'asdad'),
(12, 'Perfume', 'Fragancia', 29.99, 6, 3, 'asdad'),
(13, 'Refrigerador', 'Acero inoxidable', 799.99, 1, 4, 'asdad'),
(14, 'Arroz', 'Basmati', 5.99, 3, 1, 'asdad'),
(15, 'Sillas', 'Madera', 39.99, 4, 2, 'asdad'),
(16, 'Impresora HP', 'Láser', 129.99, 1, 1, 'asdad'),
(17, 'Pantalones', 'Vaqueros', 34.99, 2, 2, 'asdad'),
(18, 'Hamburguesas', 'Carne de res', 6.99, 3, 3, 'asdad'),
(19, 'Mesa de comedor', '', 199.99, 4, 1, NULL),
(20, 'Mouse Logitech', 'Inalámbrico', 199.99, 1, 2, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `ProveedorID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Direccion` varchar(200) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`ProveedorID`, `Nombre`, `Direccion`, `Telefono`) VALUES
(1, 'Xiaomi', 'Calle 123, Lima', '555-123-4567'),
(2, 'Laive', 'Avenida XYZ, Lima', '555-987-6543'),
(3, 'Francisco', 'Jiron Apurimac,Lima', '578-586-5522'),
(4, 'Luis', 'Chiclayo, 540', '558-889-5558');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UsuarioID` int(11) NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellido` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefono` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`CategoriaID`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ClienteID`);

--
-- Indices de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD PRIMARY KEY (`DetalleID`),
  ADD KEY `PedidoID` (`PedidoID`),
  ADD KEY `ProductoID` (`ProductoID`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`EmpleadoID`);

--
-- Indices de la tabla `enviosseguimiento`
--
ALTER TABLE `enviosseguimiento`
  ADD PRIMARY KEY (`EnvioID`),
  ADD KEY `PedidoID` (`PedidoID`);

--
-- Indices de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  ADD PRIMARY KEY (`MetodoPagoID`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`PedidoID`),
  ADD KEY `ClienteID` (`ClienteID`),
  ADD KEY `MetodoPagoID` (`MetodoPagoID`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`ProductoID`),
  ADD KEY `CategoriaID` (`CategoriaID`),
  ADD KEY `ProveedorID` (`ProveedorID`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`ProveedorID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuarioID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `CategoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  MODIFY `DetalleID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `EmpleadoID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `enviosseguimiento`
--
ALTER TABLE `enviosseguimiento`
  MODIFY `EnvioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `metodopago`
--
ALTER TABLE `metodopago`
  MODIFY `MetodoPagoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `PedidoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `ProductoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `ProveedorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallespedido`
--
ALTER TABLE `detallespedido`
  ADD CONSTRAINT `detallespedido_ibfk_1` FOREIGN KEY (`PedidoID`) REFERENCES `pedidos` (`PedidoID`),
  ADD CONSTRAINT `detallespedido_ibfk_2` FOREIGN KEY (`ProductoID`) REFERENCES `productos` (`ProductoID`);

--
-- Filtros para la tabla `enviosseguimiento`
--
ALTER TABLE `enviosseguimiento`
  ADD CONSTRAINT `enviosseguimiento_ibfk_1` FOREIGN KEY (`PedidoID`) REFERENCES `pedidos` (`PedidoID`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`),
  ADD CONSTRAINT `pedidos_ibfk_2` FOREIGN KEY (`MetodoPagoID`) REFERENCES `metodopago` (`MetodoPagoID`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`CategoriaID`) REFERENCES `categorias` (`CategoriaID`),
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`ProveedorID`) REFERENCES `proveedores` (`ProveedorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
