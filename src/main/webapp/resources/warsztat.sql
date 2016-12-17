
SET CHARACTER SET 'utf8';
SET NAMES 'utf8';

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL auto_increment,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `desc` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'Naprawa', 'Wszelkie działania umożliwiające przywrócenie właściwości użytkowych uszkodzonym ogniwom lub pojedynczym zespołom pojazdu w wyniku regeneracji lub wymiany zużytych części.');
INSERT INTO `category` VALUES ('2', 'Wymiana', 'Musisz wymienić jakąś część? Może zwyczajnie chcesz zmienić opony? Z chęcią Ci w tym pomożemy!');
INSERT INTO `category` VALUES ('3', 'Sklep', 'Potrzebujesz konkretnych części, produktów? Serdecznie zapraszamy do zakupów!');
INSERT INTO `category` VALUES ('4', 'Diagnostyka', 'Coś niepokojącego dzieje się z Twoim samochodem? Chętnie to sprawdzimy!');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `history_id` int(11) NOT NULL auto_increment,
  `user_id` int(11) default NULL,
  `product_id` int(11) default NULL,
  `date` timestamp NULL default NULL,
  `amount` int(11) default NULL,
  `cost` double default NULL,
  PRIMARY KEY  (`history_id`),
  KEY `fk_history_product` USING BTREE (`product_id`),
  KEY `fk_history_user` USING BTREE (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('1', '10', '2', '2016-02-17 12:25:21', '1', '500');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL auto_increment,
  `category_id` int(11) default NULL,
  `name` varchar(255) collate utf8_unicode_ci default NULL,
  `image` varchar(255) collate utf8_unicode_ci default NULL,
  `price` double default NULL,
  `type` varchar(255) collate utf8_unicode_ci default NULL,
  `desc` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`product_id`),
  KEY `fk_product_category` (`category_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', 'Blok silnika', 'new.jpg', '500', 'Silnik', 'Naprawa wnętrza silnika.');
INSERT INTO `product` VALUES ('2', '1', 'Elektronika', 'nu1.jpg', '200', 'Nadwozie', 'Naprawa elektroniki.');
INSERT INTO `product` VALUES ('3', '2', 'Opony', 'nostyle.jpg', '50', 'Koła', 'Wymiana opon.');
INSERT INTO `product` VALUES ('4', '2', 'Drobne', 'nam.jpg', '20', 'Części', 'Wymiana świec, żarówek, drobnych elementów karoserii.');
INSERT INTO `product` VALUES ('5', '2', 'Olej silnikowy', 'nu2.jpg', '20', 'Płyny', 'Wymiana oleju.');
INSERT INTO `product` VALUES ('6', '3', 'Płyn chłodniczy', 'dep.jpg', '15', 'Płyny', 'Płyn chłodniczy całosezonowy.');
INSERT INTO `product` VALUES ('7', '4', 'Przegląd', 'non.jpg', '80', 'Ogólne', 'Przegląd samochodu.');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL auto_increment,
  `username` varchar(255) collate utf8_unicode_ci NOT NULL,
  `password` varchar(255) collate utf8_unicode_ci NOT NULL,
  `sex` varchar(10) collate utf8_unicode_ci default NULL,
  `email` varchar(255) collate utf8_unicode_ci default NULL,
  `phone` varchar(20) collate utf8_unicode_ci default NULL,
  `address` varchar(255) collate utf8_unicode_ci default NULL,
  `role` varchar(255) collate utf8_unicode_ci default NULL,
  PRIMARY KEY  (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('10', 'test', 'test', 'Mężczyzna', 'test@mail.com', '423 212 578', '80-234 Gdańsk Głowna 22', '2');
INSERT INTO `user` VALUES ('11', 'user', 'userpass', 'Kobieta', 'user@mail.com', '512 093 002', '22-432 Kocborowo Tanczena 12/2', '2');
