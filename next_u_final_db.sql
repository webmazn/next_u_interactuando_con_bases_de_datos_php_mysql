-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.13-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para nextu_final_db
CREATE DATABASE IF NOT EXISTS `nextu_final_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `nextu_final_db`;

-- Volcando estructura para tabla nextu_final_db.nu_eventos
CREATE TABLE IF NOT EXISTS `nu_eventos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) unsigned NOT NULL,
  `titulo` varchar(150) NOT NULL,
  `fec_inicio` date NOT NULL,
  `hor_inicio` time DEFAULT NULL,
  `fec_fin` date DEFAULT NULL,
  `hor_fin` time DEFAULT NULL,
  `dia_completo` tinyint(4) NOT NULL COMMENT '1 si 0 no',
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_nu_eventos_nu_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `nu_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla nextu_final_db.nu_eventos: ~27 rows (aproximadamente)
/*!40000 ALTER TABLE `nu_eventos` DISABLE KEYS */;
INSERT INTO `nu_eventos` (`id`, `id_usuario`, `titulo`, `fec_inicio`, `hor_inicio`, `fec_fin`, `hor_fin`, `dia_completo`) VALUES
	(1, 1, 'Evento 1', '2019-08-01', '16:45:34', '2019-08-01', '16:45:36', 0),
	(2, 1, 'Evento 2', '2019-08-14', '00:00:00', '0000-00-00', '00:00:00', 0),
	(3, 1, 'Evento 3', '2019-08-09', '16:45:34', '2019-08-09', '16:45:36', 0),
	(4, 1, 'Evento 4', '2019-08-23', '16:45:34', '2019-08-23', '16:45:36', 0),
	(5, 1, 'Evento 5', '2019-08-07', '16:45:34', '2019-08-07', '16:45:36', 0),
	(6, 1, 'Evento 6', '2019-08-20', '16:45:34', '2019-08-20', '16:45:36', 0),
	(7, 1, 'Evento 7', '2019-08-21', '16:45:34', '2019-08-21', '16:45:36', 0),
	(8, 1, 'Evento 8', '2019-08-12', '16:45:34', '2019-08-12', '16:45:36', 0),
	(9, 1, 'Evento 9', '2019-08-18', '00:00:00', '0000-00-00', '00:00:00', 0),
	(10, 1, 'Evento 10', '2019-08-05', '00:00:00', '0000-00-00', '00:00:00', 0),
	(11, 2, 'Evento 11', '2019-08-22', '16:45:34', '2019-08-22', '16:45:36', 0),
	(12, 2, 'Evento 12', '2019-08-19', '16:45:34', '2019-08-19', '16:45:36', 0),
	(13, 2, 'Evento 13', '2019-08-19', '16:45:34', '2019-08-19', '16:45:36', 0),
	(14, 2, 'Evento 14', '2019-08-25', '16:45:34', '2019-08-25', '16:45:36', 0),
	(15, 2, 'Evento 15', '2019-08-06', '16:45:34', '2019-08-06', '16:45:36', 0),
	(16, 2, 'Evento 16', '2019-08-02', '16:45:34', '2019-08-02', '16:45:36', 0),
	(17, 2, 'Evento 17', '2019-08-09', '16:45:34', '2019-08-09', '16:45:36', 0),
	(18, 2, 'Evento 18', '2019-08-16', '16:45:34', '2019-08-16', '16:45:36', 0),
	(19, 2, 'Evento 19', '2019-08-20', '16:45:34', '2019-08-20', '16:45:36', 0),
	(20, 2, 'Evento 20', '2019-08-24', '16:45:34', '2019-08-24', '16:45:36', 0),
	(21, 3, 'Evento 21', '2019-08-10', '16:45:34', '2019-08-10', '16:45:36', 0),
	(22, 3, 'Evento 22', '2019-08-06', '16:45:34', '2019-08-06', '16:45:36', 0),
	(23, 3, 'Evento 23', '2019-08-08', '16:45:34', '2019-08-08', '16:45:36', 0),
	(24, 3, 'Evento 24', '2019-08-22', '16:45:34', '2019-08-22', '16:45:36', 0),
	(25, 3, 'Evento 25', '2019-08-21', '16:45:34', '2019-08-21', '16:45:36', 0),
	(26, 3, 'Evento 26', '2019-08-10', '16:45:34', '2019-08-10', '16:45:36', 0),
	(27, 3, 'Evento 27', '2019-08-20', '16:45:34', '2019-08-20', '16:45:36', 0),
	(28, 3, 'Evento 28', '2019-08-25', '16:45:34', '2019-08-25', '16:45:36', 0),
	(29, 3, 'Evento 29', '2019-08-28', '16:45:34', '2019-08-28', '16:45:36', 0),
	(30, 3, 'Evento 30', '2019-08-21', '16:45:34', '2019-08-21', '16:45:36', 0),
	(31, 1, 'Evento 31', '2019-08-13', '08:00:00', '2019-08-13', '08:30:00', 0),
	(32, 1, 'Evento 32', '2019-08-16', '08:00:00', '2019-08-16', '08:30:00', 0),
	(33, 1, 'Evento Manual', '2019-08-24', '00:00:00', '0000-00-00', '00:00:00', 1),
	(35, 1, 'Evento PerÃº', '2019-08-27', '00:00:00', '2019-08-30', '00:00:00', 0),
	(36, 1, 'Maycol Zambrano NuÃ±ez', '2019-08-21', '00:00:00', '2019-08-24', '00:00:00', 0),
	(37, 1, 'Nuevo Evento', '2019-08-05', '00:00:00', '2019-08-10', '00:00:00', 0);
/*!40000 ALTER TABLE `nu_eventos` ENABLE KEYS */;

-- Volcando estructura para tabla nextu_final_db.nu_usuarios
CREATE TABLE IF NOT EXISTS `nu_usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(75) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `fec_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla nextu_final_db.nu_usuarios: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `nu_usuarios` DISABLE KEYS */;
INSERT INTO `nu_usuarios` (`id`, `email`, `clave`, `nombre`, `fec_nacimiento`) VALUES
	(1, 'maycol_630@hotmail.com', '$2y$10$Xzg6CH4xxMz107jyIZx0POsx/fY1www29UnUNMM5MclkuZK1dEA1O', 'Maycol Zambrano NuÃ±ez', '1986-01-07'),
	(2, 'alexis_630@hotmail.com', '$2y$10$mcRM4lwRZI2FiiWWvCjtnudQKnkTd1LKGr4/LfEqXFJXWX1WkW62q', 'Ricardo Sanchez Gomez', '1989-04-17'),
	(3, 'zamnun_630@hotmail.com', '$2y$10$v1crNzYdxJMwHxk1WhIfsuKl6N1PiX2VyFVs3orrAt/TsRBlKwDmS', 'Fredy Rios SantibaÃ±ez', '1990-11-27');
/*!40000 ALTER TABLE `nu_usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
