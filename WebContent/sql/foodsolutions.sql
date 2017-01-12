-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.40 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for foodsolutions
DROP DATABASE IF EXISTS `foodsolutions`;
CREATE DATABASE IF NOT EXISTS `foodsolutions` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `foodsolutions`;

-- Dumping structure for table foodsolutions.customer
DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `migrationId` varchar(45) DEFAULT NULL,
  `terms` varchar(10) DEFAULT NULL,
  `accountCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `migrationId_UNIQUE` (`migrationId`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.customer: ~12 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
REPLACE INTO `customer` (`id`, `name`, `migrationId`, `terms`, `accountCode`) VALUES
	(0, '', NULL, NULL, NULL),
	(11, 'NTUC1', NULL, NULL, NULL),
	(13, 'NTUC2', NULL, NULL, NULL),
	(14, '9999999', NULL, NULL, NULL),
	(15, 'NTUC444', NULL, NULL, NULL),
	(16, 'NTUC222', NULL, NULL, NULL),
	(17, 'NTUCO', NULL, NULL, NULL),
	(18, 'NTUC11', NULL, NULL, NULL),
	(21, 'NTUC521', NULL, NULL, NULL),
	(22, 'NTUC11122', NULL, NULL, NULL),
	(23, 'NTUC', NULL, NULL, NULL),
	(32, 'NTUC12', NULL, NULL, NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.customerbillcontact
DROP TABLE IF EXISTS `customerbillcontact`;
CREATE TABLE IF NOT EXISTS `customerbillcontact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `billAttention` varchar(45) DEFAULT NULL,
  `billTelephone` varchar(45) DEFAULT NULL,
  `billMobile` varchar(45) DEFAULT NULL,
  `billEmail` varchar(45) DEFAULT NULL,
  `billFax` varchar(45) DEFAULT NULL,
  `billAddress1` varchar(45) DEFAULT NULL,
  `billAddress2` varchar(45) DEFAULT NULL,
  `billAddress3` varchar(45) DEFAULT NULL,
  `billPostcode` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `customerBillContact_idx` (`customerId`),
  CONSTRAINT `billContact_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.customerbillcontact: ~24 rows (approximately)
/*!40000 ALTER TABLE `customerbillcontact` DISABLE KEYS */;
REPLACE INTO `customerbillcontact` (`id`, `customerId`, `billAttention`, `billTelephone`, `billMobile`, `billEmail`, `billFax`, `billAddress1`, `billAddress2`, `billAddress3`, `billPostcode`) VALUES
	(13, 15, 'ray', '98789878', '98789878', '1@q.com', '98789878', 'jurong east', '', '', '999999'),
	(14, 16, 'ation', '22', '2222', 't@q.com', '22', 'jurong east 21', '', '', '222222'),
	(15, 17, 'ooo', '9999', '9999999', 'o@qq.com', '999', '9999999', '', '', '999999'),
	(16, 18, '111', '1', '1', '1@qqq.s', '1', '1111111', '', '', '111111'),
	(17, 21, 'try', '0', '0', '1@q.a', '0', 'jurong east', '', '', '0'),
	(18, 22, '1111', '0', '0', '1@1.a', '0', 'jurong east', '', '', '0'),
	(19, 23, '111', '1', '1', '1@1.1', '1', 'jurong east 21', '', '', '111111'),
	(22, 11, 'dddddddddddd', '', '', '', NULL, '', '', '', '161231'),
	(23, 11, 'sssss', '', '', '', NULL, '', '', '', '111110'),
	(24, 13, '1111111', '', '', '', NULL, '', '', '', '11111'),
	(25, 13, 'lkfjlk', '', '99999777', 'kldsfs@qq.com', NULL, '', '', '', '888888'),
	(26, 13, 'thomas', '', '', '', NULL, '', '', '', '777777'),
	(27, 11, 'dddddddddddd', '', '', '', NULL, '', '', '', '333333'),
	(28, 11, 'dddddddddddd', '', '', '', NULL, '', '', '', '333333'),
	(29, 14, 'money', '', '', '', NULL, '', '', '', '0'),
	(30, 13, 'dddddddddddd', '', '', '', NULL, '', '', '', '22222'),
	(31, 13, 'dddddddddddd', '', '', '', NULL, '', '', '', '33333'),
	(32, 13, 'dddddddddddd', '', '', '', NULL, '', '', '', '33333'),
	(33, 13, 'dddddddddddd', '', '', '', NULL, '', '', '', '33333'),
	(34, 13, '33333333', '', '', '', NULL, '', '', '', '33333'),
	(38, 11, '请求权', NULL, '12222221', 'jjj@qq.com', NULL, NULL, NULL, NULL, NULL),
	(39, 32, '杰拉德1', NULL, NULL, 'jjjj@gmail.com', NULL, NULL, NULL, NULL, NULL),
	(40, 23, 'dddddddddddd', NULL, NULL, 'kldsfs@qq.com', NULL, NULL, NULL, NULL, NULL),
	(42, 32, '请求权1', NULL, NULL, 'jjj@qq.com', NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `customerbillcontact` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.customerdeliverycontact
DROP TABLE IF EXISTS `customerdeliverycontact`;
CREATE TABLE IF NOT EXISTS `customerdeliverycontact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customerId` int(11) NOT NULL,
  `deliveryAttention` varchar(45) DEFAULT NULL,
  `deliveryTelephone` varchar(45) DEFAULT NULL,
  `deliveryMobile` varchar(45) DEFAULT NULL,
  `deliveryEmail` varchar(45) DEFAULT NULL,
  `deliveryAddress1` varchar(45) DEFAULT NULL,
  `deliveryAddress2` varchar(45) DEFAULT NULL,
  `deliveryAddress3` varchar(45) DEFAULT NULL,
  `deliveryPostcode` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `deliveryContact_customer_idx` (`customerId`),
  CONSTRAINT `deliveryContact_customer` FOREIGN KEY (`customerId`) REFERENCES `customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.customerdeliverycontact: ~7 rows (approximately)
/*!40000 ALTER TABLE `customerdeliverycontact` DISABLE KEYS */;
REPLACE INTO `customerdeliverycontact` (`id`, `customerId`, `deliveryAttention`, `deliveryTelephone`, `deliveryMobile`, `deliveryEmail`, `deliveryAddress1`, `deliveryAddress2`, `deliveryAddress3`, `deliveryPostcode`) VALUES
	(7, 15, 'ray', '98789878', NULL, '1@q.com', 'jurong east', '', '', '999999'),
	(8, 16, 'ation', '22', NULL, 't@q.com', 'jurong east 21', '', '', '222222'),
	(9, 17, 'ooo', '9999', NULL, 'o@qq.com', '9999999', '', '', '999999'),
	(10, 18, '111', '1', NULL, '1@qqq.s', '1111111', '', '', '111111'),
	(11, 21, 'try', '0', NULL, '1@q.a', 'jurong east', '', '', '0'),
	(12, 22, '1111', '0', NULL, '1@1.a', 'jurong east', '', '', '0'),
	(13, 23, '111', '1', NULL, '1@1.1', 'jurong east 21', '', '', '111111');
/*!40000 ALTER TABLE `customerdeliverycontact` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.menu
DROP TABLE IF EXISTS `menu`;
CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuCategoryId` int(11) DEFAULT NULL,
  `menuName` varchar(45) DEFAULT NULL,
  `price` decimal(2,0) DEFAULT NULL,
  `minPax` int(11) DEFAULT NULL,
  `kitchenTime` decimal(2,0) DEFAULT NULL,
  `deliveryTime` decimal(2,0) DEFAULT NULL,
  `collectionTime` decimal(2,0) DEFAULT NULL,
  `multipleDelivery` int(11) DEFAULT NULL COMMENT '1=运送1次\n2=运送2次\n3=运送3次\n以此类推',
  `onlineShow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.menu: ~6 rows (approximately)
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
REPLACE INTO `menu` (`id`, `menuCategoryId`, `menuName`, `price`, `minPax`, `kitchenTime`, `deliveryTime`, `collectionTime`, `multipleDelivery`, `onlineShow`) VALUES
	(1, 1, 'menu1', 5, 34, NULL, NULL, NULL, 3, 0),
	(2, 2, 'Bento $9/per', 6, 32, NULL, NULL, NULL, 3, 0),
	(3, 1, 'buffet $12/per', 90, 56, NULL, NULL, NULL, 2, 0),
	(4, 1, '  menu2', 5, 34, NULL, NULL, NULL, 3, 1),
	(5, 5, ' BBQ Set B', 90, 56, NULL, NULL, NULL, 1, 1),
	(6, 5, 'BBQ Set A', 90, 56, NULL, NULL, NULL, 1, 1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.menucategory
DROP TABLE IF EXISTS `menucategory`;
CREATE TABLE IF NOT EXISTS `menucategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuCategoryName` varchar(45) DEFAULT NULL,
  `onlineShow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.menucategory: ~6 rows (approximately)
/*!40000 ALTER TABLE `menucategory` DISABLE KEYS */;
REPLACE INTO `menucategory` (`id`, `menuCategoryName`, `onlineShow`) VALUES
	(1, '   buffet', 1),
	(2, ' bento', 1),
	(3, ' Chinese New Year 2017', 1),
	(4, 'weding', 0),
	(5, 'BBQ Party', 0),
	(6, ' Tea Register', 1);
/*!40000 ALTER TABLE `menucategory` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.menuitem
DROP TABLE IF EXISTS `menuitem`;
CREATE TABLE IF NOT EXISTS `menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) DEFAULT NULL,
  `stockId` int(11) DEFAULT NULL,
  `onlineName` varchar(45) DEFAULT NULL COMMENT 'default show stock description',
  `menuItemGroupId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.menuitem: ~2 rows (approximately)
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;
REPLACE INTO `menuitem` (`id`, `menuId`, `stockId`, `onlineName`, `menuItemGroupId`) VALUES
	(4, 6, 2, 'BBQ FoodItem A', 2),
	(5, 3, 2, 'foodItem Tea', 1);
/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.menuitemgroup
DROP TABLE IF EXISTS `menuitemgroup`;
CREATE TABLE IF NOT EXISTS `menuitemgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuItemGroupName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.menuitemgroup: ~2 rows (approximately)
/*!40000 ALTER TABLE `menuitemgroup` DISABLE KEYS */;
REPLACE INTO `menuitemgroup` (`id`, `menuItemGroupName`) VALUES
	(1, 'Rice'),
	(2, ' Appetizer');
/*!40000 ALTER TABLE `menuitemgroup` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.purchaseorder
DROP TABLE IF EXISTS `purchaseorder`;
CREATE TABLE IF NOT EXISTS `purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ponumber` varchar(11) NOT NULL,
  `date` date NOT NULL,
  `preparedBy` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ponumber` (`ponumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.purchaseorder: ~0 rows (approximately)
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.purchaseorderitems
DROP TABLE IF EXISTS `purchaseorderitems`;
CREATE TABLE IF NOT EXISTS `purchaseorderitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poId` int(11) NOT NULL,
  `stockId` int(11) DEFAULT NULL,
  `itemdescription` varchar(200) NOT NULL,
  `prId` int(11) DEFAULT NULL,
  `purchaseQty` int(11) NOT NULL,
  `purchaseUom` varchar(6) NOT NULL,
  `requestQty` int(11) NOT NULL,
  `requestUom` varchar(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_purchaseorderitems_purchaseorder` (`poId`),
  KEY `FK_purchaseorderitems_stockitem` (`stockId`),
  KEY `FK_purchaseorderitems_purchaserequest` (`prId`),
  CONSTRAINT `FK_purchaseorderitems_purchaseorder` FOREIGN KEY (`poId`) REFERENCES `purchaseorder` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_purchaseorderitems_purchaserequest` FOREIGN KEY (`prId`) REFERENCES `purchaserequest` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_purchaseorderitems_stockitem` FOREIGN KEY (`stockId`) REFERENCES `stockitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.purchaseorderitems: ~0 rows (approximately)
/*!40000 ALTER TABLE `purchaseorderitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchaseorderitems` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.purchaserequest
DROP TABLE IF EXISTS `purchaserequest`;
CREATE TABLE IF NOT EXISTS `purchaserequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` int(11) NOT NULL,
  `requestQty` decimal(10,2) NOT NULL,
  `requestUom` varchar(6) NOT NULL,
  `requestBy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.purchaserequest: ~2 rows (approximately)
/*!40000 ALTER TABLE `purchaserequest` DISABLE KEYS */;
REPLACE INTO `purchaserequest` (`id`, `stockId`, `requestQty`, `requestUom`, `requestBy`) VALUES
	(1, 1, 322.00, 'kg', 0),
	(2, 1, 444.00, 'kg', 0),
	(3, 1, 2.00, 'kg', 0),
	(4, 1, 444.00, 'kg', 0),
	(5, 1, 4.00, 'kg', 0),
	(6, 2, 322.00, 'kg', 0),
	(7, 1, 4.00, 'kg', 0),
	(8, 1, 4343.00, 'kg', 0);
/*!40000 ALTER TABLE `purchaserequest` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.stockcategory
DROP TABLE IF EXISTS `stockcategory`;
CREATE TABLE IF NOT EXISTS `stockcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.stockcategory: ~2 rows (approximately)
/*!40000 ALTER TABLE `stockcategory` DISABLE KEYS */;
REPLACE INTO `stockcategory` (`id`, `name`) VALUES
	(1, 'FOODITEM'),
	(2, 'EQUIPMENT');
/*!40000 ALTER TABLE `stockcategory` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.stockitem
DROP TABLE IF EXISTS `stockitem`;
CREATE TABLE IF NOT EXISTS `stockitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `description1` varchar(45) DEFAULT NULL,
  `unitMs` varchar(10) DEFAULT NULL,
  `avgUnitPrice` decimal(2,0) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `description_UNIQUE` (`description`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.stockitem: ~2 rows (approximately)
/*!40000 ALTER TABLE `stockitem` DISABLE KEYS */;
REPLACE INTO `stockitem` (`id`, `description`, `description1`, `unitMs`, `avgUnitPrice`, `categoryId`) VALUES
	(1, 'equipment1', 'equipment1', '', 0, 2),
	(2, 'fooditem1', 'fooditem1', '', 0, 1);
/*!40000 ALTER TABLE `stockitem` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.stockitemsupplier
DROP TABLE IF EXISTS `stockitemsupplier`;
CREATE TABLE IF NOT EXISTS `stockitemsupplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` int(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `uom` varchar(6) DEFAULT NULL,
  `isdefault` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `stockId_idx` (`stockId`),
  KEY `supplierId_idx` (`supplierId`),
  CONSTRAINT `stockId` FOREIGN KEY (`stockId`) REFERENCES `stockitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `supplierId` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.stockitemsupplier: ~1 rows (approximately)
/*!40000 ALTER TABLE `stockitemsupplier` DISABLE KEYS */;
REPLACE INTO `stockitemsupplier` (`id`, `stockId`, `supplierId`, `price`, `uom`, `isdefault`) VALUES
	(1, 1, 5, 32.00, 'kg', 1),
	(2, 2, 4, 32.00, 'kg', 1);
/*!40000 ALTER TABLE `stockitemsupplier` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.supplier
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE IF NOT EXISTS `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `accountCode` int(11) DEFAULT NULL,
  `terms` varchar(6) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.supplier: ~4 rows (approximately)
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
REPLACE INTO `supplier` (`id`, `name`, `accountCode`, `terms`, `remarks`) VALUES
	(2, 'supplier name', NULL, 'C.O.D', NULL),
	(3, 'test', NULL, 'C.O.D', NULL),
	(4, 'NTUC12', NULL, 'C.O.D', NULL),
	(5, 'supplier name11', NULL, 'C.O.D', NULL);
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.uom
DROP TABLE IF EXISTS `uom`;
CREATE TABLE IF NOT EXISTS `uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UOM` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `UOM` (`UOM`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.uom: ~4 rows (approximately)
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
REPLACE INTO `uom` (`id`, `UOM`) VALUES
	(2, 'G'),
	(1, 'KG'),
	(4, 'PACK'),
	(3, 'PCS');
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;

-- Dumping structure for table foodsolutions.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table foodsolutions.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
REPLACE INTO `user` (`id`, `username`, `email`, `password`) VALUES
	(1, 'ming', '11111@qq', '1'),
	(2, 'carrie', 'fff@qqq.ll', '1');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
