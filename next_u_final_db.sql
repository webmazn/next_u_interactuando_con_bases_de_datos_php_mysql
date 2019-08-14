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
  `dia_completo` char(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `FK_nu_eventos_nu_usuarios` FOREIGN KEY (`id_usuario`) REFERENCES `nu_usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Volcando datos para la tabla nextu_final_db.nu_eventos: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `nu_eventos` DISABLE KEYS */;
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
