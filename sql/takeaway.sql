# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.18)
# Database: takeaway
# Generation Time: 2018-09-28 11:57:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table order_detail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_detail`;

CREATE TABLE `order_detail` (
  `detail_id` varchar(32) NOT NULL DEFAULT '',
  `order_id` varchar(32) NOT NULL DEFAULT '',
  `product_id` varchar(32) NOT NULL DEFAULT '',
  `product_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '当前价格，单位分',
  `product_quantity` int(11) NOT NULL COMMENT '数量',
  `product_icon` varchar(512) DEFAULT '' COMMENT '小图',
  PRIMARY KEY (`detail_id`),
  KEY `idx_order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单商品表';

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;

INSERT INTO `order_detail` (`detail_id`, `order_id`, `product_id`, `product_name`, `product_price`, `product_quantity`, `product_icon`)
VALUES
	('1535632565919318745','1535632565909471719','157875196366160062','皮蛋粥',0.01,9,'//fuss10.elemecdn.com/0/49/65d10ef215d3c770ebb2b5ea962a7jpeg.jpeg'),
	('1535632864571398604','1535632864559296770','157875196366160062','皮蛋粥',0.01,10,'//fuss10.elemecdn.com/0/49/65d10ef215d3c770ebb2b5ea962a7jpeg.jpeg'),
	('1535632888667522981','1535632888661651044','157875196366160062','皮蛋粥',0.01,9,'//fuss10.elemecdn.com/0/49/65d10ef215d3c770ebb2b5ea962a7jpeg.jpeg'),
	('1535633003004836349','1535633002998372074','157875196366160062','皮蛋粥',0.01,5,'//fuss10.elemecdn.com/0/49/65d10ef215d3c770ebb2b5ea962a7jpeg.jpeg'),
	('1535633041803439161','1535633041795197113','167232323366164068','蜜汁鸡翅',0.02,5,'//fuss10.elemecdn.com/7/4a/f307f56216b03f067155aec8b124ejpeg.jpeg'),
	('1535633159133966742','1535633159127981760','157876323366164068','慕斯蛋糕',10.90,7,'//fuss10.elemecdn.com/9/93/91994e8456818dfe7b0bd95f10a50jpeg.jpeg'),
	('1535633159137213258','1535633159127981760','167232323366164068','蜜汁鸡翅',0.02,5,'//fuss10.elemecdn.com/7/4a/f307f56216b03f067155aec8b124ejpeg.jpeg'),
	('1538129966820329481','1538129966241171992','157876323366164068','慕斯蛋糕',10.90,7,'//fuss10.elemecdn.com/9/93/91994e8456818dfe7b0bd95f10a50jpeg.jpeg'),
	('1538129966888968820','1538129966241171992','167232323366164068','蜜汁鸡翅',0.02,5,'//fuss10.elemecdn.com/7/4a/f307f56216b03f067155aec8b124ejpeg.jpeg'),
	('1538130006162461559','1538130006152824608','157876323366164068','慕斯蛋糕',10.90,7,'//fuss10.elemecdn.com/9/93/91994e8456818dfe7b0bd95f10a50jpeg.jpeg'),
	('1538130006166848151','1538130006152824608','167232323366164068','蜜汁鸡翅',0.02,5,'//fuss10.elemecdn.com/7/4a/f307f56216b03f067155aec8b124ejpeg.jpeg'),
	('1538130446436578364','1538130446115354941','157876323366164068','慕斯蛋糕',10.90,7,'//fuss10.elemecdn.com/9/93/91994e8456818dfe7b0bd95f10a50jpeg.jpeg'),
	('1538130446497423578','1538130446115354941','167232323366164068','蜜汁鸡翅',0.02,5,'//fuss10.elemecdn.com/7/4a/f307f56216b03f067155aec8b124ejpeg.jpeg'),
	('1538135682157775036','1538135681614685138','157876323366164068','慕斯蛋糕',10.90,7,'//fuss10.elemecdn.com/9/93/91994e8456818dfe7b0bd95f10a50jpeg.jpeg'),
	('1538135682215767734','1538135681614685138','167232323366164068','蜜汁鸡翅',0.02,5,'//fuss10.elemecdn.com/7/4a/f307f56216b03f067155aec8b124ejpeg.jpeg');

/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table order_master
# ------------------------------------------------------------

DROP TABLE IF EXISTS `order_master`;

CREATE TABLE `order_master` (
  `order_id` varchar(32) NOT NULL DEFAULT '',
  `buyer_name` varchar(32) NOT NULL DEFAULT '' COMMENT '买家名字',
  `buyer_phone` varchar(32) NOT NULL DEFAULT '' COMMENT '买家电话',
  `buyer_address` varchar(128) NOT NULL DEFAULT '' COMMENT '买家地址',
  `buyer_openid` varchar(64) NOT NULL DEFAULT '' COMMENT '买家微信openid',
  `order_amount` decimal(8,2) NOT NULL COMMENT '订单总金额',
  `order_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '订单状态，0-新订单 1-完结 2-取消',
  `pay_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '支付状态，0-未支付 1-已支付',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`order_id`),
  KEY `idx_buyer_openid` (`buyer_openid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

LOCK TABLES `order_master` WRITE;
/*!40000 ALTER TABLE `order_master` DISABLE KEYS */;

INSERT INTO `order_master` (`order_id`, `buyer_name`, `buyer_phone`, `buyer_address`, `buyer_openid`, `order_amount`, `order_status`, `pay_status`, `create_time`, `update_time`)
VALUES
	('123456789','long','18675467874','Shanghai','10101010',2.30,0,0,'2018-08-20 20:41:15','2018-08-20 20:41:15'),
	('1534769129776821271','章三','13897567450','Beijing','edwsswswwewe',5.00,0,0,'2018-08-20 20:45:29','2018-08-20 20:45:29'),
	('1535632565909471719','章三','13897567450','Beijing','edfrg',0.09,0,0,'2018-08-30 20:36:05','2018-08-30 20:36:05'),
	('1535633002998372074','李四','13898765497','Beijing','sabt',0.05,0,0,'2018-08-30 20:43:23','2018-08-30 20:43:23'),
	('1535633041795197113','李四','19898765237','Beijing','sbtude',0.10,0,0,'2018-08-30 20:44:01','2018-08-30 20:44:01'),
	('1535633159127981760','张二','19898761237','Shanghai','niusbtde',76.40,0,0,'2018-08-30 20:45:59','2018-08-30 20:45:59'),
	('1538135681614685138','哈哈','19898761234','Nanjing','dwed',76.40,0,0,'2018-09-28 19:54:42','2018-09-28 19:54:42');

/*!40000 ALTER TABLE `order_master` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_category
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_category`;

CREATE TABLE `product_category` (
  `category_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category_name` varchar(64) NOT NULL DEFAULT '' COMMENT '类目名字',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`category_id`),
  UNIQUE KEY `uqe_category_type` (`category_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目表';

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;

INSERT INTO `product_category` (`category_id`, `category_name`, `category_type`, `create_time`, `update_time`)
VALUES
	(1,'热榜',1,'2018-06-01 15:32:43','2018-08-19 13:47:10'),
	(2,'好吃的',2,'2018-06-17 20:27:10','2018-08-19 13:47:12');

/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table product_info
# ------------------------------------------------------------

DROP TABLE IF EXISTS `product_info`;

CREATE TABLE `product_info` (
  `product_id` varchar(32) NOT NULL DEFAULT '',
  `product_name` varchar(64) NOT NULL DEFAULT '' COMMENT '商品名称',
  `product_price` decimal(8,2) NOT NULL COMMENT '单价',
  `product_stock` int(11) NOT NULL COMMENT '库存',
  `product_description` varchar(64) DEFAULT '' COMMENT '描述',
  `product_icon` varchar(512) DEFAULT '' COMMENT '小图',
  `product_status` tinyint(3) NOT NULL DEFAULT '0' COMMENT '商品状态 0-正常 1-下架',
  `category_type` int(11) NOT NULL COMMENT '类目编号',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表';

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;

INSERT INTO `product_info` (`product_id`, `product_name`, `product_price`, `product_stock`, `product_description`, `product_icon`, `product_status`, `category_type`, `create_time`, `update_time`)
VALUES
	('157875196366160062','皮蛋粥',0.01,525,'好吃的皮蛋粥','//fuss10.elemecdn.com/0/49/65d10ef215d3c770ebb2b5ea962a7jpeg.jpeg',0,1,'2018-04-17 20:28:21','2018-09-28 18:33:11'),
	('157876323366164068','慕斯蛋糕',10.90,666,'美味爽口','//fuss10.elemecdn.com/9/93/91994e8456818dfe7b0bd95f10a50jpeg.jpeg',1,1,'2018-05-11 20:31:36','2018-09-28 18:33:16'),
	('167232323366164068','蜜汁鸡翅',0.02,967,'好吃','//fuss10.elemecdn.com/7/4a/f307f56216b03f067155aec8b124ejpeg.jpeg',0,1,'2018-06-17 20:31:59','2018-08-17 20:37:00');

/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
