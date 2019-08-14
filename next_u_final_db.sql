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
CREATE DATABASE IF NOT EXISTS `nextu_final_db` /*!40100 DEFAULT CHARACTER SET latin1 */;
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

-- La exportación de datos fue deseleccionada.
-- Volcando estructura para tabla nextu_final_db.nu_usuarios
CREATE TABLE IF NOT EXISTS `nu_usuarios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(75) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `nombre` varchar(250) NOT NULL,
  `fec_nacimiento` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
