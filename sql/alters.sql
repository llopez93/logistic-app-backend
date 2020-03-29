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

CREATE TABLE `owner` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`first_name` VARCHAR(100) NOT NULL,
	`last_name` VARCHAR(100) NOT NULL,
	`email` VARCHAR(150) NULL DEFAULT NULL,
	`cuil` VARCHAR(50) NULL DEFAULT NULL,
  `shovel_cost` DECIMAL(10,2) NULL DEFAULT 0.00,
  `trip_cost` DECIMAL(10,2) NULL DEFAULT 0.00,
	PRIMARY KEY (`id`),
	UNIQUE INDEX `email` (`email`)
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=11
;

INSERT INTO `owner` (`id`, `first_name`, `last_name`, `email`, `cuil`, `shovel_cost`, `trip_cost`) VALUES (1, 'nombre1', 'apellido1', 'nombre1@apellido1.com', '12312312312', 0.00, 5000);
INSERT INTO `owner` (`id`, `first_name`, `last_name`, `email`, `cuil`, `shovel_cost`, `trip_cost`) VALUES (2, 'perez', 'perez', 'jose@jose.com', '09876543210', 0.00, 4590);
INSERT INTO `owner` (`id`, `first_name`, `last_name`, `email`, `cuil`, `shovel_cost`, `trip_cost`) VALUES (3, 'joselito', 'papo', 'jpapo@gimail.com', '20123456789', 12000, 3240);
INSERT INTO `owner` (`id`, `first_name`, `last_name`, `email`, `cuil`, `shovel_cost`, `trip_cost`) VALUES (4, 'prueba20', 'prueba2', 'prueba2@prueba2', '10210210210', 10000, 4210);


--
-- Estructura de tabla para la tabla `province`
--

CREATE TABLE `province` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `province`
--

INSERT INTO `province` VALUES(1, 'Buenos Aires');
INSERT INTO `province` VALUES(2,  'Buenos Aires-GBA');
INSERT INTO `province` VALUES(3,  'Capital Federal');
INSERT INTO `province` VALUES(4,  'Catamarca');
INSERT INTO `province` VALUES(5,  'Chaco');
INSERT INTO `province` VALUES(6,  'Chubut');
INSERT INTO `province` VALUES(7,  'Córdoba');
INSERT INTO `province` VALUES(8,  'Corrientes');
INSERT INTO `province` VALUES(9,  'Entre Ríos');
INSERT INTO `province` VALUES(10,  'Formosa');
INSERT INTO `province` VALUES(11,  'Jujuy');
INSERT INTO `province` VALUES(12,  'La Pampa');
INSERT INTO `province` VALUES(13,  'La Rioja');
INSERT INTO `province` VALUES(14,  'Mendoza');
INSERT INTO `province` VALUES(15,  'Misiones');
INSERT INTO `province` VALUES(16,  'Neuquén');
INSERT INTO `province` VALUES(17,  'Río Negro');
INSERT INTO `province` VALUES(18,  'Salta');
INSERT INTO `province` VALUES(19,  'San Juan');
INSERT INTO `province` VALUES(20,  'San Luis');
INSERT INTO `province` VALUES(21,  'Santa Cruz');
INSERT INTO `province` VALUES(22,  'Santa Fe');
INSERT INTO `province` VALUES(23,  'Santiago del Estero');
INSERT INTO `province` VALUES(24, 'Tierra del Fuego');
INSERT INTO `province` VALUES(25, 'Tucumán');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `province`
--
ALTER TABLE `province`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `province_name_uindex` (`name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `province`
--
ALTER TABLE `province`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;


--
-- Estructura de tabla para la tabla `city`
--

CREATE TABLE `city` (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `province_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `city`
--

INSERT INTO `city` VALUES(1,  '25 de Mayo', 1);
INSERT INTO `city` VALUES(2,  '3 de febrero', 1);
INSERT INTO `city` VALUES(3, 'A. Alsina', 1);
INSERT INTO `city` VALUES(4,  'A. Gonzáles Cháves', 1);
INSERT INTO `city` VALUES(5,  'Aguas Verdes', 1);
INSERT INTO `city` VALUES(6,  'Alberti', 1);
INSERT INTO `city` VALUES(7,  'Arrecifes', 1);
INSERT INTO `city` VALUES(8,  'Ayacucho', 1);
INSERT INTO `city` VALUES(9,  'Azul', 1);
INSERT INTO `city` VALUES(10,  'Bahía Blanca', 1);
INSERT INTO `city` VALUES(11,  'Balcarce', 1);
INSERT INTO `city` VALUES(12,  'Baradero', 1);
INSERT INTO `city` VALUES(13,  'Benito Juárez', 1);
INSERT INTO `city` VALUES(14,  'Berisso', 1);
INSERT INTO `city` VALUES(15,  'Bolívar', 1);
INSERT INTO `city` VALUES(16,  'Bragado', 1);
INSERT INTO `city` VALUES(17,  'Brandsen', 1);
INSERT INTO `city` VALUES(18,  'Campana', 1);
INSERT INTO `city` VALUES(19,  'Cañuelas', 1);
INSERT INTO `city` VALUES(20,  'Capilla del Señor', 1);
INSERT INTO `city` VALUES(21,  'Capitán Sarmiento', 1);
INSERT INTO `city` VALUES(22,  'Carapachay', 1);
INSERT INTO `city` VALUES(23,  'Carhue', 1);
INSERT INTO `city` VALUES(24,  'Cariló', 1);
INSERT INTO `city` VALUES(25,  'Carlos Casares', 1);
INSERT INTO `city` VALUES(26,  'Carlos Tejedor', 1);
INSERT INTO `city` VALUES(27,  'Carmen de Areco', 1);
INSERT INTO `city` VALUES(28,  'Carmen de Patagones', 1);
INSERT INTO `city` VALUES(29,  'Castelli', 1);
INSERT INTO `city` VALUES(30,  'Chacabuco', 1);
INSERT INTO `city` VALUES(31,  'Chascomús', 1);
INSERT INTO `city` VALUES(32,  'Chivilcoy', 1);
INSERT INTO `city` VALUES(33,  'Colón', 1);
INSERT INTO `city` VALUES(34,  'Coronel Dorrego', 1);
INSERT INTO `city` VALUES(35,  'Coronel Pringles', 1);
INSERT INTO `city` VALUES(36,  'Coronel Rosales', 1);
INSERT INTO `city` VALUES(37,  'Coronel Suarez', 1);
INSERT INTO `city` VALUES(38,  'Costa Azul', 1);
INSERT INTO `city` VALUES(39,  'Costa Chica', 1);
INSERT INTO `city` VALUES(40,  'Costa del Este', 1);
INSERT INTO `city` VALUES(41,  'Costa Esmeralda', 1);
INSERT INTO `city` VALUES(42,  'Daireaux', 1);
INSERT INTO `city` VALUES(43,  'Darregueira', 1);
INSERT INTO `city` VALUES(44,  'Del Viso', 1);
INSERT INTO `city` VALUES(45,  'Dolores', 1);
INSERT INTO `city` VALUES(46,  'Don Torcuato', 1);
INSERT INTO `city` VALUES(47,  'Ensenada', 1);
INSERT INTO `city` VALUES(48,  'Escobar', 1);
INSERT INTO `city` VALUES(49,  'Exaltación de la Cruz', 1);
INSERT INTO `city` VALUES(50,  'Florentino Ameghino', 1);
INSERT INTO `city` VALUES(51,  'Garín', 1);
INSERT INTO `city` VALUES(52,  'Gral. Alvarado', 1);
INSERT INTO `city` VALUES(53,  'Gral. Alvear', 1);
INSERT INTO `city` VALUES(54,  'Gral. Arenales', 1);
INSERT INTO `city` VALUES(55,  'Gral. Belgrano', 1);
INSERT INTO `city` VALUES(56,  'Gral. Guido', 1);
INSERT INTO `city` VALUES(57,  'Gral. Lamadrid', 1);
INSERT INTO `city` VALUES(58,  'Gral. Las Heras', 1);
INSERT INTO `city` VALUES(59,  'Gral. Lavalle', 1);
INSERT INTO `city` VALUES(60,  'Gral. Madariaga', 1);
INSERT INTO `city` VALUES(61,  'Gral. Pacheco', 1);
INSERT INTO `city` VALUES(62,  'Gral. Paz', 1);
INSERT INTO `city` VALUES(63,  'Gral. Pinto', 1);
INSERT INTO `city` VALUES(64,  'Gral. Pueyrredón', 1);
INSERT INTO `city` VALUES(65,  'Gral. Rodríguez', 1);
INSERT INTO `city` VALUES(66,  'Gral. Viamonte', 1);
INSERT INTO `city` VALUES(67,  'Gral. Villegas', 1);
INSERT INTO `city` VALUES(68,  'Guaminí', 1);
INSERT INTO `city` VALUES(69,  'Guernica', 1);
INSERT INTO `city` VALUES(70,  'Hipólito Yrigoyen', 1);
INSERT INTO `city` VALUES(71,  'Ing. Maschwitz', 1);
INSERT INTO `city` VALUES(72,  'Junín', 1);
INSERT INTO `city` VALUES(73,  'La Plata', 1);
INSERT INTO `city` VALUES(74,  'Laprida', 1);
INSERT INTO `city` VALUES(75,  'Las Flores', 1);
INSERT INTO `city` VALUES(76,  'Las Toninas', 1);
INSERT INTO `city` VALUES(77,  'Leandro N. Alem', 1);
INSERT INTO `city` VALUES(78,  'Lincoln', 1);
INSERT INTO `city` VALUES(79,  'Loberia', 1);
INSERT INTO `city` VALUES(80,  'Lobos', 1);
INSERT INTO `city` VALUES(81,  'Los Cardales', 1);
INSERT INTO `city` VALUES(82,  'Los Toldos', 1);
INSERT INTO `city` VALUES(83,  'Lucila del Mar', 1);
INSERT INTO `city` VALUES(84,  'Luján', 1);
INSERT INTO `city` VALUES(85,  'Magdalena', 1);
INSERT INTO `city` VALUES(86,  'Maipú', 1);
INSERT INTO `city` VALUES(87,  'Mar Chiquita', 1);
INSERT INTO `city` VALUES(88,  'Mar de Ajó', 1);
INSERT INTO `city` VALUES(89,  'Mar de las Pampas', 1);
INSERT INTO `city` VALUES(90,  'Mar del Plata', 1);
INSERT INTO `city` VALUES(91,  'Mar del Tuyú', 1);
INSERT INTO `city` VALUES(92,  'Marcos Paz', 1);
INSERT INTO `city` VALUES(93,  'Mercedes', 1);
INSERT INTO `city` VALUES(94,  'Miramar', 1);
INSERT INTO `city` VALUES(95,  'Monte', 1);
INSERT INTO `city` VALUES(96,  'Monte Hermoso', 1);
INSERT INTO `city` VALUES(97,  'Munro', 1);
INSERT INTO `city` VALUES(98,  'Navarro', 1);
INSERT INTO `city` VALUES(99,  'Necochea', 1);
INSERT INTO `city` VALUES(100,  'Olavarría', 1);
INSERT INTO `city` VALUES(101,  'Partido de la Costa', 1);
INSERT INTO `city` VALUES(102,  'Pehuajó', 1);
INSERT INTO `city` VALUES(103,  'Pellegrini', 1);
INSERT INTO `city` VALUES(104,  'Pergamino', 1);
INSERT INTO `city` VALUES(105,  'Pigüé', 1);
INSERT INTO `city` VALUES(106,  'Pila', 1);
INSERT INTO `city` VALUES(107,  'Pilar', 1);
INSERT INTO `city` VALUES(108,  'Pinamar', 1);
INSERT INTO `city` VALUES(109,  'Pinar del Sol', 1);
INSERT INTO `city` VALUES(110,  'Polvorines', 1);
INSERT INTO `city` VALUES(111,  'Pte. Perón', 1);
INSERT INTO `city` VALUES(112,  'Puán', 1);
INSERT INTO `city` VALUES(113,  'Punta Indio', 1);
INSERT INTO `city` VALUES(114,  'Ramallo', 1);
INSERT INTO `city` VALUES(115,  'Rauch', 1);
INSERT INTO `city` VALUES(116,  'Rivadavia', 1);
INSERT INTO `city` VALUES(117,  'Rojas', 1);
INSERT INTO `city` VALUES(118,  'Roque Pérez', 1);
INSERT INTO `city` VALUES(119,  'Saavedra', 1);
INSERT INTO `city` VALUES(120,  'Saladillo', 1);
INSERT INTO `city` VALUES(121,  'Salliqueló', 1);
INSERT INTO `city` VALUES(122,  'Salto', 1);
INSERT INTO `city` VALUES(123,  'San Andrés de Giles', 1);
INSERT INTO `city` VALUES(124,  'San Antonio de Areco', 1);
INSERT INTO `city` VALUES(125,  'San Antonio de Padua', 1);
INSERT INTO `city` VALUES(126,  'San Bernardo', 1);
INSERT INTO `city` VALUES(127,  'San Cayetano', 1);
INSERT INTO `city` VALUES(128,  'San Clemente del Tuyú', 1);
INSERT INTO `city` VALUES(129,  'San Nicolás', 1);
INSERT INTO `city` VALUES(130,  'San Pedro', 1);
INSERT INTO `city` VALUES(131,  'San Vicente', 1);
INSERT INTO `city` VALUES(132,  'Santa Teresita', 1);
INSERT INTO `city` VALUES(133,  'Suipacha', 1);
INSERT INTO `city` VALUES(134,  'Tandil', 1);
INSERT INTO `city` VALUES(135,  'Tapalqué', 1);
INSERT INTO `city` VALUES(136,  'Tordillo', 1);
INSERT INTO `city` VALUES(137,  'Tornquist', 1);
INSERT INTO `city` VALUES(138,  'Trenque Lauquen', 1);
INSERT INTO `city` VALUES(139,  'Tres Lomas', 1);
INSERT INTO `city` VALUES(140,  'Villa Gesell', 1);
INSERT INTO `city` VALUES(141,  'Villarino', 1);
INSERT INTO `city` VALUES(142,  'Zárate', 1);
INSERT INTO `city` VALUES(143,  '11 de Septiembre', 2);
INSERT INTO `city` VALUES(144,  '20 de Junio', 2);
INSERT INTO `city` VALUES(145,  '25 de Mayo', 2);
INSERT INTO `city` VALUES(146,  'Acassuso', 2);
INSERT INTO `city` VALUES(147,  'Adrogué', 2);
INSERT INTO `city` VALUES(148,  'Aldo Bonzi', 2);
INSERT INTO `city` VALUES(149,  'Área Reserva Cinturón Ecológico', 2);
INSERT INTO `city` VALUES(150,  'Avellaneda', 2);
INSERT INTO `city` VALUES(151,  'Banfield', 2);
INSERT INTO `city` VALUES(152,  'Barrio Parque', 2);
INSERT INTO `city` VALUES(153,  'Barrio Santa Teresita', 2);
INSERT INTO `city` VALUES(154,  'Beccar', 2);
INSERT INTO `city` VALUES(155,  'Bella Vista', 2);
INSERT INTO `city` VALUES(156,  'Berazategui', 2);
INSERT INTO `city` VALUES(157,  'Bernal Este', 2);
INSERT INTO `city` VALUES(158,  'Bernal Oeste', 2);
INSERT INTO `city` VALUES(159,  'Billinghurst', 2);
INSERT INTO `city` VALUES(160,  'Boulogne', 2);
INSERT INTO `city` VALUES(161,  'Burzaco', 2);
INSERT INTO `city` VALUES(162,  'Carapachay', 2);
INSERT INTO `city` VALUES(163,  'Caseros', 2);
INSERT INTO `city` VALUES(164,  'Castelar', 2);
INSERT INTO `city` VALUES(165,  'Churruca', 2);
INSERT INTO `city` VALUES(166,  'Ciudad Evita', 2);
INSERT INTO `city` VALUES(167,  'Ciudad Madero', 2);
INSERT INTO `city` VALUES(168,  'Ciudadela', 2);
INSERT INTO `city` VALUES(169,  'Claypole', 2);
INSERT INTO `city` VALUES(170,  'Crucecita', 2);
INSERT INTO `city` VALUES(171,  'Dock Sud', 2);
INSERT INTO `city` VALUES(172,  'Don Bosco', 2);
INSERT INTO `city` VALUES(173,  'Don Orione', 2);
INSERT INTO `city` VALUES(174,  'El Jagüel', 2);
INSERT INTO `city` VALUES(175,  'El Libertador', 2);
INSERT INTO `city` VALUES(176,  'El Palomar', 2);
INSERT INTO `city` VALUES(177,  'El Tala', 2);
INSERT INTO `city` VALUES(178,  'El Trébol', 2);
INSERT INTO `city` VALUES(179,  'Ezeiza', 2);
INSERT INTO `city` VALUES(180,  'Ezpeleta', 2);
INSERT INTO `city` VALUES(181,  'Florencio Varela', 2);
INSERT INTO `city` VALUES(182,  'Florida', 2);
INSERT INTO `city` VALUES(183,  'Francisco Álvarez', 2);
INSERT INTO `city` VALUES(184,  'Gerli', 2);
INSERT INTO `city` VALUES(185,  'Glew', 2);
INSERT INTO `city` VALUES(186,  'González Catán', 2);
INSERT INTO `city` VALUES(187,  'Gral. Lamadrid', 2);
INSERT INTO `city` VALUES(188,  'Grand Bourg', 2);
INSERT INTO `city` VALUES(189,  'Gregorio de Laferrere', 2);
INSERT INTO `city` VALUES(190,  'Guillermo Enrique Hudson', 2);
INSERT INTO `city` VALUES(191,  'Haedo', 2);
INSERT INTO `city` VALUES(192,  'Hurlingham', 2);
INSERT INTO `city` VALUES(193,  'Ing. Sourdeaux', 2);
INSERT INTO `city` VALUES(194,  'Isidro Casanova', 2);
INSERT INTO `city` VALUES(195,  'Ituzaingó', 2);
INSERT INTO `city` VALUES(196,  'José C. Paz', 2);
INSERT INTO `city` VALUES(197,  'José Ingenieros', 2);
INSERT INTO `city` VALUES(198,  'José Marmol', 2);
INSERT INTO `city` VALUES(199,  'La Lucila', 2);
INSERT INTO `city` VALUES(200,  'La Reja', 2);
INSERT INTO `city` VALUES(201,  'La Tablada', 2);
INSERT INTO `city` VALUES(202,  'Lanús', 2);
INSERT INTO `city` VALUES(203,  'Llavallol', 2);
INSERT INTO `city` VALUES(204,  'Loma Hermosa', 2);
INSERT INTO `city` VALUES(205,  'Lomas de Zamora', 2);
INSERT INTO `city` VALUES(206,  'Lomas del Millón', 2);
INSERT INTO `city` VALUES(207,  'Lomas del Mirador', 2);
INSERT INTO `city` VALUES(208,  'Longchamps', 2);
INSERT INTO `city` VALUES(209,  'Los Polvorines', 2);
INSERT INTO `city` VALUES(210,  'Luis Guillón', 2);
INSERT INTO `city` VALUES(211,  'Malvinas Argentinas', 2);
INSERT INTO `city` VALUES(212,  'Martín Coronado', 2);
INSERT INTO `city` VALUES(213,  'Martínez', 2);
INSERT INTO `city` VALUES(214,  'Merlo', 2);
INSERT INTO `city` VALUES(215,  'Ministro Rivadavia', 2);
INSERT INTO `city` VALUES(216,  'Monte Chingolo', 2);
INSERT INTO `city` VALUES(217,  'Monte Grande', 2);
INSERT INTO `city` VALUES(218,  'Moreno', 2);
INSERT INTO `city` VALUES(219,  'Morón', 2);
INSERT INTO `city` VALUES(220,  'Muñiz', 2);
INSERT INTO `city` VALUES(221,  'Olivos', 2);
INSERT INTO `city` VALUES(222,  'Pablo Nogués', 2);
INSERT INTO `city` VALUES(223,  'Pablo Podestá', 2);
INSERT INTO `city` VALUES(224,  'Paso del Rey', 2);
INSERT INTO `city` VALUES(225,  'Pereyra', 2);
INSERT INTO `city` VALUES(226,  'Piñeiro', 2);
INSERT INTO `city` VALUES(227,  'Plátanos', 2);
INSERT INTO `city` VALUES(228,  'Pontevedra', 2);
INSERT INTO `city` VALUES(229,  'Quilmes', 2);
INSERT INTO `city` VALUES(230,  'Rafael Calzada', 2);
INSERT INTO `city` VALUES(231,  'Rafael Castillo', 2);
INSERT INTO `city` VALUES(232,  'Ramos Mejía', 2);
INSERT INTO `city` VALUES(233,  'Ranelagh', 2);
INSERT INTO `city` VALUES(234,  'Remedios de Escalada', 2);
INSERT INTO `city` VALUES(235,  'Sáenz Peña', 2);
INSERT INTO `city` VALUES(236,  'San Antonio de Padua', 2);
INSERT INTO `city` VALUES(237,  'San Fernando', 2);
INSERT INTO `city` VALUES(238,  'San Francisco Solano', 2);
INSERT INTO `city` VALUES(239,  'San Isidro', 2);
INSERT INTO `city` VALUES(240,  'San José', 2);
INSERT INTO `city` VALUES(241,  'San Justo', 2);
INSERT INTO `city` VALUES(242,  'San Martín', 2);
INSERT INTO `city` VALUES(243,  'San Miguel', 2);
INSERT INTO `city` VALUES(244,  'Santos Lugares', 2);
INSERT INTO `city` VALUES(245,  'Sarandí', 2);
INSERT INTO `city` VALUES(246,  'Sourigues', 2);
INSERT INTO `city` VALUES(247,  'Tapiales', 2);
INSERT INTO `city` VALUES(248,  'Temperley', 2);
INSERT INTO `city` VALUES(249,  'Tigre', 2);
INSERT INTO `city` VALUES(250,  'Tortuguitas', 2);
INSERT INTO `city` VALUES(251,  'Tristán Suárez', 2);
INSERT INTO `city` VALUES(252,  'Trujui', 2);
INSERT INTO `city` VALUES(253,  'Turdera', 2);
INSERT INTO `city` VALUES(254,  'Valentín Alsina', 2);
INSERT INTO `city` VALUES(255,  'Vicente López', 2);
INSERT INTO `city` VALUES(256,  'Villa Adelina', 2);
INSERT INTO `city` VALUES(257,  'Villa Ballester', 2);
INSERT INTO `city` VALUES(258,  'Villa Bosch', 2);
INSERT INTO `city` VALUES(259,  'Villa Caraza', 2);
INSERT INTO `city` VALUES(260,  'Villa Celina', 2);
INSERT INTO `city` VALUES(261,  'Villa Centenario', 2);
INSERT INTO `city` VALUES(262,  'Villa de Mayo', 2);
INSERT INTO `city` VALUES(263,  'Villa Diamante', 2);
INSERT INTO `city` VALUES(264,  'Villa Domínico', 2);
INSERT INTO `city` VALUES(265,  'Villa España', 2);
INSERT INTO `city` VALUES(266,  'Villa Fiorito', 2);
INSERT INTO `city` VALUES(267,  'Villa Guillermina', 2);
INSERT INTO `city` VALUES(268,  'Villa Insuperable', 2);
INSERT INTO `city` VALUES(269,  'Villa José León Suárez', 2);
INSERT INTO `city` VALUES(270,  'Villa La Florida', 2);
INSERT INTO `city` VALUES(271,  'Villa Luzuriaga', 2);
INSERT INTO `city` VALUES(272,  'Villa Martelli', 2);
INSERT INTO `city` VALUES(273,  'Villa Obrera', 2);
INSERT INTO `city` VALUES(274,  'Villa Progreso', 2);
INSERT INTO `city` VALUES(275,  'Villa Raffo', 2);
INSERT INTO `city` VALUES(276,  'Villa Sarmiento', 2);
INSERT INTO `city` VALUES(277,  'Villa Tesei', 2);
INSERT INTO `city` VALUES(278,  'Villa Udaondo', 2);
INSERT INTO `city` VALUES(279,  'Virrey del Pino', 2);
INSERT INTO `city` VALUES(280,  'Wilde', 2);
INSERT INTO `city` VALUES(281,  'William Morris', 2);
INSERT INTO `city` VALUES(282,  'Agronomía', 3);
INSERT INTO `city` VALUES(283,  'Almagro', 3);
INSERT INTO `city` VALUES(284,  'Balvanera', 3);
INSERT INTO `city` VALUES(285,  'Barracas', 3);
INSERT INTO `city` VALUES(286,  'Belgrano', 3);
INSERT INTO `city` VALUES(287,  'Boca', 3);
INSERT INTO `city` VALUES(288,  'Boedo', 3);
INSERT INTO `city` VALUES(289,  'Caballito', 3);
INSERT INTO `city` VALUES(290,  'Chacarita', 3);
INSERT INTO `city` VALUES(291,  'Coghlan', 3);
INSERT INTO `city` VALUES(292,  'Colegiales', 3);
INSERT INTO `city` VALUES(293,  'Constitución', 3);
INSERT INTO `city` VALUES(294,  'Flores', 3);
INSERT INTO `city` VALUES(295,  'Floresta', 3);
INSERT INTO `city` VALUES(296,  'La Paternal', 3);
INSERT INTO `city` VALUES(297,  'Liniers', 3);
INSERT INTO `city` VALUES(298,  'Mataderos', 3);
INSERT INTO `city` VALUES(299,  'Monserrat', 3);
INSERT INTO `city` VALUES(300,  'Monte Castro', 3);
INSERT INTO `city` VALUES(301,  'Nueva Pompeya', 3);
INSERT INTO `city` VALUES(302,  'Núñez', 3);
INSERT INTO `city` VALUES(303,  'Palermo', 3);
INSERT INTO `city` VALUES(304,  'Parque Avellaneda', 3);
INSERT INTO `city` VALUES(305,  'Parque Chacabuco', 3);
INSERT INTO `city` VALUES(306,  'Parque Chas', 3);
INSERT INTO `city` VALUES(307,  'Parque Patricios', 3);
INSERT INTO `city` VALUES(308,  'Puerto Madero', 3);
INSERT INTO `city` VALUES(309,  'Recoleta', 3);
INSERT INTO `city` VALUES(310,  'Retiro', 3);
INSERT INTO `city` VALUES(311,  'Saavedra', 3);
INSERT INTO `city` VALUES(312,  'San Cristóbal', 3);
INSERT INTO `city` VALUES(313,  'San Nicolás', 3);
INSERT INTO `city` VALUES(314,  'San Telmo', 3);
INSERT INTO `city` VALUES(315,  'Vélez Sársfield', 3);
INSERT INTO `city` VALUES(316,  'Versalles', 3);
INSERT INTO `city` VALUES(317,  'Villa Crespo', 3);
INSERT INTO `city` VALUES(318,  'Villa del Parque', 3);
INSERT INTO `city` VALUES(319,  'Villa Devoto', 3);
INSERT INTO `city` VALUES(320,  'Villa Gral. Mitre', 3);
INSERT INTO `city` VALUES(321,  'Villa Lugano', 3);
INSERT INTO `city` VALUES(322,  'Villa Luro', 3);
INSERT INTO `city` VALUES(323,  'Villa Ortúzar', 3);
INSERT INTO `city` VALUES(324,  'Villa Pueyrredón', 3);
INSERT INTO `city` VALUES(325,  'Villa Real', 3);
INSERT INTO `city` VALUES(326,  'Villa Riachuelo', 3);
INSERT INTO `city` VALUES(327,  'Villa Santa Rita', 3);
INSERT INTO `city` VALUES(328,  'Villa Soldati', 3);
INSERT INTO `city` VALUES(329,  'Villa Urquiza', 3);
INSERT INTO `city` VALUES(330,  'Aconquija', 4);
INSERT INTO `city` VALUES(331,  'Ancasti', 4);
INSERT INTO `city` VALUES(332,  'Andalgalá', 4);
INSERT INTO `city` VALUES(333,  'Antofagasta', 4);
INSERT INTO `city` VALUES(334,  'Belén', 4);
INSERT INTO `city` VALUES(335,  'Capayán', 4);
INSERT INTO `city` VALUES(336,  'Capital', 4);
INSERT INTO `city` VALUES(337,  '4', 4);
INSERT INTO `city` VALUES(338,  'Corral Quemado', 4);
INSERT INTO `city` VALUES(339,  'El Alto', 4);
INSERT INTO `city` VALUES(340,  'El Rodeo', 4);
INSERT INTO `city` VALUES(341,  'F.Mamerto Esquiú', 4);
INSERT INTO `city` VALUES(342,  'Fiambalá', 4);
INSERT INTO `city` VALUES(343,  'Hualfín', 4);
INSERT INTO `city` VALUES(344,  'Huillapima', 4);
INSERT INTO `city` VALUES(345,  'Icaño', 4);
INSERT INTO `city` VALUES(346,  'La Puerta', 4);
INSERT INTO `city` VALUES(347,  'Las Juntas', 4);
INSERT INTO `city` VALUES(348,  'Londres', 4);
INSERT INTO `city` VALUES(349,  'Los Altos', 4);
INSERT INTO `city` VALUES(350,  'Los Varela', 4);
INSERT INTO `city` VALUES(351,  'Mutquín', 4);
INSERT INTO `city` VALUES(352,  'Paclín', 4);
INSERT INTO `city` VALUES(353,  'Poman', 4);
INSERT INTO `city` VALUES(354,  'Pozo de La Piedra', 4);
INSERT INTO `city` VALUES(355,  'Puerta de Corral', 4);
INSERT INTO `city` VALUES(356,  'Puerta San José', 4);
INSERT INTO `city` VALUES(357,  'Recreo', 4);
INSERT INTO `city` VALUES(358,  'S.F.V de 4', 4);
INSERT INTO `city` VALUES(359,  'San Fernando', 4);
INSERT INTO `city` VALUES(360,  'San Fernando del Valle', 4);
INSERT INTO `city` VALUES(361,  'San José', 4);
INSERT INTO `city` VALUES(362,  'Santa María', 4);
INSERT INTO `city` VALUES(363,  'Santa Rosa', 4);
INSERT INTO `city` VALUES(364,  'Saujil', 4);
INSERT INTO `city` VALUES(365,  'Tapso', 4);
INSERT INTO `city` VALUES(366,  'Tinogasta', 4);
INSERT INTO `city` VALUES(367,  'Valle Viejo', 4);
INSERT INTO `city` VALUES(368,  'Villa Vil', 4);
INSERT INTO `city` VALUES(369,  'Aviá Teraí', 5);
INSERT INTO `city` VALUES(370,  'Barranqueras', 5);
INSERT INTO `city` VALUES(371,  'Basail', 5);
INSERT INTO `city` VALUES(372,  'Campo Largo', 5);
INSERT INTO `city` VALUES(373,  'Capital', 5);
INSERT INTO `city` VALUES(374,  'Capitán Solari', 5);
INSERT INTO `city` VALUES(375,  'Charadai', 5);
INSERT INTO `city` VALUES(376,  'Charata', 5);
INSERT INTO `city` VALUES(377,  'Chorotis', 5);
INSERT INTO `city` VALUES(378,  'Ciervo Petiso', 5);
INSERT INTO `city` VALUES(379,  'Cnel. Du Graty', 5);
INSERT INTO `city` VALUES(380,  'Col. Benítez', 5);
INSERT INTO `city` VALUES(381,  'Col. Elisa', 5);
INSERT INTO `city` VALUES(382,  'Col. Popular', 5);
INSERT INTO `city` VALUES(383,  'Colonias Unidas', 5);
INSERT INTO `city` VALUES(384,  'Concepción', 5);
INSERT INTO `city` VALUES(385,  'Corzuela', 5);
INSERT INTO `city` VALUES(386,  'Cote Lai', 5);
INSERT INTO `city` VALUES(387,  'El Sauzalito', 5);
INSERT INTO `city` VALUES(388,  'Enrique Urien', 5);
INSERT INTO `city` VALUES(389,  'Fontana', 5);
INSERT INTO `city` VALUES(390,  'Fte. Esperanza', 5);
INSERT INTO `city` VALUES(391,  'Gancedo', 5);
INSERT INTO `city` VALUES(392,  'Gral. Capdevila', 5);
INSERT INTO `city` VALUES(393,  'Gral. Pinero', 5);
INSERT INTO `city` VALUES(394,  'Gral. San Martín', 5);
INSERT INTO `city` VALUES(395,  'Gral. Vedia', 5);
INSERT INTO `city` VALUES(396,  'Hermoso Campo', 5);
INSERT INTO `city` VALUES(397,  'I. del Cerrito', 5);
INSERT INTO `city` VALUES(398,  'J.J. Castelli', 5);
INSERT INTO `city` VALUES(399,  'La Clotilde', 5);
INSERT INTO `city` VALUES(400,  'La Eduvigis', 5);
INSERT INTO `city` VALUES(401,  'La Escondida', 5);
INSERT INTO `city` VALUES(402,  'La Leonesa', 5);
INSERT INTO `city` VALUES(403,  'La Tigra', 5);
INSERT INTO `city` VALUES(404,  'La Verde', 5);
INSERT INTO `city` VALUES(405,  'Laguna Blanca', 5);
INSERT INTO `city` VALUES(406,  'Laguna Limpia', 5);
INSERT INTO `city` VALUES(407,  'Lapachito', 5);
INSERT INTO `city` VALUES(408,  'Las Breñas', 5);
INSERT INTO `city` VALUES(409,  'Las Garcitas', 5);
INSERT INTO `city` VALUES(410,  'Las Palmas', 5);
INSERT INTO `city` VALUES(411,  'Los Frentones', 5);
INSERT INTO `city` VALUES(412,  'Machagai', 5);
INSERT INTO `city` VALUES(413,  'Makallé', 5);
INSERT INTO `city` VALUES(414,  'Margarita Belén', 5);
INSERT INTO `city` VALUES(415,  'Miraflores', 5);
INSERT INTO `city` VALUES(416,  'Misión N. Pompeya', 5);
INSERT INTO `city` VALUES(417,  'Napenay', 5);
INSERT INTO `city` VALUES(418,  'Pampa Almirón', 5);
INSERT INTO `city` VALUES(419,  'Pampa del Indio', 5);
INSERT INTO `city` VALUES(420,  'Pampa del Infierno', 5);
INSERT INTO `city` VALUES(421,  'Pdcia. de La Plaza', 5);
INSERT INTO `city` VALUES(422,  'Pdcia. Roca', 5);
INSERT INTO `city` VALUES(423,  'Pdcia. Roque Sáenz Peña', 5);
INSERT INTO `city` VALUES(424,  'Pto. Bermejo', 5);
INSERT INTO `city` VALUES(425,  'Pto. Eva Perón', 5);
INSERT INTO `city` VALUES(426,  'Puero Tirol', 5);
INSERT INTO `city` VALUES(427,  'Puerto Vilelas', 5);
INSERT INTO `city` VALUES(428,  'Quitilipi', 5);
INSERT INTO `city` VALUES(429,  'Resistencia', 5);
INSERT INTO `city` VALUES(430,  'Sáenz Peña', 5);
INSERT INTO `city` VALUES(431,  'Samuhú', 5);
INSERT INTO `city` VALUES(432,  'San Bernardo', 5);
INSERT INTO `city` VALUES(433,  'Santa Sylvina', 5);
INSERT INTO `city` VALUES(434,  'Taco Pozo', 5);
INSERT INTO `city` VALUES(435,  'Tres Isletas', 5);
INSERT INTO `city` VALUES(436,  'Villa Ángela', 5);
INSERT INTO `city` VALUES(437,  'Villa Berthet', 5);
INSERT INTO `city` VALUES(438,  'Villa R. Bermejito', 5);
INSERT INTO `city` VALUES(439,  'Aldea Apeleg', 6);
INSERT INTO `city` VALUES(440,  'Aldea Beleiro', 6);
INSERT INTO `city` VALUES(441,  'Aldea Epulef', 6);
INSERT INTO `city` VALUES(442,  'Alto Río Sengerr', 6);
INSERT INTO `city` VALUES(443,  'Buen Pasto', 6);
INSERT INTO `city` VALUES(444,  'Camarones', 6);
INSERT INTO `city` VALUES(445,  'Carrenleufú', 6);
INSERT INTO `city` VALUES(446,  'Cholila', 6);
INSERT INTO `city` VALUES(447,  'Co. Centinela', 6);
INSERT INTO `city` VALUES(448,  'Colan Conhué', 6);
INSERT INTO `city` VALUES(449,  'Comodoro Rivadavia', 6);
INSERT INTO `city` VALUES(450,  'Corcovado', 6);
INSERT INTO `city` VALUES(451,  'Cushamen', 6);
INSERT INTO `city` VALUES(452,  'Dique F. Ameghino', 6);
INSERT INTO `city` VALUES(453,  'Dolavón', 6);
INSERT INTO `city` VALUES(454,  'Dr. R. Rojas', 6);
INSERT INTO `city` VALUES(455,  'El Hoyo', 6);
INSERT INTO `city` VALUES(456,  'El Maitén', 6);
INSERT INTO `city` VALUES(457,  'Epuyén', 6);
INSERT INTO `city` VALUES(458,  'Esquel', 6);
INSERT INTO `city` VALUES(459,  'Facundo', 6);
INSERT INTO `city` VALUES(460,  'Gaimán', 6);
INSERT INTO `city` VALUES(461,  'Gan Gan', 6);
INSERT INTO `city` VALUES(462,  'Gastre', 6);
INSERT INTO `city` VALUES(463,  'Gdor. Costa', 6);
INSERT INTO `city` VALUES(464,  'Gualjaina', 6);
INSERT INTO `city` VALUES(465,  'J. de San Martín', 6);
INSERT INTO `city` VALUES(466,  'Lago Blanco', 6);
INSERT INTO `city` VALUES(467,  'Lago Puelo', 6);
INSERT INTO `city` VALUES(468,  'Lagunita Salada', 6);
INSERT INTO `city` VALUES(469,  'Las Plumas', 6);
INSERT INTO `city` VALUES(470,  'Los Altares', 6);
INSERT INTO `city` VALUES(471,  'Paso de los Indios', 6);
INSERT INTO `city` VALUES(472,  'Paso del Sapo', 6);
INSERT INTO `city` VALUES(473,  'Pto. Madryn', 6);
INSERT INTO `city` VALUES(474,  'Pto. Pirámides', 6);
INSERT INTO `city` VALUES(475,  'Rada Tilly', 6);
INSERT INTO `city` VALUES(476,  'Rawson', 6);
INSERT INTO `city` VALUES(477,  'Río Mayo', 6);
INSERT INTO `city` VALUES(478,  'Río Pico', 6);
INSERT INTO `city` VALUES(479,  'Sarmiento', 6);
INSERT INTO `city` VALUES(480,  'Tecka', 6);
INSERT INTO `city` VALUES(481,  'Telsen', 6);
INSERT INTO `city` VALUES(482,  'Trelew', 6);
INSERT INTO `city` VALUES(483,  'Trevelin', 6);
INSERT INTO `city` VALUES(484,  'Veintiocho de Julio', 6);
INSERT INTO `city` VALUES(485,  'Achiras', 7);
INSERT INTO `city` VALUES(486,  'Adelia Maria', 7);
INSERT INTO `city` VALUES(487,  'Agua de Oro', 7);
INSERT INTO `city` VALUES(488,  'Alcira Gigena', 7);
INSERT INTO `city` VALUES(489,  'Aldea Santa Maria', 7);
INSERT INTO `city` VALUES(490,  'Alejandro Roca', 7);
INSERT INTO `city` VALUES(491,  'Alejo Ledesma', 7);
INSERT INTO `city` VALUES(492,  'Alicia', 7);
INSERT INTO `city` VALUES(493,  'Almafuerte', 7);
INSERT INTO `city` VALUES(494,  'Alpa Corral', 7);
INSERT INTO `city` VALUES(495,  'Alta Gracia', 7);
INSERT INTO `city` VALUES(496,  'Alto Alegre', 7);
INSERT INTO `city` VALUES(497,  'Alto de Los Quebrachos', 7);
INSERT INTO `city` VALUES(498,  'Altos de Chipion', 7);
INSERT INTO `city` VALUES(499,  'Amboy', 7);
INSERT INTO `city` VALUES(500,  'Ambul', 7);
INSERT INTO `city` VALUES(501,  'Ana Zumaran', 7);
INSERT INTO `city` VALUES(502,  'Anisacate', 7);
INSERT INTO `city` VALUES(503,  'Arguello', 7);
INSERT INTO `city` VALUES(504,  'Arias', 7);
INSERT INTO `city` VALUES(505,  'Arroyito', 7);
INSERT INTO `city` VALUES(506,  'Arroyo Algodon', 7);
INSERT INTO `city` VALUES(507,  'Arroyo Cabral', 7);
INSERT INTO `city` VALUES(508,  'Arroyo Los Patos', 7);
INSERT INTO `city` VALUES(509,  'Assunta', 7);
INSERT INTO `city` VALUES(510,  'Atahona', 7);
INSERT INTO `city` VALUES(511,  'Ausonia', 7);
INSERT INTO `city` VALUES(512,  'Avellaneda', 7);
INSERT INTO `city` VALUES(513,  'Ballesteros', 7);
INSERT INTO `city` VALUES(514,  'Ballesteros Sud', 7);
INSERT INTO `city` VALUES(515,  'Balnearia', 7);
INSERT INTO `city` VALUES(516,  'Bañado de Soto', 7);
INSERT INTO `city` VALUES(517,  'Bell Ville', 7);
INSERT INTO `city` VALUES(518,  'Bengolea', 7);
INSERT INTO `city` VALUES(519,  'Benjamin Gould', 7);
INSERT INTO `city` VALUES(520,  'Berrotaran', 7);
INSERT INTO `city` VALUES(521,  'Bialet Masse', 7);
INSERT INTO `city` VALUES(522,  'Bouwer', 7);
INSERT INTO `city` VALUES(523,  'Brinkmann', 7);
INSERT INTO `city` VALUES(524,  'Buchardo', 7);
INSERT INTO `city` VALUES(525,  'Bulnes', 7);
INSERT INTO `city` VALUES(526,  'Cabalango', 7);
INSERT INTO `city` VALUES(527,  'Calamuchita', 7);
INSERT INTO `city` VALUES(528,  'Calchin', 7);
INSERT INTO `city` VALUES(529,  'Calchin Oeste', 7);
INSERT INTO `city` VALUES(530,  'Calmayo', 7);
INSERT INTO `city` VALUES(531,  'Camilo Aldao', 7);
INSERT INTO `city` VALUES(532,  'Caminiaga', 7);
INSERT INTO `city` VALUES(533,  'Cañada de Luque', 7);
INSERT INTO `city` VALUES(534,  'Cañada de Machado', 7);
INSERT INTO `city` VALUES(535,  'Cañada de Rio Pinto', 7);
INSERT INTO `city` VALUES(536,  'Cañada del Sauce', 7);
INSERT INTO `city` VALUES(537,  'Canals', 7);
INSERT INTO `city` VALUES(538,  'Candelaria Sud', 7);
INSERT INTO `city` VALUES(539,  'Capilla de Remedios', 7);
INSERT INTO `city` VALUES(540,  'Capilla de Siton', 7);
INSERT INTO `city` VALUES(541,  'Capilla del Carmen', 7);
INSERT INTO `city` VALUES(542,  'Capilla del Monte', 7);
INSERT INTO `city` VALUES(543,  'Capital', 7);
INSERT INTO `city` VALUES(544,  'Capitan Gral B. O´Higgins', 7);
INSERT INTO `city` VALUES(545,  'Carnerillo', 7);
INSERT INTO `city` VALUES(546,  'Carrilobo', 7);
INSERT INTO `city` VALUES(547,  'Casa Grande', 7);
INSERT INTO `city` VALUES(548,  'Cavanagh', 7);
INSERT INTO `city` VALUES(549,  'Cerro Colorado', 7);
INSERT INTO `city` VALUES(550,  'Chaján', 7);
INSERT INTO `city` VALUES(551,  'Chalacea', 7);
INSERT INTO `city` VALUES(552,  'Chañar Viejo', 7);
INSERT INTO `city` VALUES(553,  'Chancaní', 7);
INSERT INTO `city` VALUES(554,  'Charbonier', 7);
INSERT INTO `city` VALUES(555,  'Charras', 7);
INSERT INTO `city` VALUES(556,  'Chazón', 7);
INSERT INTO `city` VALUES(557,  'Chilibroste', 7);
INSERT INTO `city` VALUES(558,  'Chucul', 7);
INSERT INTO `city` VALUES(559,  'Chuña', 7);
INSERT INTO `city` VALUES(560,  'Chuña Huasi', 7);
INSERT INTO `city` VALUES(561,  'Churqui Cañada', 7);
INSERT INTO `city` VALUES(562,  'Cienaga Del Coro', 7);
INSERT INTO `city` VALUES(563,  'Cintra', 7);
INSERT INTO `city` VALUES(564,  'Col. Almada', 7);
INSERT INTO `city` VALUES(565,  'Col. Anita', 7);
INSERT INTO `city` VALUES(566,  'Col. Barge', 7);
INSERT INTO `city` VALUES(567,  'Col. Bismark', 7);
INSERT INTO `city` VALUES(568,  'Col. Bremen', 7);
INSERT INTO `city` VALUES(569,  'Col. Caroya', 7);
INSERT INTO `city` VALUES(570,  'Col. Italiana', 7);
INSERT INTO `city` VALUES(571,  'Col. Iturraspe', 7);
INSERT INTO `city` VALUES(572,  'Col. Las Cuatro Esquinas', 7);
INSERT INTO `city` VALUES(573,  'Col. Las Pichanas', 7);
INSERT INTO `city` VALUES(574,  'Col. Marina', 7);
INSERT INTO `city` VALUES(575,  'Col. Prosperidad', 7);
INSERT INTO `city` VALUES(576,  'Col. San Bartolome', 7);
INSERT INTO `city` VALUES(577,  'Col. San Pedro', 7);
INSERT INTO `city` VALUES(578,  'Col. Tirolesa', 7);
INSERT INTO `city` VALUES(579,  'Col. Vicente Aguero', 7);
INSERT INTO `city` VALUES(580,  'Col. Videla', 7);
INSERT INTO `city` VALUES(581,  'Col. Vignaud', 7);
INSERT INTO `city` VALUES(582,  'Col. Waltelina', 7);
INSERT INTO `city` VALUES(583,  'Colazo', 7);
INSERT INTO `city` VALUES(584,  'Comechingones', 7);
INSERT INTO `city` VALUES(585,  'Conlara', 7);
INSERT INTO `city` VALUES(586,  'Copacabana', 7);
INSERT INTO `city` VALUES(587,  '7', 7);
INSERT INTO `city` VALUES(588,  'Coronel Baigorria', 7);
INSERT INTO `city` VALUES(589,  'Coronel Moldes', 7);
INSERT INTO `city` VALUES(590,  'Corral de Bustos', 7);
INSERT INTO `city` VALUES(591,  'Corralito', 7);
INSERT INTO `city` VALUES(592,  'Cosquín', 7);
INSERT INTO `city` VALUES(593,  'Costa Sacate', 7);
INSERT INTO `city` VALUES(594,  'Cruz Alta', 7);
INSERT INTO `city` VALUES(595,  'Cruz de Caña', 7);
INSERT INTO `city` VALUES(596,  'Cruz del Eje', 7);
INSERT INTO `city` VALUES(597,  'Cuesta Blanca', 7);
INSERT INTO `city` VALUES(598,  'Dean Funes', 7);
INSERT INTO `city` VALUES(599,  'Del Campillo', 7);
INSERT INTO `city` VALUES(600,  'Despeñaderos', 7);
INSERT INTO `city` VALUES(601,  'Devoto', 7);
INSERT INTO `city` VALUES(602,  'Diego de Rojas', 7);
INSERT INTO `city` VALUES(603,  'Dique Chico', 7);
INSERT INTO `city` VALUES(604,  'El Arañado', 7);
INSERT INTO `city` VALUES(605,  'El Brete', 7);
INSERT INTO `city` VALUES(606,  'El Chacho', 7);
INSERT INTO `city` VALUES(607,  'El Crispín', 7);
INSERT INTO `city` VALUES(608,  'El Fortín', 7);
INSERT INTO `city` VALUES(609,  'El Manzano', 7);
INSERT INTO `city` VALUES(610,  'El Rastreador', 7);
INSERT INTO `city` VALUES(611,  'El Rodeo', 7);
INSERT INTO `city` VALUES(612,  'El Tío', 7);
INSERT INTO `city` VALUES(613,  'Elena', 7);
INSERT INTO `city` VALUES(614,  'Embalse', 7);
INSERT INTO `city` VALUES(615,  'Esquina', 7);
INSERT INTO `city` VALUES(616,  'Estación Gral. Paz', 7);
INSERT INTO `city` VALUES(617,  'Estación Juárez Celman', 7);
INSERT INTO `city` VALUES(618,  'Estancia de Guadalupe', 7);
INSERT INTO `city` VALUES(619,  'Estancia Vieja', 7);
INSERT INTO `city` VALUES(620,  'Etruria', 7);
INSERT INTO `city` VALUES(621,  'Eufrasio Loza', 7);
INSERT INTO `city` VALUES(622,  'Falda del Carmen', 7);
INSERT INTO `city` VALUES(623,  'Freyre', 7);
INSERT INTO `city` VALUES(624,  'Gral. Baldissera', 7);
INSERT INTO `city` VALUES(625,  'Gral. Cabrera', 7);
INSERT INTO `city` VALUES(626,  'Gral. Deheza', 7);
INSERT INTO `city` VALUES(627,  'Gral. Fotheringham', 7);
INSERT INTO `city` VALUES(628,  'Gral. Levalle', 7);
INSERT INTO `city` VALUES(629,  'Gral. Roca', 7);
INSERT INTO `city` VALUES(630,  'Guanaco Muerto', 7);
INSERT INTO `city` VALUES(631,  'Guasapampa', 7);
INSERT INTO `city` VALUES(632,  'Guatimozin', 7);
INSERT INTO `city` VALUES(633,  'Gutenberg', 7);
INSERT INTO `city` VALUES(634,  'Hernando', 7);
INSERT INTO `city` VALUES(635,  'Huanchillas', 7);
INSERT INTO `city` VALUES(636,  'Huerta Grande', 7);
INSERT INTO `city` VALUES(637,  'Huinca Renanco', 7);
INSERT INTO `city` VALUES(638,  'Idiazabal', 7);
INSERT INTO `city` VALUES(639,  'Impira', 7);
INSERT INTO `city` VALUES(640,  'Inriville', 7);
INSERT INTO `city` VALUES(641,  'Isla Verde', 7);
INSERT INTO `city` VALUES(642,  'Italó', 7);
INSERT INTO `city` VALUES(643,  'James Craik', 7);
INSERT INTO `city` VALUES(644,  'Jesús María', 7);
INSERT INTO `city` VALUES(645,  'Jovita', 7);
INSERT INTO `city` VALUES(646,  'Justiniano Posse', 7);
INSERT INTO `city` VALUES(647,  'Km 658', 7);
INSERT INTO `city` VALUES(648,  'L. V. Mansilla', 7);
INSERT INTO `city` VALUES(649,  'La Batea', 7);
INSERT INTO `city` VALUES(650,  'La Calera', 7);
INSERT INTO `city` VALUES(651,  'La Carlota', 7);
INSERT INTO `city` VALUES(652,  'La Carolina', 7);
INSERT INTO `city` VALUES(653,  'La Cautiva', 7);
INSERT INTO `city` VALUES(654,  'La Cesira', 7);
INSERT INTO `city` VALUES(655,  'La Cruz', 7);
INSERT INTO `city` VALUES(656,  'La Cumbre', 7);
INSERT INTO `city` VALUES(657,  'La Cumbrecita', 7);
INSERT INTO `city` VALUES(658,  'La Falda', 7);
INSERT INTO `city` VALUES(659,  'La Francia', 7);
INSERT INTO `city` VALUES(660,  'La Granja', 7);
INSERT INTO `city` VALUES(661,  'La Higuera', 7);
INSERT INTO `city` VALUES(662,  'La Laguna', 7);
INSERT INTO `city` VALUES(663,  'La Paisanita', 7);
INSERT INTO `city` VALUES(664,  'La Palestina', 7);
INSERT INTO `city` VALUES(665,  '12', 7);
INSERT INTO `city` VALUES(666,  'La Paquita', 7);
INSERT INTO `city` VALUES(667,  'La Para', 7);
INSERT INTO `city` VALUES(668,  'La Paz', 7);
INSERT INTO `city` VALUES(669,  'La Playa', 7);
INSERT INTO `city` VALUES(670,  'La Playosa', 7);
INSERT INTO `city` VALUES(671,  'La Población', 7);
INSERT INTO `city` VALUES(672,  'La Posta', 7);
INSERT INTO `city` VALUES(673,  'La Puerta', 7);
INSERT INTO `city` VALUES(674,  'La Quinta', 7);
INSERT INTO `city` VALUES(675,  'La Rancherita', 7);
INSERT INTO `city` VALUES(676,  'La Rinconada', 7);
INSERT INTO `city` VALUES(677,  'La Serranita', 7);
INSERT INTO `city` VALUES(678,  'La Tordilla', 7);
INSERT INTO `city` VALUES(679,  'Laborde', 7);
INSERT INTO `city` VALUES(680,  'Laboulaye', 7);
INSERT INTO `city` VALUES(681,  'Laguna Larga', 7);
INSERT INTO `city` VALUES(682,  'Las Acequias', 7);
INSERT INTO `city` VALUES(683,  'Las Albahacas', 7);
INSERT INTO `city` VALUES(684,  'Las Arrias', 7);
INSERT INTO `city` VALUES(685,  'Las Bajadas', 7);
INSERT INTO `city` VALUES(686,  'Las Caleras', 7);
INSERT INTO `city` VALUES(687,  'Las Calles', 7);
INSERT INTO `city` VALUES(688,  'Las Cañadas', 7);
INSERT INTO `city` VALUES(689,  'Las Gramillas', 7);
INSERT INTO `city` VALUES(690,  'Las Higueras', 7);
INSERT INTO `city` VALUES(691,  'Las Isletillas', 7);
INSERT INTO `city` VALUES(692,  'Las Junturas', 7);
INSERT INTO `city` VALUES(693,  'Las Palmas', 7);
INSERT INTO `city` VALUES(694,  'Las Peñas', 7);
INSERT INTO `city` VALUES(695,  'Las Peñas Sud', 7);
INSERT INTO `city` VALUES(696,  'Las Perdices', 7);
INSERT INTO `city` VALUES(697,  'Las Playas', 7);
INSERT INTO `city` VALUES(698,  'Las Rabonas', 7);
INSERT INTO `city` VALUES(699,  'Las Saladas', 7);
INSERT INTO `city` VALUES(700,  'Las Tapias', 7);
INSERT INTO `city` VALUES(701,  'Las Varas', 7);
INSERT INTO `city` VALUES(702,  'Las Varillas', 7);
INSERT INTO `city` VALUES(703,  'Las Vertientes', 7);
INSERT INTO `city` VALUES(704,  'Leguizamón', 7);
INSERT INTO `city` VALUES(705,  'Leones', 7);
INSERT INTO `city` VALUES(706,  'Los Cedros', 7);
INSERT INTO `city` VALUES(707,  'Los Cerrillos', 7);
INSERT INTO `city` VALUES(708,  'Los Chañaritos (C.E)', 7);
INSERT INTO `city` VALUES(709,  'Los Chanaritos (R.S)', 7);
INSERT INTO `city` VALUES(710,  'Los Cisnes', 7);
INSERT INTO `city` VALUES(711,  'Los Cocos', 7);
INSERT INTO `city` VALUES(712,  'Los Cóndores', 7);
INSERT INTO `city` VALUES(713,  'Los Hornillos', 7);
INSERT INTO `city` VALUES(714,  'Los Hoyos', 7);
INSERT INTO `city` VALUES(715,  'Los Mistoles', 7);
INSERT INTO `city` VALUES(716,  'Los Molinos', 7);
INSERT INTO `city` VALUES(717,  'Los Pozos', 7);
INSERT INTO `city` VALUES(718,  'Los Reartes', 7);
INSERT INTO `city` VALUES(719,  'Los Surgentes', 7);
INSERT INTO `city` VALUES(720,  'Los Talares', 7);
INSERT INTO `city` VALUES(721,  'Los Zorros', 7);
INSERT INTO `city` VALUES(722,  'Lozada', 7);
INSERT INTO `city` VALUES(723,  'Luca', 7);
INSERT INTO `city` VALUES(724,  'Luque', 7);
INSERT INTO `city` VALUES(725,  'Luyaba', 7);
INSERT INTO `city` VALUES(726,  'Malagueño', 7);
INSERT INTO `city` VALUES(727,  'Malena', 7);
INSERT INTO `city` VALUES(728,  'Malvinas Argentinas', 7);
INSERT INTO `city` VALUES(729,  'Manfredi', 7);
INSERT INTO `city` VALUES(730,  'Maquinista Gallini', 7);
INSERT INTO `city` VALUES(731,  'Marcos Juárez', 7);
INSERT INTO `city` VALUES(732,  'Marull', 7);
INSERT INTO `city` VALUES(733,  'Matorrales', 7);
INSERT INTO `city` VALUES(734,  'Mattaldi', 7);
INSERT INTO `city` VALUES(735,  'Mayu Sumaj', 7);
INSERT INTO `city` VALUES(736,  'Media Naranja', 7);
INSERT INTO `city` VALUES(737,  'Melo', 7);
INSERT INTO `city` VALUES(738,  'Mendiolaza', 7);
INSERT INTO `city` VALUES(739,  'Mi Granja', 7);
INSERT INTO `city` VALUES(740,  'Mina Clavero', 7);
INSERT INTO `city` VALUES(741,  'Miramar', 7);
INSERT INTO `city` VALUES(742,  'Morrison', 7);
INSERT INTO `city` VALUES(743,  'Morteros', 7);
INSERT INTO `city` VALUES(744,  'Mte. Buey', 7);
INSERT INTO `city` VALUES(745,  'Mte. Cristo', 7);
INSERT INTO `city` VALUES(746,  'Mte. De Los Gauchos', 7);
INSERT INTO `city` VALUES(747,  'Mte. Leña', 7);
INSERT INTO `city` VALUES(748,  'Mte. Maíz', 7);
INSERT INTO `city` VALUES(749,  'Mte. Ralo', 7);
INSERT INTO `city` VALUES(750,  'Nicolás Bruzone', 7);
INSERT INTO `city` VALUES(751,  'Noetinger', 7);
INSERT INTO `city` VALUES(752,  'Nono', 7);
INSERT INTO `city` VALUES(753,  'Nueva 7', 7);
INSERT INTO `city` VALUES(754,  'Obispo Trejo', 7);
INSERT INTO `city` VALUES(755,  'Olaeta', 7);
INSERT INTO `city` VALUES(756,  'Oliva', 7);
INSERT INTO `city` VALUES(757,  'Olivares San Nicolás', 7);
INSERT INTO `city` VALUES(758,  'Onagolty', 7);
INSERT INTO `city` VALUES(759,  'Oncativo', 7);
INSERT INTO `city` VALUES(760,  'Ordoñez', 7);
INSERT INTO `city` VALUES(761,  'Pacheco De Melo', 7);
INSERT INTO `city` VALUES(762,  'Pampayasta N.', 7);
INSERT INTO `city` VALUES(763,  'Pampayasta S.', 7);
INSERT INTO `city` VALUES(764,  'Panaholma', 7);
INSERT INTO `city` VALUES(765,  'Pascanas', 7);
INSERT INTO `city` VALUES(766,  'Pasco', 7);
INSERT INTO `city` VALUES(767,  'Paso del Durazno', 7);
INSERT INTO `city` VALUES(768,  'Paso Viejo', 7);
INSERT INTO `city` VALUES(769,  'Pilar', 7);
INSERT INTO `city` VALUES(770,  'Pincén', 7);
INSERT INTO `city` VALUES(771,  'Piquillín', 7);
INSERT INTO `city` VALUES(772,  'Plaza de Mercedes', 7);
INSERT INTO `city` VALUES(773,  'Plaza Luxardo', 7);
INSERT INTO `city` VALUES(774,  'Porteña', 7);
INSERT INTO `city` VALUES(775,  'Potrero de Garay', 7);
INSERT INTO `city` VALUES(776,  'Pozo del Molle', 7);
INSERT INTO `city` VALUES(777,  'Pozo Nuevo', 7);
INSERT INTO `city` VALUES(778,  'Pueblo Italiano', 7);
INSERT INTO `city` VALUES(779,  'Puesto de Castro', 7);
INSERT INTO `city` VALUES(780,  'Punta del Agua', 7);
INSERT INTO `city` VALUES(781,  'Quebracho Herrado', 7);
INSERT INTO `city` VALUES(782,  'Quilino', 7);
INSERT INTO `city` VALUES(783,  'Rafael García', 7);
INSERT INTO `city` VALUES(784,  'Ranqueles', 7);
INSERT INTO `city` VALUES(785,  'Rayo Cortado', 7);
INSERT INTO `city` VALUES(786,  'Reducción', 7);
INSERT INTO `city` VALUES(787,  'Rincón', 7);
INSERT INTO `city` VALUES(788,  'Río Bamba', 7);
INSERT INTO `city` VALUES(789,  'Río Ceballos', 7);
INSERT INTO `city` VALUES(790,  'Río Cuarto', 7);
INSERT INTO `city` VALUES(791,  'Río de Los Sauces', 7);
INSERT INTO `city` VALUES(792,  'Río Primero', 7);
INSERT INTO `city` VALUES(793,  'Río Segundo', 7);
INSERT INTO `city` VALUES(794,  'Río Tercero', 7);
INSERT INTO `city` VALUES(795,  'Rosales', 7);
INSERT INTO `city` VALUES(796,  'Rosario del Saladillo', 7);
INSERT INTO `city` VALUES(797,  'Sacanta', 7);
INSERT INTO `city` VALUES(798,  'Sagrada Familia', 7);
INSERT INTO `city` VALUES(799,  'Saira', 7);
INSERT INTO `city` VALUES(800,  'Saladillo', 7);
INSERT INTO `city` VALUES(801,  'Saldán', 7);
INSERT INTO `city` VALUES(802,  'Salsacate', 7);
INSERT INTO `city` VALUES(803,  'Salsipuedes', 7);
INSERT INTO `city` VALUES(804,  'Sampacho', 7);
INSERT INTO `city` VALUES(805,  'San Agustín', 7);
INSERT INTO `city` VALUES(806,  'San Antonio de Arredondo', 7);
INSERT INTO `city` VALUES(807,  'San Antonio de Litín', 7);
INSERT INTO `city` VALUES(808,  'San Basilio', 7);
INSERT INTO `city` VALUES(809,  'San Carlos Minas', 7);
INSERT INTO `city` VALUES(810,  'San Clemente', 7);
INSERT INTO `city` VALUES(811,  'San Esteban', 7);
INSERT INTO `city` VALUES(812,  'San Francisco', 7);
INSERT INTO `city` VALUES(813,  'San Ignacio', 7);
INSERT INTO `city` VALUES(814,  'San Javier', 7);
INSERT INTO `city` VALUES(815,  'San Jerónimo', 7);
INSERT INTO `city` VALUES(816,  'San Joaquín', 7);
INSERT INTO `city` VALUES(817,  'San José de La Dormida', 7);
INSERT INTO `city` VALUES(818,  'San José de Las Salinas', 7);
INSERT INTO `city` VALUES(819,  'San Lorenzo', 7);
INSERT INTO `city` VALUES(820,  'San Marcos Sierras', 7);
INSERT INTO `city` VALUES(821,  'San Marcos Sud', 7);
INSERT INTO `city` VALUES(822,  'San Pedro', 7);
INSERT INTO `city` VALUES(823,  'San Pedro N.', 7);
INSERT INTO `city` VALUES(824,  'San Roque', 7);
INSERT INTO `city` VALUES(825,  'San Vicente', 7);
INSERT INTO `city` VALUES(826,  'Santa Catalina', 7);
INSERT INTO `city` VALUES(827,  'Santa Elena', 7);
INSERT INTO `city` VALUES(828,  'Santa Eufemia', 7);
INSERT INTO `city` VALUES(829,  'Santa Maria', 7);
INSERT INTO `city` VALUES(830,  'Sarmiento', 7);
INSERT INTO `city` VALUES(831,  'Saturnino M.Laspiur', 7);
INSERT INTO `city` VALUES(832,  'Sauce Arriba', 7);
INSERT INTO `city` VALUES(833,  'Sebastián Elcano', 7);
INSERT INTO `city` VALUES(834,  'Seeber', 7);
INSERT INTO `city` VALUES(835,  'Segunda Usina', 7);
INSERT INTO `city` VALUES(836,  'Serrano', 7);
INSERT INTO `city` VALUES(837,  'Serrezuela', 7);
INSERT INTO `city` VALUES(838,  'Sgo. Temple', 7);
INSERT INTO `city` VALUES(839,  'Silvio Pellico', 7);
INSERT INTO `city` VALUES(840,  'Simbolar', 7);
INSERT INTO `city` VALUES(841,  'Sinsacate', 7);
INSERT INTO `city` VALUES(842,  'Sta. Rosa de Calamuchita', 7);
INSERT INTO `city` VALUES(843,  'Sta. Rosa de Río Primero', 7);
INSERT INTO `city` VALUES(844,  'Suco', 7);
INSERT INTO `city` VALUES(845,  'Tala Cañada', 7);
INSERT INTO `city` VALUES(846,  'Tala Huasi', 7);
INSERT INTO `city` VALUES(847,  'Talaini', 7);
INSERT INTO `city` VALUES(848,  'Tancacha', 7);
INSERT INTO `city` VALUES(849,  'Tanti', 7);
INSERT INTO `city` VALUES(850,  'Ticino', 7);
INSERT INTO `city` VALUES(851,  'Tinoco', 7);
INSERT INTO `city` VALUES(852,  'Tío Pujio', 7);
INSERT INTO `city` VALUES(853,  'Toledo', 7);
INSERT INTO `city` VALUES(854,  'Toro Pujio', 7);
INSERT INTO `city` VALUES(855,  'Tosno', 7);
INSERT INTO `city` VALUES(856,  'Tosquita', 7);
INSERT INTO `city` VALUES(857,  'Tránsito', 7);
INSERT INTO `city` VALUES(858,  'Tuclame', 7);
INSERT INTO `city` VALUES(859,  'Tutti', 7);
INSERT INTO `city` VALUES(860,  'Ucacha', 7);
INSERT INTO `city` VALUES(861,  'Unquillo', 7);
INSERT INTO `city` VALUES(862,  'Valle de Anisacate', 7);
INSERT INTO `city` VALUES(863,  'Valle Hermoso', 7);
INSERT INTO `city` VALUES(864,  'Vélez Sarfield', 7);
INSERT INTO `city` VALUES(865,  'Viamonte', 7);
INSERT INTO `city` VALUES(866,  'Vicuña Mackenna', 7);
INSERT INTO `city` VALUES(867,  'Villa Allende', 7);
INSERT INTO `city` VALUES(868,  'Villa Amancay', 7);
INSERT INTO `city` VALUES(869,  'Villa Ascasubi', 7);
INSERT INTO `city` VALUES(870,  'Villa Candelaria N.', 7);
INSERT INTO `city` VALUES(871,  'Villa Carlos Paz', 7);
INSERT INTO `city` VALUES(872,  'Villa Cerro Azul', 7);
INSERT INTO `city` VALUES(873,  'Villa Ciudad de América', 7);
INSERT INTO `city` VALUES(874,  'Villa Ciudad Pque Los Reartes', 7);
INSERT INTO `city` VALUES(875,  'Villa Concepción del Tío', 7);
INSERT INTO `city` VALUES(876,  'Villa Cura Brochero', 7);
INSERT INTO `city` VALUES(877,  'Villa de Las Rosas', 7);
INSERT INTO `city` VALUES(878,  'Villa de María', 7);
INSERT INTO `city` VALUES(879,  'Villa de Pocho', 7);
INSERT INTO `city` VALUES(880,  'Villa de Soto', 7);
INSERT INTO `city` VALUES(881,  'Villa del Dique', 7);
INSERT INTO `city` VALUES(882,  'Villa del Prado', 7);
INSERT INTO `city` VALUES(883,  'Villa del Rosario', 7);
INSERT INTO `city` VALUES(884,  'Villa del Totoral', 7);
INSERT INTO `city` VALUES(885,  'Villa Dolores', 7);
INSERT INTO `city` VALUES(886,  'Villa El Chancay', 7);
INSERT INTO `city` VALUES(887,  'Villa Elisa', 7);
INSERT INTO `city` VALUES(888,  'Villa Flor Serrana', 7);
INSERT INTO `city` VALUES(889,  'Villa Fontana', 7);
INSERT INTO `city` VALUES(890,  'Villa Giardino', 7);
INSERT INTO `city` VALUES(891,  'Villa Gral. Belgrano', 7);
INSERT INTO `city` VALUES(892,  'Villa Gutierrez', 7);
INSERT INTO `city` VALUES(893,  'Villa Huidobro', 7);
INSERT INTO `city` VALUES(894,  'Villa La Bolsa', 7);
INSERT INTO `city` VALUES(895,  'Villa Los Aromos', 7);
INSERT INTO `city` VALUES(896,  'Villa Los Patos', 7);
INSERT INTO `city` VALUES(897,  'Villa María', 7);
INSERT INTO `city` VALUES(898,  'Villa Nueva', 7);
INSERT INTO `city` VALUES(899,  'Villa Pque. Santa Ana', 7);
INSERT INTO `city` VALUES(900,  'Villa Pque. Siquiman', 7);
INSERT INTO `city` VALUES(901,  'Villa Quillinzo', 7);
INSERT INTO `city` VALUES(902,  'Villa Rossi', 7);
INSERT INTO `city` VALUES(903,  'Villa Rumipal', 7);
INSERT INTO `city` VALUES(904,  'Villa San Esteban', 7);
INSERT INTO `city` VALUES(905,  'Villa San Isidro', 7);
INSERT INTO `city` VALUES(906,  'Villa 21', 7);
INSERT INTO `city` VALUES(907,  'Villa Sarmiento (G.R)', 7);
INSERT INTO `city` VALUES(908,  'Villa Sarmiento (S.A)', 7);
INSERT INTO `city` VALUES(909,  'Villa Tulumba', 7);
INSERT INTO `city` VALUES(910,  'Villa Valeria', 7);
INSERT INTO `city` VALUES(911,  'Villa Yacanto', 7);
INSERT INTO `city` VALUES(912,  'Washington', 7);
INSERT INTO `city` VALUES(913,  'Wenceslao Escalante', 7);
INSERT INTO `city` VALUES(914,  'Ycho Cruz Sierras', 7);
INSERT INTO `city` VALUES(915,  'Alvear', 8);
INSERT INTO `city` VALUES(916,  'Bella Vista', 8);
INSERT INTO `city` VALUES(917,  'Berón de Astrada', 8);
INSERT INTO `city` VALUES(918,  'Bonpland', 8);
INSERT INTO `city` VALUES(919,  'Caá Cati', 8);
INSERT INTO `city` VALUES(920,  'Capital', 8);
INSERT INTO `city` VALUES(921,  'Chavarría', 8);
INSERT INTO `city` VALUES(922,  'Col. C. Pellegrini', 8);
INSERT INTO `city` VALUES(923,  'Col. Libertad', 8);
INSERT INTO `city` VALUES(924,  'Col. Liebig', 8);
INSERT INTO `city` VALUES(925,  'Col. Sta Rosa', 8);
INSERT INTO `city` VALUES(926,  'Concepción', 8);
INSERT INTO `city` VALUES(927,  'Cruz de Los Milagros', 8);
INSERT INTO `city` VALUES(928,  'Curuzú-Cuatiá', 8);
INSERT INTO `city` VALUES(929,  'Empedrado', 8);
INSERT INTO `city` VALUES(930,  'Esquina', 8);
INSERT INTO `city` VALUES(931,  'Estación Torrent', 8);
INSERT INTO `city` VALUES(932,  'Felipe Yofré', 8);
INSERT INTO `city` VALUES(933,  'Garruchos', 8);
INSERT INTO `city` VALUES(934,  'Gdor. Agrónomo', 8);
INSERT INTO `city` VALUES(935,  'Gdor. Martínez', 8);
INSERT INTO `city` VALUES(936,  'Goya', 8);
INSERT INTO `city` VALUES(937,  'Guaviravi', 8);
INSERT INTO `city` VALUES(938,  'Herlitzka', 8);
INSERT INTO `city` VALUES(939,  'Ita-Ibate', 8);
INSERT INTO `city` VALUES(940,  'Itatí', 8);
INSERT INTO `city` VALUES(941,  'Ituzaingó', 8);
INSERT INTO `city` VALUES(942,  'José Rafael Gómez', 8);
INSERT INTO `city` VALUES(943,  'Juan Pujol', 8);
INSERT INTO `city` VALUES(944,  'La Cruz', 8);
INSERT INTO `city` VALUES(945,  'Lavalle', 8);
INSERT INTO `city` VALUES(946,  'Lomas de Vallejos', 8);
INSERT INTO `city` VALUES(947,  'Loreto', 8);
INSERT INTO `city` VALUES(948,  'Mariano I. Loza', 8);
INSERT INTO `city` VALUES(949,  'Mburucuyá', 8);
INSERT INTO `city` VALUES(950,  'Mercedes', 8);
INSERT INTO `city` VALUES(951,  'Mocoretá', 8);
INSERT INTO `city` VALUES(952,  'Mte. Caseros', 8);
INSERT INTO `city` VALUES(953,  'Nueve de Julio', 8);
INSERT INTO `city` VALUES(954,  'Palmar Grande', 8);
INSERT INTO `city` VALUES(955,  'Parada Pucheta', 8);
INSERT INTO `city` VALUES(956,  'Paso de La Patria', 8);
INSERT INTO `city` VALUES(957,  'Paso de Los Libres', 8);
INSERT INTO `city` VALUES(958,  'Pedro R. Fernandez', 8);
INSERT INTO `city` VALUES(959,  'Perugorría', 8);
INSERT INTO `city` VALUES(960,  'Pueblo Libertador', 8);
INSERT INTO `city` VALUES(961,  'Ramada Paso', 8);
INSERT INTO `city` VALUES(962,  'Riachuelo', 8);
INSERT INTO `city` VALUES(963,  'Saladas', 8);
INSERT INTO `city` VALUES(964,  'San Antonio', 8);
INSERT INTO `city` VALUES(965,  'San Carlos', 8);
INSERT INTO `city` VALUES(966,  'San Cosme', 8);
INSERT INTO `city` VALUES(967,  'San Lorenzo', 8);
INSERT INTO `city` VALUES(968,  '20 del Palmar', 8);
INSERT INTO `city` VALUES(969,  'San Miguel', 8);
INSERT INTO `city` VALUES(970,  'San Roque', 8);
INSERT INTO `city` VALUES(971,  'Santa Ana', 8);
INSERT INTO `city` VALUES(972,  'Santa Lucía', 8);
INSERT INTO `city` VALUES(973,  'Santo Tomé', 8);
INSERT INTO `city` VALUES(974,  'Sauce', 8);
INSERT INTO `city` VALUES(975,  'Tabay', 8);
INSERT INTO `city` VALUES(976,  'Tapebicuá', 8);
INSERT INTO `city` VALUES(977,  'Tatacua', 8);
INSERT INTO `city` VALUES(978,  'Virasoro', 8);
INSERT INTO `city` VALUES(979,  'Yapeyú', 8);
INSERT INTO `city` VALUES(980,  'Yataití Calle', 8);
INSERT INTO `city` VALUES(981,  'Alarcón', 9);
INSERT INTO `city` VALUES(982,  'Alcaraz', 9);
INSERT INTO `city` VALUES(983,  'Alcaraz N.', 9);
INSERT INTO `city` VALUES(984,  'Alcaraz S.', 9);
INSERT INTO `city` VALUES(985,  'Aldea Asunción', 9);
INSERT INTO `city` VALUES(986,  'Aldea Brasilera', 9);
INSERT INTO `city` VALUES(987,  'Aldea Elgenfeld', 9);
INSERT INTO `city` VALUES(988,  'Aldea Grapschental', 9);
INSERT INTO `city` VALUES(989,  'Aldea Ma. Luisa', 9);
INSERT INTO `city` VALUES(990,  'Aldea Protestante', 9);
INSERT INTO `city` VALUES(991,  'Aldea Salto', 9);
INSERT INTO `city` VALUES(992,  'Aldea San Antonio (G)', 9);
INSERT INTO `city` VALUES(993,  'Aldea San Antonio (P)', 9);
INSERT INTO `city` VALUES(994,  'Aldea 19', 9);
INSERT INTO `city` VALUES(995,  'Aldea San Miguel', 9);
INSERT INTO `city` VALUES(996,  'Aldea San Rafael', 9);
INSERT INTO `city` VALUES(997,  'Aldea Spatzenkutter', 9);
INSERT INTO `city` VALUES(998,  'Aldea Sta. María', 9);
INSERT INTO `city` VALUES(999,  'Aldea Sta. Rosa', 9);
INSERT INTO `city` VALUES(1000,  'Aldea Valle María', 9);
INSERT INTO `city` VALUES(1001,  'Altamirano Sur', 9);
INSERT INTO `city` VALUES(1002,  'Antelo', 9);
INSERT INTO `city` VALUES(1003,  'Antonio Tomás', 9);
INSERT INTO `city` VALUES(1004,  'Aranguren', 9);
INSERT INTO `city` VALUES(1005,  'Arroyo Barú', 9);
INSERT INTO `city` VALUES(1006,  'Arroyo Burgos', 9);
INSERT INTO `city` VALUES(1007,  'Arroyo Clé', 9);
INSERT INTO `city` VALUES(1008,  'Arroyo Corralito', 9);
INSERT INTO `city` VALUES(1009,  'Arroyo del Medio', 9);
INSERT INTO `city` VALUES(1010,  'Arroyo Maturrango', 9);
INSERT INTO `city` VALUES(1011,  'Arroyo Palo Seco', 9);
INSERT INTO `city` VALUES(1012,  'Banderas', 9);
INSERT INTO `city` VALUES(1013,  'Basavilbaso', 9);
INSERT INTO `city` VALUES(1014,  'Betbeder', 9);
INSERT INTO `city` VALUES(1015,  'Bovril', 9);
INSERT INTO `city` VALUES(1016,  'Caseros', 9);
INSERT INTO `city` VALUES(1017,  'Ceibas', 9);
INSERT INTO `city` VALUES(1018,  'Cerrito', 9);
INSERT INTO `city` VALUES(1019,  'Chajarí', 9);
INSERT INTO `city` VALUES(1020,  'Chilcas', 9);
INSERT INTO `city` VALUES(1021,  'Clodomiro Ledesma', 9);
INSERT INTO `city` VALUES(1022,  'Col. Alemana', 9);
INSERT INTO `city` VALUES(1023,  'Col. Avellaneda', 9);
INSERT INTO `city` VALUES(1024,  'Col. Avigdor', 9);
INSERT INTO `city` VALUES(1025,  'Col. Ayuí', 9);
INSERT INTO `city` VALUES(1026,  'Col. Baylina', 9);
INSERT INTO `city` VALUES(1027,  'Col. Carrasco', 9);
INSERT INTO `city` VALUES(1028,  'Col. Celina', 9);
INSERT INTO `city` VALUES(1029,  'Col. Cerrito', 9);
INSERT INTO `city` VALUES(1030,  'Col. Crespo', 9);
INSERT INTO `city` VALUES(1031,  'Col. Elia', 9);
INSERT INTO `city` VALUES(1032,  'Col. Ensayo', 9);
INSERT INTO `city` VALUES(1033,  'Col. Gral. Roca', 9);
INSERT INTO `city` VALUES(1034,  'Col. La Argentina', 9);
INSERT INTO `city` VALUES(1035,  'Col. Merou', 9);
INSERT INTO `city` VALUES(1036,  'Col. Oficial Nª3', 9);
INSERT INTO `city` VALUES(1037,  'Col. Oficial Nº13', 9);
INSERT INTO `city` VALUES(1038,  'Col. Oficial Nº14', 9);
INSERT INTO `city` VALUES(1039,  'Col. Oficial Nº5', 9);
INSERT INTO `city` VALUES(1040,  'Col. Reffino', 9);
INSERT INTO `city` VALUES(1041,  'Col. Tunas', 9);
INSERT INTO `city` VALUES(1042,  'Col. Viraró', 9);
INSERT INTO `city` VALUES(1043,  'Colón', 9);
INSERT INTO `city` VALUES(1044,  'Concepción del Uruguay', 9);
INSERT INTO `city` VALUES(1045,  'Concordia', 9);
INSERT INTO `city` VALUES(1046,  'Conscripto Bernardi', 9);
INSERT INTO `city` VALUES(1047,  'Costa Grande', 9);
INSERT INTO `city` VALUES(1048,  'Costa San Antonio', 9);
INSERT INTO `city` VALUES(1049,  'Costa Uruguay N.', 9);
INSERT INTO `city` VALUES(1050,  'Costa Uruguay S.', 9);
INSERT INTO `city` VALUES(1051,  'Crespo', 9);
INSERT INTO `city` VALUES(1052,  'Crucecitas 3ª', 9);
INSERT INTO `city` VALUES(1053,  'Crucecitas 7ª', 9);
INSERT INTO `city` VALUES(1054,  'Crucecitas 8ª', 9);
INSERT INTO `city` VALUES(1055,  'Cuchilla Redonda', 9);
INSERT INTO `city` VALUES(1056,  'Curtiembre', 9);
INSERT INTO `city` VALUES(1057,  'Diamante', 9);
INSERT INTO `city` VALUES(1058,  'Distrito 6º', 9);
INSERT INTO `city` VALUES(1059,  'Distrito Chañar', 9);
INSERT INTO `city` VALUES(1060,  'Distrito Chiqueros', 9);
INSERT INTO `city` VALUES(1061,  'Distrito Cuarto', 9);
INSERT INTO `city` VALUES(1062,  'Distrito Diego López', 9);
INSERT INTO `city` VALUES(1063,  'Distrito Pajonal', 9);
INSERT INTO `city` VALUES(1064,  'Distrito Sauce', 9);
INSERT INTO `city` VALUES(1065,  'Distrito Tala', 9);
INSERT INTO `city` VALUES(1066,  'Distrito Talitas', 9);
INSERT INTO `city` VALUES(1067,  'Don Cristóbal 1ª Sección', 9);
INSERT INTO `city` VALUES(1068,  'Don Cristóbal 2ª Sección', 9);
INSERT INTO `city` VALUES(1069,  'Durazno', 9);
INSERT INTO `city` VALUES(1070,  'El Cimarrón', 9);
INSERT INTO `city` VALUES(1071,  'El Gramillal', 9);
INSERT INTO `city` VALUES(1072,  'El Palenque', 9);
INSERT INTO `city` VALUES(1073,  'El Pingo', 9);
INSERT INTO `city` VALUES(1074,  'El Quebracho', 9);
INSERT INTO `city` VALUES(1075,  'El Redomón', 9);
INSERT INTO `city` VALUES(1076,  'El Solar', 9);
INSERT INTO `city` VALUES(1077,  'Enrique Carbo', 9);
INSERT INTO `city` VALUES(1078,  '9', 9);
INSERT INTO `city` VALUES(1079,  'Espinillo N.', 9);
INSERT INTO `city` VALUES(1080,  'Estación Campos', 9);
INSERT INTO `city` VALUES(1081,  'Estación Escriña', 9);
INSERT INTO `city` VALUES(1082,  'Estación Lazo', 9);
INSERT INTO `city` VALUES(1083,  'Estación Raíces', 9);
INSERT INTO `city` VALUES(1084,  'Estación Yerúa', 9);
INSERT INTO `city` VALUES(1085,  'Estancia Grande', 9);
INSERT INTO `city` VALUES(1086,  'Estancia Líbaros', 9);
INSERT INTO `city` VALUES(1087,  'Estancia Racedo', 9);
INSERT INTO `city` VALUES(1088,  'Estancia Solá', 9);
INSERT INTO `city` VALUES(1089,  'Estancia Yuquerí', 9);
INSERT INTO `city` VALUES(1090,  'Estaquitas', 9);
INSERT INTO `city` VALUES(1091,  'Faustino M. Parera', 9);
INSERT INTO `city` VALUES(1092,  'Febre', 9);
INSERT INTO `city` VALUES(1093,  'Federación', 9);
INSERT INTO `city` VALUES(1094,  'Federal', 9);
INSERT INTO `city` VALUES(1095,  'Gdor. Echagüe', 9);
INSERT INTO `city` VALUES(1096,  'Gdor. Mansilla', 9);
INSERT INTO `city` VALUES(1097,  'Gilbert', 9);
INSERT INTO `city` VALUES(1098,  'González Calderón', 9);
INSERT INTO `city` VALUES(1099,  'Gral. Almada', 9);
INSERT INTO `city` VALUES(1100,  'Gral. Alvear', 9);
INSERT INTO `city` VALUES(1101,  'Gral. Campos', 9);
INSERT INTO `city` VALUES(1102,  'Gral. Galarza', 9);
INSERT INTO `city` VALUES(1103,  'Gral. Ramírez', 9);
INSERT INTO `city` VALUES(1104,  'Gualeguay', 9);
INSERT INTO `city` VALUES(1105,  'Gualeguaychú', 9);
INSERT INTO `city` VALUES(1106,  'Gualeguaycito', 9);
INSERT INTO `city` VALUES(1107,  'Guardamonte', 9);
INSERT INTO `city` VALUES(1108,  'Hambis', 9);
INSERT INTO `city` VALUES(1109,  'Hasenkamp', 9);
INSERT INTO `city` VALUES(1110,  'Hernandarias', 9);
INSERT INTO `city` VALUES(1111,  'Hernández', 9);
INSERT INTO `city` VALUES(1112,  'Herrera', 9);
INSERT INTO `city` VALUES(1113,  'Hinojal', 9);
INSERT INTO `city` VALUES(1114,  'Hocker', 9);
INSERT INTO `city` VALUES(1115,  'Ing. Sajaroff', 9);
INSERT INTO `city` VALUES(1116,  'Irazusta', 9);
INSERT INTO `city` VALUES(1117,  'Isletas', 9);
INSERT INTO `city` VALUES(1118,  'J.J De Urquiza', 9);
INSERT INTO `city` VALUES(1119,  'Jubileo', 9);
INSERT INTO `city` VALUES(1120,  'La Clarita', 9);
INSERT INTO `city` VALUES(1121,  'La Criolla', 9);
INSERT INTO `city` VALUES(1122,  'La Esmeralda', 9);
INSERT INTO `city` VALUES(1123,  'La Florida', 9);
INSERT INTO `city` VALUES(1124,  'La Fraternidad', 9);
INSERT INTO `city` VALUES(1125,  'La Hierra', 9);
INSERT INTO `city` VALUES(1126,  'La Ollita', 9);
INSERT INTO `city` VALUES(1127,  'La Paz', 9);
INSERT INTO `city` VALUES(1128,  'La Picada', 9);
INSERT INTO `city` VALUES(1129,  'La Providencia', 9);
INSERT INTO `city` VALUES(1130,  'La Verbena', 9);
INSERT INTO `city` VALUES(1131,  'Laguna Benítez', 9);
INSERT INTO `city` VALUES(1132,  'Larroque', 9);
INSERT INTO `city` VALUES(1133,  'Las Cuevas', 9);
INSERT INTO `city` VALUES(1134,  'Las Garzas', 9);
INSERT INTO `city` VALUES(1135,  'Las Guachas', 9);
INSERT INTO `city` VALUES(1136,  'Las Mercedes', 9);
INSERT INTO `city` VALUES(1137,  'Las Moscas', 9);
INSERT INTO `city` VALUES(1138,  'Las Mulitas', 9);
INSERT INTO `city` VALUES(1139,  'Las Toscas', 9);
INSERT INTO `city` VALUES(1140,  'Laurencena', 9);
INSERT INTO `city` VALUES(1141,  'Libertador San Martín', 9);
INSERT INTO `city` VALUES(1142,  'Loma Limpia', 9);
INSERT INTO `city` VALUES(1143,  'Los Ceibos', 9);
INSERT INTO `city` VALUES(1144,  'Los Charruas', 9);
INSERT INTO `city` VALUES(1145,  'Los Conquistadores', 9);
INSERT INTO `city` VALUES(1146,  'Lucas González', 9);
INSERT INTO `city` VALUES(1147,  'Lucas N.', 9);
INSERT INTO `city` VALUES(1148,  'Lucas S. 1ª', 9);
INSERT INTO `city` VALUES(1149,  'Lucas S. 2ª', 9);
INSERT INTO `city` VALUES(1150,  'Maciá', 9);
INSERT INTO `city` VALUES(1151,  'María Grande', 9);
INSERT INTO `city` VALUES(1152,  'María Grande 2ª', 9);
INSERT INTO `city` VALUES(1153,  'Médanos', 9);
INSERT INTO `city` VALUES(1154,  'Mojones N.', 9);
INSERT INTO `city` VALUES(1155,  'Mojones S.', 9);
INSERT INTO `city` VALUES(1156,  'Molino Doll', 9);
INSERT INTO `city` VALUES(1157,  'Monte Redondo', 9);
INSERT INTO `city` VALUES(1158,  'Montoya', 9);
INSERT INTO `city` VALUES(1159,  'Mulas Grandes', 9);
INSERT INTO `city` VALUES(1160,  'Ñancay', 9);
INSERT INTO `city` VALUES(1161,  'Nogoyá', 9);
INSERT INTO `city` VALUES(1162,  'Nueva Escocia', 9);
INSERT INTO `city` VALUES(1163,  'Nueva Vizcaya', 9);
INSERT INTO `city` VALUES(1164,  'Ombú', 9);
INSERT INTO `city` VALUES(1165,  'Oro Verde', 9);
INSERT INTO `city` VALUES(1166,  'Paraná', 9);
INSERT INTO `city` VALUES(1167,  'Pasaje Guayaquil', 9);
INSERT INTO `city` VALUES(1168,  'Pasaje Las Tunas', 9);
INSERT INTO `city` VALUES(1169,  'Paso de La Arena', 9);
INSERT INTO `city` VALUES(1170,  'Paso de La Laguna', 9);
INSERT INTO `city` VALUES(1171,  'Paso de Las Piedras', 9);
INSERT INTO `city` VALUES(1172,  'Paso Duarte', 9);
INSERT INTO `city` VALUES(1173,  'Pastor Britos', 9);
INSERT INTO `city` VALUES(1174,  'Pedernal', 9);
INSERT INTO `city` VALUES(1175,  'Perdices', 9);
INSERT INTO `city` VALUES(1176,  'Picada Berón', 9);
INSERT INTO `city` VALUES(1177,  'Piedras Blancas', 9);
INSERT INTO `city` VALUES(1178,  'Primer Distrito Cuchilla', 9);
INSERT INTO `city` VALUES(1179,  'Primero de Mayo', 9);
INSERT INTO `city` VALUES(1180,  'Pronunciamiento', 9);
INSERT INTO `city` VALUES(1181,  'Pto. Algarrobo', 9);
INSERT INTO `city` VALUES(1182,  'Pto. Ibicuy', 9);
INSERT INTO `city` VALUES(1183,  'Pueblo Brugo', 9);
INSERT INTO `city` VALUES(1184,  'Pueblo Cazes', 9);
INSERT INTO `city` VALUES(1185,  'Pueblo Gral. Belgrano', 9);
INSERT INTO `city` VALUES(1186,  'Pueblo Liebig', 9);
INSERT INTO `city` VALUES(1187,  'Puerto Yeruá', 9);
INSERT INTO `city` VALUES(1188,  'Punta del Monte', 9);
INSERT INTO `city` VALUES(1189,  'Quebracho', 9);
INSERT INTO `city` VALUES(1190,  'Quinto Distrito', 9);
INSERT INTO `city` VALUES(1191,  'Raices Oeste', 9);
INSERT INTO `city` VALUES(1192,  'Rincón de Nogoyá', 9);
INSERT INTO `city` VALUES(1193,  'Rincón del Cinto', 9);
INSERT INTO `city` VALUES(1194,  'Rincón del Doll', 9);
INSERT INTO `city` VALUES(1195,  'Rincón del Gato', 9);
INSERT INTO `city` VALUES(1196,  'Rocamora', 9);
INSERT INTO `city` VALUES(1197,  'Rosario del Tala', 9);
INSERT INTO `city` VALUES(1198,  'San Benito', 9);
INSERT INTO `city` VALUES(1199,  'San Cipriano', 9);
INSERT INTO `city` VALUES(1200,  'San Ernesto', 9);
INSERT INTO `city` VALUES(1201,  'San Gustavo', 9);
INSERT INTO `city` VALUES(1202,  'San Jaime', 9);
INSERT INTO `city` VALUES(1203,  'San José', 9);
INSERT INTO `city` VALUES(1204,  'San José de Feliciano', 9);
INSERT INTO `city` VALUES(1205,  'San Justo', 9);
INSERT INTO `city` VALUES(1206,  'San Marcial', 9);
INSERT INTO `city` VALUES(1207,  'San Pedro', 9);
INSERT INTO `city` VALUES(1208,  'San Ramírez', 9);
INSERT INTO `city` VALUES(1209,  'San Ramón', 9);
INSERT INTO `city` VALUES(1210,  'San Roque', 9);
INSERT INTO `city` VALUES(1211,  'San Salvador', 9);
INSERT INTO `city` VALUES(1212,  'San Víctor', 9);
INSERT INTO `city` VALUES(1213,  'Santa Ana', 9);
INSERT INTO `city` VALUES(1214,  'Santa Anita', 9);
INSERT INTO `city` VALUES(1215,  'Santa Elena', 9);
INSERT INTO `city` VALUES(1216,  'Santa Lucía', 9);
INSERT INTO `city` VALUES(1217,  'Santa Luisa', 9);
INSERT INTO `city` VALUES(1218,  'Sauce de Luna', 9);
INSERT INTO `city` VALUES(1219,  'Sauce Montrull', 9);
INSERT INTO `city` VALUES(1220,  'Sauce Pinto', 9);
INSERT INTO `city` VALUES(1221,  'Sauce Sur', 9);
INSERT INTO `city` VALUES(1222,  'Seguí', 9);
INSERT INTO `city` VALUES(1223,  'Sir Leonard', 9);
INSERT INTO `city` VALUES(1224,  'Sosa', 9);
INSERT INTO `city` VALUES(1225,  'Tabossi', 9);
INSERT INTO `city` VALUES(1226,  'Tezanos Pinto', 9);
INSERT INTO `city` VALUES(1227,  'Ubajay', 9);
INSERT INTO `city` VALUES(1228,  'Urdinarrain', 9);
INSERT INTO `city` VALUES(1229,  'Veinte de Septiembre', 9);
INSERT INTO `city` VALUES(1230,  'Viale', 9);
INSERT INTO `city` VALUES(1231,  'Victoria', 9);
INSERT INTO `city` VALUES(1232,  'Villa Clara', 9);
INSERT INTO `city` VALUES(1233,  'Villa del Rosario', 9);
INSERT INTO `city` VALUES(1234,  'Villa Domínguez', 9);
INSERT INTO `city` VALUES(1235,  'Villa Elisa', 9);
INSERT INTO `city` VALUES(1236,  'Villa Fontana', 9);
INSERT INTO `city` VALUES(1237,  'Villa Gdor. Etchevehere', 9);
INSERT INTO `city` VALUES(1238,  'Villa Mantero', 9);
INSERT INTO `city` VALUES(1239,  'Villa Paranacito', 9);
INSERT INTO `city` VALUES(1240,  'Villa Urquiza', 9);
INSERT INTO `city` VALUES(1241,  'Villaguay', 9);
INSERT INTO `city` VALUES(1242,  'Walter Moss', 9);
INSERT INTO `city` VALUES(1243,  'Yacaré', 9);
INSERT INTO `city` VALUES(1244,  'Yeso Oeste', 9);
INSERT INTO `city` VALUES(1245,  'Buena Vista', 10);
INSERT INTO `city` VALUES(1246,  'Clorinda', 10);
INSERT INTO `city` VALUES(1247,  'Col. Pastoril', 10);
INSERT INTO `city` VALUES(1248,  'Cte. Fontana', 10);
INSERT INTO `city` VALUES(1249,  'El Colorado', 10);
INSERT INTO `city` VALUES(1250,  'El Espinillo', 10);
INSERT INTO `city` VALUES(1251,  'Estanislao Del Campo', 10);
INSERT INTO `city` VALUES(1252,  '10', 10);
INSERT INTO `city` VALUES(1253,  'Fortín Lugones', 10);
INSERT INTO `city` VALUES(1254,  'Gral. Lucio V. Mansilla', 10);
INSERT INTO `city` VALUES(1255,  'Gral. Manuel Belgrano', 10);
INSERT INTO `city` VALUES(1256,  'Gral. Mosconi', 10);
INSERT INTO `city` VALUES(1257,  'Gran Guardia', 10);
INSERT INTO `city` VALUES(1258,  'Herradura', 10);
INSERT INTO `city` VALUES(1259,  'Ibarreta', 10);
INSERT INTO `city` VALUES(1260,  'Ing. Juárez', 10);
INSERT INTO `city` VALUES(1261,  'Laguna Blanca', 10);
INSERT INTO `city` VALUES(1262,  'Laguna Naick Neck', 10);
INSERT INTO `city` VALUES(1263,  'Laguna Yema', 10);
INSERT INTO `city` VALUES(1264,  'Las Lomitas', 10);
INSERT INTO `city` VALUES(1265,  'Los Chiriguanos', 10);
INSERT INTO `city` VALUES(1266,  'Mayor V. Villafañe', 10);
INSERT INTO `city` VALUES(1267,  'Misión San Fco.', 10);
INSERT INTO `city` VALUES(1268,  'Palo Santo', 10);
INSERT INTO `city` VALUES(1269,  'Pirané', 10);
INSERT INTO `city` VALUES(1270,  'Pozo del Maza', 10);
INSERT INTO `city` VALUES(1271,  'Riacho He-He', 10);
INSERT INTO `city` VALUES(1272,  'San Hilario', 10);
INSERT INTO `city` VALUES(1273,  'San Martín II', 10);
INSERT INTO `city` VALUES(1274,  'Siete Palmas', 10);
INSERT INTO `city` VALUES(1275,  'Subteniente Perín', 10);
INSERT INTO `city` VALUES(1276,  'Tres Lagunas', 10);
INSERT INTO `city` VALUES(1277,  'Villa Dos Trece', 10);
INSERT INTO `city` VALUES(1278,  'Villa Escolar', 10);
INSERT INTO `city` VALUES(1279,  'Villa Gral. Güemes', 10);
INSERT INTO `city` VALUES(1280,  'Abdon Castro Tolay', 11);
INSERT INTO `city` VALUES(1281,  'Abra Pampa', 11);
INSERT INTO `city` VALUES(1282,  'Abralaite', 11);
INSERT INTO `city` VALUES(1283,  'Aguas Calientes', 11);
INSERT INTO `city` VALUES(1284,  'Arrayanal', 11);
INSERT INTO `city` VALUES(1285,  'Barrios', 11);
INSERT INTO `city` VALUES(1286,  'Caimancito', 11);
INSERT INTO `city` VALUES(1287,  'Calilegua', 11);
INSERT INTO `city` VALUES(1288,  'Cangrejillos', 11);
INSERT INTO `city` VALUES(1289,  'Caspala', 11);
INSERT INTO `city` VALUES(1290,  'Catuá', 11);
INSERT INTO `city` VALUES(1291,  'Cieneguillas', 11);
INSERT INTO `city` VALUES(1292,  'Coranzulli', 11);
INSERT INTO `city` VALUES(1293,  'Cusi-Cusi', 11);
INSERT INTO `city` VALUES(1294,  'El Aguilar', 11);
INSERT INTO `city` VALUES(1295,  'El Carmen', 11);
INSERT INTO `city` VALUES(1296,  'El Cóndor', 11);
INSERT INTO `city` VALUES(1297,  'El Fuerte', 11);
INSERT INTO `city` VALUES(1298,  'El Piquete', 11);
INSERT INTO `city` VALUES(1299,  'El Talar', 11);
INSERT INTO `city` VALUES(1300,  'Fraile Pintado', 11);
INSERT INTO `city` VALUES(1301,  'Hipólito Yrigoyen', 11);
INSERT INTO `city` VALUES(1302,  'Huacalera', 11);
INSERT INTO `city` VALUES(1303,  'Humahuaca', 11);
INSERT INTO `city` VALUES(1304,  'La Esperanza', 11);
INSERT INTO `city` VALUES(1305,  'La Mendieta', 11);
INSERT INTO `city` VALUES(1306,  'La Quiaca', 11);
INSERT INTO `city` VALUES(1307,  'Ledesma', 11);
INSERT INTO `city` VALUES(1308,  'Libertador Gral. San Martin', 11);
INSERT INTO `city` VALUES(1309,  'Maimara', 11);
INSERT INTO `city` VALUES(1310,  'Mina Pirquitas', 11);
INSERT INTO `city` VALUES(1311,  'Monterrico', 11);
INSERT INTO `city` VALUES(1312,  'Palma Sola', 11);
INSERT INTO `city` VALUES(1313,  'Palpalá', 11);
INSERT INTO `city` VALUES(1314,  'Pampa Blanca', 11);
INSERT INTO `city` VALUES(1315,  'Pampichuela', 11);
INSERT INTO `city` VALUES(1316,  'Perico', 11);
INSERT INTO `city` VALUES(1317,  'Puesto del Marqués', 11);
INSERT INTO `city` VALUES(1318,  'Puesto Viejo', 11);
INSERT INTO `city` VALUES(1319,  'Pumahuasi', 11);
INSERT INTO `city` VALUES(1320,  'Purmamarca', 11);
INSERT INTO `city` VALUES(1321,  'Rinconada', 11);
INSERT INTO `city` VALUES(1322,  'Rodeitos', 11);
INSERT INTO `city` VALUES(1323,  'Rosario de Río Grande', 11);
INSERT INTO `city` VALUES(1324,  'San Antonio', 11);
INSERT INTO `city` VALUES(1325,  'San Francisco', 11);
INSERT INTO `city` VALUES(1326,  'San Pedro', 11);
INSERT INTO `city` VALUES(1327,  'San Rafael', 11);
INSERT INTO `city` VALUES(1328,  'San Salvador', 11);
INSERT INTO `city` VALUES(1329,  'Santa Ana', 11);
INSERT INTO `city` VALUES(1330,  'Santa Catalina', 11);
INSERT INTO `city` VALUES(1331,  'Santa Clara', 11);
INSERT INTO `city` VALUES(1332,  'Susques', 11);
INSERT INTO `city` VALUES(1333,  'Tilcara', 11);
INSERT INTO `city` VALUES(1334,  'Tres Cruces', 11);
INSERT INTO `city` VALUES(1335,  'Tumbaya', 11);
INSERT INTO `city` VALUES(1336,  'Valle Grande', 11);
INSERT INTO `city` VALUES(1337,  'Vinalito', 11);
INSERT INTO `city` VALUES(1338,  'Volcán', 11);
INSERT INTO `city` VALUES(1339,  'Yala', 11);
INSERT INTO `city` VALUES(1340,  'Yaví', 11);
INSERT INTO `city` VALUES(1341,  'Yuto', 11);
INSERT INTO `city` VALUES(1342,  'Abramo', 12);
INSERT INTO `city` VALUES(1343,  'Adolfo Van Praet', 12);
INSERT INTO `city` VALUES(1344,  'Agustoni', 12);
INSERT INTO `city` VALUES(1345,  'Algarrobo del Aguila', 12);
INSERT INTO `city` VALUES(1346,  'Alpachiri', 12);
INSERT INTO `city` VALUES(1347,  'Alta Italia', 12);
INSERT INTO `city` VALUES(1348,  'Anguil', 12);
INSERT INTO `city` VALUES(1349,  'Arata', 12);
INSERT INTO `city` VALUES(1350,  'Ataliva Roca', 12);
INSERT INTO `city` VALUES(1351,  'Bernardo Larroude', 12);
INSERT INTO `city` VALUES(1352,  'Bernasconi', 12);
INSERT INTO `city` VALUES(1353,  'Caleufú', 12);
INSERT INTO `city` VALUES(1354,  'Carro Quemado', 12);
INSERT INTO `city` VALUES(1355,  'Catriló', 12);
INSERT INTO `city` VALUES(1356,  'Ceballos', 12);
INSERT INTO `city` VALUES(1357,  'Chacharramendi', 12);
INSERT INTO `city` VALUES(1358,  'Col. Barón', 12);
INSERT INTO `city` VALUES(1359,  'Col. Santa María', 12);
INSERT INTO `city` VALUES(1360,  'Conhelo', 12);
INSERT INTO `city` VALUES(1361,  'Coronel Hilario Lagos', 12);
INSERT INTO `city` VALUES(1362,  'Cuchillo-Có', 12);
INSERT INTO `city` VALUES(1363,  'Doblas', 12);
INSERT INTO `city` VALUES(1364,  'Dorila', 12);
INSERT INTO `city` VALUES(1365,  'Eduardo Castex', 12);
INSERT INTO `city` VALUES(1366,  'Embajador Martini', 12);
INSERT INTO `city` VALUES(1367,  'Falucho', 12);
INSERT INTO `city` VALUES(1368,  'Gral. Acha', 12);
INSERT INTO `city` VALUES(1369,  'Gral. Manuel Campos', 12);
INSERT INTO `city` VALUES(1370,  'Gral. Pico', 12);
INSERT INTO `city` VALUES(1371,  'Guatraché', 12);
INSERT INTO `city` VALUES(1372,  'Ing. Luiggi', 12);
INSERT INTO `city` VALUES(1373,  'Intendente Alvear', 12);
INSERT INTO `city` VALUES(1374,  'Jacinto Arauz', 12);
INSERT INTO `city` VALUES(1375,  'La Adela', 12);
INSERT INTO `city` VALUES(1376,  'La Humada', 12);
INSERT INTO `city` VALUES(1377,  'La Maruja', 12);
INSERT INTO `city` VALUES(1378,  '12', 12);
INSERT INTO `city` VALUES(1379,  'La Reforma', 12);
INSERT INTO `city` VALUES(1380,  'Limay Mahuida', 12);
INSERT INTO `city` VALUES(1381,  'Lonquimay', 12);
INSERT INTO `city` VALUES(1382,  'Loventuel', 12);
INSERT INTO `city` VALUES(1383,  'Luan Toro', 12);
INSERT INTO `city` VALUES(1384,  'Macachín', 12);
INSERT INTO `city` VALUES(1385,  'Maisonnave', 12);
INSERT INTO `city` VALUES(1386,  'Mauricio Mayer', 12);
INSERT INTO `city` VALUES(1387,  'Metileo', 12);
INSERT INTO `city` VALUES(1388,  'Miguel Cané', 12);
INSERT INTO `city` VALUES(1389,  'Miguel Riglos', 12);
INSERT INTO `city` VALUES(1390,  'Monte Nievas', 12);
INSERT INTO `city` VALUES(1391,  'Parera', 12);
INSERT INTO `city` VALUES(1392,  'Perú', 12);
INSERT INTO `city` VALUES(1393,  'Pichi-Huinca', 12);
INSERT INTO `city` VALUES(1394,  'Puelches', 12);
INSERT INTO `city` VALUES(1395,  'Puelén', 12);
INSERT INTO `city` VALUES(1396,  'Quehue', 12);
INSERT INTO `city` VALUES(1397,  'Quemú Quemú', 12);
INSERT INTO `city` VALUES(1398,  'Quetrequén', 12);
INSERT INTO `city` VALUES(1399,  'Rancul', 12);
INSERT INTO `city` VALUES(1400,  'Realicó', 12);
INSERT INTO `city` VALUES(1401,  'Relmo', 12);
INSERT INTO `city` VALUES(1402,  'Rolón', 12);
INSERT INTO `city` VALUES(1403,  'Rucanelo', 12);
INSERT INTO `city` VALUES(1404,  'Sarah', 12);
INSERT INTO `city` VALUES(1405,  'Speluzzi', 12);
INSERT INTO `city` VALUES(1406,  'Sta. Isabel', 12);
INSERT INTO `city` VALUES(1407,  'Sta. Rosa', 12);
INSERT INTO `city` VALUES(1408,  'Sta. Teresa', 12);
INSERT INTO `city` VALUES(1409,  'Telén', 12);
INSERT INTO `city` VALUES(1410,  'Toay', 12);
INSERT INTO `city` VALUES(1411,  'Tomas M. de Anchorena', 12);
INSERT INTO `city` VALUES(1412,  'Trenel', 12);
INSERT INTO `city` VALUES(1413,  'Unanue', 12);
INSERT INTO `city` VALUES(1414,  'Uriburu', 12);
INSERT INTO `city` VALUES(1415,  'Veinticinco de Mayo', 12);
INSERT INTO `city` VALUES(1416,  'Vertiz', 12);
INSERT INTO `city` VALUES(1417,  'Victorica', 12);
INSERT INTO `city` VALUES(1418,  'Villa Mirasol', 12);
INSERT INTO `city` VALUES(1419,  'Winifreda', 12);
INSERT INTO `city` VALUES(1420,  'Arauco', 13);
INSERT INTO `city` VALUES(1421,  'Capital', 13);
INSERT INTO `city` VALUES(1422,  'Castro Barros', 13);
INSERT INTO `city` VALUES(1423,  'Chamical', 13);
INSERT INTO `city` VALUES(1424,  'Chilecito', 13);
INSERT INTO `city` VALUES(1425,  'Coronel F. Varela', 13);
INSERT INTO `city` VALUES(1426,  'Famatina', 13);
INSERT INTO `city` VALUES(1427,  'Gral. A.V.Peñaloza', 13);
INSERT INTO `city` VALUES(1428,  'Gral. Belgrano', 13);
INSERT INTO `city` VALUES(1429,  'Gral. J.F. Quiroga', 13);
INSERT INTO `city` VALUES(1430,  'Gral. Lamadrid', 13);
INSERT INTO `city` VALUES(1431,  'Gral. Ocampo', 13);
INSERT INTO `city` VALUES(1432,  'Gral. San Martín', 13);
INSERT INTO `city` VALUES(1433,  'Independencia', 13);
INSERT INTO `city` VALUES(1434,  'Rosario Penaloza', 13);
INSERT INTO `city` VALUES(1435,  'San Blas de Los Sauces', 13);
INSERT INTO `city` VALUES(1436,  'Sanagasta', 13);
INSERT INTO `city` VALUES(1437,  'Vinchina', 13);
INSERT INTO `city` VALUES(1438,  'Capital', 14);
INSERT INTO `city` VALUES(1439,  'Chacras de Coria', 14);
INSERT INTO `city` VALUES(1440,  'Dorrego', 14);
INSERT INTO `city` VALUES(1441,  'Gllen', 14);
INSERT INTO `city` VALUES(1442,  'Godoy Cruz', 14);
INSERT INTO `city` VALUES(1443,  'Gral. Alvear', 14);
INSERT INTO `city` VALUES(1444,  'Guaymallén', 14);
INSERT INTO `city` VALUES(1445,  'Junín', 14);
INSERT INTO `city` VALUES(1446,  'La Paz', 14);
INSERT INTO `city` VALUES(1447,  'Las Heras', 14);
INSERT INTO `city` VALUES(1448,  'Lavalle', 14);
INSERT INTO `city` VALUES(1449,  'Luján', 14);
INSERT INTO `city` VALUES(1450,  'Luján De Cuyo', 14);
INSERT INTO `city` VALUES(1451,  'Maipú', 14);
INSERT INTO `city` VALUES(1452,  'Malargüe', 14);
INSERT INTO `city` VALUES(1453,  'Rivadavia', 14);
INSERT INTO `city` VALUES(1454,  'San Carlos', 14);
INSERT INTO `city` VALUES(1455,  'San Martín', 14);
INSERT INTO `city` VALUES(1456,  'San Rafael', 14);
INSERT INTO `city` VALUES(1457,  'Sta. Rosa', 14);
INSERT INTO `city` VALUES(1458,  'Tunuyán', 14);
INSERT INTO `city` VALUES(1459,  'Tupungato', 14);
INSERT INTO `city` VALUES(1460,  'Villa Nueva', 14);
INSERT INTO `city` VALUES(1461,  'Alba Posse', 15);
INSERT INTO `city` VALUES(1462,  'Almafuerte', 15);
INSERT INTO `city` VALUES(1463,  'Apóstoles', 15);
INSERT INTO `city` VALUES(1464,  'Aristóbulo Del Valle', 15);
INSERT INTO `city` VALUES(1465,  'Arroyo Del Medio', 15);
INSERT INTO `city` VALUES(1466,  'Azara', 15);
INSERT INTO `city` VALUES(1467,  'Bdo. De Irigoyen', 15);
INSERT INTO `city` VALUES(1468,  'Bonpland', 15);
INSERT INTO `city` VALUES(1469,  'Caá Yari', 15);
INSERT INTO `city` VALUES(1470,  'Campo Grande', 15);
INSERT INTO `city` VALUES(1471,  'Campo Ramón', 15);
INSERT INTO `city` VALUES(1472,  'Campo Viera', 15);
INSERT INTO `city` VALUES(1473,  'Candelaria', 15);
INSERT INTO `city` VALUES(1474,  'Capioví', 15);
INSERT INTO `city` VALUES(1475,  'Caraguatay', 15);
INSERT INTO `city` VALUES(1476,  'Cdte. Guacurarí', 15);
INSERT INTO `city` VALUES(1477,  'Cerro Azul', 15);
INSERT INTO `city` VALUES(1478,  'Cerro Corá', 15);
INSERT INTO `city` VALUES(1479,  'Col. Alberdi', 15);
INSERT INTO `city` VALUES(1480,  'Col. Aurora', 15);
INSERT INTO `city` VALUES(1481,  'Col. Delicia', 15);
INSERT INTO `city` VALUES(1482,  'Col. Polana', 15);
INSERT INTO `city` VALUES(1483,  'Col. Victoria', 15);
INSERT INTO `city` VALUES(1484,  'Col. Wanda', 15);
INSERT INTO `city` VALUES(1485,  'Concepción De La Sierra', 15);
INSERT INTO `city` VALUES(1486,  'Corpus', 15);
INSERT INTO `city` VALUES(1487,  'Dos Arroyos', 15);
INSERT INTO `city` VALUES(1488,  'Dos de Mayo', 15);
INSERT INTO `city` VALUES(1489,  'El Alcázar', 15);
INSERT INTO `city` VALUES(1490,  'El Dorado', 15);
INSERT INTO `city` VALUES(1491,  'El Soberbio', 15);
INSERT INTO `city` VALUES(1492,  'Esperanza', 15);
INSERT INTO `city` VALUES(1493,  'F. Ameghino', 15);
INSERT INTO `city` VALUES(1494,  'Fachinal', 15);
INSERT INTO `city` VALUES(1495,  'Garuhapé', 15);
INSERT INTO `city` VALUES(1496,  'Garupá', 15);
INSERT INTO `city` VALUES(1497,  'Gdor. López', 15);
INSERT INTO `city` VALUES(1498,  'Gdor. Roca', 15);
INSERT INTO `city` VALUES(1499,  'Gral. Alvear', 15);
INSERT INTO `city` VALUES(1500,  'Gral. Urquiza', 15);
INSERT INTO `city` VALUES(1501,  'Guaraní', 15);
INSERT INTO `city` VALUES(1502,  'H. Yrigoyen', 15);
INSERT INTO `city` VALUES(1503,  'Iguazú', 15);
INSERT INTO `city` VALUES(1504,  'Itacaruaré', 15);
INSERT INTO `city` VALUES(1505,  'Jardín América', 15);
INSERT INTO `city` VALUES(1506,  'Leandro N. Alem', 15);
INSERT INTO `city` VALUES(1507,  'Libertad', 15);
INSERT INTO `city` VALUES(1508,  'Loreto', 15);
INSERT INTO `city` VALUES(1509,  'Los Helechos', 15);
INSERT INTO `city` VALUES(1510,  'Mártires', 15);
INSERT INTO `city` VALUES(1511,  '15', 15);
INSERT INTO `city` VALUES(1512,  'Mojón Grande', 15);
INSERT INTO `city` VALUES(1513,  'Montecarlo', 15);
INSERT INTO `city` VALUES(1514,  'Nueve de Julio', 15);
INSERT INTO `city` VALUES(1515,  'Oberá', 15);
INSERT INTO `city` VALUES(1516,  'Olegario V. Andrade', 15);
INSERT INTO `city` VALUES(1517,  'Panambí', 15);
INSERT INTO `city` VALUES(1518,  'Posadas', 15);
INSERT INTO `city` VALUES(1519,  'Profundidad', 15);
INSERT INTO `city` VALUES(1520,  'Pto. Iguazú', 15);
INSERT INTO `city` VALUES(1521,  'Pto. Leoni', 15);
INSERT INTO `city` VALUES(1522,  'Pto. Piray', 15);
INSERT INTO `city` VALUES(1523,  'Pto. Rico', 15);
INSERT INTO `city` VALUES(1524,  'Ruiz de Montoya', 15);
INSERT INTO `city` VALUES(1525,  'San Antonio', 15);
INSERT INTO `city` VALUES(1526,  'San Ignacio', 15);
INSERT INTO `city` VALUES(1527,  'San Javier', 15);
INSERT INTO `city` VALUES(1528,  'San José', 15);
INSERT INTO `city` VALUES(1529,  'San Martín', 15);
INSERT INTO `city` VALUES(1530,  'San Pedro', 15);
INSERT INTO `city` VALUES(1531,  'San Vicente', 15);
INSERT INTO `city` VALUES(1532,  'Santiago De Liniers', 15);
INSERT INTO `city` VALUES(1533,  'Santo Pipo', 15);
INSERT INTO `city` VALUES(1534,  'Sta. Ana', 15);
INSERT INTO `city` VALUES(1535,  'Sta. María', 15);
INSERT INTO `city` VALUES(1536,  'Tres Capones', 15);
INSERT INTO `city` VALUES(1537,  'Veinticinco de Mayo', 15);
INSERT INTO `city` VALUES(1538,  'Wanda', 15);
INSERT INTO `city` VALUES(1539,  'Aguada San Roque', 16);
INSERT INTO `city` VALUES(1540,  'Aluminé', 16);
INSERT INTO `city` VALUES(1541,  'Andacollo', 16);
INSERT INTO `city` VALUES(1542,  'Añelo', 16);
INSERT INTO `city` VALUES(1543,  'Bajada del Agrio', 16);
INSERT INTO `city` VALUES(1544,  'Barrancas', 16);
INSERT INTO `city` VALUES(1545,  'Buta Ranquil', 16);
INSERT INTO `city` VALUES(1546,  'Capital', 16);
INSERT INTO `city` VALUES(1547,  'Caviahué', 16);
INSERT INTO `city` VALUES(1548,  'Centenario', 16);
INSERT INTO `city` VALUES(1549,  'Chorriaca', 16);
INSERT INTO `city` VALUES(1550,  'Chos Malal', 16);
INSERT INTO `city` VALUES(1551,  'Cipolletti', 16);
INSERT INTO `city` VALUES(1552,  'Covunco Abajo', 16);
INSERT INTO `city` VALUES(1553,  'Coyuco Cochico', 16);
INSERT INTO `city` VALUES(1554,  'Cutral Có', 16);
INSERT INTO `city` VALUES(1555,  'El Cholar', 16);
INSERT INTO `city` VALUES(1556,  'El Huecú', 16);
INSERT INTO `city` VALUES(1557,  'El Sauce', 16);
INSERT INTO `city` VALUES(1558,  'Guañacos', 16);
INSERT INTO `city` VALUES(1559,  'Huinganco', 16);
INSERT INTO `city` VALUES(1560,  'Las Coloradas', 16);
INSERT INTO `city` VALUES(1561,  'Las Lajas', 16);
INSERT INTO `city` VALUES(1562,  'Las Ovejas', 16);
INSERT INTO `city` VALUES(1563,  'Loncopué', 16);
INSERT INTO `city` VALUES(1564,  'Los Catutos', 16);
INSERT INTO `city` VALUES(1565,  'Los Chihuidos', 16);
INSERT INTO `city` VALUES(1566,  'Los Miches', 16);
INSERT INTO `city` VALUES(1567,  'Manzano Amargo', 16);
INSERT INTO `city` VALUES(1568,  '16', 16);
INSERT INTO `city` VALUES(1569,  'Octavio Pico', 16);
INSERT INTO `city` VALUES(1570,  'Paso Aguerre', 16);
INSERT INTO `city` VALUES(1571,  'Picún Leufú', 16);
INSERT INTO `city` VALUES(1572,  'Piedra del Aguila', 16);
INSERT INTO `city` VALUES(1573,  'Pilo Lil', 16);
INSERT INTO `city` VALUES(1574,  'Plaza Huincul', 16);
INSERT INTO `city` VALUES(1575,  'Plottier', 16);
INSERT INTO `city` VALUES(1576,  'Quili Malal', 16);
INSERT INTO `city` VALUES(1577,  'Ramón Castro', 16);
INSERT INTO `city` VALUES(1578,  'Rincón de Los Sauces', 16);
INSERT INTO `city` VALUES(1579,  'San Martín de Los Andes', 16);
INSERT INTO `city` VALUES(1580,  'San Patricio del Chañar', 16);
INSERT INTO `city` VALUES(1581,  'Santo Tomás', 16);
INSERT INTO `city` VALUES(1582,  'Sauzal Bonito', 16);
INSERT INTO `city` VALUES(1583,  'Senillosa', 16);
INSERT INTO `city` VALUES(1584,  'Taquimilán', 16);
INSERT INTO `city` VALUES(1585,  'Tricao Malal', 16);
INSERT INTO `city` VALUES(1586,  'Varvarco', 16);
INSERT INTO `city` VALUES(1587,  'Villa Curí Leuvu', 16);
INSERT INTO `city` VALUES(1588,  'Villa del Nahueve', 16);
INSERT INTO `city` VALUES(1589,  'Villa del Puente Picún Leuvú', 16);
INSERT INTO `city` VALUES(1590,  'Villa El Chocón', 16);
INSERT INTO `city` VALUES(1591,  'Villa La Angostura', 16);
INSERT INTO `city` VALUES(1592,  'Villa Pehuenia', 16);
INSERT INTO `city` VALUES(1593,  'Villa Traful', 16);
INSERT INTO `city` VALUES(1594,  'Vista Alegre', 16);
INSERT INTO `city` VALUES(1595,  'Zapala', 16);
INSERT INTO `city` VALUES(1596,  'Aguada Cecilio', 17);
INSERT INTO `city` VALUES(1597,  'Aguada de Guerra', 17);
INSERT INTO `city` VALUES(1598,  'Allén', 17);
INSERT INTO `city` VALUES(1599,  'Arroyo de La Ventana', 17);
INSERT INTO `city` VALUES(1600,  'Arroyo Los Berros', 17);
INSERT INTO `city` VALUES(1601,  'Bariloche', 17);
INSERT INTO `city` VALUES(1602,  'Calte. Cordero', 17);
INSERT INTO `city` VALUES(1603,  'Campo Grande', 17);
INSERT INTO `city` VALUES(1604,  'Catriel', 17);
INSERT INTO `city` VALUES(1605,  'Cerro Policía', 17);
INSERT INTO `city` VALUES(1606,  'Cervantes', 17);
INSERT INTO `city` VALUES(1607,  'Chelforo', 17);
INSERT INTO `city` VALUES(1608,  'Chimpay', 17);
INSERT INTO `city` VALUES(1609,  'Chinchinales', 17);
INSERT INTO `city` VALUES(1610,  'Chipauquil', 17);
INSERT INTO `city` VALUES(1611,  'Choele Choel', 17);
INSERT INTO `city` VALUES(1612,  'Cinco Saltos', 17);
INSERT INTO `city` VALUES(1613,  'Cipolletti', 17);
INSERT INTO `city` VALUES(1614,  'Clemente Onelli', 17);
INSERT INTO `city` VALUES(1615,  'Colán Conhue', 17);
INSERT INTO `city` VALUES(1616,  'Comallo', 17);
INSERT INTO `city` VALUES(1617,  'Comicó', 17);
INSERT INTO `city` VALUES(1618,  'Cona Niyeu', 17);
INSERT INTO `city` VALUES(1619,  'Coronel Belisle', 17);
INSERT INTO `city` VALUES(1620,  'Cubanea', 17);
INSERT INTO `city` VALUES(1621,  'Darwin', 17);
INSERT INTO `city` VALUES(1622,  'Dina Huapi', 17);
INSERT INTO `city` VALUES(1623,  'El Bolsón', 17);
INSERT INTO `city` VALUES(1624,  'El Caín', 17);
INSERT INTO `city` VALUES(1625,  'El Manso', 17);
INSERT INTO `city` VALUES(1626,  'Gral. Conesa', 17);
INSERT INTO `city` VALUES(1627,  'Gral. Enrique Godoy', 17);
INSERT INTO `city` VALUES(1628,  'Gral. Fernandez Oro', 17);
INSERT INTO `city` VALUES(1629,  'Gral. Roca', 17);
INSERT INTO `city` VALUES(1630,  'Guardia Mitre', 17);
INSERT INTO `city` VALUES(1631,  'Ing. Huergo', 17);
INSERT INTO `city` VALUES(1632,  'Ing. Jacobacci', 17);
INSERT INTO `city` VALUES(1633,  'Laguna Blanca', 17);
INSERT INTO `city` VALUES(1634,  'Lamarque', 17);
INSERT INTO `city` VALUES(1635,  'Las Grutas', 17);
INSERT INTO `city` VALUES(1636,  'Los Menucos', 17);
INSERT INTO `city` VALUES(1637,  'Luis Beltrán', 17);
INSERT INTO `city` VALUES(1638,  'Mainqué', 17);
INSERT INTO `city` VALUES(1639,  'Mamuel Choique', 17);
INSERT INTO `city` VALUES(1640,  'Maquinchao', 17);
INSERT INTO `city` VALUES(1641,  'Mencué', 17);
INSERT INTO `city` VALUES(1642,  'Mtro. Ramos Mexia', 17);
INSERT INTO `city` VALUES(1643,  'Nahuel Niyeu', 17);
INSERT INTO `city` VALUES(1644,  'Naupa Huen', 17);
INSERT INTO `city` VALUES(1645,  'Ñorquinco', 17);
INSERT INTO `city` VALUES(1646,  'Ojos de Agua', 17);
INSERT INTO `city` VALUES(1647,  'Paso de Agua', 17);
INSERT INTO `city` VALUES(1648,  'Paso Flores', 17);
INSERT INTO `city` VALUES(1649,  'Peñas Blancas', 17);
INSERT INTO `city` VALUES(1650,  'Pichi Mahuida', 17);
INSERT INTO `city` VALUES(1651,  'Pilcaniyeu', 17);
INSERT INTO `city` VALUES(1652,  'Pomona', 17);
INSERT INTO `city` VALUES(1653,  'Prahuaniyeu', 17);
INSERT INTO `city` VALUES(1654,  'Rincón Treneta', 17);
INSERT INTO `city` VALUES(1655,  'Río Chico', 17);
INSERT INTO `city` VALUES(1656,  'Río Colorado', 17);
INSERT INTO `city` VALUES(1657,  'Roca', 17);
INSERT INTO `city` VALUES(1658,  'San Antonio Oeste', 17);
INSERT INTO `city` VALUES(1659,  'San Javier', 17);
INSERT INTO `city` VALUES(1660,  'Sierra Colorada', 17);
INSERT INTO `city` VALUES(1661,  'Sierra Grande', 17);
INSERT INTO `city` VALUES(1662,  'Sierra Pailemán', 17);
INSERT INTO `city` VALUES(1663,  'Valcheta', 17);
INSERT INTO `city` VALUES(1664,  'Valle Azul', 17);
INSERT INTO `city` VALUES(1665,  'Viedma', 17);
INSERT INTO `city` VALUES(1666,  'Villa Llanquín', 17);
INSERT INTO `city` VALUES(1667,  'Villa Mascardi', 17);
INSERT INTO `city` VALUES(1668,  'Villa Regina', 17);
INSERT INTO `city` VALUES(1669,  'Yaminué', 17);
INSERT INTO `city` VALUES(1670,  'A. Saravia', 18);
INSERT INTO `city` VALUES(1671,  'Aguaray', 18);
INSERT INTO `city` VALUES(1672,  'Angastaco', 18);
INSERT INTO `city` VALUES(1673,  'Animaná', 18);
INSERT INTO `city` VALUES(1674,  'Cachi', 18);
INSERT INTO `city` VALUES(1675,  'Cafayate', 18);
INSERT INTO `city` VALUES(1676,  'Campo Quijano', 18);
INSERT INTO `city` VALUES(1677,  'Campo Santo', 18);
INSERT INTO `city` VALUES(1678,  'Capital', 18);
INSERT INTO `city` VALUES(1679,  'Cerrillos', 18);
INSERT INTO `city` VALUES(1680,  'Chicoana', 18);
INSERT INTO `city` VALUES(1681,  'Col. Sta. Rosa', 18);
INSERT INTO `city` VALUES(1682,  'Coronel Moldes', 18);
INSERT INTO `city` VALUES(1683,  'El Bordo', 18);
INSERT INTO `city` VALUES(1684,  'El Carril', 18);
INSERT INTO `city` VALUES(1685,  'El Galpón', 18);
INSERT INTO `city` VALUES(1686,  'El Jardín', 18);
INSERT INTO `city` VALUES(1687,  'El Potrero', 18);
INSERT INTO `city` VALUES(1688,  'El Quebrachal', 18);
INSERT INTO `city` VALUES(1689,  'El Tala', 18);
INSERT INTO `city` VALUES(1690,  'Embarcación', 18);
INSERT INTO `city` VALUES(1691,  'Gral. Ballivian', 18);
INSERT INTO `city` VALUES(1692,  'Gral. Güemes', 18);
INSERT INTO `city` VALUES(1693,  'Gral. Mosconi', 18);
INSERT INTO `city` VALUES(1694,  'Gral. Pizarro', 18);
INSERT INTO `city` VALUES(1695,  'Guachipas', 18);
INSERT INTO `city` VALUES(1696,  'Hipólito Yrigoyen', 18);
INSERT INTO `city` VALUES(1697,  'Iruyá', 18);
INSERT INTO `city` VALUES(1698,  'Isla De Cañas', 18);
INSERT INTO `city` VALUES(1699,  'J. V. Gonzalez', 18);
INSERT INTO `city` VALUES(1700,  'La Caldera', 18);
INSERT INTO `city` VALUES(1701,  'La Candelaria', 18);
INSERT INTO `city` VALUES(1702,  'La Merced', 18);
INSERT INTO `city` VALUES(1703,  'La Poma', 18);
INSERT INTO `city` VALUES(1704,  'La Viña', 18);
INSERT INTO `city` VALUES(1705,  'Las Lajitas', 18);
INSERT INTO `city` VALUES(1706,  'Los Toldos', 18);
INSERT INTO `city` VALUES(1707,  'Metán', 18);
INSERT INTO `city` VALUES(1708,  'Molinos', 18);
INSERT INTO `city` VALUES(1709,  'Nazareno', 18);
INSERT INTO `city` VALUES(1710,  'Orán', 18);
INSERT INTO `city` VALUES(1711,  'Payogasta', 18);
INSERT INTO `city` VALUES(1712,  'Pichanal', 18);
INSERT INTO `city` VALUES(1713,  'Prof. S. Mazza', 18);
INSERT INTO `city` VALUES(1714,  'Río Piedras', 18);
INSERT INTO `city` VALUES(1715,  'Rivadavia Banda Norte', 18);
INSERT INTO `city` VALUES(1716,  'Rivadavia Banda Sur', 18);
INSERT INTO `city` VALUES(1717,  'Rosario de La Frontera', 18);
INSERT INTO `city` VALUES(1718,  'Rosario de Lerma', 18);
INSERT INTO `city` VALUES(1719,  'Saclantás', 18);
INSERT INTO `city` VALUES(1720,  '18', 18);
INSERT INTO `city` VALUES(1721,  'San Antonio', 18);
INSERT INTO `city` VALUES(1722,  'San Carlos', 18);
INSERT INTO `city` VALUES(1723,  'San José De Metán', 18);
INSERT INTO `city` VALUES(1724,  'San Ramón', 18);
INSERT INTO `city` VALUES(1725,  'Santa Victoria E.', 18);
INSERT INTO `city` VALUES(1726,  'Santa Victoria O.', 18);
INSERT INTO `city` VALUES(1727,  'Tartagal', 18);
INSERT INTO `city` VALUES(1728,  'Tolar Grande', 18);
INSERT INTO `city` VALUES(1729,  'Urundel', 18);
INSERT INTO `city` VALUES(1730,  'Vaqueros', 18);
INSERT INTO `city` VALUES(1731,  'Villa San Lorenzo', 18);
INSERT INTO `city` VALUES(1732,  'Albardón', 19);
INSERT INTO `city` VALUES(1733,  'Angaco', 19);
INSERT INTO `city` VALUES(1734,  'Calingasta', 19);
INSERT INTO `city` VALUES(1735,  'Capital', 19);
INSERT INTO `city` VALUES(1736,  'Caucete', 19);
INSERT INTO `city` VALUES(1737,  'Chimbas', 19);
INSERT INTO `city` VALUES(1738,  'Iglesia', 19);
INSERT INTO `city` VALUES(1739,  'Jachal', 19);
INSERT INTO `city` VALUES(1740,  'Nueve de Julio', 19);
INSERT INTO `city` VALUES(1741,  'Pocito', 19);
INSERT INTO `city` VALUES(1742,  'Rawson', 19);
INSERT INTO `city` VALUES(1743,  'Rivadavia', 19);
INSERT INTO `city` VALUES(1744,  '19', 19);
INSERT INTO `city` VALUES(1745,  'San Martín', 19);
INSERT INTO `city` VALUES(1746,  'Santa Lucía', 19);
INSERT INTO `city` VALUES(1747,  'Sarmiento', 19);
INSERT INTO `city` VALUES(1748,  'Ullum', 19);
INSERT INTO `city` VALUES(1749,  'Valle Fértil', 19);
INSERT INTO `city` VALUES(1750,  'Veinticinco de Mayo', 19);
INSERT INTO `city` VALUES(1751,  'Zonda', 19);
INSERT INTO `city` VALUES(1752,  'Alto Pelado', 20);
INSERT INTO `city` VALUES(1753,  'Alto Pencoso', 20);
INSERT INTO `city` VALUES(1754,  'Anchorena', 20);
INSERT INTO `city` VALUES(1755,  'Arizona', 20);
INSERT INTO `city` VALUES(1756,  'Bagual', 20);
INSERT INTO `city` VALUES(1757,  'Balde', 20);
INSERT INTO `city` VALUES(1758,  'Batavia', 20);
INSERT INTO `city` VALUES(1759,  'Beazley', 20);
INSERT INTO `city` VALUES(1760,  'Buena Esperanza', 20);
INSERT INTO `city` VALUES(1761,  'Candelaria', 20);
INSERT INTO `city` VALUES(1762,  'Capital', 20);
INSERT INTO `city` VALUES(1763,  'Carolina', 20);
INSERT INTO `city` VALUES(1764,  'Carpintería', 20);
INSERT INTO `city` VALUES(1765,  'Concarán', 20);
INSERT INTO `city` VALUES(1766,  'Cortaderas', 20);
INSERT INTO `city` VALUES(1767,  'El Morro', 20);
INSERT INTO `city` VALUES(1768,  'El Trapiche', 20);
INSERT INTO `city` VALUES(1769,  'El Volcán', 20);
INSERT INTO `city` VALUES(1770,  'Fortín El Patria', 20);
INSERT INTO `city` VALUES(1771,  'Fortuna', 20);
INSERT INTO `city` VALUES(1772,  'Fraga', 20);
INSERT INTO `city` VALUES(1773,  'Juan Jorba', 20);
INSERT INTO `city` VALUES(1774,  'Juan Llerena', 20);
INSERT INTO `city` VALUES(1775,  'Juana Koslay', 20);
INSERT INTO `city` VALUES(1776,  'Justo Daract', 20);
INSERT INTO `city` VALUES(1777,  'La Calera', 20);
INSERT INTO `city` VALUES(1778,  'La Florida', 20);
INSERT INTO `city` VALUES(1779,  'La Punilla', 20);
INSERT INTO `city` VALUES(1780,  'La Toma', 20);
INSERT INTO `city` VALUES(1781,  'Lafinur', 20);
INSERT INTO `city` VALUES(1782,  'Las Aguadas', 20);
INSERT INTO `city` VALUES(1783,  'Las Chacras', 20);
INSERT INTO `city` VALUES(1784,  'Las Lagunas', 20);
INSERT INTO `city` VALUES(1785,  'Las Vertientes', 20);
INSERT INTO `city` VALUES(1786,  'Lavaisse', 20);
INSERT INTO `city` VALUES(1787,  'Leandro N. Alem', 20);
INSERT INTO `city` VALUES(1788,  'Los Molles', 20);
INSERT INTO `city` VALUES(1789,  'Luján', 20);
INSERT INTO `city` VALUES(1790,  'Mercedes', 20);
INSERT INTO `city` VALUES(1791,  'Merlo', 20);
INSERT INTO `city` VALUES(1792,  'Naschel', 20);
INSERT INTO `city` VALUES(1793,  'Navia', 20);
INSERT INTO `city` VALUES(1794,  'Nogolí', 20);
INSERT INTO `city` VALUES(1795,  'Nueva Galia', 20);
INSERT INTO `city` VALUES(1796,  'Papagayos', 20);
INSERT INTO `city` VALUES(1797,  'Paso Grande', 20);
INSERT INTO `city` VALUES(1798,  'Potrero de Los Funes', 20);
INSERT INTO `city` VALUES(1799,  'Quines', 20);
INSERT INTO `city` VALUES(1800,  'Renca', 20);
INSERT INTO `city` VALUES(1801,  'Saladillo', 20);
INSERT INTO `city` VALUES(1802,  'San Francisco', 20);
INSERT INTO `city` VALUES(1803,  'San Gerónimo', 20);
INSERT INTO `city` VALUES(1804,  'San Martín', 20);
INSERT INTO `city` VALUES(1805,  'San Pablo', 20);
INSERT INTO `city` VALUES(1806,  'Santa Rosa de Conlara', 20);
INSERT INTO `city` VALUES(1807,  'Talita', 20);
INSERT INTO `city` VALUES(1808,  'Tilisarao', 20);
INSERT INTO `city` VALUES(1809,  'Unión', 20);
INSERT INTO `city` VALUES(1810,  'Villa de La Quebrada', 20);
INSERT INTO `city` VALUES(1811,  'Villa de Praga', 20);
INSERT INTO `city` VALUES(1812,  'Villa del Carmen', 20);
INSERT INTO `city` VALUES(1813,  'Villa Gral. Roca', 20);
INSERT INTO `city` VALUES(1814,  'Villa Larca', 20);
INSERT INTO `city` VALUES(1815,  'Villa Mercedes', 20);
INSERT INTO `city` VALUES(1816,  'Zanjitas', 20);
INSERT INTO `city` VALUES(1817,  'Calafate', 21);
INSERT INTO `city` VALUES(1818,  'Caleta Olivia', 21);
INSERT INTO `city` VALUES(1819,  'Cañadón Seco', 21);
INSERT INTO `city` VALUES(1820,  'Comandante Piedrabuena', 21);
INSERT INTO `city` VALUES(1821,  'El Calafate', 21);
INSERT INTO `city` VALUES(1822,  'El Chaltén', 21);
INSERT INTO `city` VALUES(1823,  'Gdor. Gregores', 21);
INSERT INTO `city` VALUES(1824,  'Hipólito Yrigoyen', 21);
INSERT INTO `city` VALUES(1825,  'Jaramillo', 21);
INSERT INTO `city` VALUES(1826,  'Koluel Kaike', 21);
INSERT INTO `city` VALUES(1827,  'Las Heras', 21);
INSERT INTO `city` VALUES(1828,  'Los Antiguos', 21);
INSERT INTO `city` VALUES(1829,  'Perito Moreno', 21);
INSERT INTO `city` VALUES(1830,  'Pico Truncado', 21);
INSERT INTO `city` VALUES(1831,  'Pto. Deseado', 21);
INSERT INTO `city` VALUES(1832,  'Pto. San Julián', 21);
INSERT INTO `city` VALUES(1833,  'Pto. 21', 21);
INSERT INTO `city` VALUES(1834,  'Río Cuarto', 21);
INSERT INTO `city` VALUES(1835,  'Río Gallegos', 21);
INSERT INTO `city` VALUES(1836,  'Río Turbio', 21);
INSERT INTO `city` VALUES(1837,  'Tres Lagos', 21);
INSERT INTO `city` VALUES(1838,  'Veintiocho De Noviembre', 21);
INSERT INTO `city` VALUES(1839,  'Aarón Castellanos', 22);
INSERT INTO `city` VALUES(1840,  'Acebal', 22);
INSERT INTO `city` VALUES(1841,  'Aguará Grande', 22);
INSERT INTO `city` VALUES(1842,  'Albarellos', 22);
INSERT INTO `city` VALUES(1843,  'Alcorta', 22);
INSERT INTO `city` VALUES(1844,  'Aldao', 22);
INSERT INTO `city` VALUES(1845,  'Alejandra', 22);
INSERT INTO `city` VALUES(1846,  'Álvarez', 22);
INSERT INTO `city` VALUES(1847,  'Ambrosetti', 22);
INSERT INTO `city` VALUES(1848,  'Amenábar', 22);
INSERT INTO `city` VALUES(1849,  'Angélica', 22);
INSERT INTO `city` VALUES(1850,  'Angeloni', 22);
INSERT INTO `city` VALUES(1851,  'Arequito', 22);
INSERT INTO `city` VALUES(1852,  'Arminda', 22);
INSERT INTO `city` VALUES(1853,  'Armstrong', 22);
INSERT INTO `city` VALUES(1854,  'Arocena', 22);
INSERT INTO `city` VALUES(1855,  'Arroyo Aguiar', 22);
INSERT INTO `city` VALUES(1856,  'Arroyo Ceibal', 22);
INSERT INTO `city` VALUES(1857,  'Arroyo Leyes', 22);
INSERT INTO `city` VALUES(1858,  'Arroyo Seco', 22);
INSERT INTO `city` VALUES(1859,  'Arrufó', 22);
INSERT INTO `city` VALUES(1860,  'Arteaga', 22);
INSERT INTO `city` VALUES(1861,  'Ataliva', 22);
INSERT INTO `city` VALUES(1862,  'Aurelia', 22);
INSERT INTO `city` VALUES(1863,  'Avellaneda', 22);
INSERT INTO `city` VALUES(1864,  'Barrancas', 22);
INSERT INTO `city` VALUES(1865,  'Bauer Y Sigel', 22);
INSERT INTO `city` VALUES(1866,  'Bella Italia', 22);
INSERT INTO `city` VALUES(1867,  'Berabevú', 22);
INSERT INTO `city` VALUES(1868,  'Berna', 22);
INSERT INTO `city` VALUES(1869,  'Bernardo de Irigoyen', 22);
INSERT INTO `city` VALUES(1870,  'Bigand', 22);
INSERT INTO `city` VALUES(1871,  'Bombal', 22);
INSERT INTO `city` VALUES(1872,  'Bouquet', 22);
INSERT INTO `city` VALUES(1873,  'Bustinza', 22);
INSERT INTO `city` VALUES(1874,  'Cabal', 22);
INSERT INTO `city` VALUES(1875,  'Cacique Ariacaiquin', 22);
INSERT INTO `city` VALUES(1876,  'Cafferata', 22);
INSERT INTO `city` VALUES(1877,  'Calchaquí', 22);
INSERT INTO `city` VALUES(1878,  'Campo Andino', 22);
INSERT INTO `city` VALUES(1879,  'Campo Piaggio', 22);
INSERT INTO `city` VALUES(1880,  'Cañada de Gómez', 22);
INSERT INTO `city` VALUES(1881,  'Cañada del Ucle', 22);
INSERT INTO `city` VALUES(1882,  'Cañada Rica', 22);
INSERT INTO `city` VALUES(1883,  'Cañada Rosquín', 22);
INSERT INTO `city` VALUES(1884,  'Candioti', 22);
INSERT INTO `city` VALUES(1885,  'Capital', 22);
INSERT INTO `city` VALUES(1886,  'Capitán Bermúdez', 22);
INSERT INTO `city` VALUES(1887,  'Capivara', 22);
INSERT INTO `city` VALUES(1888,  'Carcarañá', 22);
INSERT INTO `city` VALUES(1889,  'Carlos Pellegrini', 22);
INSERT INTO `city` VALUES(1890,  'Carmen', 22);
INSERT INTO `city` VALUES(1891,  'Carmen Del Sauce', 22);
INSERT INTO `city` VALUES(1892,  'Carreras', 22);
INSERT INTO `city` VALUES(1893,  'Carrizales', 22);
INSERT INTO `city` VALUES(1894,  'Casalegno', 22);
INSERT INTO `city` VALUES(1895,  'Casas', 22);
INSERT INTO `city` VALUES(1896,  'Casilda', 22);
INSERT INTO `city` VALUES(1897,  'Castelar', 22);
INSERT INTO `city` VALUES(1898,  'Castellanos', 22);
INSERT INTO `city` VALUES(1899,  'Cayastá', 22);
INSERT INTO `city` VALUES(1900,  'Cayastacito', 22);
INSERT INTO `city` VALUES(1901,  'Centeno', 22);
INSERT INTO `city` VALUES(1902,  'Cepeda', 22);
INSERT INTO `city` VALUES(1903,  'Ceres', 22);
INSERT INTO `city` VALUES(1904,  'Chabás', 22);
INSERT INTO `city` VALUES(1905,  'Chañar Ladeado', 22);
INSERT INTO `city` VALUES(1906,  'Chapuy', 22);
INSERT INTO `city` VALUES(1907,  'Chovet', 22);
INSERT INTO `city` VALUES(1908,  'Christophersen', 22);
INSERT INTO `city` VALUES(1909,  'Classon', 22);
INSERT INTO `city` VALUES(1910,  'Cnel. Arnold', 22);
INSERT INTO `city` VALUES(1911,  'Cnel. Bogado', 22);
INSERT INTO `city` VALUES(1912,  'Cnel. Dominguez', 22);
INSERT INTO `city` VALUES(1913,  'Cnel. Fraga', 22);
INSERT INTO `city` VALUES(1914,  'Col. Aldao', 22);
INSERT INTO `city` VALUES(1915,  'Col. Ana', 22);
INSERT INTO `city` VALUES(1916,  'Col. Belgrano', 22);
INSERT INTO `city` VALUES(1917,  'Col. Bicha', 22);
INSERT INTO `city` VALUES(1918,  'Col. Bigand', 22);
INSERT INTO `city` VALUES(1919,  'Col. Bossi', 22);
INSERT INTO `city` VALUES(1920,  'Col. Cavour', 22);
INSERT INTO `city` VALUES(1921,  'Col. Cello', 22);
INSERT INTO `city` VALUES(1922,  'Col. Dolores', 22);
INSERT INTO `city` VALUES(1923,  'Col. Dos Rosas', 22);
INSERT INTO `city` VALUES(1924,  'Col. Durán', 22);
INSERT INTO `city` VALUES(1925,  'Col. Iturraspe', 22);
INSERT INTO `city` VALUES(1926,  'Col. Margarita', 22);
INSERT INTO `city` VALUES(1927,  'Col. Mascias', 22);
INSERT INTO `city` VALUES(1928,  'Col. Raquel', 22);
INSERT INTO `city` VALUES(1929,  'Col. Rosa', 22);
INSERT INTO `city` VALUES(1930,  'Col. San José', 22);
INSERT INTO `city` VALUES(1931,  'Constanza', 22);
INSERT INTO `city` VALUES(1932,  'Coronda', 22);
INSERT INTO `city` VALUES(1933,  'Correa', 22);
INSERT INTO `city` VALUES(1934,  'Crispi', 22);
INSERT INTO `city` VALUES(1935,  'Cululú', 22);
INSERT INTO `city` VALUES(1936,  'Curupayti', 22);
INSERT INTO `city` VALUES(1937,  'Desvio Arijón', 22);
INSERT INTO `city` VALUES(1938,  'Diaz', 22);
INSERT INTO `city` VALUES(1939,  'Diego de Alvear', 22);
INSERT INTO `city` VALUES(1940,  'Egusquiza', 22);
INSERT INTO `city` VALUES(1941,  'El Arazá', 22);
INSERT INTO `city` VALUES(1942,  'El Rabón', 22);
INSERT INTO `city` VALUES(1943,  'El Sombrerito', 22);
INSERT INTO `city` VALUES(1944,  'El Trébol', 22);
INSERT INTO `city` VALUES(1945,  'Elisa', 22);
INSERT INTO `city` VALUES(1946,  'Elortondo', 22);
INSERT INTO `city` VALUES(1947,  'Emilia', 22);
INSERT INTO `city` VALUES(1948,  'Empalme San Carlos', 22);
INSERT INTO `city` VALUES(1949,  'Empalme Villa Constitucion', 22);
INSERT INTO `city` VALUES(1950,  'Esmeralda', 22);
INSERT INTO `city` VALUES(1951,  'Esperanza', 22);
INSERT INTO `city` VALUES(1952,  'Estación Alvear', 22);
INSERT INTO `city` VALUES(1953,  'Estacion Clucellas', 22);
INSERT INTO `city` VALUES(1954,  'Esteban Rams', 22);
INSERT INTO `city` VALUES(1955,  'Esther', 22);
INSERT INTO `city` VALUES(1956,  'Esustolia', 22);
INSERT INTO `city` VALUES(1957,  'Eusebia', 22);
INSERT INTO `city` VALUES(1958,  'Felicia', 22);
INSERT INTO `city` VALUES(1959,  'Fidela', 22);
INSERT INTO `city` VALUES(1960,  'Fighiera', 22);
INSERT INTO `city` VALUES(1961,  'Firmat', 22);
INSERT INTO `city` VALUES(1962,  'Florencia', 22);
INSERT INTO `city` VALUES(1963,  'Fortín Olmos', 22);
INSERT INTO `city` VALUES(1964,  'Franck', 22);
INSERT INTO `city` VALUES(1965,  'Fray Luis Beltrán', 22);
INSERT INTO `city` VALUES(1966,  'Frontera', 22);
INSERT INTO `city` VALUES(1967,  'Fuentes', 22);
INSERT INTO `city` VALUES(1968,  'Funes', 22);
INSERT INTO `city` VALUES(1969,  'Gaboto', 22);
INSERT INTO `city` VALUES(1970,  'Galisteo', 22);
INSERT INTO `city` VALUES(1971,  'Gálvez', 22);
INSERT INTO `city` VALUES(1972,  'Garabalto', 22);
INSERT INTO `city` VALUES(1973,  'Garibaldi', 22);
INSERT INTO `city` VALUES(1974,  'Gato Colorado', 22);
INSERT INTO `city` VALUES(1975,  'Gdor. Crespo', 22);
INSERT INTO `city` VALUES(1976,  'Gessler', 22);
INSERT INTO `city` VALUES(1977,  'Godoy', 22);
INSERT INTO `city` VALUES(1978,  'Golondrina', 22);
INSERT INTO `city` VALUES(1979,  'Gral. Gelly', 22);
INSERT INTO `city` VALUES(1980,  'Gral. Lagos', 22);
INSERT INTO `city` VALUES(1981,  'Granadero Baigorria', 22);
INSERT INTO `city` VALUES(1982,  'Gregoria Perez De Denis', 22);
INSERT INTO `city` VALUES(1983,  'Grutly', 22);
INSERT INTO `city` VALUES(1984,  'Guadalupe N.', 22);
INSERT INTO `city` VALUES(1985,  'Gödeken', 22);
INSERT INTO `city` VALUES(1986,  'Helvecia', 22);
INSERT INTO `city` VALUES(1987,  'Hersilia', 22);
INSERT INTO `city` VALUES(1988,  'Hipatía', 22);
INSERT INTO `city` VALUES(1989,  'Huanqueros', 22);
INSERT INTO `city` VALUES(1990,  'Hugentobler', 22);
INSERT INTO `city` VALUES(1991,  'Hughes', 22);
INSERT INTO `city` VALUES(1992,  'Humberto 1º', 22);
INSERT INTO `city` VALUES(1993,  'Humboldt', 22);
INSERT INTO `city` VALUES(1994,  'Ibarlucea', 22);
INSERT INTO `city` VALUES(1995,  'Ing. Chanourdie', 22);
INSERT INTO `city` VALUES(1996,  'Intiyaco', 22);
INSERT INTO `city` VALUES(1997,  'Ituzaingó', 22);
INSERT INTO `city` VALUES(1998,  'Jacinto L. Aráuz', 22);
INSERT INTO `city` VALUES(1999,  'Josefina', 22);
INSERT INTO `city` VALUES(2000,  'Juan B. Molina', 22);
INSERT INTO `city` VALUES(2001,  'Juan de Garay', 22);
INSERT INTO `city` VALUES(2002,  'Juncal', 22);
INSERT INTO `city` VALUES(2003,  'La Brava', 22);
INSERT INTO `city` VALUES(2004,  'La Cabral', 22);
INSERT INTO `city` VALUES(2005,  'La Camila', 22);
INSERT INTO `city` VALUES(2006,  'La Chispa', 22);
INSERT INTO `city` VALUES(2007,  'La Clara', 22);
INSERT INTO `city` VALUES(2008,  'La Criolla', 22);
INSERT INTO `city` VALUES(2009,  'La Gallareta', 22);
INSERT INTO `city` VALUES(2010,  'La Lucila', 22);
INSERT INTO `city` VALUES(2011,  'La Pelada', 22);
INSERT INTO `city` VALUES(2012,  'La Penca', 22);
INSERT INTO `city` VALUES(2013,  'La Rubia', 22);
INSERT INTO `city` VALUES(2014,  'La Sarita', 22);
INSERT INTO `city` VALUES(2015,  'La Vanguardia', 22);
INSERT INTO `city` VALUES(2016,  'Labordeboy', 22);
INSERT INTO `city` VALUES(2017,  'Laguna Paiva', 22);
INSERT INTO `city` VALUES(2018,  'Landeta', 22);
INSERT INTO `city` VALUES(2019,  'Lanteri', 22);
INSERT INTO `city` VALUES(2020,  'Larrechea', 22);
INSERT INTO `city` VALUES(2021,  'Las Avispas', 22);
INSERT INTO `city` VALUES(2022,  'Las Bandurrias', 22);
INSERT INTO `city` VALUES(2023,  'Las Garzas', 22);
INSERT INTO `city` VALUES(2024,  'Las Palmeras', 22);
INSERT INTO `city` VALUES(2025,  'Las Parejas', 22);
INSERT INTO `city` VALUES(2026,  'Las Petacas', 22);
INSERT INTO `city` VALUES(2027,  'Las Rosas', 22);
INSERT INTO `city` VALUES(2028,  'Las Toscas', 22);
INSERT INTO `city` VALUES(2029,  'Las Tunas', 22);
INSERT INTO `city` VALUES(2030,  'Lazzarino', 22);
INSERT INTO `city` VALUES(2031,  'Lehmann', 22);
INSERT INTO `city` VALUES(2032,  'Llambi Campbell', 22);
INSERT INTO `city` VALUES(2033,  'Logroño', 22);
INSERT INTO `city` VALUES(2034,  'Loma Alta', 22);
INSERT INTO `city` VALUES(2035,  'López', 22);
INSERT INTO `city` VALUES(2036,  'Los Amores', 22);
INSERT INTO `city` VALUES(2037,  'Los Cardos', 22);
INSERT INTO `city` VALUES(2038,  'Los Laureles', 22);
INSERT INTO `city` VALUES(2039,  'Los Molinos', 22);
INSERT INTO `city` VALUES(2040,  'Los Quirquinchos', 22);
INSERT INTO `city` VALUES(2041,  'Lucio V. Lopez', 22);
INSERT INTO `city` VALUES(2042,  'Luis Palacios', 22);
INSERT INTO `city` VALUES(2043,  'Ma. Juana', 22);
INSERT INTO `city` VALUES(2044,  'Ma. Luisa', 22);
INSERT INTO `city` VALUES(2045,  'Ma. Susana', 22);
INSERT INTO `city` VALUES(2046,  'Ma. Teresa', 22);
INSERT INTO `city` VALUES(2047,  'Maciel', 22);
INSERT INTO `city` VALUES(2048,  'Maggiolo', 22);
INSERT INTO `city` VALUES(2049,  'Malabrigo', 22);
INSERT INTO `city` VALUES(2050,  'Marcelino Escalada', 22);
INSERT INTO `city` VALUES(2051,  'Margarita', 22);
INSERT INTO `city` VALUES(2052,  'Matilde', 22);
INSERT INTO `city` VALUES(2053,  'Mauá', 22);
INSERT INTO `city` VALUES(2054,  'Máximo Paz', 22);
INSERT INTO `city` VALUES(2055,  'Melincué', 22);
INSERT INTO `city` VALUES(2056,  'Miguel Torres', 22);
INSERT INTO `city` VALUES(2057,  'Moisés Ville', 22);
INSERT INTO `city` VALUES(2058,  'Monigotes', 22);
INSERT INTO `city` VALUES(2059,  'Monje', 22);
INSERT INTO `city` VALUES(2060,  'Monte Obscuridad', 22);
INSERT INTO `city` VALUES(2061,  'Monte Vera', 22);
INSERT INTO `city` VALUES(2062,  'Montefiore', 22);
INSERT INTO `city` VALUES(2063,  'Montes de Oca', 22);
INSERT INTO `city` VALUES(2064,  'Murphy', 22);
INSERT INTO `city` VALUES(2065,  'Ñanducita', 22);
INSERT INTO `city` VALUES(2066,  'Naré', 22);
INSERT INTO `city` VALUES(2067,  'Nelson', 22);
INSERT INTO `city` VALUES(2068,  'Nicanor E. Molinas', 22);
INSERT INTO `city` VALUES(2069,  'Nuevo Torino', 22);
INSERT INTO `city` VALUES(2070,  'Oliveros', 22);
INSERT INTO `city` VALUES(2071,  'Palacios', 22);
INSERT INTO `city` VALUES(2072,  'Pavón', 22);
INSERT INTO `city` VALUES(2073,  'Pavón Arriba', 22);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_province_id_fk` (`province_id`),
  ADD KEY `name` (`name`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `city`
--
ALTER TABLE `city`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2077;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `city`
--
ALTER TABLE `city` ADD CONSTRAINT `city_province_fk` FOREIGN KEY (`province_id`) REFERENCES `province`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

CREATE TABLE address ( `id` BIGINT NOT NULL AUTO_INCREMENT , `street` VARCHAR(500) NOT NULL , `number` VARCHAR(10) NOT NULL , `city_id` BIGINT NOT NULL , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE `address` ADD CONSTRAINT `address_city_fk` FOREIGN KEY (`city_id`) REFERENCES `city`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE `client` ADD `social_reason` VARCHAR(300) NOT NULL AFTER `name`, ADD `cuil` VARCHAR(30) NOT NULL AFTER `social_reason`;

ALTER TABLE `client` ADD `address_id` BIGINT NOT NULL AFTER `email`;
ALTER TABLE `client` CHANGE `address_id` `address_id` BIGINT(20) NULL;

ALTER TABLE `client` ADD CONSTRAINT `client_address_fk` FOREIGN KEY (`address_id`) REFERENCES `address`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;


-- 13/03/2020 --

ALTER TABLE material ADD UNIQUE `name_unique` (`name`);

-- 17/03/2020 --


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

ALTER TABLE `client` ADD `acount_state` BIGINT NOT NULL AFTER `has_materials`;
