/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : testoa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-10-02 00:06:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for itcast_application
-- ----------------------------
DROP TABLE IF EXISTS `itcast_application`;
CREATE TABLE `itcast_application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `applicationTemplateId` bigint(20) DEFAULT NULL,
  `applicantId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK35EB4F7BE40A6B40` (`applicationTemplateId`),
  KEY `FK35EB4F7B4ED67A97` (`applicantId`),
  CONSTRAINT `FK35EB4F7B4ED67A97` FOREIGN KEY (`applicantId`) REFERENCES `itcast_user` (`id`),
  CONSTRAINT `FK35EB4F7BE40A6B40` FOREIGN KEY (`applicationTemplateId`) REFERENCES `itcast_applicationtemplate` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_application
-- ----------------------------

-- ----------------------------
-- Table structure for itcast_applicationtemplate
-- ----------------------------
DROP TABLE IF EXISTS `itcast_applicationtemplate`;
CREATE TABLE `itcast_applicationtemplate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `processDefinitionKey` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_applicationtemplate
-- ----------------------------

-- ----------------------------
-- Table structure for itcast_approveinfo
-- ----------------------------
DROP TABLE IF EXISTS `itcast_approveinfo`;
CREATE TABLE `itcast_approveinfo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `approveTime` datetime DEFAULT NULL,
  `approval` bit(1) DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `applicationId` bigint(20) DEFAULT NULL,
  `approverId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK328B7C666B0C5AC` (`applicationId`),
  KEY `FK328B7C6251BDD9A` (`approverId`),
  CONSTRAINT `FK328B7C6251BDD9A` FOREIGN KEY (`approverId`) REFERENCES `itcast_user` (`id`),
  CONSTRAINT `FK328B7C666B0C5AC` FOREIGN KEY (`applicationId`) REFERENCES `itcast_application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_approveinfo
-- ----------------------------

-- ----------------------------
-- Table structure for itcast_department
-- ----------------------------
DROP TABLE IF EXISTS `itcast_department`;
CREATE TABLE `itcast_department` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB56F87C7729C9286` (`parentId`),
  CONSTRAINT `FKB56F87C7729C9286` FOREIGN KEY (`parentId`) REFERENCES `itcast_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_department
-- ----------------------------
INSERT INTO `itcast_department` VALUES ('20', '食堂管理', '管理食堂日常事务，饮食健康', null);
INSERT INTO `itcast_department` VALUES ('21', '财务管理', '管理公司财务，账务报销，工资发放等', null);
INSERT INTO `itcast_department` VALUES ('22', '医疗服务', '保障员工身体健康', null);
INSERT INTO `itcast_department` VALUES ('23', '人事部', '管理入职、印章、公司等各项证明等', null);
INSERT INTO `itcast_department` VALUES ('24', '后勤部', '后勤服务，水电装修，机械修理', null);
INSERT INTO `itcast_department` VALUES ('26', '保卫部', '门卫保障进入公司的没有闲杂人等', null);

-- ----------------------------
-- Table structure for itcast_forum
-- ----------------------------
DROP TABLE IF EXISTS `itcast_forum`;
CREATE TABLE `itcast_forum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `topicCount` int(11) DEFAULT NULL,
  `articleCount` int(11) DEFAULT NULL,
  `lastTopicId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lastTopicId` (`lastTopicId`),
  KEY `FK903A938C1D89DB14` (`lastTopicId`),
  CONSTRAINT `FK903A938C1D89DB14` FOREIGN KEY (`lastTopicId`) REFERENCES `itcast_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_forum
-- ----------------------------
INSERT INTO `itcast_forum` VALUES ('12', '1', '1', '13', '12', '17', '13');
INSERT INTO `itcast_forum` VALUES ('13', '2', '2', '12', '0', '0', null);
INSERT INTO `itcast_forum` VALUES ('14', '3', '3', '14', '0', '0', null);

-- ----------------------------
-- Table structure for itcast_privilege
-- ----------------------------
DROP TABLE IF EXISTS `itcast_privilege`;
CREATE TABLE `itcast_privilege` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parentId` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK2A54CF9CE7D51427` (`parentId`),
  CONSTRAINT `FK2A54CF9CE7D51427` FOREIGN KEY (`parentId`) REFERENCES `itcast_privilege` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_privilege
-- ----------------------------
INSERT INTO `itcast_privilege` VALUES ('1', null, 'FUNC20064.gif', null, '系统管理');
INSERT INTO `itcast_privilege` VALUES ('2', 'roleAction_list', null, '1', '岗位管理');
INSERT INTO `itcast_privilege` VALUES ('3', 'departmentAction_list', null, '1', '部门管理');
INSERT INTO `itcast_privilege` VALUES ('4', 'userAction_list', null, '1', '用户管理');
INSERT INTO `itcast_privilege` VALUES ('5', 'roleAction_list', null, '2', '岗位列表');
INSERT INTO `itcast_privilege` VALUES ('6', 'roleAction_delete', null, '2', '岗位删除');
INSERT INTO `itcast_privilege` VALUES ('7', 'roleAction_add', null, '2', '岗位添加');
INSERT INTO `itcast_privilege` VALUES ('8', 'roleAction_edit', null, '2', '岗位修改');
INSERT INTO `itcast_privilege` VALUES ('9', 'department_Action_list', null, '3', '部门列表');
INSERT INTO `itcast_privilege` VALUES ('10', 'department_Action_delete', null, '3', '部门删除');
INSERT INTO `itcast_privilege` VALUES ('11', 'department_Action_add', null, '3', '部门添加');
INSERT INTO `itcast_privilege` VALUES ('12', 'department_Action_edit', null, '3', '部门修改');
INSERT INTO `itcast_privilege` VALUES ('13', 'userAction_list', null, '4', '用户列表');
INSERT INTO `itcast_privilege` VALUES ('14', 'userAction_delete', null, '4', '用户删除');
INSERT INTO `itcast_privilege` VALUES ('15', 'userAction_add', null, '4', '用户添加');
INSERT INTO `itcast_privilege` VALUES ('16', 'userAction_edit', null, '4', '用户修改');
INSERT INTO `itcast_privilege` VALUES ('17', 'userAction_initPassword', null, '4', '初始化密码');
INSERT INTO `itcast_privilege` VALUES ('18', null, 'FUNC20064.gif', null, '网上交流');
INSERT INTO `itcast_privilege` VALUES ('19', 'forumManageAction_list', null, '18', '论坛管理');
INSERT INTO `itcast_privilege` VALUES ('20', 'forumAction_list', null, '18', '论坛');
INSERT INTO `itcast_privilege` VALUES ('21', '', 'FUNC20064.gif', null, '审批流转');
INSERT INTO `itcast_privilege` VALUES ('22', 'processDefinitionAction_list', null, '21', '审批流程管理');
INSERT INTO `itcast_privilege` VALUES ('23', 'applicationTemplateAction_list', null, '21', '申请模板管理');
INSERT INTO `itcast_privilege` VALUES ('24', 'flowAction_applicationTemplateList', null, '21', '起草申请');
INSERT INTO `itcast_privilege` VALUES ('25', 'flowAction_myTaskList', null, '21', '待我审批');
INSERT INTO `itcast_privilege` VALUES ('26', 'flowAction_myApplicationList', null, '21', '我的申请查询');
INSERT INTO `itcast_privilege` VALUES ('79', null, 'FUNC20082.gif', null, '系统管理');
INSERT INTO `itcast_privilege` VALUES ('80', 'roleAction_list', null, '79', '岗位管理');
INSERT INTO `itcast_privilege` VALUES ('81', 'departmentAction_list', null, '79', '部门管理');
INSERT INTO `itcast_privilege` VALUES ('82', 'userAction_list', null, '79', '用户管理');
INSERT INTO `itcast_privilege` VALUES ('83', 'roleAction_list', null, '80', '岗位列表');
INSERT INTO `itcast_privilege` VALUES ('84', 'roleAction_delete', null, '80', '岗位删除');
INSERT INTO `itcast_privilege` VALUES ('85', 'roleAction_add', null, '80', '岗位添加');
INSERT INTO `itcast_privilege` VALUES ('86', 'roleAction_edit', null, '80', '岗位修改');
INSERT INTO `itcast_privilege` VALUES ('87', 'departmentAction_list', null, '81', '部门列表');
INSERT INTO `itcast_privilege` VALUES ('88', 'departmentAction_delete', null, '81', '部门删除');
INSERT INTO `itcast_privilege` VALUES ('89', 'departmentAction_add', null, '81', '部门添加');
INSERT INTO `itcast_privilege` VALUES ('90', 'departmentAction_edit', null, '81', '部门修改');
INSERT INTO `itcast_privilege` VALUES ('91', 'userAction_list', null, '82', '用户列表');
INSERT INTO `itcast_privilege` VALUES ('92', 'userAction_delete', null, '82', '用户删除');
INSERT INTO `itcast_privilege` VALUES ('93', 'userAction_add', null, '82', '用户添加');
INSERT INTO `itcast_privilege` VALUES ('94', 'userAction_edit', null, '82', '用户修改');
INSERT INTO `itcast_privilege` VALUES ('95', 'userAction_initPassword', null, '82', '用户初始化密码');
INSERT INTO `itcast_privilege` VALUES ('96', null, 'FUNC20064.gif', null, '网上交流');
INSERT INTO `itcast_privilege` VALUES ('97', 'forumManageAction_list', null, '96', '论坛管理');
INSERT INTO `itcast_privilege` VALUES ('98', 'forumAction_list', null, '96', '论坛');
INSERT INTO `itcast_privilege` VALUES ('99', null, 'FUNC20057.gif', null, '审批流转');
INSERT INTO `itcast_privilege` VALUES ('100', 'processDefinitionAction_list', null, '99', '审批流程管理');
INSERT INTO `itcast_privilege` VALUES ('101', 'applicationTemplateAction_list', null, '99', '申请模板管理');
INSERT INTO `itcast_privilege` VALUES ('102', 'flowAction_applicationTemplateList', null, '99', '起草申请');
INSERT INTO `itcast_privilege` VALUES ('103', 'flowAction_myTaskList', null, '99', '待我审批');
INSERT INTO `itcast_privilege` VALUES ('104', 'flowAction_myApplicationList', null, '99', '我的申请查询');

-- ----------------------------
-- Table structure for itcast_reply
-- ----------------------------
DROP TABLE IF EXISTS `itcast_reply`;
CREATE TABLE `itcast_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `faceIcon` varchar(255) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  `authorId` bigint(20) DEFAULT NULL,
  `topicId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK90DF19551074626A` (`topicId`),
  KEY `FK90DF1955479FFEE0` (`authorId`),
  CONSTRAINT `FK90DF19551074626A` FOREIGN KEY (`topicId`) REFERENCES `itcast_topic` (`id`),
  CONSTRAINT `FK90DF1955479FFEE0` FOREIGN KEY (`authorId`) REFERENCES `itcast_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_reply
-- ----------------------------
INSERT INTO `itcast_reply` VALUES ('1', '回复：a', '&nbsp;你什么呀发的', null, '2017-08-22 17:36:11', '0:0:0:0:0:0:0:1', '19', '1');
INSERT INTO `itcast_reply` VALUES ('2', '回复：a', '&nbsp;就是，赞同二楼的', null, '2017-08-22 17:36:27', '0:0:0:0:0:0:0:1', '19', '1');
INSERT INTO `itcast_reply` VALUES ('3', '回复：哈哈', '&nbsp;神经病，就发个哈哈<img src=\"http://localhost:8084/ItcastOA/fckeditor/editor/images/smiley/wangwang/28.gif\" alt=\"\" />', '1', '2017-08-22 17:37:21', '0:0:0:0:0:0:0:1', '19', '5');
INSERT INTO `itcast_reply` VALUES ('4', '回复：哈哈', '&nbsp;<span style=\"color: rgb(255, 204, 0);\"><em><strong>来吧，</strong></em></span>我们都哈哈个<img src=\"http://localhost:8084/ItcastOA/fckeditor/editor/images/smiley/wangwang/84.gif\" alt=\"\" />', null, '2017-08-22 17:38:18', '0:0:0:0:0:0:0:1', '19', '5');
INSERT INTO `itcast_reply` VALUES ('5', '回复：哈哈', '&nbsp;我是四楼我最美<img src=\"http://localhost:8084/ItcastOA/fckeditor/editor/images/smiley/wangwang/13.gif\" alt=\"\" />', null, '2017-08-22 17:38:44', '0:0:0:0:0:0:0:1', '19', '5');

-- ----------------------------
-- Table structure for itcast_role
-- ----------------------------
DROP TABLE IF EXISTS `itcast_role`;
CREATE TABLE `itcast_role` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_role
-- ----------------------------
INSERT INTO `itcast_role` VALUES ('2', '董事长', 'xiaozhang\r\n');
INSERT INTO `itcast_role` VALUES ('3', '总经理', '');
INSERT INTO `itcast_role` VALUES ('4', '副总经理', '');
INSERT INTO `itcast_role` VALUES ('5', '主任', '');
INSERT INTO `itcast_role` VALUES ('6', '员工', '');
INSERT INTO `itcast_role` VALUES ('12', null, null);

-- ----------------------------
-- Table structure for itcast_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `itcast_role_privilege`;
CREATE TABLE `itcast_role_privilege` (
  `roleId` bigint(20) NOT NULL,
  `privilegeId` bigint(20) NOT NULL,
  PRIMARY KEY (`privilegeId`,`roleId`),
  KEY `FK350BD81DB0E19C6E` (`privilegeId`),
  KEY `FK350BD81DBB0AE3B6` (`roleId`),
  CONSTRAINT `FK350BD81DB0E19C6E` FOREIGN KEY (`privilegeId`) REFERENCES `itcast_privilege` (`id`),
  CONSTRAINT `FK350BD81DBB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `itcast_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_role_privilege
-- ----------------------------
INSERT INTO `itcast_role_privilege` VALUES ('2', '1');
INSERT INTO `itcast_role_privilege` VALUES ('3', '1');
INSERT INTO `itcast_role_privilege` VALUES ('4', '1');
INSERT INTO `itcast_role_privilege` VALUES ('2', '2');
INSERT INTO `itcast_role_privilege` VALUES ('3', '2');
INSERT INTO `itcast_role_privilege` VALUES ('4', '2');
INSERT INTO `itcast_role_privilege` VALUES ('2', '3');
INSERT INTO `itcast_role_privilege` VALUES ('3', '3');
INSERT INTO `itcast_role_privilege` VALUES ('2', '4');
INSERT INTO `itcast_role_privilege` VALUES ('2', '5');
INSERT INTO `itcast_role_privilege` VALUES ('3', '5');
INSERT INTO `itcast_role_privilege` VALUES ('4', '5');
INSERT INTO `itcast_role_privilege` VALUES ('2', '6');
INSERT INTO `itcast_role_privilege` VALUES ('3', '6');
INSERT INTO `itcast_role_privilege` VALUES ('4', '6');
INSERT INTO `itcast_role_privilege` VALUES ('2', '7');
INSERT INTO `itcast_role_privilege` VALUES ('3', '7');
INSERT INTO `itcast_role_privilege` VALUES ('4', '7');
INSERT INTO `itcast_role_privilege` VALUES ('2', '8');
INSERT INTO `itcast_role_privilege` VALUES ('3', '8');
INSERT INTO `itcast_role_privilege` VALUES ('4', '8');
INSERT INTO `itcast_role_privilege` VALUES ('2', '9');
INSERT INTO `itcast_role_privilege` VALUES ('3', '9');
INSERT INTO `itcast_role_privilege` VALUES ('2', '10');
INSERT INTO `itcast_role_privilege` VALUES ('3', '10');
INSERT INTO `itcast_role_privilege` VALUES ('2', '11');
INSERT INTO `itcast_role_privilege` VALUES ('3', '11');
INSERT INTO `itcast_role_privilege` VALUES ('2', '12');
INSERT INTO `itcast_role_privilege` VALUES ('3', '12');
INSERT INTO `itcast_role_privilege` VALUES ('2', '13');
INSERT INTO `itcast_role_privilege` VALUES ('2', '14');
INSERT INTO `itcast_role_privilege` VALUES ('2', '15');
INSERT INTO `itcast_role_privilege` VALUES ('2', '16');
INSERT INTO `itcast_role_privilege` VALUES ('2', '17');
INSERT INTO `itcast_role_privilege` VALUES ('2', '21');
INSERT INTO `itcast_role_privilege` VALUES ('2', '22');
INSERT INTO `itcast_role_privilege` VALUES ('2', '23');
INSERT INTO `itcast_role_privilege` VALUES ('2', '24');
INSERT INTO `itcast_role_privilege` VALUES ('2', '25');
INSERT INTO `itcast_role_privilege` VALUES ('2', '26');

-- ----------------------------
-- Table structure for itcast_topic
-- ----------------------------
DROP TABLE IF EXISTS `itcast_topic`;
CREATE TABLE `itcast_topic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `faceIcon` varchar(255) DEFAULT NULL,
  `postTime` datetime DEFAULT NULL,
  `ipAddr` varchar(255) DEFAULT NULL,
  `authorId` bigint(20) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `replyCount` int(11) DEFAULT NULL,
  `lastUpdateTime` datetime DEFAULT NULL,
  `forumId` bigint(20) DEFAULT NULL,
  `lastReplyId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `lastReplyId` (`lastReplyId`),
  KEY `FK90FFD39AA28DE3CA` (`lastReplyId`),
  KEY `FK90FFD39A479FFEE0` (`authorId`),
  KEY `FK90FFD39A2B39ADCE` (`forumId`),
  CONSTRAINT `FK90FFD39A2B39ADCE` FOREIGN KEY (`forumId`) REFERENCES `itcast_forum` (`id`),
  CONSTRAINT `FK90FFD39A479FFEE0` FOREIGN KEY (`authorId`) REFERENCES `itcast_user` (`id`),
  CONSTRAINT `FK90FFD39AA28DE3CA` FOREIGN KEY (`lastReplyId`) REFERENCES `itcast_reply` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_topic
-- ----------------------------
INSERT INTO `itcast_topic` VALUES ('1', 'a', '<img src=\"http://localhost:8084/ItcastOA/fckeditor/editor/images/smiley/wangwang/1.gif\" alt=\"\" />', '2', '2017-08-22 17:16:59', '0:0:0:0:0:0:0:1', '19', '0', '2', '2017-08-22 17:36:27', '12', '2');
INSERT INTO `itcast_topic` VALUES ('2', '啊啊', '&nbsp;啊啊', '3', '2017-08-22 17:20:46', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:20:46', '12', null);
INSERT INTO `itcast_topic` VALUES ('3', '阿方索地方', '&nbsp; &nbsp;发的飒飒的', '4', '2017-08-22 17:20:58', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:20:58', '12', null);
INSERT INTO `itcast_topic` VALUES ('5', '哈哈', '&nbsp;<img src=\"http://localhost:8084/ItcastOA/fckeditor/editor/images/smiley/wangwang/10.gif\" alt=\"\" />', '2', '2017-08-22 17:33:35', '0:0:0:0:0:0:0:1', '19', '0', '3', '2017-08-22 17:38:44', '12', '5');
INSERT INTO `itcast_topic` VALUES ('6', '2', '&nbsp;2', null, '2017-08-22 17:39:12', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:39:12', '12', null);
INSERT INTO `itcast_topic` VALUES ('7', '3', '&nbsp;3<img src=\"http://localhost:8084/ItcastOA/fckeditor/editor/images/smiley/wangwang/9.gif\" alt=\"\" />', null, '2017-08-22 17:39:18', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:39:18', '12', null);
INSERT INTO `itcast_topic` VALUES ('8', '4', '&nbsp;4', '3', '2017-08-22 17:39:27', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:39:27', '12', null);
INSERT INTO `itcast_topic` VALUES ('9', '5', '&nbsp;5', null, '2017-08-22 17:39:47', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:39:47', '12', null);
INSERT INTO `itcast_topic` VALUES ('10', '6', '&nbsp;6<img src=\"http://localhost:8084/ItcastOA/fckeditor/editor/images/smiley/wangwang/18.gif\" alt=\"\" />', null, '2017-08-22 17:39:55', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:39:55', '12', null);
INSERT INTO `itcast_topic` VALUES ('11', '7', '&nbsp;7', null, '2017-08-22 17:40:02', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:40:02', '12', null);
INSERT INTO `itcast_topic` VALUES ('12', '8', '&nbsp;8', null, '2017-08-22 17:40:09', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:40:09', '12', null);
INSERT INTO `itcast_topic` VALUES ('13', '9', '&nbsp;9', null, '2017-08-22 17:40:16', '0:0:0:0:0:0:0:1', '19', '0', '0', '2017-08-22 17:40:16', '12', null);

-- ----------------------------
-- Table structure for itcast_user
-- ----------------------------
DROP TABLE IF EXISTS `itcast_user`;
CREATE TABLE `itcast_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `loginName` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `gender` varchar(255) DEFAULT NULL,
  `phoneNumber` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `departmentId` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4ADEC00F49BC32E` (`departmentId`),
  CONSTRAINT `FK4ADEC00F49BC32E` FOREIGN KEY (`departmentId`) REFERENCES `itcast_department` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_user
-- ----------------------------
INSERT INTO `itcast_user` VALUES ('19', 'admin', 'admin', '超级管理员', null, null, null, null, null);
INSERT INTO `itcast_user` VALUES ('22', '1', '1', '1', '女', '188389255656', '188856989454@1653.com', '大二学生', null);
INSERT INTO `itcast_user` VALUES ('23', '2', '81dc9bdb52d04dc20036dbd8313ed055', '2', '男', '1213', '454@163.com', '学生会部长', '20');
INSERT INTO `itcast_user` VALUES ('24', '3', '3', '3', '男', '22', '222', '22', '22');
INSERT INTO `itcast_user` VALUES ('25', '??', '81dc9bdb52d04dc20036dbd8313ed055', '??', '?', '7898987987987', '8989899@qq.com', 'jdjdj', '20');

-- ----------------------------
-- Table structure for itcast_user_role
-- ----------------------------
DROP TABLE IF EXISTS `itcast_user_role`;
CREATE TABLE `itcast_user_role` (
  `userId` bigint(20) NOT NULL,
  `roleId` bigint(20) NOT NULL,
  PRIMARY KEY (`roleId`,`userId`),
  KEY `FK9C95CD55BB0AE3B6` (`roleId`),
  KEY `FK9C95CD55C0603920` (`userId`),
  CONSTRAINT `FK9C95CD55BB0AE3B6` FOREIGN KEY (`roleId`) REFERENCES `itcast_role` (`id`),
  CONSTRAINT `FK9C95CD55C0603920` FOREIGN KEY (`userId`) REFERENCES `itcast_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of itcast_user_role
-- ----------------------------
INSERT INTO `itcast_user_role` VALUES ('25', '6');

-- ----------------------------
-- Table structure for jbpm4_deployment
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployment`;
CREATE TABLE `jbpm4_deployment` (
  `DBID_` bigint(20) NOT NULL,
  `NAME_` longtext,
  `TIMESTAMP_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployment
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_deployprop
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_deployprop`;
CREATE TABLE `jbpm4_deployprop` (
  `DBID_` bigint(20) NOT NULL,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `OBJNAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `STRINGVAL_` varchar(255) DEFAULT NULL,
  `LONGVAL_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_DEPLPROP_DEPL` (`DEPLOYMENT_`),
  CONSTRAINT `FK_DEPLPROP_DEPL` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_deployprop
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_execution
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_execution`;
CREATE TABLE `jbpm4_execution` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ACTIVITYNAME_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `HISACTINST_` bigint(20) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `INSTANCE_` bigint(20) DEFAULT NULL,
  `SUPEREXEC_` bigint(20) DEFAULT NULL,
  `SUBPROCINST_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  UNIQUE KEY `ID_` (`ID_`),
  KEY `FK_EXEC_SUBPI` (`SUBPROCINST_`),
  KEY `FK_EXEC_INSTANCE` (`INSTANCE_`),
  KEY `FK_EXEC_SUPEREXEC` (`SUPEREXEC_`),
  KEY `FK_EXEC_PARENT` (`PARENT_`),
  CONSTRAINT `FK_EXEC_INSTANCE` FOREIGN KEY (`INSTANCE_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUBPI` FOREIGN KEY (`SUBPROCINST_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_EXEC_SUPEREXEC` FOREIGN KEY (`SUPEREXEC_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_execution
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_actinst
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_actinst`;
CREATE TABLE `jbpm4_hist_actinst` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `TRANSITION_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HACTI_HPROCI` (`HPROCI_`),
  KEY `FK_HTI_HTASK` (`HTASK_`),
  CONSTRAINT `FK_HACTI_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HTI_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_actinst
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_detail
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_detail`;
CREATE TABLE `jbpm4_hist_detail` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TIME_` datetime DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HPROCIIDX_` int(11) DEFAULT NULL,
  `HACTI_` bigint(20) DEFAULT NULL,
  `HACTIIDX_` int(11) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  `HTASKIDX_` int(11) DEFAULT NULL,
  `HVAR_` bigint(20) DEFAULT NULL,
  `HVARIDX_` int(11) DEFAULT NULL,
  `MESSAGE_` longtext,
  `OLD_STR_` varchar(255) DEFAULT NULL,
  `NEW_STR_` varchar(255) DEFAULT NULL,
  `OLD_INT_` int(11) DEFAULT NULL,
  `NEW_INT_` int(11) DEFAULT NULL,
  `OLD_TIME_` datetime DEFAULT NULL,
  `NEW_TIME_` datetime DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  `PARENT_IDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HDETAIL_HVAR` (`HVAR_`),
  KEY `FK_HDETAIL_HPROCI` (`HPROCI_`),
  KEY `FK_HDETAIL_HTASK` (`HTASK_`),
  KEY `FK_HDETAIL_HACTI` (`HACTI_`),
  CONSTRAINT `FK_HDETAIL_HACTI` FOREIGN KEY (`HACTI_`) REFERENCES `jbpm4_hist_actinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`),
  CONSTRAINT `FK_HDETAIL_HVAR` FOREIGN KEY (`HVAR_`) REFERENCES `jbpm4_hist_var` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_detail
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_procinst
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_procinst`;
CREATE TABLE `jbpm4_hist_procinst` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PROCDEFID_` varchar(255) DEFAULT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `START_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ENDACTIVITY_` varchar(255) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_procinst
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_task
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_task`;
CREATE TABLE `jbpm4_hist_task` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `EXECUTION_` varchar(255) DEFAULT NULL,
  `OUTCOME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `END_` datetime DEFAULT NULL,
  `DURATION_` bigint(20) DEFAULT NULL,
  `NEXTIDX_` int(11) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HSUPERT_SUB` (`SUPERTASK_`),
  CONSTRAINT `FK_HSUPERT_SUB` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_task
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_hist_var
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_hist_var`;
CREATE TABLE `jbpm4_hist_var` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `PROCINSTID_` varchar(255) DEFAULT NULL,
  `EXECUTIONID_` varchar(255) DEFAULT NULL,
  `VARNAME_` varchar(255) DEFAULT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  `HPROCI_` bigint(20) DEFAULT NULL,
  `HTASK_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_HVAR_HPROCI` (`HPROCI_`),
  KEY `FK_HVAR_HTASK` (`HTASK_`),
  CONSTRAINT `FK_HVAR_HPROCI` FOREIGN KEY (`HPROCI_`) REFERENCES `jbpm4_hist_procinst` (`DBID_`),
  CONSTRAINT `FK_HVAR_HTASK` FOREIGN KEY (`HTASK_`) REFERENCES `jbpm4_hist_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_hist_var
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_id_group
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_group`;
CREATE TABLE `jbpm4_id_group` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `PARENT_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_GROUP_PARENT` (`PARENT_`),
  CONSTRAINT `FK_GROUP_PARENT` FOREIGN KEY (`PARENT_`) REFERENCES `jbpm4_id_group` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_group
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_id_membership
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_membership`;
CREATE TABLE `jbpm4_id_membership` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `USER_` bigint(20) DEFAULT NULL,
  `GROUP_` bigint(20) DEFAULT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_MEM_GROUP` (`GROUP_`),
  KEY `FK_MEM_USER` (`USER_`),
  CONSTRAINT `FK_MEM_GROUP` FOREIGN KEY (`GROUP_`) REFERENCES `jbpm4_id_group` (`DBID_`),
  CONSTRAINT `FK_MEM_USER` FOREIGN KEY (`USER_`) REFERENCES `jbpm4_id_user` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_membership
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_id_user
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_id_user`;
CREATE TABLE `jbpm4_id_user` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `ID_` varchar(255) DEFAULT NULL,
  `PASSWORD_` varchar(255) DEFAULT NULL,
  `GIVENNAME_` varchar(255) DEFAULT NULL,
  `FAMILYNAME_` varchar(255) DEFAULT NULL,
  `BUSINESSEMAIL_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_id_user
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_job
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_job`;
CREATE TABLE `jbpm4_job` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `STATE_` varchar(255) DEFAULT NULL,
  `ISEXCLUSIVE_` bit(1) DEFAULT NULL,
  `LOCKOWNER_` varchar(255) DEFAULT NULL,
  `LOCKEXPTIME_` datetime DEFAULT NULL,
  `EXCEPTION_` longtext,
  `RETRIES_` int(11) DEFAULT NULL,
  `PROCESSINSTANCE_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `CFG_` bigint(20) DEFAULT NULL,
  `SIGNAL_` varchar(255) DEFAULT NULL,
  `EVENT_` varchar(255) DEFAULT NULL,
  `REPEAT_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_JOB_CFG` (`CFG_`),
  CONSTRAINT `FK_JOB_CFG` FOREIGN KEY (`CFG_`) REFERENCES `jbpm4_lob` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_job
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_lob
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_lob`;
CREATE TABLE `jbpm4_lob` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `BLOB_VALUE_` longblob,
  `DEPLOYMENT_` bigint(20) DEFAULT NULL,
  `NAME_` longtext,
  PRIMARY KEY (`DBID_`),
  KEY `FK_LOB_DEPLOYMENT` (`DEPLOYMENT_`),
  CONSTRAINT `FK_LOB_DEPLOYMENT` FOREIGN KEY (`DEPLOYMENT_`) REFERENCES `jbpm4_deployment` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_lob
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_participation
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_participation`;
CREATE TABLE `jbpm4_participation` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `GROUPID_` varchar(255) DEFAULT NULL,
  `USERID_` varchar(255) DEFAULT NULL,
  `TYPE_` varchar(255) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_PART_SWIMLANE` (`SWIMLANE_`),
  KEY `FK_PART_TASK` (`TASK_`),
  CONSTRAINT `FK_PART_SWIMLANE` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`),
  CONSTRAINT `FK_PART_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_participation
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_property
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_property`;
CREATE TABLE `jbpm4_property` (
  `KEY_` varchar(255) NOT NULL,
  `VERSION_` int(11) NOT NULL,
  `VALUE_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`KEY_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_property
-- ----------------------------
INSERT INTO `jbpm4_property` VALUES ('next.dbid', '0', '1');

-- ----------------------------
-- Table structure for jbpm4_swimlane
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_swimlane`;
CREATE TABLE `jbpm4_swimlane` (
  `DBID_` bigint(20) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_SWIMLANE_EXEC` (`EXECUTION_`),
  CONSTRAINT `FK_SWIMLANE_EXEC` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_swimlane
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_task
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_task`;
CREATE TABLE `jbpm4_task` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` char(1) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `NAME_` varchar(255) DEFAULT NULL,
  `DESCR_` longtext,
  `STATE_` varchar(255) DEFAULT NULL,
  `SUSPHISTSTATE_` varchar(255) DEFAULT NULL,
  `ASSIGNEE_` varchar(255) DEFAULT NULL,
  `FORM_` varchar(255) DEFAULT NULL,
  `PRIORITY_` int(11) DEFAULT NULL,
  `CREATE_` datetime DEFAULT NULL,
  `DUEDATE_` datetime DEFAULT NULL,
  `PROGRESS_` int(11) DEFAULT NULL,
  `SIGNALLING_` bit(1) DEFAULT NULL,
  `EXECUTION_ID_` varchar(255) DEFAULT NULL,
  `ACTIVITY_NAME_` varchar(255) DEFAULT NULL,
  `HASVARS_` bit(1) DEFAULT NULL,
  `SUPERTASK_` bigint(20) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `PROCINST_` bigint(20) DEFAULT NULL,
  `SWIMLANE_` bigint(20) DEFAULT NULL,
  `TASKDEFNAME_` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_TASK_SWIML` (`SWIMLANE_`),
  KEY `FK_TASK_SUPERTASK` (`SUPERTASK_`),
  CONSTRAINT `FK_TASK_SUPERTASK` FOREIGN KEY (`SUPERTASK_`) REFERENCES `jbpm4_task` (`DBID_`),
  CONSTRAINT `FK_TASK_SWIML` FOREIGN KEY (`SWIMLANE_`) REFERENCES `jbpm4_swimlane` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_task
-- ----------------------------

-- ----------------------------
-- Table structure for jbpm4_variable
-- ----------------------------
DROP TABLE IF EXISTS `jbpm4_variable`;
CREATE TABLE `jbpm4_variable` (
  `DBID_` bigint(20) NOT NULL,
  `CLASS_` varchar(255) NOT NULL,
  `DBVERSION_` int(11) NOT NULL,
  `KEY_` varchar(255) DEFAULT NULL,
  `CONVERTER_` varchar(255) DEFAULT NULL,
  `HIST_` bit(1) DEFAULT NULL,
  `EXECUTION_` bigint(20) DEFAULT NULL,
  `TASK_` bigint(20) DEFAULT NULL,
  `LOB_` bigint(20) DEFAULT NULL,
  `DATE_VALUE_` datetime DEFAULT NULL,
  `DOUBLE_VALUE_` double DEFAULT NULL,
  `CLASSNAME_` varchar(255) DEFAULT NULL,
  `LONG_VALUE_` bigint(20) DEFAULT NULL,
  `STRING_VALUE_` varchar(255) DEFAULT NULL,
  `TEXT_VALUE_` longtext,
  `EXESYS_` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`DBID_`),
  KEY `FK_VAR_EXESYS` (`EXESYS_`),
  KEY `FK_VAR_LOB` (`LOB_`),
  KEY `FK_VAR_TASK` (`TASK_`),
  KEY `FK_VAR_EXECUTION` (`EXECUTION_`),
  CONSTRAINT `FK_VAR_EXECUTION` FOREIGN KEY (`EXECUTION_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_EXESYS` FOREIGN KEY (`EXESYS_`) REFERENCES `jbpm4_execution` (`DBID_`),
  CONSTRAINT `FK_VAR_LOB` FOREIGN KEY (`LOB_`) REFERENCES `jbpm4_lob` (`DBID_`),
  CONSTRAINT `FK_VAR_TASK` FOREIGN KEY (`TASK_`) REFERENCES `jbpm4_task` (`DBID_`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jbpm4_variable
-- ----------------------------
