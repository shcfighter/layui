/*
Navicat MySQL Data Transfer

Source Server         : 47.98.232.164_mysql
Source Server Version : 50722
Source Host           : 47.98.232.164:3306
Source Database       : layui

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2018-06-02 10:55:07
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
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(255) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='货物 库存';

-- ----------------------------
-- Records of t_goods
-- ----------------------------
INSERT INTO `t_goods` VALUES ('7', '白布', 'baibu', '1', '白色', '90', '匹', '0', '2018-05-29 05:00:52', '2018-05-30 04:27:37', null, '2', null);
INSERT INTO `t_goods` VALUES ('8', '蓝色牛仔裤', '2018', '2', '蓝色', '100', '件', '0', '2018-05-29 05:37:35', null, null, null, null);
INSERT INTO `t_goods` VALUES ('10', '染料', '2018983', '1', '黑色', '9', '桶', '0', '2018-05-30 01:40:25', '2018-05-30 01:43:14', null, '2', null);
INSERT INTO `t_goods` VALUES ('11', '324', '432', '1', '434', '432', '432', '0', '2018-05-30 01:42:14', null, null, null, null);

-- ----------------------------
-- Table structure for t_goods_use_record
-- ----------------------------
DROP TABLE IF EXISTS `t_goods_use_record`;
CREATE TABLE `t_goods_use_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_id` int(11) DEFAULT NULL,
  `goods_name` varchar(50) DEFAULT NULL,
  `goods_model` varchar(50) DEFAULT NULL,
  `batch_no` varchar(50) DEFAULT NULL COMMENT '入库/出库申请单id',
  `goods_num` int(11) DEFAULT NULL COMMENT '更改后数量',
  `original_num` int(11) DEFAULT '0' COMMENT '原始数量',
  `user` varchar(50) DEFAULT NULL COMMENT '使用人',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  `type` int(2) DEFAULT NULL COMMENT '1-新增；2-修改；3-入库；4-出库；5-删除;',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='货物使用情况';

-- ----------------------------
-- Records of t_goods_use_record
-- ----------------------------
INSERT INTO `t_goods_use_record` VALUES ('15', '10', '染料', '2018983', '15', '10', '0', '2', '0', '2018-05-30 01:40:25', '2', null, '4');
INSERT INTO `t_goods_use_record` VALUES ('16', '11', '324', '432', '12', '432', '0', '2', '0', '2018-05-30 01:42:14', '2', null, '4');
INSERT INTO `t_goods_use_record` VALUES ('17', '10', '染料', '2018983', '12', '9', '10', '2', '0', '2018-05-30 01:43:15', '2', null, '4');
INSERT INTO `t_goods_use_record` VALUES ('18', '7', '白布', 'baibu', '13', '90', '100', '超级管理员', '0', '2018-05-30 04:27:37', '2', null, '4');

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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES ('1', null, '系统管理', null, 'layui-icon-set', '1', '99', '0', null);
INSERT INTO `t_menu` VALUES ('2', '1', '部门管理', 'system/dept-list.html', null, '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('3', '1', '用户管理', 'system/user-list.html', 'layui-icon-user1', '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('4', '1', '角色管理', 'system/role-list.html', null, '1', '3', '0', null);
INSERT INTO `t_menu` VALUES ('5', '12', '原材料申请', 'business\r\n/outbound-list.html', null, '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('6', null, '仓库管理', null, 'layui-icon-component', '1', '7', '0', null);
INSERT INTO `t_menu` VALUES ('7', '6', '库存管理', 'business/goods-list.html', null, '1', '3', '0', null);
INSERT INTO `t_menu` VALUES ('8', null, '主页', 'main.html', 'layui-icon-home', '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('9', null, '控制台', 'home/console.html', null, '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('11', null, '订单管理', 'business/order-list.html', 'layui-icon-read', '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('12', null, '生产车间', '', 'layui-icon-read', '1', '6', '0', null);
INSERT INTO `t_menu` VALUES ('13', null, '样品管理', 'business/sample-list.html', 'layui-icon-read', '1', '3', '0', null);
INSERT INTO `t_menu` VALUES ('14', '6', '库存使用', 'business/goods-record-list.html', null, '1', '5', '0', null);
INSERT INTO `t_menu` VALUES ('15', '12', '计划单', 'business/plan-list-produce.html', '', '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('16', null, '采购科', null, 'layui-icon-read', '1', '5', '0', null);
INSERT INTO `t_menu` VALUES ('18', null, '计划科', null, 'layui-icon-read', '1', '4', '0', null);
INSERT INTO `t_menu` VALUES ('19', '18', '订单列表', 'business/order-list-read.html', null, '1', '3', '0', null);
INSERT INTO `t_menu` VALUES ('20', '18', '样品列表', 'business/sample-list-read.html', null, '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('21', '18', '计划单', 'business/plan-list.html', null, '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('22', '12', '成品入库申请', 'business/product-list.html', null, '1', '3', '0', null);
INSERT INTO `t_menu` VALUES ('23', '16', '生产计划单', 'business/plan-list-read.html', null, '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('24', '16', '采购单', 'business/purchase-order-list.html', null, '1', '2', '0', null);
INSERT INTO `t_menu` VALUES ('25', '6', '入库管理', 'business/purchase-order-list-warehouse.html', null, '1', '1', '0', null);
INSERT INTO `t_menu` VALUES ('26', '6', '出库管理', 'business/outbound-list-warehouse.html', null, '1', '2', '0', null);

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
  `order_time` datetime DEFAULT NULL,
  `contact_phone` varchar(11) DEFAULT NULL COMMENT '联系方式',
  `sample_id` int(11) DEFAULT NULL COMMENT '样品id',
  `status` int(11) DEFAULT '0' COMMENT '0-接单、录单；1-生产阶段；5-入库；-1-作废',
  `is_deleted` int(2) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='入单 业务员接单';

-- ----------------------------
-- Records of t_order
-- ----------------------------
INSERT INTO `t_order` VALUES ('21', '100', '夏天牛仔裤', '件', '2018-06-30', '99.00', '9900.00', '牛仔裤批发市场', '张三', '2018-05-28 00:00:00', '18813112970', '20', '0', null, '2018-05-30 10:48:45', '2018-05-31 01:53:35', '2', '2', '初次合作');
INSERT INTO `t_order` VALUES ('22', '20', '白色衬衫', '件', '2018-07-24', '80.00', '1600.00', '某公司', '李四', '2018-05-11 00:00:00', '18736579021', '20', '1', null, '2018-05-30 18:56:04', '2018-05-30 18:56:04', '2', null, '');
INSERT INTO `t_order` VALUES ('23', '432', '324', '432', '2018-05-31', '432.00', '43.00', '432', '432', '2018-05-31 00:00:00', '18888888888', null, '0', null, '2018-05-31 04:25:42', null, '2', null, '');

-- ----------------------------
-- Table structure for t_outbound
-- ----------------------------
DROP TABLE IF EXISTS `t_outbound`;
CREATE TABLE `t_outbound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `good_id` int(11) DEFAULT NULL COMMENT '库存物品id',
  `outbound_type` int(2) DEFAULT NULL COMMENT '1-原材料申请出库；2-成品申请出库',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '货物名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '货物型号',
  `type` int(2) DEFAULT NULL COMMENT '1-原材料；2-成品；',
  `color` varchar(10) DEFAULT NULL COMMENT '货物颜色',
  `num` int(11) DEFAULT NULL COMMENT '货物数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '货物单位',
  `status` int(2) DEFAULT '0' COMMENT '0-新建；1-申请入库；2-入库完成；3-驳回；',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(255) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='物品出库申请单';

-- ----------------------------
-- Records of t_outbound
-- ----------------------------
INSERT INTO `t_outbound` VALUES ('10', '7', '1', '白布', 'baibu', '1', '白色', '0', '匹', '1', '0', '2018-05-30 00:47:06', '2018-05-30 01:02:22', '2', '2', '');
INSERT INTO `t_outbound` VALUES ('11', '8', '1', '蓝色牛仔裤', '2018', '1', '蓝色', '0', '件', '0', '0', '2018-05-30 00:48:42', '2018-05-30 00:50:20', '2', '2', '');
INSERT INTO `t_outbound` VALUES ('12', '10', '1', '染料', '2018983', '1', '黑色', '1', '桶', '2', '0', '2018-05-30 01:42:00', '2018-05-30 01:43:15', '2', '2', '');
INSERT INTO `t_outbound` VALUES ('13', '7', '1', '白布', 'baibu', '1', '白色', '10', '匹', '2', '0', '2018-05-30 04:27:24', '2018-05-30 04:27:37', '2', '2', '');
INSERT INTO `t_outbound` VALUES ('14', '8', '1', '蓝色牛仔裤', '2018', '2', '蓝色', '0', '件', '0', '1', '2018-05-31 01:11:59', '2018-05-31 01:13:16', '2', '2', '');

-- ----------------------------
-- Table structure for t_plan
-- ----------------------------
DROP TABLE IF EXISTS `t_plan`;
CREATE TABLE `t_plan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL COMMENT '样品id, 跟名称不符  ',
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_plan
-- ----------------------------
INSERT INTO `t_plan` VALUES ('5', '14', '201805', '生产部', '蓝色牛仔裤', '2345', '2018-05-23 00:00:00', '2018-05-26 00:00:00', '20', '1', '0', '2018-05-27 15:08:35', '2018-05-27 07:43:04', '2', '2', '生产生产4567');
INSERT INTO `t_plan` VALUES ('6', null, '2016', '生产部', '蓝色牛仔', '3242', '2018-05-28 00:00:00', '2018-05-31 00:00:00', '50', '0', '0', '2018-05-27 15:08:35', '2018-05-27 15:08:35', '2', '2', '生产');
INSERT INTO `t_plan` VALUES ('7', null, '324567', '4535', '4324', '45353', '2018-05-26 00:00:00', '2018-05-31 00:00:00', '435', '0', '0', '2018-05-27 15:08:35', '2018-05-27 15:08:35', '2', '2', '435');
INSERT INTO `t_plan` VALUES ('8', null, '2345', '345', '2345', '23456', '2018-05-20 00:00:00', '2018-05-31 00:00:00', '345', '0', '0', '2018-05-27 15:08:45', '2018-05-27 15:08:45', '2', '2', '3456');

-- ----------------------------
-- Table structure for t_purchase_order
-- ----------------------------
DROP TABLE IF EXISTS `t_purchase_order`;
CREATE TABLE `t_purchase_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_name` varchar(50) DEFAULT NULL COMMENT '货物名称',
  `goods_model` varchar(50) DEFAULT NULL COMMENT '货物型号',
  `goods_type` int(2) DEFAULT NULL COMMENT '1-采购入库申请；2-成品入库申请；',
  `type` int(2) DEFAULT NULL COMMENT '1-原材料；2-成品；',
  `color` varchar(10) DEFAULT NULL COMMENT '货物颜色',
  `num` int(11) DEFAULT NULL COMMENT '货物数量',
  `unit` varchar(10) DEFAULT NULL COMMENT '货物单位',
  `batch_no` varchar(50) DEFAULT NULL COMMENT '批号',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `total_price` decimal(15,2) DEFAULT NULL,
  `produce_date` date DEFAULT NULL COMMENT '生产日期',
  `expired_date` date DEFAULT NULL COMMENT '过期日期',
  `supplier` varchar(50) DEFAULT NULL COMMENT '供应商',
  `buyer` varchar(50) DEFAULT NULL COMMENT '采购人',
  `buy_date` date DEFAULT NULL COMMENT '采购日期',
  `status` int(2) DEFAULT '0' COMMENT '0-新建；1-申请入库；2-入库完成；3-驳回；',
  `is_deleted` int(2) DEFAULT '0',
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(255) DEFAULT NULL,
  `remarks` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='采购单';

-- ----------------------------
-- Records of t_purchase_order
-- ----------------------------
INSERT INTO `t_purchase_order` VALUES ('11', '白布', 'baibu', '1', '1', '白色', '100', '匹', '20180529', '10.00', '1000.00', '2018-05-09', '2018-05-31', '白布有限公司', '张三', '2018-05-28', '2', '0', '2018-05-29 04:56:42', '2018-05-29 05:00:52', '2', '2', '入库吧');
INSERT INTO `t_purchase_order` VALUES ('12', '324', '432', '1', '1', '434', '432', '432', '432', '432.00', '324.00', '2018-05-22', '2018-05-31', '432', '432', '2018-05-22', '2', '0', '2018-05-29 05:05:08', '2018-05-30 01:42:14', '2', '2', '');
INSERT INTO `t_purchase_order` VALUES ('13', '黑皮鞋', '2019', '2', '2', '黑色', '543', '双', '543', '543.00', null, '2018-05-02', '2022-05-20', null, null, null, '3', '0', '2018-05-29 05:26:12', '2018-05-30 11:01:08', '2', '2', '5435');
INSERT INTO `t_purchase_order` VALUES ('14', '蓝色牛仔裤', '2018', '2', '2', '蓝色', '100', '件', '2019', '99.00', null, '2018-05-16', '2018-05-31', null, null, null, '2', '0', '2018-05-29 05:36:45', '2018-05-29 05:37:35', '2', '2', '34567');
INSERT INTO `t_purchase_order` VALUES ('15', '染料', '2018983', '1', '1', '黑色', '10', '桶', '21425', '99.00', '990.00', '2018-05-30', '2018-05-31', '某小店', '张三', '2018-05-22', '2', '0', '2018-05-30 01:34:34', '2018-05-30 01:40:25', '2', '2', '34565');
INSERT INTO `t_purchase_order` VALUES ('16', '白色衬衫', '2019', '2', '2', '白色', '100', '件', '3943', '99.00', null, '2018-05-23', '2021-05-07', null, null, null, '1', '0', '2018-05-30 11:01:37', '2018-05-30 11:01:41', '2', '2', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=328 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES ('42', '2', '1', '0', '2018-05-16 19:06:33', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('43', '2', '2', '0', '2018-05-16 19:06:33', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('305', '1', '8', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('306', '1', '11', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('307', '1', '13', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('308', '1', '18', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('309', '1', '21', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('310', '1', '20', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('311', '1', '19', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('312', '1', '16', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('313', '1', '23', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('314', '1', '24', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('315', '1', '12', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('316', '1', '15', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('317', '1', '5', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('318', '1', '22', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('319', '1', '6', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('320', '1', '25', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('321', '1', '14', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('322', '1', '26', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('323', '1', '7', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('324', '1', '1', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('325', '1', '2', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('326', '1', '3', '0', '2018-05-29 08:53:37', null, '2', null, null);
INSERT INTO `t_role_menu` VALUES ('327', '1', '4', '0', '2018-05-29 08:53:37', null, '2', null, null);

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
  `status` int(2) DEFAULT '0' COMMENT '0-新建；1-完成；',
  `is_deleted` int(255) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `creater` int(11) DEFAULT NULL,
  `modifier` int(11) DEFAULT NULL,
  `remarks` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='样品表 打样';

-- ----------------------------
-- Records of t_sample
-- ----------------------------
INSERT INTO `t_sample` VALUES ('19', null, '夏天牛仔', '2018xinkuang', 'http://47.98.232.164:8080/images/upload/f252a9d8-9500-4e27-a90d-09b1b8ce4457.jpg,http://47.98.232.164:8080/images/upload/e1ae3e78-7e3b-4606-9a0f-4122e48e7acd.jpg,http://47.98.232.164:8080/images/upload/2d74c00c-29bc-4e92-8c0b-347c5a6022e7.jpg', '1', '0', '2018-05-30 10:45:36', '2018-05-30 10:46:03', '2', '2', '夏天牛仔');
INSERT INTO `t_sample` VALUES ('20', null, '衬衫', '2019', 'http://47.98.232.164:8080/images/upload/c925500b-a1cc-4078-8077-8a12e164728d.jpg,http://47.98.232.164:8080/images/upload/638fd3b5-aa3b-4d79-821d-8263994c0ad0.jpg', '1', '0', '2018-05-30 10:47:07', '2018-05-30 10:53:28', '2', '2', '');
INSERT INTO `t_sample` VALUES ('21', null, '鞋子', '2018', 'http://47.98.232.164:8080/images/upload/3f0d46e6-b3a1-4e61-a1fd-8e05cc4db81b.jpg,http://47.98.232.164:8080/images/upload/152f7d34-2a23-45a3-be01-223452aa486c.jpg', '0', '1', '2018-05-30 10:59:01', '2018-05-31 02:34:51', '2', '2', '');

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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_sample_material
-- ----------------------------
INSERT INTO `t_sample_material` VALUES ('21', '19', null, '白线', '123464', '10', '白色', '卷', '0', '2018-05-30 18:45:35', null, '2', null, '白色线');
INSERT INTO `t_sample_material` VALUES ('22', '19', null, '白布', 'baibu', '10', '白色', '匹', '0', '2018-05-30 18:45:35', null, '2', null, '白色布匹');
INSERT INTO `t_sample_material` VALUES ('23', '20', null, '布匹', '2018', '20', '白色', '匹', '0', '2018-05-30 18:47:07', null, '2', null, '白色布匹');
INSERT INTO `t_sample_material` VALUES ('24', '21', null, '牛皮', '2018', '20', '褐色', '斤', '0', '2018-05-30 18:59:01', null, '2', null, '');

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
