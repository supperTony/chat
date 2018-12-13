/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50635
 Source Host           : localhost
 Source Database       : chat

 Target Server Type    : MySQL
 Target Server Version : 50635
 File Encoding         : utf-8

 Date: 12/12/2018 17:49:26 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `c_admin`
-- ----------------------------
DROP TABLE IF EXISTS `c_admin`;
CREATE TABLE `c_admin` (
  `id` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `salt` varchar(8) NOT NULL DEFAULT '' COMMENT '密码混淆码',
  `encrypt` varchar(6) NOT NULL DEFAULT '',
  `lastloginip` int(10) NOT NULL DEFAULT '0',
  `lastlogintime` int(10) unsigned NOT NULL DEFAULT '0',
  `email` varchar(40) NOT NULL DEFAULT '',
  `mobile` varchar(11) NOT NULL DEFAULT '',
  `realname` varchar(50) NOT NULL DEFAULT '',
  `openid` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(2:无效,1:有效)',
  `updatetime` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `c_admin`
-- ----------------------------
BEGIN;
INSERT INTO `c_admin` VALUES ('1', 'admin', 'd2cfdd3866bea832bf276cb1157afe0027bac296', 'MDIy', '', '2130706433', '1544605648', 'to_darcy@163.com', '15818189144', '老子是大佬', '', '1', '1528685285'), ('2', 'test', '8daf9ba72273ed8b98f05f39d73f2ea3c542d1c4', 'NTIx', '', '2130706433', '1544595701', '', '', '', '', '1', '1513402282'), ('3', 'yao', '6204504ddade5c0a67a51a09fe53f3df096d89f5', 'ODgx', '', '2130706433', '1544607119', '', '', '我是这条街最靓的崽', '', '1', '1544597650');
COMMIT;

-- ----------------------------
--  Table structure for `c_admin_group`
-- ----------------------------
DROP TABLE IF EXISTS `c_admin_group`;
CREATE TABLE `c_admin_group` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `rules` varchar(500) NOT NULL DEFAULT '' COMMENT '用户组拥有的规则id，多个规则 , 隔开',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `c_admin_group`
-- ----------------------------
BEGIN;
INSERT INTO `c_admin_group` VALUES ('1', '普通管理员', '普通管理员', '32,33,34', '0', '1525579040'), ('2', '工作人员', '仅拥有日志管理权限', '18,23,27', '0', '1476067479'), ('3', '后台演示', '只能看，不能增删改', '31,1,2,3,7,8,23,18,12,13,27', '0', '1479969527');
COMMIT;

-- ----------------------------
--  Table structure for `c_admin_group_access`
-- ----------------------------
DROP TABLE IF EXISTS `c_admin_group_access`;
CREATE TABLE `c_admin_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户id',
  `group_id` mediumint(8) unsigned NOT NULL COMMENT '用户组id',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `c_admin_group_access`
-- ----------------------------
BEGIN;
INSERT INTO `c_admin_group_access` VALUES ('3', '1'), ('2', '3'), ('4', '3');
COMMIT;

-- ----------------------------
--  Table structure for `c_admin_log`
-- ----------------------------
DROP TABLE IF EXISTS `c_admin_log`;
CREATE TABLE `c_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `m` varchar(15) NOT NULL,
  `c` varchar(20) NOT NULL,
  `a` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` int(10) NOT NULL,
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `c_admin_log`
-- ----------------------------
BEGIN;
INSERT INTO `c_admin_log` VALUES ('1', 'admin', 'Group', 'index', '', '4', 'test', '2130706433', '0'), ('2', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '2130706433', '1511774084'), ('3', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1511774113'), ('4', 'admin', 'Admin', 'favicon.ico', '', '1', 'admin', '2130706433', '1511774113'), ('5', 'admin', 'Admin', 'index', '?/admin/Admin/index', '4', 'test', '2130706433', '1511774606'), ('6', 'admin', 'Admin', 'index', '?/admin/Admin/index', '4', 'test', '2130706433', '1511774687'), ('7', 'admin', 'Admin', 'index', '?/admin/Admin/index', '4', 'test', '2130706433', '1511774689'), ('8', 'admin', 'Group', 'index', '?/admin/Group/index', '4', 'test', '2130706433', '1511774690'), ('9', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '4', 'test', '2130706433', '1511774733'), ('10', 'admin', 'Admin', 'index', '?/admin/Admin/index', '4', 'test', '2130706433', '1511774738'), ('11', 'admin', 'Admin', 'index', '?/admin/Admin/index', '4', 'test', '2130706433', '1511774747'), ('12', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '2130706433', '1511774761'), ('13', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1511774763'), ('14', 'admin', 'Admin', 'favicon.ico', '?/admin/Admin/favicon.ico', '1', 'admin', '2130706433', '1511774764'), ('15', 'admin', 'Admin', 'del', '?/admin/admin/del&id=3', '1', 'admin', '2130706433', '1511774766'), ('16', 'admin', 'Admin', 'index', '?/admin/admin/index', '1', 'admin', '2130706433', '1511774769'), ('17', 'admin', 'Admin', 'favicon.ico', '?/admin/admin/favicon.ico', '1', 'admin', '2130706433', '1511774769'), ('18', 'admin', 'Admin', 'del', '?/admin/admin/del&id=2', '1', 'admin', '2130706433', '1511774771'), ('19', 'admin', 'Admin', 'index', '?/admin/admin/index', '1', 'admin', '2130706433', '1511774774'), ('20', 'admin', 'Admin', 'info', '?/admin/admin/info&id=4', '1', 'admin', '2130706433', '1511774807'), ('21', 'admin', 'Admin', 'edit', '?/admin/admin/edit', '1', 'admin', '2130706433', '1511774831'), ('22', 'admin', 'Admin', 'info', '?/admin/admin/info&id=4', '1', 'admin', '2130706433', '1511774834'), ('23', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1511774837'), ('24', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1511774842'), ('25', 'admin', 'Group', 'favicon.ico', '?/admin/Group/favicon.ico', '1', 'admin', '2130706433', '1511774842'), ('26', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1511774843'), ('27', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1511774846'), ('28', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1511774854'), ('29', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1511774858'), ('30', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1511774860'), ('31', 'admin', 'Group', 'index', '?/admin/Group/index', '1', 'admin', '2130706433', '1511774862'), ('32', 'admin', 'Log', 'favicon.ico', '?/admin/Log/favicon.ico', '1', 'admin', '2130706433', '1511774872'), ('33', 'admin', 'Admin', 'public_edit_info', '?/admin/admin/public_edit_info', '1', 'admin', '2130706433', '1511774953'), ('34', 'admin', 'Index', 'favicon.ico', '?/admin/Index/favicon.ico', '1', 'admin', '2130706433', '1511774956'), ('35', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1511775061'), ('36', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1511775063'), ('37', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1511775335'), ('38', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1511775776'), ('39', 'admin', 'Index', 'favicon.ico', '?s=/admin/index/favicon.ico', '1', 'admin', '2130706433', '1512540784'), ('40', 'admin', 'Admin', 'index', '?s=/admin/Admin/index', '1', 'admin', '2130706433', '1512540790'), ('41', 'admin', 'Admin', 'favicon.ico', '?s=/admin/Admin/favicon.ico', '1', 'admin', '2130706433', '1512540790'), ('42', 'admin', 'Group', 'index', '?s=/admin/Group/index', '1', 'admin', '2130706433', '1512540795'), ('43', 'admin', 'Group', 'favicon.ico', '?s=/admin/Group/favicon.ico', '1', 'admin', '2130706433', '1512540795'), ('44', 'admin', 'Admin', 'public_edit_info', '?s=/admin/Admin/public_edit_info', '1', 'admin', '2130706433', '1512540800'), ('45', 'admin', 'Menu', 'favicon.ico', '?s=/admin/Menu/favicon.ico', '1', 'admin', '2130706433', '1512540804'), ('46', 'admin', 'Admin', 'index', '?s=/admin/Admin/index', '1', 'admin', '2130706433', '1512541331'), ('47', 'admin', 'Admin', 'info', '?s=/admin/Admin/info', '1', 'admin', '2130706433', '1512541333'), ('48', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '2130706433', '1513221333'), ('49', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '1900118788', '1513401919'), ('50', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '2130706433', '1513402071'), ('51', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1513402086'), ('52', 'admin', 'Admin', 'favicon.ico', '?/admin/Admin/favicon.ico', '1', 'admin', '2130706433', '1513402087'), ('53', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '2130706433', '1513402230'), ('54', 'admin', 'Admin', 'info', '?/admin/Admin/info', '1', 'admin', '2130706433', '1513402232'), ('55', 'admin', 'Admin', 'add', '?/admin/Admin/add', '1', 'admin', '2130706433', '1513402248'), ('56', 'admin', 'Admin', 'index', '?/admin/admin/index', '1', 'admin', '2130706433', '1513402252'), ('57', 'admin', 'Admin', 'favicon.ico', '?/admin/admin/favicon.ico', '1', 'admin', '2130706433', '1513402254'), ('58', 'admin', 'Admin', 'info', '?/admin/admin/info&id=2', '1', 'admin', '2130706433', '1513402269'), ('59', 'admin', 'Admin', 'edit', '?/admin/admin/edit', '1', 'admin', '2130706433', '1513402281'), ('60', 'admin', 'Admin', 'info', '?/admin/admin/info&id=2', '1', 'admin', '2130706433', '1513402285'), ('61', 'admin', 'Admin', 'index', '?/admin/Admin/index', '2', 'test', '2130706433', '1513402325'), ('62', 'admin', 'Index', 'favicon.ico', '?/admin/index/favicon.ico', '1', 'admin', '1900118788', '1513403072'), ('63', 'admin', 'Admin', 'index', '?/admin/Admin/index', '1', 'admin', '1900118788', '1513403074'), ('64', 'admin', 'Admin', 'favicon.ico', '?/admin/Admin/favicon.ico', '1', 'admin', '1900118788', '1513403075'), ('65', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '1900118788', '1513403080'), ('66', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '1900118788', '1513403105'), ('67', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '1', 'admin', '1900118788', '1513403108'), ('68', 'admin', 'Admin', 'index', '?/admin/Admin/index', '2', 'test', '2130706433', '1513403231'), ('69', 'admin', 'Group', 'index', '?/admin/Group/index', '2', 'test', '2130706433', '1513403236'), ('70', 'admin', 'Admin', 'index', '?/admin/Admin/index', '2', 'test', '2130706433', '1513403239'), ('71', 'admin', 'Admin', 'info', '?/admin/Admin/info', '2', 'test', '2130706433', '1513403242'), ('72', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '2', 'test', '2130706433', '1513403246'), ('73', 'admin', 'Group', 'index', '?/admin/Group/index', '2', 'test', '2130706433', '1513403249'), ('74', 'admin', 'Group', 'index', '?/admin/Group/index', '2', 'test', '2130706433', '1513403258'), ('75', 'admin', 'Group', 'info', '?/admin/group/info&id=1', '2', 'test', '2130706433', '1513403260'), ('76', 'admin', 'Group', 'info', '?/admin/group/info&id=1', '2', 'test', '2130706433', '1513403274'), ('77', 'admin', 'Admin', 'index', '?/admin/Admin/index', '2', 'test', '1900118788', '1513410701'), ('78', 'admin', 'Group', 'index', '?/admin/Group/index', '2', 'test', '1900118788', '1513410701'), ('79', 'admin', 'Admin', 'index', '?/admin/Admin/index', '2', 'test', '1857662162', '1513411069'), ('80', 'admin', 'Admin', 'public_edit_info', '?/admin/Admin/public_edit_info', '2', 'test', '1857662162', '1513411073'), ('81', 'admin', 'Admin', 'index', '', '2', 'test', '2130706433', '1523417909'), ('82', 'admin', 'Admin', 'index', '', '2', 'test', '2130706433', '1523417911'), ('83', 'admin', 'Admin', 'index', '', '2', 'test', '2130706433', '1523417913'), ('84', 'admin', 'Group', 'index', '', '2', 'test', '2130706433', '1523417915'), ('85', 'admin', 'Group', 'index', '', '2', 'test', '2130706433', '1523417929'), ('86', 'admin', 'Admin', 'public_edit_info', '', '2', 'test', '2130706433', '1523417945'), ('87', 'admin', 'Group', 'index', '', '2', 'test', '2130706433', '1523417948'), ('88', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '2130706433', '1525578745'), ('89', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1525578748'), ('90', 'admin', 'Admin', 'favicon.ico', '', '1', 'admin', '2130706433', '1525578749'), ('91', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578753'), ('92', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578764'), ('93', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578767'), ('94', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578863'), ('95', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578869'), ('96', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578872'), ('97', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578904'), ('98', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578907'), ('99', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578929'), ('100', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578932'), ('101', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578984'), ('102', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525578987'), ('103', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525579008'), ('104', 'admin', 'Group', 'index', '', '1', 'admin', '2130706433', '1525579010'), ('105', 'admin', 'Group', 'favicon.ico', '', '1', 'admin', '2130706433', '1525579010'), ('106', 'admin', 'Group', 'info', '?id=1', '1', 'admin', '2130706433', '1525579016'), ('107', 'admin', 'Group', 'favicon.ico', '', '1', 'admin', '2130706433', '1525579017'), ('108', 'admin', 'Group', 'edit', '', '1', 'admin', '2130706433', '1525579040'), ('109', 'admin', 'Group', 'index', '', '1', 'admin', '2130706433', '1525579043'), ('110', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1525579048'), ('111', 'admin', 'Menu', 'favicon.ico', '', '1', 'admin', '2130706433', '1525579056'), ('112', 'admin', 'Log', 'favicon.ico', '', '1', 'admin', '2130706433', '1525579061'), ('113', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '2130706433', '1525579064'), ('114', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1525579066'), ('115', 'admin', 'Group', 'index', '', '1', 'admin', '2130706433', '1525579067'), ('116', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1525579068'), ('117', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1525599652'), ('118', 'admin', 'Group', 'index', '', '1', 'admin', '2130706433', '1525599670'), ('119', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1525599684'), ('120', 'admin', 'Menu', 'info', '?id=1', '1', 'admin', '2130706433', '1525599744'), ('121', 'admin', 'Menu', 'favicon.ico', '', '1', 'admin', '2130706433', '1525599744'), ('122', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1525599779'), ('123', 'admin', 'Menu', 'add', '', '1', 'admin', '2130706433', '1525599856'), ('124', 'admin', 'Menu', 'info', '?id=32', '1', 'admin', '2130706433', '1525600072'), ('125', 'admin', 'Menu', 'edit', '', '1', 'admin', '2130706433', '1525600080'), ('126', 'admin', 'Warehouse', 'warehouse', '', '1', 'admin', '2130706433', '1525600084'), ('127', 'admin', 'Menu', 'info', '?parentid=32', '1', 'admin', '2130706433', '1525600094'), ('128', 'admin', 'Menu', 'info', '?id=12', '1', 'admin', '2130706433', '1525600130'), ('129', 'admin', 'Menu', 'info', '?id=2', '1', 'admin', '2130706433', '1525600145'), ('130', 'admin', 'Menu', 'add', '', '1', 'admin', '2130706433', '1525600180'), ('131', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525600185'), ('132', 'admin', 'Warehouse', 'favicon.ico', '', '1', 'admin', '2130706433', '1525600186'), ('133', 'admin', 'Menu', 'info', '?id=2', '1', 'admin', '2130706433', '1525600226'), ('134', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525600228'), ('135', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1525602070'), ('136', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525602601'), ('137', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525602642'), ('138', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525602661'), ('139', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525602681'), ('140', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525602704'), ('141', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525602729'), ('142', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525602741'), ('143', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525602791'), ('144', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604044'), ('145', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604067'), ('146', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604088'), ('147', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604125'), ('148', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604203'), ('149', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604292'), ('150', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604417'), ('151', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604445'), ('152', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604448'), ('153', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604467'), ('154', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604491'), ('155', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604521'), ('156', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604553'), ('157', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604555'), ('158', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1525604611'), ('159', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525604620'), ('160', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1525663680'), ('161', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '2130706433', '1528684998'), ('162', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1528685003'), ('163', 'admin', 'Admin', 'favicon.ico', '', '1', 'admin', '2130706433', '1528685003'), ('164', 'admin', 'Group', 'index', '', '1', 'admin', '2130706433', '1528685004'), ('165', 'admin', 'Group', 'favicon.ico', '', '1', 'admin', '2130706433', '1528685004'), ('166', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1528685005'), ('167', 'admin', 'Menu', 'favicon.ico', '', '1', 'admin', '2130706433', '1528685008'), ('168', 'admin', 'Log', 'favicon.ico', '', '1', 'admin', '2130706433', '1528685010'), ('169', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1528685018'), ('170', 'admin', 'Admin', 'favicon.ico', '', '1', 'admin', '2130706433', '1528685018'), ('171', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '2130706433', '1528685020'), ('172', 'admin', 'Warehouse', 'index', '', '1', 'admin', '2130706433', '1528685217'), ('173', 'admin', 'Warehouse', 'favicon.ico', '', '1', 'admin', '2130706433', '1528685217'), ('174', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1528685276'), ('175', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1528685285'), ('176', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1528685288'), ('177', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1528689465'), ('178', 'admin', 'Admin', 'index', '', '2', 'test', '2130706433', '1542686280'), ('179', 'admin', 'Group', 'index', '', '2', 'test', '2130706433', '1542686284'), ('180', 'admin', 'Admin', 'public_edit_info', '', '2', 'test', '2130706433', '1542686288'), ('181', 'admin', 'Admin', 'index', '', '2', 'test', '2130706433', '1544068895'), ('182', 'admin', 'Group', 'index', '', '2', 'test', '2130706433', '1544068897'), ('183', 'admin', 'Admin', 'public_edit_info', '', '2', 'test', '2130706433', '1544068898'), ('184', 'admin', 'Admin', 'index', '', '2', 'test', '2130706433', '1544068921'), ('185', 'admin', 'Group', 'index', '', '2', 'test', '2130706433', '1544103137'), ('186', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103167'), ('187', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103215'), ('188', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103247'), ('189', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103535'), ('190', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103542'), ('191', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103574'), ('192', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103574'), ('193', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103732'), ('194', 'admin', 'Menu', 'info', '', '2', 'test', '2130706433', '1544103732'), ('195', 'admin', 'Admin', 'index', '', '2', 'test', '2130706433', '1544407963'), ('196', 'admin', 'Group', 'index', '', '2', 'test', '2130706433', '1544407970'), ('197', 'admin', 'Admin', 'public_edit_info', '', '2', 'test', '2130706433', '1544407976'), ('198', 'admin', 'Index', 'favicon.ico', '', '1', 'admin', '2130706433', '1544581585'), ('199', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581588'), ('200', 'admin', 'Admin', 'favicon.ico', '', '1', 'admin', '2130706433', '1544581588'), ('201', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544581590'), ('202', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544581618'), ('203', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581623'), ('204', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544581627'), ('205', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581630'), ('206', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581663'), ('207', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544581673'), ('208', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581675'), ('209', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581749'), ('210', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581770'), ('211', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581771'), ('212', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581804'), ('213', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581806'), ('214', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581856'), ('215', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581864'), ('216', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581865'), ('217', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581889'), ('218', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581889'), ('219', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581901'), ('220', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581902'), ('221', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581964'), ('222', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581990'), ('223', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544581991'), ('224', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544581993'), ('225', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544582149'), ('226', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544582150'), ('227', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582152'), ('228', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582320'), ('229', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582321'), ('230', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582325'), ('231', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582326'), ('232', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582327'), ('233', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582492'), ('234', 'admin', 'Admin', 'add', '', '1', 'admin', '2130706433', '1544582522'), ('235', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544582525'), ('236', 'admin', 'Admin', 'favicon.ico', '', '1', 'admin', '2130706433', '1544582525'), ('237', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544582600'), ('238', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544582603'), ('239', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582606'), ('240', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582606'), ('241', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582667'), ('242', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582698'), ('243', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582698'), ('244', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582772'), ('245', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582773'), ('246', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582902'), ('247', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582902'), ('248', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544582916'), ('249', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544583100'), ('250', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544583101'), ('251', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544583102'), ('252', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544583102'), ('253', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544583112'), ('254', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544583112'), ('255', 'admin', 'Admin', 'edit', '', '1', 'admin', '2130706433', '1544583116'), ('256', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544583119'), ('257', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544583119'), ('258', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544583125'), ('259', 'admin', 'Menu', 'favicon.ico', '', '1', 'admin', '2130706433', '1544583133'), ('260', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583162'), ('261', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583162'), ('262', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583185'), ('263', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583186'), ('264', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583192'), ('265', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583193'), ('266', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583357'), ('267', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583358'), ('268', 'admin', 'Menu', 'edit', '', '1', 'admin', '2130706433', '1544583375'), ('269', 'admin', 'Menu', 'favicon.ico', '', '1', 'admin', '2130706433', '1544583378'), ('270', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583384'), ('271', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583385'), ('272', 'admin', 'Menu', 'edit', '', '1', 'admin', '2130706433', '1544583399'), ('273', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583406'), ('274', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544583406'), ('275', 'admin', 'Menu', 'edit', '', '1', 'admin', '2130706433', '1544583419'), ('276', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544583433'), ('277', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544583465'), ('278', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544583466'), ('279', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544583488'), ('280', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544583711'), ('281', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544597616'), ('282', 'admin', 'Group', 'index', '', '1', 'admin', '2130706433', '1544597618'), ('283', 'admin', 'Group', 'favicon.ico', '', '1', 'admin', '2130706433', '1544597618'), ('284', 'admin', 'Group', 'info', '', '1', 'admin', '2130706433', '1544597621'), ('285', 'admin', 'Group', 'info', '', '1', 'admin', '2130706433', '1544597622'), ('286', 'admin', 'Admin', 'public_edit_info', '', '1', 'admin', '2130706433', '1544597629'), ('287', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544597631'), ('288', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544597635'), ('289', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544597635'), ('290', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544597642'), ('291', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544597644'), ('292', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544597645'), ('293', 'admin', 'Admin', 'edit', '', '1', 'admin', '2130706433', '1544597650'), ('294', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544597653'), ('295', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544597654'), ('296', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544597657'), ('297', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544597660'), ('298', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544597866'), ('299', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544597932'), ('300', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544598809'), ('301', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544599012'), ('302', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544599048'), ('303', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544599345'), ('304', 'admin', 'Group', 'index', '', '1', 'admin', '2130706433', '1544599424'), ('305', 'admin', 'Group', 'info', '', '1', 'admin', '2130706433', '1544599428'), ('306', 'admin', 'Group', 'info', '', '1', 'admin', '2130706433', '1544599428'), ('307', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544599434'), ('308', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544599437'), ('309', 'admin', 'Admin', 'info', '', '1', 'admin', '2130706433', '1544599438'), ('310', 'admin', 'Admin', 'index', '', '1', 'admin', '2130706433', '1544599439'), ('311', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544599456'), ('312', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599479'), ('313', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599479'), ('314', 'admin', 'Customerservice', 'favicon.ico', '', '1', 'admin', '2130706433', '1544599479'), ('315', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599496'), ('316', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599496'), ('317', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599532'), ('318', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599532'), ('319', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599608'), ('320', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599608'), ('321', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599688'), ('322', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599688'), ('323', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599703'), ('324', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599704'), ('325', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599737'), ('326', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599738'), ('327', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599803'), ('328', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599804'), ('329', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599904'), ('330', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599951'), ('331', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544599959'), ('332', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544599960'), ('333', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600048'), ('334', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600049'), ('335', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600069'), ('336', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600070'), ('337', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600105'), ('338', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600130'), ('339', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600130'), ('340', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600189'), ('341', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600190'), ('342', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600299'), ('343', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600300'), ('344', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600352'), ('345', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600353'), ('346', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600366'), ('347', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600367'), ('348', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600390'), ('349', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600390'), ('350', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600402'), ('351', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600403'), ('352', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600475'), ('353', 'admin', 'Customerservice', 'getuserid', '', '1', 'admin', '2130706433', '1544600476'), ('354', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600597'), ('355', 'admin', 'Customerservice', 'index', '', '1', 'admin', '2130706433', '1544600625'), ('356', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544600769'), ('357', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544600838'), ('358', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544601125'), ('359', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544601389'), ('360', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544601472'), ('361', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544601682'), ('362', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544605699'), ('363', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544605776'), ('364', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544605800'), ('365', 'admin', 'Menu', 'add', '', '1', 'admin', '2130706433', '1544605864'), ('366', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544605914'), ('367', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544605916'), ('368', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544605926'), ('369', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544605978'), ('370', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606018'), ('371', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606019'), ('372', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606047'), ('373', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606061'), ('374', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606062'), ('375', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606092'), ('376', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606106'), ('377', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606107'), ('378', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606135'), ('379', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606136'), ('380', 'admin', 'Menu', 'info', '', '1', 'admin', '2130706433', '1544606146'), ('381', 'admin', 'Menu', 'add', '', '1', 'admin', '2130706433', '1544606190'), ('382', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544606690'), ('383', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544606721'), ('384', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544606763'), ('385', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544607014'), ('386', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5600000002', '3', 'yao', '2130706433', '1544607015'), ('387', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544607127'), ('388', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5400000002', '3', 'yao', '2130706433', '1544607128'), ('389', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5400000002', '3', 'yao', '2130706433', '1544607152'), ('390', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5400000002', '3', 'yao', '2130706433', '1544607251'), ('391', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5400000002', '3', 'yao', '2130706433', '1544607281'), ('392', 'admin', 'Customerservice', 'index', '', '3', 'yao', '2130706433', '1544607382'), ('393', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5600000003', '3', 'yao', '2130706433', '1544607382'), ('394', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5400000003', '3', 'yao', '2130706433', '1544607598'), ('395', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5700000002', '3', 'yao', '2130706433', '1544607639'), ('396', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5700000003', '3', 'yao', '2130706433', '1544607708'), ('397', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5700000004', '3', 'yao', '2130706433', '1544607748'), ('398', 'admin', 'Customerservice', 'upclientid', '?client_id=7f0000010b5500000001', '3', 'yao', '2130706433', '1544607770');
COMMIT;

-- ----------------------------
--  Table structure for `c_app`
-- ----------------------------
DROP TABLE IF EXISTS `c_app`;
CREATE TABLE `c_app` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(100) NOT NULL DEFAULT '',
  `price` decimal(10,0) NOT NULL DEFAULT '0',
  `icon` varchar(100) NOT NULL DEFAULT '' COMMENT '图标',
  `total` int(11) NOT NULL DEFAULT '0' COMMENT '数量',
  `type` tinyint(2) NOT NULL DEFAULT '1' COMMENT '1软件，2游戏，3付费',
  `add_time` datetime NOT NULL COMMENT '添加时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `user_id` int(11) NOT NULL COMMENT '发布人ID',
  `position` smallint(5) NOT NULL DEFAULT '0' COMMENT '位置',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '标记说明',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL COMMENT '开始时间',
  `s_time` time DEFAULT NULL,
  `date_total` int(11) DEFAULT NULL,
  `time_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '时间类型：1全天，2时间段',
  PRIMARY KEY (`id`),
  KEY `nums` (`total`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `c_config`
-- ----------------------------
DROP TABLE IF EXISTS `c_config`;
CREATE TABLE `c_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置ID',
  `name` varchar(30) NOT NULL DEFAULT '' COMMENT '配置名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置类型',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '配置说明',
  `group` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '配置分组',
  `extra` varchar(255) NOT NULL DEFAULT '' COMMENT '配置值',
  `remark` varchar(100) NOT NULL COMMENT '配置说明',
  `create_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  `value` text NOT NULL COMMENT '配置值',
  `sort` smallint(3) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_name` (`name`),
  KEY `type` (`type`),
  KEY `group` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `c_customer_service`
-- ----------------------------
DROP TABLE IF EXISTS `c_customer_service`;
CREATE TABLE `c_customer_service` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '后台管理员ID',
  `name` varchar(100) CHARACTER SET utf8mb4 NOT NULL COMMENT '客服昵称',
  `is_online` tinyint(1) NOT NULL COMMENT '是否在线；0=离线1=在线',
  `client_id` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL COMMENT 'websocket用户ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `c_customer_service`
-- ----------------------------
BEGIN;
INSERT INTO `c_customer_service` VALUES ('1', '3', '客服001', '0', '7f0000010b5500000001'), ('2', '2', '客服002', '0', null);
COMMIT;

-- ----------------------------
--  Table structure for `c_goods`
-- ----------------------------
DROP TABLE IF EXISTS `c_goods`;
CREATE TABLE `c_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '商品名',
  `type` tinyint(2) unsigned NOT NULL DEFAULT '1' COMMENT '1(克),2(公斤)',
  `stock` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `up_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `operator` int(11) unsigned NOT NULL COMMENT '修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `c_goods`
-- ----------------------------
BEGIN;
INSERT INTO `c_goods` VALUES ('1', '小米', '1', '100', '1524816014', '1524816016', '1');
COMMIT;

-- ----------------------------
--  Table structure for `c_menu`
-- ----------------------------
DROP TABLE IF EXISTS `c_menu`;
CREATE TABLE `c_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) DEFAULT '0',
  `icon` varchar(20) NOT NULL DEFAULT '',
  `c` varchar(20) DEFAULT NULL,
  `a` varchar(20) DEFAULT NULL,
  `data` varchar(50) NOT NULL DEFAULT '',
  `tip` varchar(255) NOT NULL DEFAULT '' COMMENT '提示',
  `group` varchar(50) DEFAULT '' COMMENT '分组',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '999',
  `display` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否显示(1:显示,2:不显示)',
  `updatetime` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `c_menu`
-- ----------------------------
BEGIN;
INSERT INTO `c_menu` VALUES ('1', '管理设置', '0', 'fa-users', 'Admin', 'admin', '', '', '', '1', '1', '1476175413'), ('2', '管理员管理', '1', '', 'Admin', 'index', '', '', '', '0', '1', '1476175413'), ('3', '详情', '2', '', 'Admin', 'info', '', '', '', '0', '2', '1476175413'), ('4', '添加', '2', '', 'Admin', 'add', '', '', '', '0', '2', '1476175413'), ('5', '修改', '2', '', 'Admin', 'edit', '', '', '', '0', '2', '1476175413'), ('6', '删除', '2', '', 'Admin', 'del', '', '', '', '0', '2', '1476175413'), ('7', '分组管理', '1', '', 'Group', 'index', '', '', '', '0', '1', '1476175413'), ('8', '详情', '7', '', 'Group', 'info', '', '', '', '0', '2', '1476175413'), ('9', '添加', '7', '', 'Group', 'add', '', '', '', '0', '2', '1476175413'), ('10', '修改', '7', '', 'Group', 'edit', '', '', '', '0', '2', '1476175413'), ('11', '删除', '7', '', 'Group', 'del', '', '', '', '0', '2', '1476175413'), ('12', '菜单管理', '18', '', 'Menu', 'index', '', '', '', '0', '1', '1476175413'), ('13', '查看', '12', '', 'Menu', 'info', '', '', '', '0', '2', '1476175413'), ('14', '添加', '12', '', 'Menu', 'add', '', '', '', '0', '2', '1476175413'), ('15', '修改', '12', '', 'Menu', 'edit', '', '', '', '0', '2', '1476175413'), ('16', '删除', '12', '', 'Menu', 'del', '', '', '', '0', '2', '1476175413'), ('18', '系统设置', '0', 'fa-cogs', 'Menu', 'index', '', '', '', '2', '1', '1476175413'), ('22', '权限设置', '2', '', 'Group', 'rule', '', '', '', '999', '2', '1476175413'), ('23', '个人设置', '1', '', 'Admin', 'public_edit_info', '', '', '', '999', '1', '1476175413'), ('27', '日志管理', '18', '', 'Log', 'index', '', '', '', '999', '1', '1476175413'), ('31', '系统首页', '0', 'fa-bank', 'Index', 'index', '', '', '', '0', '1', '1476175413'), ('32', '客服页面', '0', 'fa-bars', 'CustomerService', 'customerService', '', '', '', '999', '1', '1544583399'), ('33', '客服聊天', '32', '', 'CustomerService', 'index', '', '', '', '999', '1', '1544583419'), ('34', '更新client_id', '32', 'address-card', 'CustomerService', 'upClientId', '', '', '', '999', '2', null);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
