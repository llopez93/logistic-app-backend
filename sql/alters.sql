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
  `phone_type` varchar(30) NOT NULL,
  `email` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id`);

---- 04/03/2020  ----

--
-- Estructura de tabla para la tabla `owner`
--

ALTER TABLE `owner` ADD `shovel_cost` DECIMAL(10,2) NULL DEFAULT 0.00;
ALTER TABLE `owner` ADD `trip_cost` DECIMAL(10,2) NULL DEFAULT 0.00;

CREATE TABLE address ( `id` BIGINT NOT NULL AUTO_INCREMENT , `street` VARCHAR(500) NOT NULL , `number` VARCHAR(10) NOT NULL , `city_id` BIGINT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `address` ADD CONSTRAINT `address_city_fk` FOREIGN KEY (`city_id`) REFERENCES `city`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `client` ADD `social_reason` VARCHAR(300) NOT NULL AFTER `name`, ADD `cuil` VARCHAR(30) NOT NULL AFTER `social_reason`;

ALTER TABLE `client` ADD `address_id` BIGINT NOT NULL AFTER `email`;
ALTER TABLE `client` CHANGE `address_id` `address_id` BIGINT(20) NULL;

ALTER TABLE `client` ADD CONSTRAINT `client_address_fk` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


create table material
(
    id   bigint auto_increment
        primary key,
    name varchar(255)             not null,
    unit varchar(50) default 'm3' not null,
    constraint name_unique
        unique (name)
);

--
-- Estructura de tabla para la tabla `trip`
--

CREATE TABLE `trip` (
                        `id` bigint(20) NOT NULL,
                        `client_id` bigint(20) NOT NULL,
                        `truck_id` bigint(20) NOT NULL,
                        `trip_date` datetime NOT NULL,
                        `origin_id` bigint(20) DEFAULT NULL,
                        `origin_name` varchar(300) DEFAULT NULL,
                        `destination` varchar(300) NOT NULL,
                        `material_id` bigint(20) NOT NULL,
                        `load_size` int(11) NOT NULL,
                        `load_cost` tinyint(1) NOT NULL,
                        `fuel` int(11) NOT NULL,
                        `price` bigint(20) NOT NULL,
                        `create_time` datetime NOT NULL,
                        `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `trip`
--
ALTER TABLE `trip`
    ADD PRIMARY KEY (`id`),
    ADD KEY `client_trip_fk` (`client_id`),
    ADD KEY `truck_trip_fk` (`truck_id`),
    ADD KEY `provider_trip_fk` (`origin_id`),
    ADD KEY `material_trip_fk` (`material_id`),
    ADD KEY `user_trip_fk` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `trip`
--
ALTER TABLE `trip`
    MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `trip`
--
ALTER TABLE `trip`
    ADD CONSTRAINT `client_trip_fk` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`),
    ADD CONSTRAINT `material_trip_fk` FOREIGN KEY (`material_id`) REFERENCES `material` (`id`),
    ADD CONSTRAINT `provider_trip_fk` FOREIGN KEY (`origin_id`) REFERENCES `client` (`id`),
    ADD CONSTRAINT `truck_trip_fk` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`id`),
    ADD CONSTRAINT `user_trip_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

ALTER TABLE `client` ADD `acount_state` BIGINT NOT NULL AFTER has_materials;


-- 5/04/2020 --

alter table trip
    add shipment_price int null;
alter table trip
    add shovel_price int null;
