--
-- Estructura de tabla para la tabla `brand`
--

CREATE TABLE `brand` (
  `id` bigint(20) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `brand`
--

INSERT INTO `brand` (`id`, `name`) VALUES
(1, 'Scania'),
(2, 'Volvo'),
(3, 'Mercedes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `model`
--

CREATE TABLE `model` (
  `id` bigint(20) NOT NULL,
  `name` varchar(150) NOT NULL,
  `brand_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `model`
--

INSERT INTO `model` (`id`, `name`, `brand_id`) VALUES
(1, 'Modelo 1', 2),
(2, 'Modelo 2', 2),
(3, 'Transport', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `truck`
--

CREATE TABLE `truck` (
  `id` int(11) NOT NULL,
  `name` varchar(300) NOT NULL,
  `domain` varchar(15) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `model_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `truck`
--

INSERT INTO `truck` (`id`, `name`, `domain`, `year`, `model_id`) VALUES
(1, 'Prueba 1', 'aabb33', 2019, 3),
(2, 'Prueba 2', 'bbssee2', 1995, 2);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brand`
--
ALTER TABLE `brand`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `model`
--
ALTER TABLE `model`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brand_model_fk` (`brand_id`);

--
-- Indices de la tabla `truck`
--
ALTER TABLE `truck`
  ADD PRIMARY KEY (`id`),
  ADD KEY `model_truck_fk` (`model_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brand`
--
ALTER TABLE `brand`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `model`
--
ALTER TABLE `model`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `truck`
--
ALTER TABLE `truck`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `model`
--
ALTER TABLE `model`
  ADD CONSTRAINT `brand_model_fk` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`);

--
-- Filtros para la tabla `truck`
--
ALTER TABLE `truck`
  ADD CONSTRAINT `model_truck_fk` FOREIGN KEY (`model_id`) REFERENCES `model` (`id`);
COMMIT;

ALTER TABLE `person` ADD `email` VARCHAR(150) NULL AFTER `last_name`, ADD `cuil` VARCHAR(50) NULL AFTER `email`;

CREATE TABLE `client` (
  `id` bigint(20) NOT NULL,
  `name` varchar(300) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
COMMIT;
