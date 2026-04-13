-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Apr 14, 2026 at 12:33 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `smartmeal_db`
--
CREATE DATABASE IF NOT EXISTS `smartmeal_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `smartmeal_db`;

-- --------------------------------------------------------

--
-- Table structure for table `ingredientes_usuario`
--

DROP TABLE IF EXISTS `ingredientes_usuario`;
CREATE TABLE `ingredientes_usuario` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `categoria` enum('proteínas','carbohidratos','verduras','otros') NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `precio` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredientes_usuario`
--

INSERT INTO `ingredientes_usuario` (`id`, `usuario_id`, `categoria`, `nombre`, `precio`) VALUES
(10, 1, 'carbohidratos', 'arroz', 500),
(11, 1, 'proteínas', 'pollo', 5000),
(12, 1, 'proteínas', 'carne', 7000),
(13, 1, 'proteínas', 'huevo', 12000),
(14, 1, 'proteínas', 'pescado', 7000),
(15, 1, 'carbohidratos', 'pan', 5000),
(16, 1, 'carbohidratos', 'aguacate', 5000),
(17, 1, 'carbohidratos', 'maiz', 7000),
(18, 1, 'verduras', 'tomate', 5000),
(19, 1, 'verduras', 'calabaza', 7000),
(21, 1, 'verduras', 'patata', 10000),
(22, 1, 'otros', 'leche', 5000),
(23, 1, 'otros', 'arepas', 10000),
(24, 1, 'otros', 'empanada', 12000),
(25, 1, 'otros', 'durazno', 7000),
(26, 1, 'verduras', 'lentejas', 8000),
(27, 3, 'proteínas', 'pollo', 5000),
(28, 3, 'proteínas', 'carne desmechada', 4800),
(29, 3, 'proteínas', 'jamon', 700),
(30, 3, 'proteínas', 'alas de pollo', 6000),
(31, 3, 'carbohidratos', 'arroz', 5000),
(32, 3, 'carbohidratos', 'papa', 1200),
(34, 3, 'carbohidratos', 'frijoles', 3000),
(35, 3, 'carbohidratos', 'pan integral', 1200),
(36, 3, 'verduras', 'cebolla', 1200),
(37, 3, 'verduras', 'tomate', 1000),
(38, 3, 'verduras', 'espinaca', 2000),
(39, 3, 'verduras', 'pepino', 2000),
(40, 3, 'otros', 'leche', 2000),
(41, 3, 'otros', 'queso', 2000),
(42, 3, 'otros', 'yogourd griego', 5000),
(43, 3, 'otros', 'galleta oreo', 1200);

-- --------------------------------------------------------

--
-- Table structure for table `presupuesto_semanal`
--

DROP TABLE IF EXISTS `presupuesto_semanal`;
CREATE TABLE `presupuesto_semanal` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `presupuesto_semanal`
--

INSERT INTO `presupuesto_semanal` (`id`, `usuario_id`, `monto`, `fecha`) VALUES
(1, 1, 15000, '2026-04-13'),
(2, 1, 15000, '2026-04-13'),
(3, 1, 15000, '2026-04-13'),
(4, 1, 15000, '2026-04-13'),
(5, 1, 70000, '2026-04-13'),
(6, 1, 70000, '2026-04-13'),
(7, 1, 70000, '2026-04-13'),
(8, 1, 70000, '2026-04-13'),
(9, 1, 70000, '2026-04-13'),
(10, 1, 70000, '2026-04-13'),
(11, 1, 70000, '2026-04-13'),
(12, 1, 70000, '2026-04-13'),
(13, 1, 80000, '2026-04-13'),
(14, 1, 80000, '2026-04-13'),
(15, 1, 90000, '2026-04-13'),
(16, 1, 90000, '2026-04-13'),
(17, 3, 80000, '2026-04-13');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `email`, `password`) VALUES
(1, 'jose ', 'janco2306@gmail.com', '$2b$10$qA.y91akzCJvK9nZCfmJGOwV/gDoIxCf2mE4rgs9UI002p7N2hwTO'),
(3, 'sara', 'valeriaramos264f@gmail.com', '$2b$10$hCclEOBevy4HLXtkCfgUFuQpLIb22AZBoDhK9R0YtQ3.4kjR42cRq');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ingredientes_usuario`
--
ALTER TABLE `ingredientes_usuario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `presupuesto_semanal`
--
ALTER TABLE `presupuesto_semanal`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ingredientes_usuario`
--
ALTER TABLE `ingredientes_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `presupuesto_semanal`
--
ALTER TABLE `presupuesto_semanal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ingredientes_usuario`
--
ALTER TABLE `ingredientes_usuario`
  ADD CONSTRAINT `ingredientes_usuario_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `presupuesto_semanal`
--
ALTER TABLE `presupuesto_semanal`
  ADD CONSTRAINT `presupuesto_semanal_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
