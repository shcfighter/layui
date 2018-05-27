/*
Navicat MySQL Data Transfer

Source Server         : 47.98.232.164_mysql
Source Server Version : 50722
Source Host           : 47.98.232.164:3306
Source Database       : layui

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-05-26 20:00:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_dept
-- ----------------------------
DROP TABLE IF EXISTS `t_dept`;
CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL COMMENT '父节点',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '部门code',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_dept
-- ----------------------------
INSERT INTO `t_dept` VALUES ('1', null, '董事长办公室', 'dsz', '0', '2018-05-15 11:29:58', '2018-05-15 11:30:02', null, null, null);
INSERT INTO `t_dept` VALUES ('2', null, '总经理', 'zjl', '0', '2018-05-15 11:33:42', '2018-05-15 11:33:42', null, null, null);
INSERT INTO `t_dept` VALUES ('3', '2', '计划科', 'jhk', '0', null, null, null, null, null);
INSERT INTO `t_dept` VALUES ('4', '2', '生产部', 'scb', '0', null, null, null, null, null);
INSERT INTO `t_dept` VALUES ('5', '2', '采购部', 'cgb', '0', null, null, null, null, null);
INSERT INTO `t_dept` VALUES ('7', '2', '1212', '2121', '1', '2018-05-15 17:03:11', '2018-05-15 09:07:40', '2', '2', null);
INSERT INTO `t_dept` VALUES ('8', '2', '4343', '4324', '1', '2018-05-15 08:48:52', '2018-05-15 09:08:17', '2', '2', null);
INSERT INTO `t_dept` VALUES ('9', '2', '4324', '432', '0', '2018-05-15 17:03:11', '2018-05-15 17:03:11', '2', '2', null);
INSERT INTO `t_dept` VALUES ('12', '5', '采购一组', '324', '0', '2018-05-15 09:08:36', null, '2', null, null);
INSERT INTO `t_dept` VALUES ('13', null, '父节点', '324', '0', '2018-05-15 09:10:38', null, '2', null, null);
INSERT INTO `t_dept` VALUES ('14', '9', 'test', 'test', '0', '2018-05-16 13:07:08', null, '2', null, null);

-- ----------------------------
-- Table structure for t_goods
-- ----------------------------
DROP TABLE IF EXISTS `t_goods`;
CREATE TABLE `t_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) DEFAULT NULL COMMENT '货物名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '货物型号',
  `type` int(2) DEFAULT NULL COMMENT '1-原材料；2-成品；',
  `color` varchar(10) DEFAULT NULL COMMENT '货物颜色',
  `num` int(11) DEFAULT NULL COMMENT '货物数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '货物单位',
  `batch_no` varchar(50) DEFAULT NULL COMMENT '批号',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `total_price` decimal(15,2) DEFAULT NULL,
  `produce_date` date DEFAULT NULL COMMENT '生产日期',
  `expired_date` date DEFAULT NULL COMMENT '过期日期',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(255) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='货物 库存';

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('4', '麻布', '2345', '1', '蓝色', '90', '匹', '20180522', '50.00', '5000.00', '2018-05-22', '2018-05-31', '0', '2018-05-22 04:40:23', '2018-05-26 07:58:53', '2', '2', '采购完成');
INSERT INTO `t_goods` VALUES ('5', '蓝线', '3453', '1', '蓝色', '10', '卷', '20180522', '20.00', '200.00', '2018-05-22', '2018-05-31', '0', '2018-05-22 04:41:07', null, '2', null, '采购完成');
INSERT INTO `t_goods` VALUES ('6', '蓝色牛仔裤', '2018', '2', '蓝色', '130', '件', '35435435', '99.00', '9900.00', '2018-05-23', '2018-05-31', '0', '2018-05-23 05:35:54', '2018-05-23 05:36:34', '2', '2', '3456789543');

-- ----------------------------
-- Table structure for t_goods_use_record
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_use_record`;
CREATE TABLE `t_goods_use_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `goods_model` varchar(50) DEFAULT NULL,
  `batch_no` varchar(50) DEFAULT NULL,
  `goods_num` int(11) DEFAULT NULL COMMENT '更改后数量',
  `original_num` int(11) DEFAULT '0' COMMENT '原始数量',
  `user` varchar(50) DEFAULT NULL COMMENT '使用人',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '1-新增；2-修改；3-入库；4-出库；5-删除;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='货物使用情况';

-- ----------------------------
-- Records of t_goods_use_record
-- ----------------------------
INSERT INTO `t_goods_use_record` VALUES ('7', '4', '麻布', '2345', '20180522', '100', '0', 'admin', '0', '2018-05-22 04:40:24', '2', null, '1');
INSERT INTO `t_goods_use_record` VALUES ('8', '5', '蓝线', '3453', '20180522', '10', '0', 'admin', '0', '2018-05-22 04:41:07', '2', null, '1');
INSERT INTO `t_goods_use_record` VALUES ('9', '6', '蓝色牛仔裤', '2018', '35435435', '100', '0', 'admin', '0', '2018-05-23 05:35:54', '2', null, '1');
INSERT INTO `t_goods_use_record` VALUES ('10', '6', '蓝色牛仔裤', '2018', '35435435', '80', '100', 'admin', '0', '2018-05-23 05:36:18', '2', null, '4');
INSERT INTO `t_goods_use_record` VALUES ('11', '6', '蓝色牛仔裤', '2018', '35435435', '130', '80', 'admin', '0', '2018-05-23 05:36:34', '2', null, '3');
INSERT INTO `t_goods_use_record` VALUES ('12', '4', '麻布', '2345', '20180522', '90', '100', 'admin', '0', '2018-05-23 09:40:00', '2', null, '4');
INSERT INTO `t_goods_use_record` VALUES ('13', '4', '麻布', '2345', '20180522', '100', '90', 'admin', '0', '2018-05-26 07:40:55', '2', null, '3');
INSERT INTO `t_goods_use_record` VALUES ('14', '4', '麻布', '2345', '20180522', '90', '100', 'admin', '0', '2018-05-26 07:58:53', '2', null, '4');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) DEFAULT NULL,
  `menu_name` varchar(50) DEFAULT NULL,
  `menu_url` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `menu_icon` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `is_menu` int(2) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `is_valid` int(11) DEFAULT '0' COMMENT '0-正常；1-禁用',
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', null, '系统管理', null, 'layui-icon-set', '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('2', '1', '部门管理', 'system/dept-list.html', null, '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('3', '1', '用户管理', 'system/user-list.html', 'layui-icon-user1', '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('4', '1', '角色管理', 'system/role-list.html', null, '1', '3', '0', null);
INSERT INTO `t_menu` VALUES ('5', '1', '权限管理', 'system/auth-list.html', null, '1', '4', '0', null);
INSERT INTO `t_menu` VALUES ('6', null, '仓库管理', null, 'layui-icon-component', '1', '3', '0', null);
INSERT INTO `t_menu` VALUES ('7', '6', '库存管理', 'business/goods-list.html', null, '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('8', null, '主页', null, 'layui-icon-home', '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('9', '8', '控制台', 'home/console.html', null, '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('10', null, '业务', null, 'layui-icon-read', '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('11', null, '订单管理', 'business/order-list.html', 'layui-icon-read', '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('12', null, '样品管理-计划科', 'business/plan-list.html', 'layui-icon-read', '1', '3', '0', null);
INSERT INTO `t_menu` VALUES ('13', null, '样品管理', 'business/purchase-list.html', 'layui-icon-read', '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('14', '6', '库存使用', 'business/goods-record-list.html', null, '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('15', null, '生产计划', 'business/produce-list.html', 'layui-icon-read', '1', '4', '0', null);
INSERT INTO `t_menu` VALUES ('16', null, '采购单管理', null, null, '1', '10', '0', null);

-- ----------------------------
-- Table structure for t_order
-- ----------------------------
DROP TABLE IF EXISTS `t_order`;
CREATE TABLE `t_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_num` int(11) DEFAULT NULL COMMENT '订单数据',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `product_unit` varchar(10) DEFAULT NULL COMMENT '产品单位',
  `deliver_date` date DEFAULT NULL COMMENT '交付时间',
  `unit_price` decimal(8,2) DEFAULT NULL COMMENT '单价',
  `total_price` decimal(15,2) DEFAULT NULL COMMENT '总价',
  `cooperation_company` varchar(50) DEFAULT NULL COMMENT '合作公司',
  `contact_name` varchar(50) DEFAULT NULL COMMENT '合作人',
  `contact_phone` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `status` int(11) DEFAULT '0' COMMENT '0-接单、录单；1-打样；2-采购；3-排单；4-生产；5-入库；-1-作废',
  `is_deleted` int(2) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='入单 业务员接单';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('14', '100', '牛仔裤', '件', '2018-05-31', '99.00', '9900.00', '服装专卖店', '张三', '18888888888', '5', null, '2018-05-23 13:29:13', '2018-05-23 13:29:13', '2', null, '做好call我');
INSERT INTO `t_order` VALUES ('15', '54', '34', '432', '2018-05-31', '432.00', '4324.00', '432', '432', '19999999999', '1', null, '2018-05-23 13:10:36', '2018-05-23 13:10:36', '2', null, '4324');
INSERT INTO `t_order` VALUES ('16', '400', '沙县小吃', '碗', '2018-05-24', '1.00', '400.00', '腾讯', '马化腾', '13133331245', '0', null, '2018-05-23 06:00:29', null, '2', null, '');
INSERT INTO `t_order` VALUES ('17', '100', '订单20180526', '件', '2018-05-31', '100.00', '10000.00', '加', '张三', '18888888888', '4', null, '2018-05-26 15:53:29', '2018-05-26 15:53:29', '2', null, '随便');

-- ----------------------------
-- Table structure for t_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_plan`;
CREATE TABLE `t_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `plan_name` varchar(50) DEFAULT NULL COMMENT '计划代号',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '生产部门',
  `product_name` varchar(50) DEFAULT NULL COMMENT '产品名称',
  `batch_no` varchar(50) DEFAULT NULL COMMENT '生产批次',
  `begin_date` datetime DEFAULT NULL COMMENT '开始生产时间',
  `end_date` datetime DEFAULT NULL COMMENT '结束生产时间',
  `num` int(11) DEFAULT NULL COMMENT '生产数量',
  `status` int(2) DEFAULT '0' COMMENT '0-新增；1-生产；2-完成；',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(255) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_plan
-- ----------------------------
INSERT INTO `t_plan` VALUES ('5', '14', '201805', '生产部', '蓝色牛仔裤', '2345', '2018-05-23 00:00:00', '2018-05-26 00:00:00', '20', '2', '0', '2018-05-23 13:24:19', '2018-05-23 05:25:45', '2', '2', '生产生产');
INSERT INTO `t_plan` VALUES ('6', '14', '2016', '生产部', '蓝色牛仔', '3242', '2018-05-28 00:00:00', '2018-05-31 00:00:00', '50', '2', '0', '2018-05-23 13:24:19', '2018-05-23 05:28:57', '2', '2', '生产');
INSERT INTO `t_plan` VALUES ('7', '17', '324567', '4535', '4324', '45353', '2018-05-26 00:00:00', '2018-05-31 00:00:00', '435', '2', '0', '2018-05-26 15:53:29', '2018-05-26 07:53:53', '2', '2', '435');

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(50) CHARACTER SET latin1 DEFAULT NULL COMMENT '角色code',
  `is_deleted` int(2) DEFAULT '0' COMMENT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(512) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES ('1', '超级管理员', '1111', '0', '2018-05-15 19:44:38', '2018-05-15 19:44:38', '2', '2', null);
INSERT INTO `t_role` VALUES ('2', '管理员', '324324', '0', '2018-05-15 19:45:38', '2018-05-15 19:45:38', '2', '2', null);
INSERT INTO `t_role` VALUES ('3', '普通员工', 'ptyg', '0', '2018-05-16 13:06:21', null, '2', null, null);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `r_id` int(11) DEFAULT NULL COMMENT '角色id',
  `m_id` int(11) DEFAULT NULL COMMENT '菜单id',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('42', '2', '1', '0', '2018-05-16 19:06:33', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('43', '2', '2', '0', '2018-05-16 19:06:33', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('130', '1', '11', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('131', '1', '1', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('132', '1', '2', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('133', '1', '3', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('134', '1', '4', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('135', '1', '5', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('136', '1', '13', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('137', '1', '6', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('138', '1', '7', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('139', '1', '14', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('140', '1', '12', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('141', '1', '15', '0', '2018-05-26 15:37:06', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('142', '1', '16', '0', '2018-05-26 15:37:06', null, '2', null, null);

-- ----------------------------
-- Table structure for t_sample
-- ----------------------------
DROP TABLE IF EXISTS `t_sample`;
CREATE TABLE `t_sample` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '订单id',
  `sample_name` varchar(50) DEFAULT NULL,
  `sample_code` varchar(20) DEFAULT NULL COMMENT '样品型号',
  `photo_url` varchar(5000) DEFAULT NULL COMMENT '照片 以逗号分隔',
  `status` int(2) DEFAULT '0' COMMENT '0-新建；1-完成；2-计划生产阶段',
  `is_deleted` int(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='样品表 打样';

-- ----------------------------
-- Records of t_sample
-- ----------------------------
INSERT INTO `t_sample` VALUES ('14', '14', '蓝色牛仔裤', 'blue', 'http://47.98.232.164:8080/images/upload/0fae7a50-8826-40ff-a9b1-210853b885a5.jpg,http://47.98.232.164:8080/images/upload/11586639-b3df-423f-a2c9-79009ad8d0d2.jpg,http://47.98.232.164:8080/images/upload/3b635e55-0324-4985-8e8b-4f89041b29c7.jpg,http://47.98.232.164:8080/images/upload/eb71e4b1-3b71-467c-9b7d-ecb2e9e0c6f7.jpg,http://47.98.232.164:8080/images/upload/76e21e63-3fad-4e54-8c15-322eeffb8c39.jpg', '2', '0', '2018-05-23 13:18:46', '2018-05-23 13:18:46', '2', '2', '按照样品生产');
INSERT INTO `t_sample` VALUES ('15', '15', '543', '54', 'http://47.98.232.164:8080/images/upload/f1852bcf-0a7f-4f69-a573-24b3ce14f200.jpg', '0', '0', '2018-05-23 05:10:36', null, '2', null, '43');
INSERT INTO `t_sample` VALUES ('16', '17', '样品2018', '323456', 'http://47.98.232.164:8080/images/upload/5a9731cf-00a1-498f-a77c-11389a327729.jpg,http://47.98.232.164:8080/images/upload/5a7601c7-89c3-4fdf-9e6a-0e0dcf501dac.jpg,http://47.98.232.164:8080/images/upload/79ac8d75-510e-43c2-ac59-de6fc8e858ce.jpg', '2', '0', '2018-05-26 15:51:43', '2018-05-26 15:51:43', '2', '2', '234567');

-- ----------------------------
-- Table structure for t_sample_material
-- ----------------------------
DROP TABLE IF EXISTS `t_sample_material`;
CREATE TABLE `t_sample_material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `simple_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  `goods_name` varchar(255) DEFAULT NULL,
  `goods_model` varchar(50) DEFAULT NULL COMMENT '货物型号',
  `num` int(11) DEFAULT NULL COMMENT '货物数量',
  `color` varchar(10) DEFAULT NULL COMMENT '货物颜色',
  `unit` varchar(10) DEFAULT NULL COMMENT '货物单位',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(255) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sample_material
-- ----------------------------
INSERT INTO `t_sample_material` VALUES ('11', '14', null, '麻布', '2343', '50', '白色', '匹', '0', '2018-05-23 12:58:11', null, '2', null, '尽快采购');
INSERT INTO `t_sample_material` VALUES ('12', '14', null, '房价管理', '4', '43', '435', '435', '1', '2018-05-23 12:58:11', '2018-05-23 05:04:14', '2', '2', '343');
INSERT INTO `t_sample_material` VALUES ('13', '14', null, '435', '543', '543', '543', '543', '1', '2018-05-23 12:58:11', '2018-05-23 05:02:49', '2', '2', '543');
INSERT INTO `t_sample_material` VALUES ('14', '14', null, '蓝色染料', '23423', '10', '蓝色', '灌', '0', '2018-05-23 12:58:11', null, '2', null, '采购吧');
INSERT INTO `t_sample_material` VALUES ('15', '15', null, '435', '54', '54', '543', '543', '0', '2018-05-23 13:10:36', null, '2', null, '54');
INSERT INTO `t_sample_material` VALUES ('16', '16', null, '布匹', '23456', '10', '蓝色', '匹', '0', '2018-05-26 15:26:00', null, '2', null, '的发达省份');
INSERT INTO `t_sample_material` VALUES ('17', '16', null, '线', '3456', '10', '5653', '34', '0', '2018-05-26 15:26:00', null, '2', null, '436');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login_name` varchar(50) DEFAULT NULL COMMENT '员工id',
  `real_name` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `password` varchar(64) DEFAULT NULL COMMENT '密码',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `sex` int(2) DEFAULT NULL COMMENT '性别 0-未知；1-男；2-女',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门id',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '部门名称',
  `is_deleted` int(2) DEFAULT '0' COMMENT '0-未删除;1-删除',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login_name` (`login_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', null, '李四', 'e10adc3949ba59abbe56e057f20f883e', '18888888888', '86@163.com', '2', null, null, '1', '2018-05-16 19:11:29', '2018-05-16 19:11:29', null, '2', '5435');
INSERT INTO `t_user` VALUES ('2', 'admin', '超级管理员', 'e10adc3949ba59abbe56e057f20f883e', '18888888888', '1888888888@163.com', '1', '1', '董事长办公室', '0', '2018-05-14 00:33:42', '2018-05-18 14:11:05', null, '2', '超级管理员');
INSERT INTO `t_user` VALUES ('3', null, '王老五', 'e10adc3949ba59abbe56e057f20f883e', '13167579876', '1111@163.com', null, null, null, '1', '2018-05-16 19:11:37', '2018-05-16 19:11:37', null, '2', '324253');
INSERT INTO `t_user` VALUES ('4', null, '乱七八糟', 'e10adc3949ba59abbe56e057f20f883e', '13145678900', '7788@sina.com', '0', null, null, '1', '2018-05-16 19:11:37', '2018-05-16 19:11:37', null, '2', '43567');
INSERT INTO `t_user` VALUES ('11', null, '张三傻冒傻', 'e10adc3949ba59abbe56e057f20f883e', '15868888888', '564fwd@163.com', null, null, null, '1', '2018-05-16 19:11:37', '2018-05-16 19:11:37', null, '2', null);
INSERT INTO `t_user` VALUES ('12', '15688888881', 'test12', 'e10adc3949ba59abbe56e057f20f883e', '15688888888', '34253654@163.com', '0', null, null, '0', '2018-05-17 09:04:48', '2018-05-17 09:04:48', '2', '2', '5435');
INSERT INTO `t_user` VALUES ('13', '15688888882', 'test5', 'e10adc3949ba59abbe56e057f20f883e', '15688888888', '34253654@163.com', null, null, null, '0', '2018-05-17 09:04:53', '2018-05-17 09:04:53', '2', '2', '5435');
INSERT INTO `t_user` VALUES ('14', '15888888883', 'tests', 'e10adc3949ba59abbe56e057f20f883e', '15888888888', '86@163.com', null, null, null, '0', '2018-05-17 09:04:55', '2018-05-17 09:04:55', '2', '2', '5435');
INSERT INTO `t_user` VALUES ('15', '18888888888', '赵六', 'e10adc3949ba59abbe56e057f20f883e', '18888888888', '43536@163.com', '0', null, null, '0', '2018-05-14 11:22:08', null, '2', null, '123457');
INSERT INTO `t_user` VALUES ('16', '18777777774', '老七', 'e10adc3949ba59abbe56e057f20f883e', '18777777777', '24356@163.com', '1', null, null, '0', '2018-05-17 09:04:58', '2018-05-17 09:04:58', null, '2', '435353');
INSERT INTO `t_user` VALUES ('17', '18777777777', '老七', 'e10adc3949ba59abbe56e057f20f883e', '18777777777', '24356@163.com', '1', null, null, '0', '2018-05-15 08:43:11', '2018-05-15 08:43:11', null, '2', '435353');
INSERT INTO `t_user` VALUES ('19', '123456', '12345', 'e10adc3949ba59abbe56e057f20f883e', '18888888881', '111@163.com', '1', null, null, '0', '2018-05-16 11:01:15', null, '2', null, '234567');
INSERT INTO `t_user` VALUES ('20', 'cgy01', '采购员', 'e10adc3949ba59abbe56e057f20f883e', '18888888882', '234@sina.com', '2', '5', '采购部', '0', '2018-05-16 11:39:42', '2018-05-16 11:42:15', '2', '2', '但是发达省份');
INSERT INTO `t_user` VALUES ('21', '54254', '23452', 'e10adc3949ba59abbe56e057f20f883e', '18888883764', '43243@sina.com', '1', '4', '生产部', '0', '2018-05-16 11:45:22', '2018-05-16 11:45:30', '2', '2', '34235435');
INSERT INTO `t_user` VALUES ('22', '23457', '23456789', 'e10adc3949ba59abbe56e057f20f883e', '18888888999', '1234@234.com', '1', '3', '计划科', '0', '2018-05-17 00:29:38', null, '2', null, '');
INSERT INTO `t_user` VALUES ('23', '32425', '不知道叫啥', 'e10adc3949ba59abbe56e057f20f883e', '18888888888', 'fre@163.com', '1', '4', '生产部', '0', '2018-05-17 11:40:51', null, '2', null, '43543543543任');

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) DEFAULT NULL COMMENT '用户id',
  `r_id` int(11) DEFAULT NULL COMMENT '角色id',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES ('18', '2', '2', '0', '2018-05-16 04:47:38', null, '2', null, null);
INSERT INTO `t_user_role` VALUES ('19', '2', '1', '0', '2018-05-16 05:03:38', null, '2', null, null);
