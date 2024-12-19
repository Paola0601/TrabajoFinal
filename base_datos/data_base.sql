-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         11.5.2-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para data_base
CREATE DATABASE IF NOT EXISTS `data_base` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci */;
USE `data_base`;

-- Volcando estructura para tabla data_base.compras
CREATE TABLE IF NOT EXISTS `compras` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` varchar(50) DEFAULT NULL,
  `productos` varchar(50) DEFAULT NULL,
  `total` decimal(20,2) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_compra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla data_base.compras: ~0 rows (aproximadamente)

-- Volcando estructura para tabla data_base.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT '0',
  `descripcion` varchar(50) DEFAULT '0',
  `precio` decimal(20,2) DEFAULT NULL,
  `imagen` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla data_base.productos: ~8 rows (aproximadamente)
INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `imagen`) VALUES
	(1, 'Paracetamol', 'Medicamento utilizado para reducir la fiebre y ali', 10.00, 'paracetamol.jpg'),
	(2, 'Ibuprofeno', 'Antiinflamatorio no esteroideo que ayuda a reducir', 15.00, 'ibuprofeno.jpg'),
	(3, 'Omeprazol', 'Inhibidor de la acidez gástrica usado para tratar ', 20.00, 'omeprazol.jpg'),
	(4, 'Aspirina', 'Medicamento utilizado para aliviar dolores leves, ', 5.00, 'aspirina.jpg'),
	(5, 'Diclofenaco', 'Anti-inflamatorio eficaz para aliviar dolores musc', 25.00, 'diclofenaco.jpg'),
	(6, 'Amoxicilina', 'Antibiótico indicado para tratar infecciones bacte', 30.00, 'amoxicilina.jpg'),
	(7, 'Loratadina', 'Antihistamínico que alivia los síntomas de alergia', 35.00, 'loratadina.jpg'),
	(8, 'Clonazepam', 'Medicamento ansiolítico usado para tratar trastorn', 40.00, 'clonazepam.jpg');

-- Volcando estructura para tabla data_base.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `dni` int(8) NOT NULL,
  `nombre` varchar(50) DEFAULT NULL,
  `correo` varchar(50) DEFAULT NULL,
  `contraseña` varchar(50) DEFAULT NULL,
  `fecha_registro` date DEFAULT NULL,
  PRIMARY KEY (`dni`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla data_base.usuarios: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
