/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : service-price

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2022-07-20 14:41:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for price_rule
-- ----------------------------
DROP TABLE IF EXISTS `price_rule`;
CREATE TABLE `price_rule` (
  `city_code` char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '城市代码',
  `vehicle_type` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '车辆类型',
  `start_fare` double(4,2) DEFAULT NULL COMMENT '起步价',
  `start_mile` int(4) DEFAULT NULL,
  `unit_price_per_mile` double(4,2) DEFAULT NULL,
  `unit_price_per_minute` double(4,2) DEFAULT NULL,
  PRIMARY KEY (`city_code`,`vehicle_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of price_rule
-- ----------------------------
INSERT INTO `price_rule` VALUES ('110000', '1', '10.00', '3', '1.80', '0.50');
