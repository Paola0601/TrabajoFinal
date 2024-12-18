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
  `id_usuario` varchar(50) NOT NULL,
  `productos` varchar(50) NOT NULL,
  `total` decimal(20,6) NOT NULL DEFAULT 0.000000,
  `fecha` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`id_compra`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla data_base.compras: ~0 rows (aproximadamente)

-- Volcando estructura para tabla data_base.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `precio` decimal(20,6) NOT NULL,
  `imagen` varchar(255) NOT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla data_base.productos: ~14 rows (aproximadamente)
INSERT INTO `productos` (`id_producto`, `nombre`, `descripcion`, `precio`, `categoria`) VALUES
	(1, 'Paracetamol 500mg', 'Pastillas para fiebre y dolor', 2.500000, 'Analgesicos'),
	(2, 'Ibuprofeno 400mg', 'Antiinflamatorio y analgésico', 3.200000, 'Antiinflamatorios'),
	(3, 'Amoxicilina 500mg', 'Antibiótico de amplio espectro', 7.500000, 'Antibióticos'),
	(4, 'Jarabe para la tos', 'Alivio de tos seca', 4.800000, 'Jarabes'),
	(5, 'Vitamina C 1000mg', 'Suplemento para el sistema inmunológico', 5.000000, 'Vitaminas'),
	(6, 'Loratadina 10mg', 'Antihistamínico para alergias', 2.700000, 'Antialérgicos'),
	(7, 'Omeprazol 20mg', 'Protector gástrico', 6.300000, 'Antiácidos'),
	(8, 'Salbutamol Inhalador', 'Broncodilatador para asma', 15.000000, 'Inhaladores'),
	(9, 'Metformina 850mg', 'Control de glucosa en diabetes', 3.900000, 'Antidiabéticos'),
	(10, 'Diclofenaco Gel', 'Antiinflamatorio tópico', 6.500000, 'Cremas y Gel'),
	(11, 'Clorfenamina 4mg', 'Antihistamínico para rinitis alérgica', 1.800000, 'Antialérgicos'),
	(12, 'Acetaminofén Gotas', 'Analgésico para niños', 3.200000, 'Analgésicos'),
	(13, 'Jarabe Ambroxol', 'Mucolítico para vías respiratorias', 4.500000, 'Jarabes'),
	(14, 'Insulina 100 UI', 'Hormona para control de diabetes', 25.000000, 'Antidiabéticos');

-- Volcando estructura para tabla data_base.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `dni` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '',
  `correo` varchar(50) NOT NULL,
  `contraseña` varchar(50) NOT NULL,
  `fecha_registro` date NOT NULL,
  PRIMARY KEY (`dni`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- Volcando datos para la tabla data_base.usuarios: ~0 rows (aproximadamente)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
INSERT INTO productos (nombre, descripcion, precio, imagen) VALUES
('Paracetamol', 'Este producto es bueno para la tos', 10.00, 'paracetamol.jpg'),
('Ibuprofeno', 'Este producto es bueno para el dolor de cabeza', 15.00, 'ibuprofeno.jpg'),
('Omeprazol', 'Este producto es bueno para el dolor de estomago', 20.00, 'omeprazol.jpg'),
('Aspirina', 'Este producto es bueno para el dolor de cabeza', 5.00, 'aspirina.jpg'),
('Diclofenaco', 'Este producto es bueno para el dolor de cabeza', 25.00, 'diclofenaco.jpg'),
('Amoxicilina', 'Este producto es bueno para la tos', 30.00, 'amoxicilina.jpg'),
('Loratadina', 'Este producto es bueno para la tos', 35.00, 'loratadina.jpg'),
('Clonazepam', 'Este producto es bueno para la tos', 40.00, 'clonazepam.jpg');