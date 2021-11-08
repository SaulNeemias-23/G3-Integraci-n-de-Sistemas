-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2020 a las 16:30:31
-- Versión del servidor: 10.1.40-MariaDB
-- Versión de PHP: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `denimdb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(9, 'Bermuda'),
(8, 'Blusa'),
(5, 'Camisa'),
(7, 'Casaca'),
(4, 'Pantalón'),
(6, 'Polo'),
(10, 'Ropa de bebé');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `media`
--

CREATE TABLE `media` (
  `id` int(11) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `media`
--

INSERT INTO `media` (`id`, `file_name`, `file_type`) VALUES
(2, 'Pantalon Sport Liso.jpg', 'image/jpeg'),
(3, 'Polo American Eagle.jpg', 'image/jpeg'),
(4, 'Camisa Jeanious.jpg', 'image/jpeg'),
(5, 'Bermuda Quiksilver.jpg', 'image/jpeg'),
(6, 'Blusa Manga Corta.jpg', 'image/jpeg'),
(7, 'Casaca Woallance.jpg', 'image/jpeg'),
(8, 'Ropa bebe mujer.jpg', 'image/jpeg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `buy_price` decimal(25,2) DEFAULT NULL,
  `sale_price` decimal(25,2) NOT NULL,
  `categorie_id` int(11) UNSIGNED NOT NULL,
  `media_id` int(11) DEFAULT '0',
  `date` datetime NOT NULL,
  `provider_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`, `media_id`, `date`, `provider_id`) VALUES
(5, 'Camisa de verano', '19', '20.00', '35.00', 5, 4, '2020-02-20 07:47:47', 2),
(6, 'Blusa de verano', '10', '25.00', '55.00', 8, 6, '2020-02-20 04:27:23', 2),
(7, 'Roponcito para bebe niño(a)', '10', '20.00', '33.00', 10, 8, '2020-02-20 04:38:08', 2),
(9, 'pantalones', '14', '50.00', '70.00', 4, 2, '2020-02-22 16:53:38', 4),
(10, 'Polo cuello v', '20', '15.00', '25.00', 6, 3, '2020-02-23 14:24:04', 13);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `providers`
--

CREATE TABLE `providers` (
  `id` int(11) UNSIGNED NOT NULL,
  `nombre` varchar(250) CHARACTER SET utf8 NOT NULL,
  `ruc` varchar(11) CHARACTER SET utf8 NOT NULL,
  `direccion` varchar(250) CHARACTER SET utf8 NOT NULL,
  `tipo` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `providers`
--

INSERT INTO `providers` (`id`, `nombre`, `ruc`, `direccion`, `tipo`) VALUES
(2, 'DISTRIBUIDORA CONTINENTAL 6 SA', '20100067081', 'CAL.LUIS GALVANI NRO. 498', 'SOCIEDAD ANONIMA'),
(3, 'BANCO INTERNACIONAL DEL PERU-INTERBANK', '20100053455', 'AV. CARLOS VILLARAN NRO. 140 URB. SANTA CATALINA LIMA - LIMA - LA VICTORIA', 'SOCIEDAD ANONIMA ABIERTA'),
(4, 'COMPAÑÍA UNIVERSAL TEXTIL S.A.', '20100562848', 'CAR.PANAMERICANA SUR KM. 29.5 INT. C01A Z.I. MEGACENTRO (PUENTE VIDU) LIMA - LIMA - LURIN', 'SOCIEDAD ANONIMA'),
(5, 'TEXTILES CAMONES S.A.', '20293847038', 'AV. SANTA JOSEFINA NRO. 527 (PARADERO LAS VEGAS KM.30) LIMA - LIMA - PUENTE PIEDRA', 'SOCIEDAD ANONIMA'),
(6, 'TEXTIL CABOBLANCO S.A.C.', '20100353254', 'AV. LOS EUCALIPTOS MZA. E LOTE. 2 AS HUERTOS DE ST GENOVEVA (ALT. KM. 40 DE LA ANTIGUA PAN. SUR) LIMA - LIMA - LURIN', 'SOCIEDAD ANONIMA CERRADA'),
(7, 'INDUSTRIAL TEXTIL ACUARIO SA', '20267910813', 'AV. PROLONGACIÃ“N PARINACOCHAS NRO. 1180 URB. SAN GERMAN LIMA - LIMA - LA VICTORIA', 'SOCIEDAD ANONIMA'),
(12, 'ASA TEXTILE SOURCING S.A.', '20381633021', 'AV. ALVAREZ CALDERON NRO. 185 DPTO. 301 RES. SAN ISIDRO LIMA - LIMA - SAN ISIDRO', 'SOCIEDAD ANONIMA'),
(13, 'GOZME FLORES JHOSEP ALVARO', '70609907', '-', 'PERSONA NATURAL SIN NEGOCIO'),
(14, 'DE LA CRUZ ACUÃ‘A WALTER MIGUEL', '10710501055', '-', 'PERSONA NATURAL SIN NEGOCIO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sales`
--

CREATE TABLE `sales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`) VALUES
(2, 5, 1, '35.00', '2020-02-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'Dayanne Cadenillas Rivera', 'admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'usuario1.png', 1, '2020-08-16 23:59:20'),
(6, 'Jenny Castillo Alzamora', 'User', '12dea96fec20593566ab75692c9949596833adc9', 3, 'usuario2.png', 1, '2020-08-16 11:47:22'),
(8, 'Cristian Diaz Alegre', 'User2', 'a1881c06eec96db9901c7bbfe41c42a3f08e9cb4', 3, 'usuario3.jpg', 1, '2020-08-16 12:11:47'),
(9, 'Luis Limber Leandro López', 'User3', '0b7f849446d3383546d15a480966084442cd2193', 1, 'usuario4.jpg', 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Admin', 1, 1),
(2, 'Asistente', 2, 1),
(3, 'Ventas', 3, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `media_id` (`media_id`),
  ADD KEY `provider_id` (`provider_id`);

--
-- Indices de la tabla `providers`
--
ALTER TABLE `providers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ruc` (`ruc`);

--
-- Indices de la tabla `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `user_level` (`user_level`);

--
-- Indices de la tabla `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_level` (`group_level`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `providers`
--
ALTER TABLE `providers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
