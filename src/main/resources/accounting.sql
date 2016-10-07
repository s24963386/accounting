/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50611
Source Host           : localhost:3306
Source Database       : accounting

Target Server Type    : MYSQL
Target Server Version : 50611
File Encoding         : 65001

Date: 2016-10-08 00:35:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(32) DEFAULT NULL,
  `account_book_id` varchar(32) DEFAULT NULL,
  `income` decimal(11,2) DEFAULT NULL,
  `outcome` decimal(11,2) DEFAULT NULL,
  `balance` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account
-- ----------------------------

-- ----------------------------
-- Table structure for `accounting_detail`
-- ----------------------------
DROP TABLE IF EXISTS `accounting_detail`;
CREATE TABLE `accounting_detail` (
  `id` varchar(32) NOT NULL,
  `purpose` varchar(256) DEFAULT NULL,
  `cost` decimal(11,2) DEFAULT NULL,
  `cost_time` date DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(32) DEFAULT NULL,
  `account_id` varchar(32) DEFAULT NULL,
  `account_book_id` varchar(32) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accounting_detail
-- ----------------------------
INSERT INTO `accounting_detail` VALUES ('1', '1', '1.00', '2016-10-07', '2016-10-07 23:41:28', '1', '1', '1', '0');
INSERT INTO `accounting_detail` VALUES ('ieo8qzxvcw', '1', '2.00', '2016-07-10', '2016-10-08 00:23:32', 'test', '1', '1', '0');
INSERT INTO `accounting_detail` VALUES ('ieo9vwsf7k', '2', '2.00', '2017-01-01', '2016-10-08 00:26:03', 'test', '1', '1', '0');
INSERT INTO `accounting_detail` VALUES ('ieoa85qvpc', '2', '2.00', '2017-01-02', '2016-10-08 00:26:49', 'test', '2', '1', '1');

-- ----------------------------
-- Table structure for `account_book`
-- ----------------------------
DROP TABLE IF EXISTS `account_book`;
CREATE TABLE `account_book` (
  `id` varchar(32) NOT NULL,
  `name` varchar(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_user` varchar(32) DEFAULT NULL,
  `income` decimal(11,2) DEFAULT NULL,
  `outcome` decimal(11,2) DEFAULT NULL,
  `balance` decimal(11,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_book
-- ----------------------------

-- ----------------------------
-- Table structure for `account_book_user_rel`
-- ----------------------------
DROP TABLE IF EXISTS `account_book_user_rel`;
CREATE TABLE `account_book_user_rel` (
  `account_book_id` varchar(32) NOT NULL,
  `username` varchar(32) NOT NULL,
  PRIMARY KEY (`account_book_id`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_book_user_rel
-- ----------------------------
