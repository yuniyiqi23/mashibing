/*
Navicat MySQL Data Transfer

Source Server         : 本机
Source Server Version : 80017
Source Host           : localhost:3306
Source Database       : service-driver-user

Target Server Type    : MYSQL
Target Server Version : 80017
File Encoding         : 65001

Date: 2022-07-20 14:40:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for car
-- ----------------------------
DROP TABLE IF EXISTS `car`;
CREATE TABLE `car` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT,
  `address` char(6) DEFAULT NULL COMMENT '车辆所在城市',
  `vehicle_no` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '车辆号牌',
  `plate_color` char(1) DEFAULT NULL COMMENT '车牌颜色（1：蓝色，2：黄色，3：黑色，4：白色，5：绿色，9：其他）',
  `seats` int(3) DEFAULT NULL COMMENT '核定载客位',
  `brand` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '车辆厂牌',
  `model` varchar(16) DEFAULT NULL COMMENT '车辆型号',
  `vehicle_type` varchar(16) DEFAULT NULL COMMENT '车辆类型',
  `owner_name` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '车辆所有人',
  `vehicle_color` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '车辆颜色（1：白色，2：黑色）',
  `engine_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发动机号',
  `vin` varchar(64) DEFAULT NULL,
  `certify_date_a` date DEFAULT NULL COMMENT '车辆注册日期',
  `fue_type` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '燃料类型(1：汽油，2：柴油，3：天然气，4：液化气，5：电动，9：其他）',
  `engine_displace` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '发动机排量（毫升）',
  `trans_agency` varchar(32) DEFAULT NULL COMMENT '车辆运输证发证机构',
  `trans_area` varchar(32) DEFAULT NULL COMMENT '车辆经验区域',
  `trans_date_start` date DEFAULT NULL COMMENT '车辆运输证有效期起',
  `trans_date_end` date DEFAULT NULL COMMENT '车辆运输证有效期止',
  `certify_date_b` date DEFAULT NULL COMMENT '车辆初次登记日期',
  `fix_state` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '车辆的检修状态(0：未检修，1：已检修，2：未知）',
  `next_fix_date` date DEFAULT NULL COMMENT '下次年检时间',
  `check_state` char(2) DEFAULT '' COMMENT '年度审验状态（0：未年审，1：年审合格，2：年审不合格）',
  `fee_print_id` varchar(64) DEFAULT NULL COMMENT '发票打印设备序列号',
  `gps_brand` varchar(32) DEFAULT NULL COMMENT '卫星定位装置品牌',
  `gps_model` varchar(32) DEFAULT NULL COMMENT '卫星型号',
  `gps_install_date` date DEFAULT NULL COMMENT '卫星定位设备安装日期',
  `register_date` date DEFAULT NULL COMMENT '报备日期',
  `commercial_type` int(2) DEFAULT NULL COMMENT '服务类型：1：网络预约出租车，2：巡游出租车，3：私人小客车合乘',
  `fare_type` varchar(16) DEFAULT NULL COMMENT '运价编码 关联计价规则',
  `state` tinyint(1) DEFAULT NULL COMMENT '状态：0:有效，1：失效',
  `gmt_create` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of car
-- ----------------------------

-- ----------------------------
-- Table structure for driver_user
-- ----------------------------
DROP TABLE IF EXISTS `driver_user`;
CREATE TABLE `driver_user` (
  `id` bigint(32) unsigned NOT NULL AUTO_INCREMENT,
  `address` char(6) DEFAULT NULL COMMENT '司机注册地行政区划代码',
  `driver_name` varchar(16) DEFAULT NULL COMMENT '司机姓名',
  `driver_phone` varchar(16) DEFAULT NULL,
  `driver_gender` tinyint(2) DEFAULT NULL COMMENT '1:男，2：女',
  `driver_birthday` date DEFAULT NULL,
  `driver_nation` char(2) DEFAULT NULL COMMENT '驾驶员民族',
  `driver_contact_address` varchar(255) DEFAULT NULL,
  `license_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '机动车驾驶证号',
  `get_driver_license_date` date DEFAULT NULL COMMENT '初次领取驾驶证日期',
  `driver_license_on` date DEFAULT NULL COMMENT '驾驶证有效期起',
  `driver_license_off` date DEFAULT NULL COMMENT '驾驶证有效期止',
  `taxi_driver` tinyint(2) DEFAULT NULL COMMENT '是否巡游出租汽车：1：是，0：否',
  `certificate_no` varchar(255) DEFAULT NULL COMMENT '网络预约出租汽车驾驶员资格证号',
  `network_car_issue_organization` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL COMMENT '网络预约出租汽车驾驶员发证机构',
  `network_car_issue_date` date DEFAULT NULL COMMENT '资格证发证日期',
  `get_network_car_proof_date` date DEFAULT NULL COMMENT '初次领取资格证日期',
  `network_car_proof_on` date DEFAULT NULL COMMENT '资格证有效起始日期',
  `network_car_proof_off` date DEFAULT NULL COMMENT '资格证有效截止日期',
  `register_date` date DEFAULT NULL COMMENT '报备日期',
  `commercial_type` tinyint(2) DEFAULT NULL COMMENT '服务类型：1：网络预约出租汽车，2：巡游出租汽车，3：私人小客车合乘',
  `contract_company` varchar(255) DEFAULT NULL COMMENT '驾驶员合同（协议）签署公司',
  `contract_on` date DEFAULT NULL COMMENT '合同（协议）有效期起',
  `contract_off` date DEFAULT NULL COMMENT '合同有效期止',
  `state` tinyint(2) DEFAULT NULL COMMENT '司机状态：0：有效，1：失效',
  `gmt_create` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1542494575889854467 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of driver_user
-- ----------------------------
INSERT INTO `driver_user` VALUES ('1542494575889854466', '110000', '张红', '13910733522', '1', '2020-01-03', '01', '通信地址', '机动车驾驶证号', '2019-01-05', '2019-01-01', '2025-01-01', '1', '网络预约出租汽车驾驶员资格证号', '网络预约出租汽车驾驶员发证机构', '2020-01-02', '2020-01-01', '2020-01-03', '2020-01-03', '2020-02-03', '1', '合约公司', '2022-01-05', '2022-01-06', '1', '2022-06-30 22:05:19', '2022-06-30 22:05:20');
