/*
 Navicat MySQL Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 116.196.80.135
 Source Database       : miaosha

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : utf-8

 Date: 06/24/2018 16:15:59 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

use miaosha;

-- ----------------------------
--  Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '商品ID',
  `goods_name` varchar(16) DEFAULT NULL COMMENT '商品名称',
  `goods_title` varchar(64) DEFAULT NULL COMMENT '商品标题',
  `goods_img` varchar(64) DEFAULT NULL COMMENT '商品的图片',
  `goods_detail` longtext COMMENT '商品的详情介绍',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `goods_stock` int(11) DEFAULT '0' COMMENT '商品库存，-1表示没有限制',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `goods`
-- ----------------------------
BEGIN;
INSERT INTO `goods` VALUES ('1', 'iPhone X', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机', '/img/iphonex.png', 'Apple iPhone X (A1865) 64GB 深空灰色 移动联通电信4G手机', '8388.00', '8888'), ('2', '华为Mate9', '华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待', '/img/meta10.png', '\n\n华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n    华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n\n关注 分享 对比\n举报\n京东精选 华为 Mate 9 Pro 6GB+128GB版 琥珀金 移动联通电信4G手机 双卡双待\n2K双曲面屏幕！麒麟960芯片！二代徕卡双摄像头！', '3099.00', '6666');
COMMIT;

-- ----------------------------
--  Table structure for `miaosha_goods`
-- ----------------------------
DROP TABLE IF EXISTS `miaosha_goods`;
CREATE TABLE `miaosha_goods` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '秒杀的商品',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `miaosha_price` decimal(10,2) DEFAULT '0.00' COMMENT '秒杀价',
  `stock_count` int(11) DEFAULT NULL COMMENT '库存数量',
  `start_date` datetime DEFAULT NULL COMMENT '秒杀开始时间',
  `end_date` datetime DEFAULT NULL COMMENT '秒杀结束时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `miaosha_goods`
-- ----------------------------
BEGIN;
INSERT INTO `miaosha_goods` VALUES ('1', '1', '0.01', '9', '2018-06-23 15:18:00', '2018-06-30 14:00:18'), ('2', '2', '0.01', '10', '2018-06-18 14:00:00', '2018-06-30 14:00:18');
COMMIT;

-- ----------------------------
--  Table structure for `miaosha_order`
-- ----------------------------
DROP TABLE IF EXISTS `miaosha_order`;
CREATE TABLE `miaosha_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `order_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `miaosha_order`
-- ----------------------------
BEGIN;
INSERT INTO `miaosha_order` VALUES ('15', '13910380055', '1', '15');
COMMIT;

-- ----------------------------
--  Table structure for `miaosha_user`
-- ----------------------------
DROP TABLE IF EXISTS `miaosha_user`;
CREATE TABLE `miaosha_user` (
  `id` bigint(20) NOT NULL COMMENT '用户ID，手机号码',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `password` varchar(32) DEFAULT NULL COMMENT 'MD5(MD5(pass明文+固定salt)+salt)',
  `salt` varchar(10) DEFAULT NULL,
  `head` varchar(128) DEFAULT NULL COMMENT '头像，云存储的ID',
  `register_date` datetime DEFAULT NULL COMMENT '注册时间',
  `last_login_date` datetime DEFAULT NULL COMMENT '上次登录时间',
  `login_count` int(11) DEFAULT '0' COMMENT '登录次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `miaosha_user`
-- ----------------------------
BEGIN;
INSERT INTO `miaosha_user` VALUES ('13000000000', 'user0', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000001', 'user1', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000002', 'user2', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000003', 'user3', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000004', 'user4', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000005', 'user5', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000006', 'user6', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000007', 'user7', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000008', 'user8', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000009', 'user9', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000010', 'user10', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000011', 'user11', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000012', 'user12', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000013', 'user13', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000014', 'user14', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000015', 'user15', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000016', 'user16', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000017', 'user17', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000018', 'user18', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000019', 'user19', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000020', 'user20', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000021', 'user21', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000022', 'user22', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000023', 'user23', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000024', 'user24', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000025', 'user25', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000026', 'user26', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000027', 'user27', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000028', 'user28', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000029', 'user29', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000030', 'user30', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000031', 'user31', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000032', 'user32', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000033', 'user33', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000034', 'user34', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000035', 'user35', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000036', 'user36', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000037', 'user37', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000038', 'user38', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000039', 'user39', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000040', 'user40', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000041', 'user41', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000042', 'user42', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000043', 'user43', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000044', 'user44', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000045', 'user45', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000046', 'user46', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000047', 'user47', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000048', 'user48', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000049', 'user49', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000050', 'user50', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000051', 'user51', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000052', 'user52', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000053', 'user53', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000054', 'user54', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000055', 'user55', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000056', 'user56', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000057', 'user57', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000058', 'user58', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000059', 'user59', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000060', 'user60', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000061', 'user61', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000062', 'user62', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000063', 'user63', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000064', 'user64', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000065', 'user65', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000066', 'user66', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000067', 'user67', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000068', 'user68', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000069', 'user69', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000070', 'user70', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000071', 'user71', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000072', 'user72', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000073', 'user73', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000074', 'user74', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000075', 'user75', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000076', 'user76', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000077', 'user77', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000078', 'user78', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000079', 'user79', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000080', 'user80', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000081', 'user81', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000082', 'user82', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000083', 'user83', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000084', 'user84', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000085', 'user85', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000086', 'user86', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000087', 'user87', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000088', 'user88', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000089', 'user89', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000090', 'user90', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000091', 'user91', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000092', 'user92', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000093', 'user93', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000094', 'user94', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000095', 'user95', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000096', 'user96', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000097', 'user97', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000098', 'user98', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13000000099', 'user99', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c', null, '2018-06-23 23:50:22', null, '1'), ('13910380055', 'jdcoe', 'b7797cce01b4b131b433b6acf4add449', '1a2b3c4d', null, '2018-06-21 14:01:53', '2018-06-21 14:02:01', '1');
COMMIT;

-- ----------------------------
--  Table structure for `order_info`
-- ----------------------------
DROP TABLE IF EXISTS `order_info`;
CREATE TABLE `order_info` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `goods_id` bigint(20) DEFAULT NULL COMMENT '商品ID',
  `delivery_addr_id` bigint(20) DEFAULT NULL COMMENT '收货地址ID',
  `goods_name` varchar(16) DEFAULT NULL COMMENT '冗余过来的商品名称',
  `goods_count` int(11) DEFAULT NULL COMMENT '商品数量',
  `goods_price` decimal(10,2) DEFAULT '0.00' COMMENT '商品单价',
  `order_channel` tinyint(4) DEFAULT '0' COMMENT '1pc, 2android, 3ios',
  `status` tinyint(4) DEFAULT '0' COMMENT '订单状态，0新建未支付，1已支付，2已发货，3已收货，4已退款，5已完成',
  `create_date` datetime DEFAULT NULL COMMENT '订单的创建时间',
  `pay_date` datetime DEFAULT NULL COMMENT '支付时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
--  Records of `order_info`
-- ----------------------------
BEGIN;
INSERT INTO `order_info` VALUES ('15', '13910380055', '1', null, 'iPhone X', '1', '0.01', '1', '0', '2018-06-24 12:07:10', null);
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'JDCOE');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
