-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-07-2024 a las 22:27:06
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
-- Base de datos: `crm_odoo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `archivadores`
--

CREATE TABLE `archivadores` (
  `id_archivador` int(11) NOT NULL,
  `nombre_archivador` varchar(255) NOT NULL,
  `imagen_archivador` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaciones`
--

CREATE TABLE `asignaciones` (
  `id_asignacion` int(11) NOT NULL,
  `id_tarea` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_libreta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_de_las_tareas`
--

CREATE TABLE `estados_de_las_tareas` (
  `id_estado` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `color` varchar(255) NOT NULL,
  `fondo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `estados_de_las_tareas`
--

INSERT INTO `estados_de_las_tareas` (`id_estado`, `nombre`, `color`, `fondo`) VALUES
(1, 'Pendiente', '#FF0000', '#FFE5E5'),
(2, 'En Progreso', '#FFA500', '#FFF5E5'),
(3, 'Completado', '#008000', '#E5FFE5'),
(4, 'En Espera', '#0000FF', '#E5E5FF'),
(5, 'Cancelado', '#808080', '#F0F0F0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `etapas`
--

CREATE TABLE `etapas` (
  `id_etapa` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_pipeline` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `etapas`
--

INSERT INTO `etapas` (`id_etapa`, `nombre`, `descripcion`, `id_pipeline`) VALUES
(1, 'Etapa 1 - testeo', 'Sale enlace en pipeline', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libretas`
--

CREATE TABLE `libretas` (
  `id_libreta` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen_libreta` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `archivador_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `libretas`
--

INSERT INTO `libretas` (`id_libreta`, `titulo`, `descripcion`, `imagen_libreta`, `user_id`, `archivador_id`) VALUES
(3, 'Libreta 1', 'Tareas de programacion', 'attachment_81310971.jpeg', 3, NULL),
(4, 'Libreta 2', 'Esta libreta no debe de tener ninguna tarea', 'logo.png', 3, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pipeline`
--

CREATE TABLE `pipeline` (
  `id_pipeline` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `pipeline`
--

INSERT INTO `pipeline` (`id_pipeline`, `nombre`, `descripcion`, `id_usuario`) VALUES
(1, 'Pipeline de ejemplo', 'Este es de ejemplo para ver que funciona', 3),
(2, 'Pipeline 2', 'aaaaa', 3),
(3, 'Pipeline 23', 'aaaaa', 3),
(4, 'Pipeline4', 'aaaaa', 3),
(5, 'Pipeline 5', 'aaaaa', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `portadas`
--

CREATE TABLE `portadas` (
  `id_portada` int(11) NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `imagen_portada` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `portadas`
--

INSERT INTO `portadas` (`id_portada`, `titulo`, `descripcion`, `imagen_portada`) VALUES
(1, 'Portada 1', 'Descripción de portada 1', '../bandeja_de_recursos/ss/portada1.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posiciones`
--

CREATE TABLE `posiciones` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pipeline_id` int(11) NOT NULL,
  `posicion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `posiciones`
--

INSERT INTO `posiciones` (`id`, `user_id`, `pipeline_id`, `posicion`) VALUES
(61, 3, 5, 0),
(62, 3, 4, 1),
(63, 3, 3, 2),
(64, 3, 2, 3),
(65, 3, 1, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prioridades`
--

CREATE TABLE `prioridades` (
  `id_prioridad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `color` varchar(7) NOT NULL,
  `fondo` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `prioridades`
--

INSERT INTO `prioridades` (`id_prioridad`, `nombre`, `color`, `fondo`) VALUES
(1, 'Alta', '#FF0000', '#FFE5E5'),
(2, 'Media', '#FFA500', '#FFF5E5'),
(3, 'Baja', '#008000', '#E5FFE5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(50) NOT NULL,
  `descripcion` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`, `descripcion`) VALUES
(1, 'Administrador', 'Tiene acceso completo a todas las funcionalidades del blog.'),
(2, 'Editor', 'Puede editar y publicar todas las entradas, pero no tiene acceso a la configuración del blog.'),
(3, 'Autor', 'Puede escribir y publicar sus propias entradas.'),
(4, 'Colaborador', 'Puede escribir y editar sus propias entradas, pero no puede publicarlas.'),
(5, 'Invitado', 'Puede leer y comentar en las entradas del blog.'),
(6, 'SuperAdministrador', 'Este tendrá todos los poderes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tareas`
--

CREATE TABLE `tareas` (
  `id_tarea` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  `links_de_archivos` varchar(255) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `fecha_de_creacion` datetime NOT NULL DEFAULT current_timestamp(),
  `user_id` int(11) NOT NULL,
  `portada_id` int(11) DEFAULT NULL,
  `libreta_id` int(11) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `prioridad_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `correo_electronico` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL,
  `id_rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish2_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `nombre_usuario`, `password`, `correo_electronico`, `status`, `id_rol`) VALUES
(3, 'Milanes', '4684c609febdc7395a914ee8dc918f85', 'test1@gmail.com', 'online', 1),
(4, 'test1', '4684c609febdc7395a914ee8dc918f85', 'test@gmail.com', 'offline', 3);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `archivadores`
--
ALTER TABLE `archivadores`
  ADD PRIMARY KEY (`id_archivador`);

--
-- Indices de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD PRIMARY KEY (`id_asignacion`),
  ADD KEY `id_tarea` (`id_tarea`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_libreta` (`id_libreta`);

--
-- Indices de la tabla `estados_de_las_tareas`
--
ALTER TABLE `estados_de_las_tareas`
  ADD PRIMARY KEY (`id_estado`);

--
-- Indices de la tabla `etapas`
--
ALTER TABLE `etapas`
  ADD PRIMARY KEY (`id_etapa`),
  ADD KEY `fk_etapas_pipeline` (`id_pipeline`);

--
-- Indices de la tabla `libretas`
--
ALTER TABLE `libretas`
  ADD PRIMARY KEY (`id_libreta`),
  ADD KEY `fk_libretas_usuarios` (`user_id`),
  ADD KEY `fk_libretas_archivadores` (`archivador_id`);

--
-- Indices de la tabla `pipeline`
--
ALTER TABLE `pipeline`
  ADD PRIMARY KEY (`id_pipeline`),
  ADD KEY `fk_pipeline_usuarios` (`id_usuario`);

--
-- Indices de la tabla `portadas`
--
ALTER TABLE `portadas`
  ADD PRIMARY KEY (`id_portada`);

--
-- Indices de la tabla `posiciones`
--
ALTER TABLE `posiciones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `pipeline_id` (`pipeline_id`);

--
-- Indices de la tabla `prioridades`
--
ALTER TABLE `prioridades`
  ADD PRIMARY KEY (`id_prioridad`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD PRIMARY KEY (`id_tarea`),
  ADD KEY `fk_tareas_usuarios` (`user_id`),
  ADD KEY `fk_tareas_portadas` (`portada_id`),
  ADD KEY `fk_tareas_libretas` (`libreta_id`),
  ADD KEY `fk_tareas_estados` (`id_estado`),
  ADD KEY `fk_tareas_prioridades` (`prioridad_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fk_usuarios_roles` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `archivadores`
--
ALTER TABLE `archivadores`
  MODIFY `id_archivador` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  MODIFY `id_asignacion` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `estados_de_las_tareas`
--
ALTER TABLE `estados_de_las_tareas`
  MODIFY `id_estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `etapas`
--
ALTER TABLE `etapas`
  MODIFY `id_etapa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `libretas`
--
ALTER TABLE `libretas`
  MODIFY `id_libreta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `pipeline`
--
ALTER TABLE `pipeline`
  MODIFY `id_pipeline` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `portadas`
--
ALTER TABLE `portadas`
  MODIFY `id_portada` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `posiciones`
--
ALTER TABLE `posiciones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT de la tabla `prioridades`
--
ALTER TABLE `prioridades`
  MODIFY `id_prioridad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `tareas`
--
ALTER TABLE `tareas`
  MODIFY `id_tarea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignaciones`
--
ALTER TABLE `asignaciones`
  ADD CONSTRAINT `asignaciones_ibfk_1` FOREIGN KEY (`id_tarea`) REFERENCES `tareas` (`id_tarea`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE,
  ADD CONSTRAINT `asignaciones_ibfk_3` FOREIGN KEY (`id_libreta`) REFERENCES `libretas` (`id_libreta`) ON DELETE CASCADE;

--
-- Filtros para la tabla `etapas`
--
ALTER TABLE `etapas`
  ADD CONSTRAINT `fk_etapas_pipeline` FOREIGN KEY (`id_pipeline`) REFERENCES `pipeline` (`id_pipeline`) ON DELETE CASCADE;

--
-- Filtros para la tabla `libretas`
--
ALTER TABLE `libretas`
  ADD CONSTRAINT `fk_libretas_archivadores` FOREIGN KEY (`archivador_id`) REFERENCES `archivadores` (`id_archivador`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_libretas_usuarios` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pipeline`
--
ALTER TABLE `pipeline`
  ADD CONSTRAINT `fk_pipeline_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `posiciones`
--
ALTER TABLE `posiciones`
  ADD CONSTRAINT `posiciones_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id_usuario`),
  ADD CONSTRAINT `posiciones_ibfk_2` FOREIGN KEY (`pipeline_id`) REFERENCES `pipeline` (`id_pipeline`);

--
-- Filtros para la tabla `tareas`
--
ALTER TABLE `tareas`
  ADD CONSTRAINT `fk_tareas_estados` FOREIGN KEY (`id_estado`) REFERENCES `estados_de_las_tareas` (`id_estado`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tareas_libretas` FOREIGN KEY (`libreta_id`) REFERENCES `libretas` (`id_libreta`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tareas_portadas` FOREIGN KEY (`portada_id`) REFERENCES `portadas` (`id_portada`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tareas_prioridades` FOREIGN KEY (`prioridad_id`) REFERENCES `prioridades` (`id_prioridad`) ON DELETE SET NULL,
  ADD CONSTRAINT `fk_tareas_usuarios` FOREIGN KEY (`user_id`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_usuarios_roles` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
