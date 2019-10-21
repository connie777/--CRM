/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50148
Source Host           : localhost:3306
Source Database       : crm

Target Server Type    : MYSQL
Target Server Version : 50148
File Encoding         : 65001

Date: 2019-10-21 17:45:23
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base_dict
-- ----------------------------
DROP TABLE IF EXISTS `base_dict`;
CREATE TABLE `base_dict` (
  `dict_id` varchar(32) NOT NULL COMMENT '数据字典id(主键)',
  `dict_type_code` varchar(10) NOT NULL COMMENT '数据字典类别代码',
  `dict_type_name` varchar(50) NOT NULL COMMENT '数据字典类别名称',
  `dict_item_name` varchar(50) NOT NULL COMMENT '数据字典项目名称',
  `dict_item_code` varchar(10) DEFAULT NULL COMMENT '数据字典项目代码(可为空)',
  `dict_sort` int(10) DEFAULT NULL COMMENT '排序字段',
  `dict_enable` char(1) NOT NULL COMMENT '1:使用 0:停用',
  `dict_memo` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_dict
-- ----------------------------
INSERT INTO `base_dict` VALUES ('1', '001', '客户行业', '教育培训 ', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('10', '003', '公司性质', '民企', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('12', '004', '年营业额', '1-10万', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('13', '004', '年营业额', '10-20万', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('14', '004', '年营业额', '20-50万', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('15', '004', '年营业额', '50-100万', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('16', '004', '年营业额', '100-500万', null, '5', '1', null);
INSERT INTO `base_dict` VALUES ('17', '004', '年营业额', '500-1000万', null, '6', '1', null);
INSERT INTO `base_dict` VALUES ('18', '005', '客户状态', '基础客户', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('19', '005', '客户状态', '潜在客户', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('2', '001', '客户行业', '电子商务', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('20', '005', '客户状态', '成功客户', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('21', '005', '客户状态', '无效客户', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('22', '006', '客户级别', '普通客户', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('23', '006', '客户级别', 'VIP客户', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('24', '007', '商机状态', '意向客户', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('25', '007', '商机状态', '初步沟通', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('26', '007', '商机状态', '深度沟通', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('27', '007', '商机状态', '签订合同', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('3', '001', '客户行业', '对外贸易', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('30', '008', '商机类型', '新业务', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('31', '008', '商机类型', '现有业务', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('32', '009', '商机来源', '电话营销', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('33', '009', '商机来源', '网络营销', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('34', '009', '商机来源', '推广活动', null, '3', '1', null);
INSERT INTO `base_dict` VALUES ('35', '001', '客户行业', '互联网', null, '6', '1', null);
INSERT INTO `base_dict` VALUES ('4', '001', '客户行业', '酒店旅游', null, '4', '1', null);
INSERT INTO `base_dict` VALUES ('5', '001', '客户行业', '房地产', null, '5', '1', null);
INSERT INTO `base_dict` VALUES ('6', '002', '客户信息来源', '电话营销', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('7', '002', '客户信息来源', '网络营销', null, '2', '1', null);
INSERT INTO `base_dict` VALUES ('8', '003', '公司性质', '合资', null, '1', '1', null);
INSERT INTO `base_dict` VALUES ('9', '003', '公司性质', '国企', null, '2', '1', null);

-- ----------------------------
-- Table structure for contract
-- ----------------------------
DROP TABLE IF EXISTS `contract`;
CREATE TABLE `contract` (
  `contract_id` varchar(100) NOT NULL COMMENT '合同编号（含有英文）',
  `contract_cust_name` varchar(255) DEFAULT NULL COMMENT '客户名称',
  `contract_date` datetime DEFAULT NULL COMMENT '签约日期',
  `contract_img` varchar(255) DEFAULT NULL COMMENT '合同附件名',
  PRIMARY KEY (`contract_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合同表';

-- ----------------------------
-- Records of contract
-- ----------------------------
INSERT INTO `contract` VALUES ('HT101', 'Alibaba', '2019-03-14 00:00:00', 'upload/baab480d10ca491db680f7b18c1d0c84.png');
INSERT INTO `contract` VALUES ('HT102', '美团网', '2019-03-30 00:00:00', 'upload/402e993c0512403a9a571df4d9b7799b.jpeg');
INSERT INTO `contract` VALUES ('Ht103', '蚂蚁金服', '2019-03-25 00:00:00', 'upload/efa3e69b59764107a516ce9cf8bf554d.jpeg');
INSERT INTO `contract` VALUES ('HT104', '腾讯', '2019-04-11 00:00:00', 'upload/172e9a4866f14705b892b1c4117b9ff3.jpeg');
INSERT INTO `contract` VALUES ('HT105', '沪江网校', '2019-04-06 00:00:00', 'upload/798b0a1e5ce34190a97924b96b148143.jpeg');
INSERT INTO `contract` VALUES ('HT106', '滴滴出行', '2019-03-14 00:00:00', 'upload/0195e8102ba3477db4d9c3b3f8d0efd6.jpeg');
INSERT INTO `contract` VALUES ('HT108', '蚂蚁金服', '2019-04-10 00:00:00', 'upload/ffd44bdb250643619bcf27ec59df22e6.png');

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户编号(主键)',
  `cust_name` varchar(32) NOT NULL COMMENT '客户名称(公司名称)',
  `cust_user_id` int(11) DEFAULT NULL COMMENT '负责人id',
  `cust_create_id` bigint(32) DEFAULT NULL COMMENT '创建人id',
  `cust_source` varchar(32) DEFAULT NULL COMMENT '客户信息来源',
  `cust_industry` varchar(32) DEFAULT NULL COMMENT '客户所属行业',
  `cust_level` varchar(32) DEFAULT NULL COMMENT '客户级别',
  `cust_linkman` varchar(64) DEFAULT NULL COMMENT '联系人',
  `cust_phone` varchar(64) DEFAULT NULL COMMENT '固定电话',
  `cust_mobile` varchar(16) DEFAULT NULL COMMENT '移动电话',
  `cust_zipcode` varchar(50) DEFAULT NULL,
  `cust_address` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  KEY `fk1` (`cust_user_id`),
  CONSTRAINT `fk1` FOREIGN KEY (`cust_user_id`) REFERENCES `sys_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of customer
-- ----------------------------
INSERT INTO `customer` VALUES ('107', 'Alibaba', '10', '9', '7', '2', '23', null, '571-8502-2088', null, '310052', '杭州市滨江区网商路699号滨江新园区');
INSERT INTO `customer` VALUES ('108', 'Tencent', '11', '9', '6', '35', '23', null, '065-1515152', null, '46525623', '深圳市南山区高新科技园北区');
INSERT INTO `customer` VALUES ('109', '百度', '11', '9', '7', '35', '23', null, '065-1515152', null, '76135213', '北京市海淀区西北旺东路10号院百度科技园');
INSERT INTO `customer` VALUES ('110', '恒大地产', '11', '9', '6', '5', '22', null, '065-1516512', null, '4651351', '深圳南山区');
INSERT INTO `customer` VALUES ('111', '北京新东方教育科技（集团）有限公司', '11', '9', '6', '1', '22', null, '021-1515115', null, '15615615', '北京市海淀区中关村');
INSERT INTO `customer` VALUES ('112', '沪江网校', '10', '9', '6', '1', '22', null, '065-155152125', null, '46525623', '上海市浦东新区亮秀路112号y2座3楼');
INSERT INTO `customer` VALUES ('113', '北京京东世纪贸易有限公司', '11', '9', '6', '2', '23', null, '065-155152125', null, '76135213', '北京亦庄经济技术开发区科创十一街18号院');
INSERT INTO `customer` VALUES ('114', '上海跨境通国际贸易有限公司', '10', '9', '6', '3', '23', null, '021-1551522', null, '76135213', '上海市浦东新区博霞路160号5楼');
INSERT INTO `customer` VALUES ('115', '迈美(上海)国际贸易有限公司', '10', '9', '6', '3', '22', null, '021-1551522', null, '46525623', '上海市浦东新区张江高科技园区');
INSERT INTO `customer` VALUES ('116', '碧桂园集团', '10', '9', '6', '5', '23', null, '065-1515152', null, '6848125', '广东省佛山市顺德区');
INSERT INTO `customer` VALUES ('117', '携程', '10', '9', '7', '4', '23', null, '021-1515115', null, '7451365', '上海市长宁区福泉路99号3楼');
INSERT INTO `customer` VALUES ('118', '美团网', '11', '9', '7', '4', '23', null, '021-1551522', null, '7451365', '北京市朝阳区望京东路6号');
INSERT INTO `customer` VALUES ('119', '沪江网校', '10', '9', '6', '1', '22', null, '065-155152125', null, '6848125', '上海市浦东新区亮秀路112号y2座3楼');

-- ----------------------------
-- Table structure for linkman
-- ----------------------------
DROP TABLE IF EXISTS `linkman`;
CREATE TABLE `linkman` (
  `lkm_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '联系人编号(主键)',
  `lkm_name` varchar(16) DEFAULT NULL COMMENT '联系人姓名',
  `lkm_cust_id` bigint(32) NOT NULL COMMENT '客户id',
  `lkm_gender` char(1) DEFAULT NULL COMMENT '联系人性别',
  `lkm_phone` varchar(16) DEFAULT NULL COMMENT '联系人办公电话',
  `lkm_mobile` varchar(16) DEFAULT NULL COMMENT '联系人手机',
  `lkm_email` varchar(64) DEFAULT NULL COMMENT '联系人邮箱',
  `lkm_qq` varchar(16) DEFAULT NULL COMMENT '联系人qq',
  `lkm_position` varchar(16) DEFAULT NULL COMMENT '联系人职位',
  `lkm_memo` varchar(512) DEFAULT NULL COMMENT '联系人备注',
  PRIMARY KEY (`lkm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of linkman
-- ----------------------------
INSERT INTO `linkman` VALUES ('21', '葛睿', '107', '男', '1234567', '765432', 'gerui@alibaba.cn', '456789065', 'PM', '喜欢动漫');
INSERT INTO `linkman` VALUES ('22', '王文涛', '108', '男', '98765432', '8765432', 'wwenta0@qq.cn', '9876543', '研发经理', '喜欢LOL');
INSERT INTO `linkman` VALUES ('24', '周全', '109', '男', '1234567', '765432', 'zhouquan@baidu.cn', '1913296101', '市场部经理', '喜欢LOL');
INSERT INTO `linkman` VALUES ('25', '张无忌', '110', '男', '1234567', '765432', 'gerui@alibaba.cn', '1913296101', 'TeamLeader', '明教教主');
INSERT INTO `linkman` VALUES ('26', '周芷若', '111', '女', '1234567', '8765432', 'gerui@alibaba.cn', '1913296101', 'HR', '峨眉派');
INSERT INTO `linkman` VALUES ('27', '张三丰', '112', '男', '1234567', '765432', 'wwenta0@qq.cn', '1913296101', '财务', '武当派');
INSERT INTO `linkman` VALUES ('28', '杨潇', '113', '男', '1234567', '765432', 'wwenta0@qq.cn', '1913296101', '副总裁', '光明右使');
INSERT INTO `linkman` VALUES ('29', '殷素素', '114', '女', '1234567', '765432', 'wwenta0@qq.cn', '9876543', '猎头顾问', '天鹰教');
INSERT INTO `linkman` VALUES ('30', '韦一笑', '115', '男', '1234567', '765432', 'wwenta0@qq.cn', '1913296101', '总裁', '明教');
INSERT INTO `linkman` VALUES ('31', '谢逊', '116', '男', '1234567', '765432', 'wwenta0@qq.cn', '1913296101', '码农', '金毛狮王');
INSERT INTO `linkman` VALUES ('32', '开玉文', '117', '男', '1234567', '765432', 'gerui@alibaba.cn', '1913296101', 'JAVA工程师', 'Kevin');
INSERT INTO `linkman` VALUES ('33', '王金奥', '118', '女', '1234567', '765432', 'zhouquan@baidu.cn', '9876543', '前端工程师', '黄金二');

-- ----------------------------
-- Table structure for market_perform
-- ----------------------------
DROP TABLE IF EXISTS `market_perform`;
CREATE TABLE `market_perform` (
  `perform_id` int(11) NOT NULL AUTO_INCREMENT,
  `perform_user_id` int(11) DEFAULT NULL,
  `perform_date` datetime DEFAULT NULL,
  `perform_total_amount` double DEFAULT NULL,
  PRIMARY KEY (`perform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='营销业绩表';

-- ----------------------------
-- Records of market_perform
-- ----------------------------
INSERT INTO `market_perform` VALUES ('6', '10', '2019-03-01 00:00:00', '222222.22');
INSERT INTO `market_perform` VALUES ('7', '10', '2019-02-01 00:00:00', '100000');
INSERT INTO `market_perform` VALUES ('8', '10', '2019-01-01 00:00:00', '50000.55');
INSERT INTO `market_perform` VALUES ('9', '10', '2018-12-01 00:00:00', '40000.44');
INSERT INTO `market_perform` VALUES ('10', '10', '2018-11-01 00:00:00', '22222.22');
INSERT INTO `market_perform` VALUES ('11', '10', '2018-10-01 00:00:00', '33333.33');
INSERT INTO `market_perform` VALUES ('13', '10', '2018-09-01 00:00:00', '100000');
INSERT INTO `market_perform` VALUES ('14', '10', '2018-08-01 00:00:00', '88888.88');
INSERT INTO `market_perform` VALUES ('15', '10', '2018-07-01 00:00:00', '77777.77');
INSERT INTO `market_perform` VALUES ('16', '10', '2018-06-01 00:00:00', '66666.66');
INSERT INTO `market_perform` VALUES ('18', '11', '2018-07-01 00:00:00', '77777.77');
INSERT INTO `market_perform` VALUES ('19', '11', '2018-08-01 00:00:00', '88888.88');
INSERT INTO `market_perform` VALUES ('20', '11', '2018-09-01 00:00:00', '99999.99');
INSERT INTO `market_perform` VALUES ('21', '11', '2018-10-01 00:00:00', '100000');
INSERT INTO `market_perform` VALUES ('22', '11', '2018-11-01 00:00:00', '11111.11');
INSERT INTO `market_perform` VALUES ('24', '11', '2019-01-01 00:00:00', '11111.11');
INSERT INTO `market_perform` VALUES ('25', '11', '2019-02-01 00:00:00', '222222.22');
INSERT INTO `market_perform` VALUES ('26', '11', '2019-03-01 00:00:00', '33333.33');
INSERT INTO `market_perform` VALUES ('27', '11', '2018-06-01 00:00:00', '12345.6');
INSERT INTO `market_perform` VALUES ('28', '11', '2018-12-01 00:00:00', '121212');

-- ----------------------------
-- Table structure for market_plan
-- ----------------------------
DROP TABLE IF EXISTS `market_plan`;
CREATE TABLE `market_plan` (
  `plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `plan_name` varchar(255) DEFAULT NULL COMMENT '计划名称',
  `plan_content` varchar(255) DEFAULT NULL COMMENT '计划内容',
  `plan_cost` varchar(255) DEFAULT NULL COMMENT '预期成本',
  `plan_profits` varchar(255) DEFAULT NULL COMMENT '预期收益',
  `plan_start_date` datetime DEFAULT NULL COMMENT '开始日期',
  `plan_end_date` datetime DEFAULT NULL COMMENT '结束日期',
  `plan_principal` int(11) DEFAULT NULL COMMENT '负责人',
  `plan_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of market_plan
-- ----------------------------
INSERT INTO `market_plan` VALUES ('1', 'plan A', '优惠大促销', '2K', '5K', '2019-03-01 00:00:00', '2019-03-10 00:00:00', '11', '难受啊马飞');
INSERT INTO `market_plan` VALUES ('2', 'plan B', '满1000-200', '2K', '5K', '2019-03-21 00:00:00', '2019-03-31 00:00:00', '11', '哎呦不错哦');
INSERT INTO `market_plan` VALUES ('3', 'plan C', '满2000送购物券', '2K', '5K', '2019-03-22 00:00:00', '2019-04-06 00:00:00', '10', '');
INSERT INTO `market_plan` VALUES ('4', 'plan D', '满2000-500', '2K', '5K', '2019-03-29 00:00:00', '2019-06-08 00:00:00', '10', '');
INSERT INTO `market_plan` VALUES ('5', 'plan E', '优惠大促销', '2K', '5K', '2019-03-21 00:00:00', '2019-03-30 00:00:00', '11', '');
INSERT INTO `market_plan` VALUES ('6', 'plan F', '满1000-200', '2K', '5K', '2019-03-01 00:00:00', '2019-03-31 00:00:00', '10', '哎呦不错哦');
INSERT INTO `market_plan` VALUES ('7', 'plan G', '满2000-500', '2K', '5K', '2019-04-04 00:00:00', '2019-05-17 00:00:00', '10', '哎呦不错哦');
INSERT INTO `market_plan` VALUES ('8', 'plan H', '满1000-200', '2K', '5K', '2019-03-15 00:00:00', '2019-05-18 00:00:00', '11', '哎呦不错哦');
INSERT INTO `market_plan` VALUES ('9', 'plan I', '满2000送购物券', '2K', '5K', '2019-03-28 00:00:00', '2019-05-03 00:00:00', '10', '哎呦不错哦');
INSERT INTO `market_plan` VALUES ('10', 'plan J', '满1000-200', '2K', '5K', '2019-03-13 00:00:00', '2019-05-17 00:00:00', '10', '哎呦不错哦');
INSERT INTO `market_plan` VALUES ('11', 'plan K', '优惠大促销', '2K', '5K', '2019-03-08 00:00:00', '2019-03-30 00:00:00', '11', '');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `user_code` varchar(32) NOT NULL COMMENT '用户账号',
  `user_name` varchar(50) NOT NULL COMMENT '用户名称',
  `user_password` varchar(32) NOT NULL COMMENT '用户密码',
  `user_state` int(1) NOT NULL COMMENT '1:正常,0:暂停',
  `user_phone` varchar(50) NOT NULL,
  `user_level` int(1) DEFAULT '3' COMMENT '1为高级管理员最高权限\r\n2为销售主管\r\n3为销售',
  `user_position` varchar(100) DEFAULT NULL COMMENT '职位',
  `user_department` varchar(100) DEFAULT NULL COMMENT '部门',
  `user_avatar` varchar(255) DEFAULT NULL COMMENT '头像',
  `user_email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('9', 'admin', '杨宇航', 'admin', '1', '17717545847', '1', '总监', '事业部', 'avatar/baf0e08681a64cb79ce310d0ea300cfb.gif', '17717545847@163.com');
INSERT INTO `sys_user` VALUES ('10', '123', '卢本伟', '123', '1', '123', '3', '销售', '销售部', 'avatar/default_avatar_male.jpg', null);
INSERT INTO `sys_user` VALUES ('11', '1', '马飞飞', '1', '1', '1', '3', '销售', '销售部', 'avatar/9b9559d5bc094f5fbb9d7cbfb37731bf.gif', 'mafeifei@163.com');
INSERT INTO `sys_user` VALUES ('12', '2', '金咕咕', '2', '1', '2', '3', '销售', '销售部', 'avatar/default_avatar_male.jpg', null);
INSERT INTO `sys_user` VALUES ('13', '3', 'clearlove', '3', '1', '3', '3', '销售', '销售部', 'avatar/default_avatar_male.jpg', null);
INSERT INTO `sys_user` VALUES ('14', '4', 'faker', '4', '1', '4', '3', '销售', '销售部', 'avatar/default_avatar_male.jpg', null);
INSERT INTO `sys_user` VALUES ('15', '191329610', '周二珂', '191329610', '1', '17717545847', '3', '销售', '销售部', 'avatar/5324c7967bba41609f8ed62e5e83d3c9.gif', '');
INSERT INTO `sys_user` VALUES ('16', 'zhangwuji', '张无忌', '123456', '1', '17717545847', '3', '销售', '销售部', 'avatar/default_avatar_male.jpg', null);
INSERT INTO `sys_user` VALUES ('17', 'yangyuhang', '杨宇航', '123456', '1', '17717545847', '3', '销售', '销售部', 'avatar/default_avatar_male.jpg', null);

-- ----------------------------
-- Table structure for user_detail
-- ----------------------------
DROP TABLE IF EXISTS `user_detail`;
CREATE TABLE `user_detail` (
  `detail_id` int(32) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `detail_user_id` int(32) DEFAULT NULL COMMENT '用户id',
  `detail_user_name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `detail_user_age` varchar(50) DEFAULT NULL COMMENT '年龄',
  `detail_user_gender` char(1) DEFAULT NULL COMMENT '性别',
  `detail_user_photo` varchar(100) DEFAULT NULL COMMENT '照片',
  `detail_user_email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_detail
-- ----------------------------

-- ----------------------------
-- Table structure for visit
-- ----------------------------
DROP TABLE IF EXISTS `visit`;
CREATE TABLE `visit` (
  `visit_id` int(32) NOT NULL AUTO_INCREMENT,
  `visit_cust_id` int(32) DEFAULT NULL COMMENT '客户id',
  `visit_user_id` int(32) DEFAULT NULL COMMENT '负责人id',
  `visit_lkm_id` int(32) DEFAULT NULL COMMENT '联系人id',
  `visit_time` date DEFAULT NULL COMMENT '拜访时间',
  `visit_addr` varchar(128) DEFAULT NULL COMMENT '拜访地点',
  `visit_detail` varchar(256) DEFAULT NULL COMMENT '拜访详情',
  `visit_nexttime` date DEFAULT NULL COMMENT '下次拜访时间',
  PRIMARY KEY (`visit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of visit
-- ----------------------------
INSERT INTO `visit` VALUES ('17', '108', '11', '22', '2019-03-15', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('18', '109', '11', '24', '2019-03-22', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('19', '110', '11', '25', '2019-03-31', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('20', '111', '11', '26', '2019-03-30', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('21', '113', '11', '28', '2019-03-31', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('22', '118', '11', '33', '2019-04-03', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('23', '108', '11', '22', '2019-04-04', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('24', '109', '11', '24', '2019-03-23', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('25', '110', '11', '25', '2019-03-23', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('26', '111', '11', '26', '2019-03-24', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('27', '113', '11', '28', '2019-03-17', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('28', '118', '11', '33', '2019-04-05', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('29', '107', '10', '21', '2019-03-15', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('30', '112', '10', '27', '2019-03-22', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('31', '114', '10', '29', '2019-03-16', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('32', '115', '10', '30', '2019-03-24', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('33', '116', '10', '31', '2019-03-29', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('34', '117', '10', '32', '2019-04-14', '上海张江', '沟通产品细节', null);
INSERT INTO `visit` VALUES ('35', '107', '10', '21', '2019-04-12', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('36', '112', '10', '27', '2019-03-23', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('37', '114', '10', '29', '2019-03-23', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('38', '115', '10', '30', '2019-04-13', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('39', '116', '10', '31', '2019-03-23', '上海张江', '确立合作意向', null);
INSERT INTO `visit` VALUES ('41', '117', '10', '32', '2019-04-18', '上海张江', '确立合作意向', null);
