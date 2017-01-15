# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: foodsolutions
# Generation Time: 2017-01-15 14:28:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table customer
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer`;

CREATE TABLE `customer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `migrationId` varchar(45) DEFAULT NULL,
  `terms` varchar(10) DEFAULT NULL,
  `accountCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`),
  UNIQUE KEY `migrationId_UNIQUE` (`migrationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;

INSERT INTO `customer` (`id`, `name`, `migrationId`, `terms`, `accountCode`)
VALUES
	(0,'',NULL,NULL,NULL),
	(11,'NTUC1',NULL,NULL,NULL),
	(13,'NTUC2',NULL,NULL,NULL),
	(14,'9999999',NULL,NULL,NULL),
	(15,'NTUC444',NULL,NULL,NULL),
	(16,'NTUC222',NULL,NULL,NULL),
	(17,'NTUCO',NULL,NULL,NULL),
	(18,'NTUC11',NULL,NULL,NULL),
	(21,'NTUC521',NULL,NULL,NULL),
	(22,'NTUC11122',NULL,NULL,NULL),
	(23,'NTUC',NULL,NULL,NULL),
	(32,'NTUC12',NULL,NULL,NULL);

/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customerbillcontact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customerbillcontact`;

CREATE TABLE `customerbillcontact` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `customerbillcontact` WRITE;
/*!40000 ALTER TABLE `customerbillcontact` DISABLE KEYS */;

INSERT INTO `customerbillcontact` (`id`, `customerId`, `billAttention`, `billTelephone`, `billMobile`, `billEmail`, `billFax`, `billAddress1`, `billAddress2`, `billAddress3`, `billPostcode`)
VALUES
	(13,15,'ray','98789878','98789878','1@q.com','98789878','jurong east','','','999999'),
	(14,16,'ation','22','2222','t@q.com','22','jurong east 21','','','222222'),
	(15,17,'ooo','9999','9999999','o@qq.com','999','9999999','','','999999'),
	(16,18,'111','1','1','1@qqq.s','1','1111111','','','111111'),
	(17,21,'try','0','0','1@q.a','0','jurong east','','','0'),
	(18,22,'1111','0','0','1@1.a','0','jurong east','','','0'),
	(19,23,'111','1','1','1@1.1','1','jurong east 21','','','111111'),
	(22,11,'dddddddddddd','','','',NULL,'','','','161231'),
	(23,11,'sssss','','','',NULL,'','','','111110'),
	(24,13,'1111111','','','',NULL,'','','','11111'),
	(25,13,'lkfjlk','','99999777','kldsfs@qq.com',NULL,'','','','888888'),
	(26,13,'thomas','','','',NULL,'','','','777777'),
	(27,11,'dddddddddddd','','','',NULL,'','','','333333'),
	(28,11,'dddddddddddd','','','',NULL,'','','','333333'),
	(29,14,'money','','','',NULL,'','','','0'),
	(30,13,'dddddddddddd','','','',NULL,'','','','22222'),
	(31,13,'dddddddddddd','','','',NULL,'','','','33333'),
	(32,13,'dddddddddddd','','','',NULL,'','','','33333'),
	(33,13,'dddddddddddd','','','',NULL,'','','','33333'),
	(34,13,'33333333','','','',NULL,'','','','33333'),
	(38,11,'请求权',NULL,'12222221','jjj@qq.com',NULL,NULL,NULL,NULL,NULL),
	(39,32,'杰拉德1',NULL,NULL,'jjjj@gmail.com',NULL,NULL,NULL,NULL,NULL),
	(40,23,'dddddddddddd',NULL,NULL,'kldsfs@qq.com',NULL,NULL,NULL,NULL,NULL),
	(42,32,'请求权1',NULL,NULL,'jjj@qq.com',NULL,NULL,NULL,NULL,NULL);

/*!40000 ALTER TABLE `customerbillcontact` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customerdeliverycontact
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customerdeliverycontact`;

CREATE TABLE `customerdeliverycontact` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `customerdeliverycontact` WRITE;
/*!40000 ALTER TABLE `customerdeliverycontact` DISABLE KEYS */;

INSERT INTO `customerdeliverycontact` (`id`, `customerId`, `deliveryAttention`, `deliveryTelephone`, `deliveryMobile`, `deliveryEmail`, `deliveryAddress1`, `deliveryAddress2`, `deliveryAddress3`, `deliveryPostcode`)
VALUES
	(7,15,'ray','98789878',NULL,'1@q.com','jurong east','','','999999'),
	(8,16,'ation','22',NULL,'t@q.com','jurong east 21','','','222222'),
	(9,17,'ooo','9999',NULL,'o@qq.com','9999999','','','999999'),
	(10,18,'111','1',NULL,'1@qqq.s','1111111','','','111111'),
	(11,21,'try','0',NULL,'1@q.a','jurong east','','','0'),
	(12,22,'1111','0',NULL,'1@1.a','jurong east','','','0'),
	(13,23,'111','1',NULL,'1@1.1','jurong east 21','','','111111');

/*!40000 ALTER TABLE `customerdeliverycontact` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table goodsReceived
# ------------------------------------------------------------

DROP TABLE IF EXISTS `goodsReceived`;

CREATE TABLE `goodsReceived` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `vendorInvoice` varchar(11) NOT NULL DEFAULT '',
  `receivedDate` date DEFAULT NULL,
  `poNumber` varchar(11) DEFAULT '',
  `stockId` int(11) NOT NULL,
  `receivedQty` decimal(6,2) NOT NULL,
  `receivedUom` varchar(6) NOT NULL DEFAULT '',
  `apNumber` varchar(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `goodsReceived` WRITE;
/*!40000 ALTER TABLE `goodsReceived` DISABLE KEYS */;

INSERT INTO `goodsReceived` (`id`, `vendorInvoice`, `receivedDate`, `poNumber`, `stockId`, `receivedQty`, `receivedUom`, `apNumber`, `supplierId`)
VALUES
	(1,'vinvo0009','2017-01-15','232799457',3,89.00,'kg',NULL,4),
	(2,'vinvo0002','2017-01-15','754918265',3,11.00,'kg',NULL,4),
	(3,'vinvo0004','2017-01-15','987803639',3,122.00,'kg',NULL,4),
	(4,'vinvo0004','2017-01-15','987803639',2,11.00,'kg',NULL,4),
	(5,'vinvo00010','2017-01-15','754918265',3,1.00,'kg',NULL,4),
	(6,'vinvo000912','2017-01-15','997277271',1,1.00,'pack',NULL,4);

/*!40000 ALTER TABLE `goodsReceived` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menu`;

CREATE TABLE `menu` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;

INSERT INTO `menu` (`id`, `menuCategoryId`, `menuName`, `price`, `minPax`, `kitchenTime`, `deliveryTime`, `collectionTime`, `multipleDelivery`, `onlineShow`)
VALUES
	(1,1,'menu1',5,34,NULL,NULL,NULL,3,0),
	(2,2,'Bento $9/per',6,32,NULL,NULL,NULL,3,0),
	(3,1,'buffet $12/per',90,56,NULL,NULL,NULL,2,0),
	(4,1,'  menu2',5,34,NULL,NULL,NULL,3,1),
	(5,5,' BBQ Set B',90,56,NULL,NULL,NULL,1,1),
	(6,5,'BBQ Set A',90,56,NULL,NULL,NULL,1,1);

/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menucategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menucategory`;

CREATE TABLE `menucategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuCategoryName` varchar(45) DEFAULT NULL,
  `onlineShow` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `menucategory` WRITE;
/*!40000 ALTER TABLE `menucategory` DISABLE KEYS */;

INSERT INTO `menucategory` (`id`, `menuCategoryName`, `onlineShow`)
VALUES
	(1,'   buffet',1),
	(2,' bento',1),
	(3,' Chinese New Year 2017',1),
	(4,'weding',0),
	(5,'BBQ Party',0),
	(6,' Tea Register',1);

/*!40000 ALTER TABLE `menucategory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menuitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menuitem`;

CREATE TABLE `menuitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuId` int(11) DEFAULT NULL,
  `stockId` int(11) DEFAULT NULL,
  `onlineName` varchar(45) DEFAULT NULL COMMENT 'default show stock description',
  `menuItemGroupId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `menuitem` WRITE;
/*!40000 ALTER TABLE `menuitem` DISABLE KEYS */;

INSERT INTO `menuitem` (`id`, `menuId`, `stockId`, `onlineName`, `menuItemGroupId`)
VALUES
	(4,6,2,'BBQ FoodItem A',2),
	(5,3,2,'foodItem Tea',1),
	(6,2,1,'Table 3x3',1);

/*!40000 ALTER TABLE `menuitem` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table menuitemgroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `menuitemgroup`;

CREATE TABLE `menuitemgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menuItemGroupName` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `menuitemgroup` WRITE;
/*!40000 ALTER TABLE `menuitemgroup` DISABLE KEYS */;

INSERT INTO `menuitemgroup` (`id`, `menuItemGroupName`)
VALUES
	(1,'Rice'),
	(2,' Appetizer'),
	(3,'Beef'),
	(4,'Fish'),
	(5,' Chicken'),
	(6,'Add On');

/*!40000 ALTER TABLE `menuitemgroup` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchaseorder
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchaseorder`;

CREATE TABLE `purchaseorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ponumber` varchar(11) NOT NULL,
  `date` date NOT NULL,
  `preparedBy` int(11) NOT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `status` varchar(11) DEFAULT 'open',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ponumber` (`ponumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchaseorder` WRITE;
/*!40000 ALTER TABLE `purchaseorder` DISABLE KEYS */;

INSERT INTO `purchaseorder` (`id`, `ponumber`, `date`, `preparedBy`, `supplierId`, `status`)
VALUES
	(8,'359796016','2017-01-13',0,5,'reject'),
	(9,'490730867','2017-01-13',0,5,'open'),
	(10,'892118408','2017-01-13',0,5,'open'),
	(11,'810015793','2017-01-14',0,5,'reject'),
	(12,'828402684','2017-01-14',0,2,'open'),
	(13,'754918265','2017-01-14',0,4,'full'),
	(14,'232799457','2017-01-14',0,4,'full'),
	(15,'987803639','2017-01-14',0,4,'full'),
	(16,'997277271','2017-01-15',0,4,'full');

/*!40000 ALTER TABLE `purchaseorder` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchaseorderitems
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchaseorderitems`;

CREATE TABLE `purchaseorderitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poNumber` varchar(11) NOT NULL DEFAULT '',
  `stockId` int(11) DEFAULT NULL,
  `itemdescription` varchar(200) NOT NULL DEFAULT '',
  `prId` int(11) DEFAULT NULL,
  `purchaseQty` int(11) NOT NULL,
  `purchaseUom` varchar(6) NOT NULL,
  `requestQty` int(11) NOT NULL,
  `requestUom` varchar(6) NOT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `price` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_purchaseorderitems_stockitem` (`stockId`),
  KEY `FK_purchaseorderitems_purchaserequest` (`prId`),
  KEY `FK_poNumber` (`poNumber`),
  CONSTRAINT `FK_poNumber` FOREIGN KEY (`poNumber`) REFERENCES `purchaseorder` (`ponumber`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_purchaseorderitems_purchaserequest` FOREIGN KEY (`prId`) REFERENCES `purchaserequest` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_purchaseorderitems_stockitem` FOREIGN KEY (`stockId`) REFERENCES `stockitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchaseorderitems` WRITE;
/*!40000 ALTER TABLE `purchaseorderitems` DISABLE KEYS */;

INSERT INTO `purchaseorderitems` (`id`, `poNumber`, `stockId`, `itemdescription`, `prId`, `purchaseQty`, `purchaseUom`, `requestQty`, `requestUom`, `supplierId`, `price`)
VALUES
	(8,'359796016',1,'',9,45,'pack',45,'pack',5,3.00),
	(9,'490730867',1,'',3,2,'kg',2,'kg',5,32.00),
	(10,'892118408',1,'',5,4,'pc',4,'kg',5,32.00),
	(11,'810015793',1,'',1,3,'kg',322,'kg',0,32.00),
	(12,'828402684',4,'prawn',11,11,'kg',12,'kg',0,12.00),
	(13,'754918265',3,'rice',10,12,'kg',12,'kg',4,3.00),
	(14,'232799457',3,'rice',12,89,'kg',90,'kg',4,3.00),
	(15,'987803639',3,'rice',14,122,'kg',122,'kg',4,3.00),
	(16,'987803639',2,'fire chicken',13,11,'kg',11,'kg',4,32.00),
	(17,'997277271',1,'table',15,1,'pack',1,'pack',4,12.00);

/*!40000 ALTER TABLE `purchaseorderitems` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table purchaserequest
# ------------------------------------------------------------

DROP TABLE IF EXISTS `purchaserequest`;

CREATE TABLE `purchaserequest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` int(11) NOT NULL,
  `requestQty` decimal(10,2) NOT NULL,
  `requestUom` varchar(6) NOT NULL,
  `requestBy` int(11) NOT NULL,
  `prStatus` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `purchaserequest` WRITE;
/*!40000 ALTER TABLE `purchaserequest` DISABLE KEYS */;

INSERT INTO `purchaserequest` (`id`, `stockId`, `requestQty`, `requestUom`, `requestBy`, `prStatus`)
VALUES
	(1,1,322.00,'kg',0,NULL),
	(2,1,444.00,'kg',0,'reject'),
	(3,1,2.00,'kg',0,NULL),
	(4,1,444.00,'kg',0,'reject'),
	(5,1,4.00,'kg',0,NULL),
	(6,2,322.00,'kg',0,'reject'),
	(7,1,4.00,'kg',0,'reject'),
	(8,1,4343.00,'kg',0,'reject'),
	(9,1,45.00,'pack',0,NULL),
	(10,3,12.00,'kg',0,'full'),
	(11,4,12.00,'kg',0,NULL),
	(12,3,90.00,'kg',0,'particular'),
	(13,2,11.00,'kg',0,'full'),
	(14,3,122.00,'kg',0,'full'),
	(15,1,1.00,'pack',0,'full');

/*!40000 ALTER TABLE `purchaserequest` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stockcategory
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stockcategory`;

CREATE TABLE `stockcategory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `stockcategory` WRITE;
/*!40000 ALTER TABLE `stockcategory` DISABLE KEYS */;

INSERT INTO `stockcategory` (`id`, `name`)
VALUES
	(1,'FOODITEM'),
	(2,'EQUIPMENT');

/*!40000 ALTER TABLE `stockcategory` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stockitem
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stockitem`;

CREATE TABLE `stockitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(45) NOT NULL,
  `description1` varchar(45) DEFAULT NULL,
  `unitMs` varchar(6) DEFAULT NULL,
  `avgUnitPrice` decimal(5,2) DEFAULT NULL,
  `categoryId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `description_UNIQUE` (`description`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `stockitem` WRITE;
/*!40000 ALTER TABLE `stockitem` DISABLE KEYS */;

INSERT INTO `stockitem` (`id`, `description`, `description1`, `unitMs`, `avgUnitPrice`, `categoryId`)
VALUES
	(1,'table','table','pc',0.00,2),
	(2,'fire chicken','fire chicken','pc',0.00,1),
	(3,'rice','rice','kg',0.00,1),
	(4,'prawn','prawn','kg',0.00,1),
	(5,'rice 1','rice 1','kg',0.00,1),
	(6,'living fish','living fish','kg',0.00,1),
	(7,'dddd1','dddd1','kg',0.00,1);

/*!40000 ALTER TABLE `stockitem` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table stockitemsupplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `stockitemsupplier`;

CREATE TABLE `stockitemsupplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stockId` int(11) DEFAULT NULL,
  `supplierId` int(11) DEFAULT NULL,
  `price` decimal(4,2) DEFAULT NULL,
  `uom` varchar(6) DEFAULT NULL,
  `isdefault` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `stockId_supplierId_uom` (`stockId`,`supplierId`,`uom`),
  KEY `stockId_idx` (`stockId`),
  KEY `supplierId_idx` (`supplierId`),
  CONSTRAINT `stockId` FOREIGN KEY (`stockId`) REFERENCES `stockitem` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `supplierId` FOREIGN KEY (`supplierId`) REFERENCES `supplier` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `stockitemsupplier` WRITE;
/*!40000 ALTER TABLE `stockitemsupplier` DISABLE KEYS */;

INSERT INTO `stockitemsupplier` (`id`, `stockId`, `supplierId`, `price`, `uom`, `isdefault`)
VALUES
	(1,1,5,32.00,'kg',0),
	(2,2,4,32.00,'kg',1),
	(3,1,5,11.00,'pack',0),
	(4,3,4,3.00,'kg',1),
	(5,1,4,32.00,'kg',0),
	(6,4,2,12.00,'kg',1),
	(7,4,4,13.00,'kg',0),
	(8,1,4,12.00,'pack',1);

/*!40000 ALTER TABLE `stockitemsupplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table supplier
# ------------------------------------------------------------

DROP TABLE IF EXISTS `supplier`;

CREATE TABLE `supplier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `accountCode` int(11) DEFAULT NULL,
  `terms` varchar(6) DEFAULT NULL,
  `remarks` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;

INSERT INTO `supplier` (`id`, `name`, `accountCode`, `terms`, `remarks`)
VALUES
	(2,'supplier name',NULL,'C.O.D',NULL),
	(3,'test',NULL,'C.O.D',NULL),
	(4,'NTUC12',NULL,'C.O.D',NULL),
	(5,'supplier name11',NULL,'C.O.D',NULL);

/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sysChartOfAccounts
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sysChartOfAccounts`;

CREATE TABLE `sysChartOfAccounts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  `accountCode` int(11) DEFAULT NULL,
  `ledgerType` varchar(11) DEFAULT NULL,
  `ledgerGroup` varchar(50) DEFAULT NULL,
  `opening` double(20,2) DEFAULT NULL,
  `gstType` varchar(11) DEFAULT NULL,
  `gstRate` double(4,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table sysGeneralLedger
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sysGeneralLedger`;

CREATE TABLE `sysGeneralLedger` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `accountType` varchar(20) DEFAULT '',
  `accountCode` int(11) DEFAULT NULL,
  `endCode` int(11) DEFAULT NULL,
  `ledgerType` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `accountType` (`accountType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `sysGeneralLedger` WRITE;
/*!40000 ALTER TABLE `sysGeneralLedger` DISABLE KEYS */;

INSERT INTO `sysGeneralLedger` (`id`, `accountType`, `accountCode`, `endCode`, `ledgerType`)
VALUES
	(1,'Asset',1000,1999,'Asset'),
	(2,'Liabilities',2000,2999,'Liabilities'),
	(3,'Equity',3000,3999,'Equity'),
	(4,'Revenues',5000,5999,'Revenues'),
	(5,'Expenses',6000,6999,'Expenses'),
	(6,'Cost Of Goods Sold',7000,7999,'COG');

/*!40000 ALTER TABLE `sysGeneralLedger` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table sysLedgerGroup
# ------------------------------------------------------------

DROP TABLE IF EXISTS `sysLedgerGroup`;

CREATE TABLE `sysLedgerGroup` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ledgerType` varchar(11) DEFAULT NULL,
  `ledgerGroup` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table uom
# ------------------------------------------------------------

DROP TABLE IF EXISTS `uom`;

CREATE TABLE `uom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `UOM` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `UOM` (`UOM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;

INSERT INTO `uom` (`id`, `UOM`)
VALUES
	(2,'G'),
	(1,'KG'),
	(4,'PACK'),
	(3,'PCS');

/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;

INSERT INTO `user` (`id`, `username`, `email`, `password`)
VALUES
	(6,'sming','1@1.com',''),
	(7,'carrie','1@1.com','1');

/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
