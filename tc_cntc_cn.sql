/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50726
 Source Host           : 127.0.0.1:3306
 Source Schema         : tc_cntc_cn

 Target Server Type    : MySQL
 Target Server Version : 50726
 File Encoding         : 65001

 Date: 17/04/2022 23:46:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yc_admin
-- ----------------------------
DROP TABLE IF EXISTS `yc_admin`;
CREATE TABLE `yc_admin`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_admin
-- ----------------------------
INSERT INTO `yc_admin` VALUES (1, 'admin', 'Admin', 'd63c61ffa73b09b44ef6bd1c96db8d6f', '79bec6', 'http://tc.cn/assets/img/avatar.png', '1991361342@qq.com', 0, 1650093418, '127.0.0.1', 1491635035, 1650093418, '62a769f6-81df-4699-a90a-7c8bab349529', 'normal');

-- ----------------------------
-- Table structure for yc_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `yc_admin_log`;
CREATE TABLE `yc_admin_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '日志标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 184 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '管理员日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_admin_log
-- ----------------------------
INSERT INTO `yc_admin_log` VALUES (1, 1, 'admin', '/tiEkolbOBK.php/index/login', '登录', '{\"__token__\":\"***\",\"username\":\"admin\",\"password\":\"***\",\"captcha\":\"vynf\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650093418);
INSERT INTO `yc_admin_log` VALUES (2, 1, 'admin', '/tiEkolbOBK.php/addon/install', '插件管理', '{\"name\":\"command\",\"force\":\"0\",\"uid\":\"25047\",\"token\":\"***\",\"version\":\"1.0.6\",\"faversion\":\"1.3.3.20220121\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650093440);
INSERT INTO `yc_admin_log` VALUES (3, 1, 'admin', '/tiEkolbOBK.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"command\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650093440);
INSERT INTO `yc_admin_log` VALUES (4, 1, 'admin', '/tiEkolbOBK.php/addon/install', '插件管理', '{\"name\":\"simditor\",\"force\":\"0\",\"uid\":\"25047\",\"token\":\"***\",\"version\":\"1.0.5\",\"faversion\":\"1.3.3.20220121\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650093460);
INSERT INTO `yc_admin_log` VALUES (5, 1, 'admin', '/tiEkolbOBK.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"simditor\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650093460);
INSERT INTO `yc_admin_log` VALUES (6, 1, 'admin', '/tiEkolbOBK.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;默认&quot;,&quot;page&quot;:&quot;单页&quot;,&quot;article&quot;:&quot;文章&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;基础配置&quot;,&quot;email&quot;:&quot;邮件配置&quot;,&quot;dictionary&quot;:&quot;字典配置&quot;,&quot;user&quot;:&quot;会员配置&quot;,&quot;mini_wechat&quot;:&quot;微信小程序配置&quot;}\",\"attachmentcategory\":\"{&quot;category1&quot;:&quot;分类一&quot;,&quot;category2&quot;:&quot;分类二&quot;,&quot;custom&quot;:&quot;自定义&quot;}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095465);
INSERT INTO `yc_admin_log` VALUES (7, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"miniapp_appid\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095492);
INSERT INTO `yc_admin_log` VALUES (8, 1, 'admin', '/tiEkolbOBK.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mini_wechat\",\"type\":\"string\",\"name\":\"miniapp_appid\",\"title\":\"APPID\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"wxf546a5881c82222e\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095553);
INSERT INTO `yc_admin_log` VALUES (9, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"miniapp_key\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095571);
INSERT INTO `yc_admin_log` VALUES (10, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"miniapp_secret\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095578);
INSERT INTO `yc_admin_log` VALUES (11, 1, 'admin', '/tiEkolbOBK.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"mini_wechat\",\"type\":\"text\",\"name\":\"miniapp_secret\",\"title\":\"AppSecret\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"ba4a5884aa4df84136f0f8c6669d4512\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095686);
INSERT INTO `yc_admin_log` VALUES (12, 1, 'admin', '/tiEkolbOBK.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;默认&quot;,&quot;page&quot;:&quot;单页&quot;,&quot;article&quot;:&quot;文章&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;基础配置&quot;,&quot;email&quot;:&quot;邮件配置&quot;,&quot;dictionary&quot;:&quot;字典配置&quot;,&quot;user&quot;:&quot;会员配置&quot;,&quot;wechat_pay&quot;:&quot;微信支付配置&quot;,&quot;mini_wechat&quot;:&quot;微信小程序配置&quot;}\",\"attachmentcategory\":\"{&quot;category1&quot;:&quot;分类一&quot;,&quot;category2&quot;:&quot;分类二&quot;,&quot;custom&quot;:&quot;自定义&quot;}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095736);
INSERT INTO `yc_admin_log` VALUES (13, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"mch_id\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095807);
INSERT INTO `yc_admin_log` VALUES (14, 1, 'admin', '/tiEkolbOBK.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"wechat_pay\",\"type\":\"string\",\"name\":\"mch_id\",\"title\":\"商户号\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"1608517040\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095874);
INSERT INTO `yc_admin_log` VALUES (15, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"pay_key_v2\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650095990);
INSERT INTO `yc_admin_log` VALUES (16, 1, 'admin', '/tiEkolbOBK.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"wechat_pay\",\"type\":\"text\",\"name\":\"pay_key_v2\",\"title\":\"支付密钥V2\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"dacf3ffb62509a51556b60103b4b295e\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096010);
INSERT INTO `yc_admin_log` VALUES (17, 1, 'admin', '/tiEkolbOBK.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"mch_id\":\"1608517040\",\"pay_key_v2\":\"dacf3ffb62509a51556b60103b4b295e\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096064);
INSERT INTO `yc_admin_log` VALUES (18, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"wechat_pay_cert_client\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096082);
INSERT INTO `yc_admin_log` VALUES (19, 1, 'admin', '/tiEkolbOBK.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"wechat_pay\",\"type\":\"file\",\"name\":\"wechat_pay_cert_client\",\"title\":\"cert_client证书\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096110);
INSERT INTO `yc_admin_log` VALUES (20, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"wechat_pay_cert_client\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096122);
INSERT INTO `yc_admin_log` VALUES (21, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"wechat_pay_cert_key\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096126);
INSERT INTO `yc_admin_log` VALUES (22, 1, 'admin', '/tiEkolbOBK.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"wechat_pay\",\"type\":\"file\",\"name\":\"wechat_pay_cert_key\",\"title\":\"cert_key证书\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096130);
INSERT INTO `yc_admin_log` VALUES (23, 1, 'admin', '/tiEkolbOBK.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"wechat_pay_mch_id\":\"1608517040\",\"wechat_pay_key_v2\":\"dacf3ffb62509a51556b60103b4b295e\",\"wechat_pay_cert_client\":\"\",\"wechat_pay_cert_key\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096348);
INSERT INTO `yc_admin_log` VALUES (24, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096399);
INSERT INTO `yc_admin_log` VALUES (25, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096401);
INSERT INTO `yc_admin_log` VALUES (26, 1, 'admin', '/tiEkolbOBK.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"wechat_pay_mch_id\":\"1608517040\",\"wechat_pay_key_v2\":\"dacf3ffb62509a51556b60103b4b295e\",\"wechat_pay_cert_client\":\"\\/uploads\\/20220416\\/cc1faf4355ae2348d09c60529bb8eb6a.pem\",\"wechat_pay_cert_key\":\"\\/uploads\\/20220416\\/ad2f98ca9151d969693b7e28893375d8.pem\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650096403);
INSERT INTO `yc_admin_log` VALUES (27, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097489);
INSERT INTO `yc_admin_log` VALUES (28, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097521);
INSERT INTO `yc_admin_log` VALUES (29, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_community\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097526);
INSERT INTO `yc_admin_log` VALUES (30, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"0\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_community\",\"controller\":\"\",\"model\":\"\",\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097527);
INSERT INTO `yc_admin_log` VALUES (31, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097529);
INSERT INTO `yc_admin_log` VALUES (32, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097531);
INSERT INTO `yc_admin_log` VALUES (33, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Community.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097532);
INSERT INTO `yc_admin_log` VALUES (34, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Community.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097533);
INSERT INTO `yc_admin_log` VALUES (35, 1, 'admin', '/tiEkolbOBK.php/community/add?dialog=1', '社区信息 / 添加', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220401\",\"name\":\"升伟一里南滨\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路二巷20号\",\"longitude\":\"106.57425979572295\",\"latitude\":\"29.532681764428744\",\"status\":\"1\",\"status_msg\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650097868);
INSERT INTO `yc_admin_log` VALUES (36, 1, 'admin', '/tiEkolbOBK.php/community/add?dialog=1', '社区信息 / 添加', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220402\",\"name\":\"东源锦悦\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路2巷2号\",\"longitude\":\"106.57310108142852\",\"latitude\":\"29.53053471727576\",\"status\":\"1\",\"status_msg\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650098017);
INSERT INTO `yc_admin_log` VALUES (37, 1, 'admin', '/tiEkolbOBK.php/auth/rule/edit/ids/92?dialog=1', '权限管理 / 菜单规则 / 编辑', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"ismenu\":\"1\",\"pid\":\"0\",\"name\":\"community\",\"title\":\"小区信息\",\"url\":\"\",\"icon\":\"fa fa-circle-o\",\"condition\":\"\",\"menutype\":\"addtabs\",\"extend\":\"\",\"remark\":\"\",\"weigh\":\"0\",\"status\":\"normal\"},\"ids\":\"92\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650098157);
INSERT INTO `yc_admin_log` VALUES (38, 1, 'admin', '/tiEkolbOBK.php/addon/install', '插件管理', '{\"name\":\"address\",\"force\":\"0\",\"uid\":\"25047\",\"token\":\"***\",\"version\":\"1.0.7\",\"faversion\":\"1.3.3.20220121\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650098218);
INSERT INTO `yc_admin_log` VALUES (39, 1, 'admin', '/tiEkolbOBK.php/addon/state', '插件管理 / 禁用启用', '{\"name\":\"address\",\"action\":\"enable\",\"force\":\"0\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650098218);
INSERT INTO `yc_admin_log` VALUES (40, 1, 'admin', '/tiEkolbOBK.php/addon/config?name=address&dialog=1', '插件管理 / 配置', '{\"name\":\"address\",\"dialog\":\"1\",\"row\":{\"maptype\":\"amap\",\"location\":\"重庆\",\"zoom\":\"12\",\"lat\":\"29.532681764428744\",\"lng\":\"106.57425979572295\",\"baidukey\":\"\",\"amapkey\":\"01b4f94154f68a652d3b59245a69bf76\",\"tencentkey\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650098499);
INSERT INTO `yc_admin_log` VALUES (41, 1, 'admin', '/tiEkolbOBK.php/addon/config?name=address&dialog=1', '插件管理 / 配置', '{\"name\":\"address\",\"dialog\":\"1\",\"row\":{\"maptype\":\"amap\",\"location\":\"重庆\",\"zoom\":\"12\",\"lat\":\"29.532681764428744\",\"lng\":\"106.57425979572295\",\"baidukey\":\"\",\"amapkey\":\"01b4f94154f68a652d3b59245a69bf76\",\"tencentkey\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650098824);
INSERT INTO `yc_admin_log` VALUES (42, 1, 'admin', '/tiEkolbOBK.php/addon/config?name=address&dialog=1', '插件管理 / 配置', '{\"name\":\"address\",\"dialog\":\"1\",\"row\":{\"maptype\":\"amap\",\"location\":\"重庆\",\"zoom\":\"12\",\"lat\":\"29.532681764428744\",\"lng\":\"106.57425979572295\",\"baidukey\":\"\",\"amapkey\":\"6b6bf36e207a07dc5cd40e1d9ee38734\",\"tencentkey\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650098921);
INSERT INTO `yc_admin_log` VALUES (43, 1, 'admin', '/tiEkolbOBK.php/community/edit/ids/2?dialog=1', '小区信息 / 编辑', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220402\",\"name\":\"东源锦悦\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路2巷2号\",\"longitude\":\"106.57310108142852\",\"latitude\":\"29.53053471727576\",\"status\":\"1\",\"status_msg\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650099697);
INSERT INTO `yc_admin_log` VALUES (44, 1, 'admin', '/tiEkolbOBK.php/community/edit/ids/2?dialog=1', '小区信息 / 编辑', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220402\",\"name\":\"东源锦悦\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路2巷2号\",\"longitude\":\"106.57310108142852\",\"latitude\":\"29.53053471727576\",\"status\":\"1\",\"status_msg\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650099699);
INSERT INTO `yc_admin_log` VALUES (45, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103237);
INSERT INTO `yc_admin_log` VALUES (46, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_banner\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103240);
INSERT INTO `yc_admin_log` VALUES (47, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103249);
INSERT INTO `yc_admin_log` VALUES (48, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103249);
INSERT INTO `yc_admin_log` VALUES (49, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103250);
INSERT INTO `yc_admin_log` VALUES (50, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103250);
INSERT INTO `yc_admin_log` VALUES (51, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103251);
INSERT INTO `yc_admin_log` VALUES (52, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103251);
INSERT INTO `yc_admin_log` VALUES (53, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_banner\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"image\",\"jump_type\",\"jump_url\",\"status\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"yc_community\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"community_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103256);
INSERT INTO `yc_admin_log` VALUES (54, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_banner\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"image\",\"jump_type\",\"jump_url\",\"status\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"yc_community\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"community_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103259);
INSERT INTO `yc_admin_log` VALUES (55, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103263);
INSERT INTO `yc_admin_log` VALUES (56, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103264);
INSERT INTO `yc_admin_log` VALUES (57, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103266);
INSERT INTO `yc_admin_log` VALUES (58, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Banner.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103267);
INSERT INTO `yc_admin_log` VALUES (59, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Banner.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103267);
INSERT INTO `yc_admin_log` VALUES (60, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103403);
INSERT INTO `yc_admin_log` VALUES (61, 1, 'admin', '/tiEkolbOBK.php/banner/add?dialog=1', '首页轮播 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"\",\"image\":\"\\/uploads\\/20220416\\/606192725820e51f66d13bb061794df3.png\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103440);
INSERT INTO `yc_admin_log` VALUES (62, 1, 'admin', '/tiEkolbOBK.php/command/execute/ids/3', '在线命令管理 / 运行', '{\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103949);
INSERT INTO `yc_admin_log` VALUES (63, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103963);
INSERT INTO `yc_admin_log` VALUES (64, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_banner\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103967);
INSERT INTO `yc_admin_log` VALUES (65, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103972);
INSERT INTO `yc_admin_log` VALUES (66, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103972);
INSERT INTO `yc_admin_log` VALUES (67, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103972);
INSERT INTO `yc_admin_log` VALUES (68, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103972);
INSERT INTO `yc_admin_log` VALUES (69, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103974);
INSERT INTO `yc_admin_log` VALUES (70, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103975);
INSERT INTO `yc_admin_log` VALUES (71, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_banner\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"weigh\",\"image\",\"jump_type\",\"jump_url\",\"status\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"yc_community\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"community_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103980);
INSERT INTO `yc_admin_log` VALUES (72, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_banner\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"weigh\",\"image\",\"jump_type\",\"jump_url\",\"status\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"yc_community\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"community_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103981);
INSERT INTO `yc_admin_log` VALUES (73, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/1?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"weigh\":\"1\",\"community_id\":\"0\",\"image\":\"\\/uploads\\/20220416\\/606192725820e51f66d13bb061794df3.png\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650103995);
INSERT INTO `yc_admin_log` VALUES (74, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650104086);
INSERT INTO `yc_admin_log` VALUES (75, 1, 'admin', '/tiEkolbOBK.php/banner/add?dialog=1', '首页轮播 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"\",\"image\":\"\\/uploads\\/20220416\\/f12882b9041108c28dc48d4d231dfa84.jpg\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650104089);
INSERT INTO `yc_admin_log` VALUES (76, 1, 'admin', '/tiEkolbOBK.php/banner/add?dialog=1', '首页轮播 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"\",\"image\":\"\\/uploads\\/20220416\\/f12882b9041108c28dc48d4d231dfa84.jpg\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650104094);
INSERT INTO `yc_admin_log` VALUES (77, 1, 'admin', '/tiEkolbOBK.php/banner/add?dialog=1', '首页轮播 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"\",\"image\":\"\\/uploads\\/20220416\\/f12882b9041108c28dc48d4d231dfa84.jpg\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650104117);
INSERT INTO `yc_admin_log` VALUES (78, 1, 'admin', '/tiEkolbOBK.php/ajax/weigh', '', '{\"ids\":\"1,2\",\"changeid\":\"2\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"banner\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650104119);
INSERT INTO `yc_admin_log` VALUES (79, 1, 'admin', '/tiEkolbOBK.php/ajax/weigh', '', '{\"ids\":\"2,1\",\"changeid\":\"2\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"banner\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650104121);
INSERT INTO `yc_admin_log` VALUES (80, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/2?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"weigh\":\"2\",\"community_id\":\"1\",\"image\":\"\\/uploads\\/20220416\\/f12882b9041108c28dc48d4d231dfa84.jpg\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650104391);
INSERT INTO `yc_admin_log` VALUES (81, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105048);
INSERT INTO `yc_admin_log` VALUES (82, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_banner\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105057);
INSERT INTO `yc_admin_log` VALUES (83, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105062);
INSERT INTO `yc_admin_log` VALUES (84, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105062);
INSERT INTO `yc_admin_log` VALUES (85, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105062);
INSERT INTO `yc_admin_log` VALUES (86, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105062);
INSERT INTO `yc_admin_log` VALUES (87, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105064);
INSERT INTO `yc_admin_log` VALUES (88, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105064);
INSERT INTO `yc_admin_log` VALUES (89, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105106);
INSERT INTO `yc_admin_log` VALUES (90, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_modular\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105112);
INSERT INTO `yc_admin_log` VALUES (91, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105117);
INSERT INTO `yc_admin_log` VALUES (92, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105118);
INSERT INTO `yc_admin_log` VALUES (93, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105118);
INSERT INTO `yc_admin_log` VALUES (94, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105118);
INSERT INTO `yc_admin_log` VALUES (95, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105119);
INSERT INTO `yc_admin_log` VALUES (96, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_community\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105120);
INSERT INTO `yc_admin_log` VALUES (97, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_modular\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"title\",\"ico_image\",\"jump_type\",\"jump_url\",\"status\",\"weigh\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"yc_community\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"community_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105124);
INSERT INTO `yc_admin_log` VALUES (98, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_modular\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"title\",\"ico_image\",\"jump_type\",\"jump_url\",\"status\",\"weigh\",\"createtime\"],\"relation\":{\"2\":{\"relation\":\"yc_community\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"community_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"name\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105124);
INSERT INTO `yc_admin_log` VALUES (99, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105126);
INSERT INTO `yc_admin_log` VALUES (100, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105128);
INSERT INTO `yc_admin_log` VALUES (101, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105129);
INSERT INTO `yc_admin_log` VALUES (102, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Modular.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105130);
INSERT INTO `yc_admin_log` VALUES (103, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Modular.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105131);
INSERT INTO `yc_admin_log` VALUES (104, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105568);
INSERT INTO `yc_admin_log` VALUES (105, 1, 'admin', '/tiEkolbOBK.php/modular/add?dialog=1', '首页模块 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"\",\"title\":\"商超便利\",\"ico_image\":\"\\/uploads\\/20220416\\/205d4c1f655dae34b35ac5d4948eb85b.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=1\",\"status\":\"1\",\"weigh\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105656);
INSERT INTO `yc_admin_log` VALUES (106, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105782);
INSERT INTO `yc_admin_log` VALUES (107, 1, 'admin', '/tiEkolbOBK.php/modular/add?dialog=1', '首页模块 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"\",\"title\":\"美食餐馆\",\"ico_image\":\"\\/uploads\\/20220416\\/2cbac8e1c1d3cef7e7b001214090eeea.png\",\"jump_type\":\"0\",\"jump_url\":\"\\/pages\\/business\\/business?classify=2\",\"status\":\"1\",\"weigh\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105784);
INSERT INTO `yc_admin_log` VALUES (108, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/2?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"美食餐馆\",\"ico_image\":\"\\/uploads\\/20220416\\/2cbac8e1c1d3cef7e7b001214090eeea.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=2\",\"status\":\"1\",\"weigh\":\"2\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105789);
INSERT INTO `yc_admin_log` VALUES (109, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105855);
INSERT INTO `yc_admin_log` VALUES (110, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105858);
INSERT INTO `yc_admin_log` VALUES (111, 1, 'admin', '/tiEkolbOBK.php/modular/add?dialog=1', '首页模块 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"\",\"title\":\"甜点饮品\",\"ico_image\":\"\\/uploads\\/20220416\\/12b53f16e546837f9fd4b004b743889e.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=3\",\"status\":\"1\",\"weigh\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105871);
INSERT INTO `yc_admin_log` VALUES (112, 1, 'admin', '/tiEkolbOBK.php/ajax/weigh', '', '{\"ids\":\"1,3,2\",\"changeid\":\"1\",\"pid\":\"\",\"field\":\"weigh\",\"orderway\":\"desc\",\"table\":\"modular\",\"pk\":\"id\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105877);
INSERT INTO `yc_admin_log` VALUES (113, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105955);
INSERT INTO `yc_admin_log` VALUES (114, 1, 'admin', '/tiEkolbOBK.php/modular/add?dialog=1', '首页模块 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"\",\"title\":\"二手闲置\",\"ico_image\":\"\\/uploads\\/20220416\\/05936dd68deec22d86c237f3383e1a32.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/second-hand\\/second-hand\",\"status\":\"1\",\"weigh\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650105979);
INSERT INTO `yc_admin_log` VALUES (115, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/2?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"weigh\":\"2\",\"community_id\":\"2\",\"image\":\"\\/uploads\\/20220416\\/f12882b9041108c28dc48d4d231dfa84.jpg\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650114284);
INSERT INTO `yc_admin_log` VALUES (116, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/2?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"weigh\":\"2\",\"community_id\":\"\",\"image\":\"\\/uploads\\/20220416\\/f12882b9041108c28dc48d4d231dfa84.jpg\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650114317);
INSERT INTO `yc_admin_log` VALUES (117, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/2?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"平台试运营\",\"sub_title\":\"现在入驻，抢第一波流量啦\",\"image\":\"\\/uploads\\/20220416\\/f12882b9041108c28dc48d4d231dfa84.jpg\",\"jump_type\":\"0\",\"jump_url\":\"\",\"weigh\":\"2\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650117421);
INSERT INTO `yc_admin_log` VALUES (118, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/2?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"平台试运营\",\"sub_title\":\"现在入驻，抢第一波流量啦\",\"image\":\"\\/uploads\\/20220416\\/f12882b9041108c28dc48d4d231dfa84.jpg\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=1\",\"weigh\":\"2\",\"status\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650117439);
INSERT INTO `yc_admin_log` VALUES (119, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/1?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"\",\"sub_title\":\"\",\"image\":\"\\/uploads\\/20220416\\/606192725820e51f66d13bb061794df3.png\",\"jump_type\":\"0\",\"jump_url\":\"\",\"weigh\":\"1\",\"status\":\"0\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650117809);
INSERT INTO `yc_admin_log` VALUES (120, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/1?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"\",\"sub_title\":\"\",\"image\":\"\\/uploads\\/20220416\\/606192725820e51f66d13bb061794df3.png\",\"jump_type\":\"0\",\"jump_url\":\"\",\"weigh\":\"1\",\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650117836);
INSERT INTO `yc_admin_log` VALUES (121, 1, 'admin', '/tiEkolbOBK.php/community/add?dialog=1', '小区信息 / 添加', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220403\",\"name\":\"万寿华庭\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区花园路街道金山支路1号\",\"longitude\":\"106.56043\",\"latitude\":\"29.522746\",\"status\":\"1\",\"status_msg\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650120965);
INSERT INTO `yc_admin_log` VALUES (122, 1, 'admin', '/tiEkolbOBK.php/community/edit/ids/3?dialog=1', '小区信息 / 编辑', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220403\",\"name\":\"万寿华庭\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区花园路街道金山支路1号\",\"longitude\":\"106.56043\",\"latitude\":\"29.522746\",\"status\":\"0\",\"status_msg\":\"\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650121558);
INSERT INTO `yc_admin_log` VALUES (123, 1, 'admin', '/tiEkolbOBK.php/community/edit/ids/2?dialog=1', '小区信息 / 编辑', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220402\",\"name\":\"东源锦悦\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路2巷2号\",\"longitude\":\"106.57310108142852\",\"latitude\":\"29.53053471727576\",\"status\":\"0\",\"status_msg\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650121562);
INSERT INTO `yc_admin_log` VALUES (124, 1, 'admin', '/tiEkolbOBK.php/community/edit/ids/1?dialog=1', '小区信息 / 编辑', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220401\",\"name\":\"升伟一里南滨\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路二巷20号\",\"longitude\":\"106.57425979572295\",\"latitude\":\"29.532681764428744\",\"status\":\"0\",\"status_msg\":\"\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650121565);
INSERT INTO `yc_admin_log` VALUES (125, 1, 'admin', '/tiEkolbOBK.php/community/edit/ids/3?dialog=1', '小区信息 / 编辑', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220403\",\"name\":\"万寿华庭\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区花园路街道金山支路1号\",\"longitude\":\"106.56043\",\"latitude\":\"29.522746\",\"status\":\"1\",\"status_msg\":\"\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650121594);
INSERT INTO `yc_admin_log` VALUES (126, 1, 'admin', '/tiEkolbOBK.php/community/edit/ids/2?dialog=1', '小区信息 / 编辑', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220402\",\"name\":\"东源锦悦\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路2巷2号\",\"longitude\":\"106.57310108142852\",\"latitude\":\"29.53053471727576\",\"status\":\"1\",\"status_msg\":\"\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650121597);
INSERT INTO `yc_admin_log` VALUES (127, 1, 'admin', '/tiEkolbOBK.php/community/edit/ids/1?dialog=1', '小区信息 / 编辑', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220401\",\"name\":\"升伟一里南滨\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路二巷20号\",\"longitude\":\"106.57425979572295\",\"latitude\":\"29.532681764428744\",\"status\":\"1\",\"status_msg\":\"\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650121600);
INSERT INTO `yc_admin_log` VALUES (128, 1, 'admin', '/tiEkolbOBK.php/modular/add?dialog=1', '首页模块 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"2\",\"title\":\"测试模块\",\"ico_image\":\"\\/assets\\/img\\/qrcode.png\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\",\"weigh\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650124177);
INSERT INTO `yc_admin_log` VALUES (129, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650124974);
INSERT INTO `yc_admin_log` VALUES (130, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/5?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"2\",\"title\":\"帮买帮送\",\"ico_image\":\"\\/uploads\\/20220417\\/1631472f066e3b900924574b4dfe5175.png\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"1\",\"weigh\":\"5\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650124976);
INSERT INTO `yc_admin_log` VALUES (131, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/5?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"2\",\"title\":\"帮买帮送\",\"ico_image\":\"\\/uploads\\/20220417\\/1631472f066e3b900924574b4dfe5175.png\",\"jump_type\":\"0\",\"jump_url\":\"\",\"status\":\"0\",\"weigh\":\"5\"},\"ids\":\"5\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650125224);
INSERT INTO `yc_admin_log` VALUES (132, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/1?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"商超便利\",\"ico_image\":\"\\/uploads\\/20220416\\/205d4c1f655dae34b35ac5d4948eb85b.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=1\",\"status\":\"0\",\"weigh\":\"3\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650125229);
INSERT INTO `yc_admin_log` VALUES (133, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/3?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"甜点饮品\",\"ico_image\":\"\\/uploads\\/20220416\\/12b53f16e546837f9fd4b004b743889e.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=3\",\"status\":\"0\",\"weigh\":\"2\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650125234);
INSERT INTO `yc_admin_log` VALUES (134, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/2?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"美食餐馆\",\"ico_image\":\"\\/uploads\\/20220416\\/2cbac8e1c1d3cef7e7b001214090eeea.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=2\",\"status\":\"0\",\"weigh\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650125238);
INSERT INTO `yc_admin_log` VALUES (135, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/1?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"商超便利\",\"ico_image\":\"\\/uploads\\/20220416\\/205d4c1f655dae34b35ac5d4948eb85b.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=1\",\"status\":\"1\",\"weigh\":\"3\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650125302);
INSERT INTO `yc_admin_log` VALUES (136, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/3?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"甜点饮品\",\"ico_image\":\"\\/uploads\\/20220416\\/12b53f16e546837f9fd4b004b743889e.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=3\",\"status\":\"1\",\"weigh\":\"2\"},\"ids\":\"3\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650125306);
INSERT INTO `yc_admin_log` VALUES (137, 1, 'admin', '/tiEkolbOBK.php/modular/edit/ids/2?dialog=1', '首页模块 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"美食餐馆\",\"ico_image\":\"\\/uploads\\/20220416\\/2cbac8e1c1d3cef7e7b001214090eeea.png\",\"jump_type\":\"1\",\"jump_url\":\"\\/pages\\/business\\/business?classify=2\",\"status\":\"1\",\"weigh\":\"1\"},\"ids\":\"2\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650125310);
INSERT INTO `yc_admin_log` VALUES (138, 1, 'admin', '/tiEkolbOBK.php/community/add?dialog=1', '小区信息 / 添加', '{\"dialog\":\"1\",\"row\":{\"no\":\"CQ220404\",\"name\":\"洋河南滨花园\",\"city\":\"重庆\\/重庆市\\/南岸区\",\"address\":\"重庆市南岸区南坪东路2巷2洋河南滨花园\",\"longitude\":\"106.571005\",\"latitude\":\"29.533296\",\"status\":\"1\",\"status_msg\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650130971);
INSERT INTO `yc_admin_log` VALUES (139, 1, 'admin', '/tiEkolbOBK.php/banner/edit/ids/1?dialog=1', '首页轮播 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"0\",\"title\":\"平台试运营\",\"sub_title\":\"现在入驻，抢第一波流量啦\",\"image\":\"\\/uploads\\/20220416\\/606192725820e51f66d13bb061794df3.png\",\"jump_type\":\"0\",\"jump_url\":\"\",\"weigh\":\"1\",\"status\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650136961);
INSERT INTO `yc_admin_log` VALUES (140, 1, 'admin', '/tiEkolbOBK.php/auth/rule/multi', '权限管理 / 菜单规则', '{\"action\":\"\",\"ids\":\"3\",\"params\":\"ismenu=1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167004);
INSERT INTO `yc_admin_log` VALUES (141, 1, 'admin', '/tiEkolbOBK.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"categorytype\":\"{&quot;default&quot;:&quot;默认&quot;,&quot;information&quot;:&quot;同城信息&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;基础配置&quot;,&quot;email&quot;:&quot;邮件配置&quot;,&quot;dictionary&quot;:&quot;字典配置&quot;,&quot;user&quot;:&quot;会员配置&quot;,&quot;wechat_pay&quot;:&quot;微信支付配置&quot;,&quot;mini_wechat&quot;:&quot;微信小程序配置&quot;}\",\"attachmentcategory\":\"{&quot;category1&quot;:&quot;分类一&quot;,&quot;category2&quot;:&quot;分类二&quot;,&quot;custom&quot;:&quot;自定义&quot;}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167074);
INSERT INTO `yc_admin_log` VALUES (142, 1, 'admin', '/tiEkolbOBK.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"categorytype\":\"{&quot;information&quot;:&quot;同城信息&quot;}\",\"configgroup\":\"{&quot;basic&quot;:&quot;基础配置&quot;,&quot;email&quot;:&quot;邮件配置&quot;,&quot;dictionary&quot;:&quot;字典配置&quot;,&quot;user&quot;:&quot;会员配置&quot;,&quot;wechat_pay&quot;:&quot;微信支付配置&quot;,&quot;mini_wechat&quot;:&quot;微信小程序配置&quot;}\",\"attachmentcategory\":\"{&quot;category1&quot;:&quot;分类一&quot;,&quot;category2&quot;:&quot;分类二&quot;,&quot;custom&quot;:&quot;自定义&quot;}\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167077);
INSERT INTO `yc_admin_log` VALUES (143, 1, 'admin', '/tiEkolbOBK.php/category/add?dialog=1', '分类管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"type\":\"information\",\"pid\":\"0\",\"name\":\"二手闲置\",\"nickname\":\"二手闲置\",\"image\":\"\\/uploads\\/20220416\\/05936dd68deec22d86c237f3383e1a32.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167136);
INSERT INTO `yc_admin_log` VALUES (144, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167330);
INSERT INTO `yc_admin_log` VALUES (145, 1, 'admin', '/tiEkolbOBK.php/category/add?dialog=1', '分类管理 / 添加', '{\"dialog\":\"1\",\"__token__\":\"***\",\"row\":{\"type\":\"information\",\"pid\":\"0\",\"name\":\"招聘求职\",\"nickname\":\"招聘求职\",\"image\":\"\\/uploads\\/20220417\\/8dfe4b687fc6ec53f51e89cef3008fde.png\",\"keywords\":\"\",\"description\":\"\",\"weigh\":\"0\",\"status\":\"normal\",\"flag\":[\"\"]}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167332);
INSERT INTO `yc_admin_log` VALUES (146, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167795);
INSERT INTO `yc_admin_log` VALUES (147, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_category\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167836);
INSERT INTO `yc_admin_log` VALUES (148, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_information\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167838);
INSERT INTO `yc_admin_log` VALUES (149, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167851);
INSERT INTO `yc_admin_log` VALUES (150, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167851);
INSERT INTO `yc_admin_log` VALUES (151, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167851);
INSERT INTO `yc_admin_log` VALUES (152, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167851);
INSERT INTO `yc_admin_log` VALUES (153, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167856);
INSERT INTO `yc_admin_log` VALUES (154, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167856);
INSERT INTO `yc_admin_log` VALUES (155, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_information\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"title\",\"substance\",\"images\",\"contact\",\"status\",\"status_msg\",\"createtime\",\"updatetime\"],\"relation\":{\"2\":{\"relation\":\"yc_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"user_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167867);
INSERT INTO `yc_admin_log` VALUES (156, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_information\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"title\",\"substance\",\"images\",\"contact\",\"status\",\"status_msg\",\"createtime\",\"updatetime\"],\"relation\":{\"2\":{\"relation\":\"yc_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"user_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167868);
INSERT INTO `yc_admin_log` VALUES (157, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"1\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167870);
INSERT INTO `yc_admin_log` VALUES (158, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167871);
INSERT INTO `yc_admin_log` VALUES (159, 1, 'admin', '/tiEkolbOBK.php/command/get_controller_list', '在线命令管理', '{\"q_word\":[\"\"],\"pageNumber\":\"2\",\"pageSize\":\"10\",\"andOr\":\"OR \",\"orderBy\":[[\"name\",\"ASC\"]],\"searchTable\":\"tbl\",\"showField\":\"name\",\"keyField\":\"id\",\"searchField\":[\"name\"],\"name\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167873);
INSERT INTO `yc_admin_log` VALUES (160, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Information.php\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167874);
INSERT INTO `yc_admin_log` VALUES (161, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"menu\",\"allcontroller\":\"0\",\"delete\":\"0\",\"force\":\"0\",\"controllerfile_text\":\"\",\"controllerfile\":\"Information.php\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167874);
INSERT INTO `yc_admin_log` VALUES (162, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167952);
INSERT INTO `yc_admin_log` VALUES (163, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167952);
INSERT INTO `yc_admin_log` VALUES (164, 1, 'admin', '/tiEkolbOBK.php/ajax/upload', '', '{\"category\":\"\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167952);
INSERT INTO `yc_admin_log` VALUES (165, 1, 'admin', '/tiEkolbOBK.php/information/add?dialog=1', '信息管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"3\",\"category_id\":\"14\",\"title\":\"测试测试测试测试测试\",\"substance\":\"测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试\",\"images\":\"\\/uploads\\/20220417\\/764e9025071108bf8b7e5a9ae2c88bed.png,\\/uploads\\/20220417\\/756aadd19a7c2b906ee19b37d71cc596.jpg,\\/uploads\\/20220417\\/0f8912f314765bef899a7dc5fcae1b15.png\",\"contact\":\"17380287639\",\"status\":\"0\",\"status_msg\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650167962);
INSERT INTO `yc_admin_log` VALUES (166, 1, 'admin', '/tiEkolbOBK.php/information/edit/ids/1?dialog=1', '信息管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"3\",\"category_id\":\"14\",\"title\":\"测试测试测试测试测试\",\"substance\":\"测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试\",\"images\":\"\\/uploads\\/20220417\\/764e9025071108bf8b7e5a9ae2c88bed.png,\\/uploads\\/20220417\\/756aadd19a7c2b906ee19b37d71cc596.jpg,\\/uploads\\/20220417\\/0f8912f314765bef899a7dc5fcae1b15.png\",\"contact\":\"17380287639\",\"status\":\"1\",\"status_msg\":\"\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168001);
INSERT INTO `yc_admin_log` VALUES (167, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168361);
INSERT INTO `yc_admin_log` VALUES (168, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_information\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168366);
INSERT INTO `yc_admin_log` VALUES (169, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168376);
INSERT INTO `yc_admin_log` VALUES (170, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168376);
INSERT INTO `yc_admin_log` VALUES (171, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168376);
INSERT INTO `yc_admin_log` VALUES (172, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_admin\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168376);
INSERT INTO `yc_admin_log` VALUES (173, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168379);
INSERT INTO `yc_admin_log` VALUES (174, 1, 'admin', '/tiEkolbOBK.php/command/get_field_list', '在线命令管理', '{\"table\":\"yc_user\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168379);
INSERT INTO `yc_admin_log` VALUES (175, 1, 'admin', '/tiEkolbOBK.php/command/command/action/command', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_information\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"title\",\"substance\",\"images\",\"contact\",\"status\",\"status_msg\",\"weigh\",\"createtime\",\"updatetime\"],\"relation\":{\"2\":{\"relation\":\"yc_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"user_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"command\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168386);
INSERT INTO `yc_admin_log` VALUES (176, 1, 'admin', '/tiEkolbOBK.php/command/command/action/execute', '在线命令管理', '{\"commandtype\":\"crud\",\"isrelation\":\"1\",\"local\":\"0\",\"delete\":\"0\",\"force\":\"1\",\"table\":\"yc_information\",\"controller\":\"\",\"model\":\"\",\"fields\":[\"id\",\"title\",\"substance\",\"images\",\"contact\",\"status\",\"status_msg\",\"weigh\",\"createtime\",\"updatetime\"],\"relation\":{\"2\":{\"relation\":\"yc_user\",\"relationmode\":\"belongsto\",\"relationforeignkey\":\"user_id\",\"relationprimarykey\":\"id\",\"relationfields\":[\"nickname\"]}},\"setcheckboxsuffix\":\"\",\"enumradiosuffix\":\"\",\"imagefield\":\"\",\"filefield\":\"\",\"intdatesuffix\":\"\",\"switchsuffix\":\"\",\"citysuffix\":\"\",\"selectpagesuffix\":\"\",\"selectpagessuffix\":\"\",\"ignorefields\":\"\",\"sortfield\":\"\",\"editorsuffix\":\"\",\"headingfilterfield\":\"\",\"action\":\"execute\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168386);
INSERT INTO `yc_admin_log` VALUES (177, 1, 'admin', '/tiEkolbOBK.php/information/edit/ids/1?dialog=1', '信息管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"user_id\":\"3\",\"category_id\":\"14\",\"title\":\"测试测试测试测试测试\",\"substance\":\"测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试\",\"images\":\"\\/uploads\\/20220417\\/764e9025071108bf8b7e5a9ae2c88bed.png,\\/uploads\\/20220417\\/756aadd19a7c2b906ee19b37d71cc596.jpg,\\/uploads\\/20220417\\/0f8912f314765bef899a7dc5fcae1b15.png\",\"contact\":\"17380287639\",\"status\":\"1\",\"status_msg\":\"\",\"weigh\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650168420);
INSERT INTO `yc_admin_log` VALUES (178, 1, 'admin', '/tiEkolbOBK.php/information/edit/ids/1?dialog=1', '信息管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"1\",\"user_id\":\"3\",\"category_id\":\"14\",\"title\":\"测试测试测试测试测试\",\"substance\":\"测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试\",\"images\":\"\\/uploads\\/20220417\\/764e9025071108bf8b7e5a9ae2c88bed.png,\\/uploads\\/20220417\\/756aadd19a7c2b906ee19b37d71cc596.jpg,\\/uploads\\/20220417\\/0f8912f314765bef899a7dc5fcae1b15.png\",\"contact\":\"17380287639\",\"status\":\"1\",\"status_msg\":\"\",\"weigh\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650170724);
INSERT INTO `yc_admin_log` VALUES (179, 1, 'admin', '/tiEkolbOBK.php/information/edit/ids/1?dialog=1', '信息管理 / 编辑', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"1\",\"user_id\":\"3\",\"category_id\":\"14\",\"title\":\"测试测试测试测试测试\",\"substance\":\"测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试\",\"images\":\"\\/uploads\\/20220417\\/764e9025071108bf8b7e5a9ae2c88bed.png,\\/uploads\\/20220417\\/756aadd19a7c2b906ee19b37d71cc596.jpg,\\/uploads\\/20220417\\/0f8912f314765bef899a7dc5fcae1b15.png\",\"contact\":\"17380287639\",\"status\":\"1\",\"status_msg\":\"\",\"weigh\":\"1\"},\"ids\":\"1\"}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650170733);
INSERT INTO `yc_admin_log` VALUES (180, 1, 'admin', '/tiEkolbOBK.php/information/add?dialog=1', '信息管理 / 添加', '{\"dialog\":\"1\",\"row\":{\"community_id\":\"2\",\"user_id\":\"4\",\"category_id\":\"15\",\"title\":\"平台试运营平台试运营平台试运营平台试运营平台试运营\",\"substance\":\"平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营\",\"images\":\"\\/uploads\\/20220417\\/756aadd19a7c2b906ee19b37d71cc596.jpg\",\"contact\":\"17380287639\",\"status\":\"1\",\"status_msg\":\"\",\"weigh\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650175263);
INSERT INTO `yc_admin_log` VALUES (181, 1, 'admin', '/tiEkolbOBK.php/general/config/check', '常规管理 / 系统配置', '{\"row\":{\"name\":\"baseImgUrl\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650178289);
INSERT INTO `yc_admin_log` VALUES (182, 1, 'admin', '/tiEkolbOBK.php/general.config/add', '常规管理 / 系统配置 / 添加', '{\"__token__\":\"***\",\"row\":{\"group\":\"basic\",\"type\":\"string\",\"name\":\"baseImgUrl\",\"title\":\"文件根域名\",\"setting\":{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"},\"value\":\"\",\"content\":\"value1|title1\\r\\nvalue2|title2\",\"tip\":\"\",\"rule\":\"\",\"visible\":\"\",\"extend\":\"\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650178308);
INSERT INTO `yc_admin_log` VALUES (183, 1, 'admin', '/tiEkolbOBK.php/general.config/edit', '常规管理 / 系统配置 / 编辑', '{\"__token__\":\"***\",\"row\":{\"name\":\"智慧社区生活平台\",\"beian\":\"\",\"version\":\"1.0.1\",\"timezone\":\"Asia\\/Shanghai\",\"forbiddenip\":\"\",\"languages\":\"{&quot;backend&quot;:&quot;zh-cn&quot;,&quot;frontend&quot;:&quot;zh-cn&quot;}\",\"fixedpage\":\"dashboard\",\"baseImgUrl\":\"http:\\/\\/192.168.10.13\\/\"}}', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/100.0.4896.88 Safari/537.36', 1650178350);

-- ----------------------------
-- Table structure for yc_area
-- ----------------------------
DROP TABLE IF EXISTS `yc_area`;
CREATE TABLE `yc_area`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) NULL DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '简称',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) NULL DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '地区表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yc_attachment
-- ----------------------------
DROP TABLE IF EXISTS `yc_attachment`;
CREATE TABLE `yc_attachment`  (
  `id` int(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类别',
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '管理员ID',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '图片帧数',
  `filename` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '文件大小',
  `mimetype` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) NULL DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '附件表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_attachment
-- ----------------------------
INSERT INTO `yc_attachment` VALUES (1, '', 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `yc_attachment` VALUES (2, '', 1, 0, '/uploads/20220416/cc1faf4355ae2348d09c60529bb8eb6a.pem', '', '', 'pem', 0, 'apiclient_cert.pem', 1432, 'application/octet-stream', '', 1650096399, 1650096399, 1650096399, 'local', '2d40756c2b3c7f525ab2e04b2e40dd2587ed7d40');
INSERT INTO `yc_attachment` VALUES (3, '', 1, 0, '/uploads/20220416/ad2f98ca9151d969693b7e28893375d8.pem', '', '', 'pem', 0, 'apiclient_key.pem', 1704, 'application/octet-stream', '', 1650096401, 1650096401, 1650096401, 'local', '083b6060c83dc2fe7e41063eb85e7d743c624548');
INSERT INTO `yc_attachment` VALUES (4, '', 1, 0, '/uploads/20220416/606192725820e51f66d13bb061794df3.png', '732', '284', 'png', 0, '微信截图_20220416180303.png', 525674, 'image/png', '', 1650103403, 1650103403, 1650103403, 'local', 'dc03b052363fc5fe362e5185118e7c51608ef5c4');
INSERT INTO `yc_attachment` VALUES (5, '', 1, 0, '/uploads/20220416/f12882b9041108c28dc48d4d231dfa84.jpg', '1080', '810', 'jpg', 0, '照片呀.jpg', 100664, 'image/jpeg', '', 1650104086, 1650104086, 1650104086, 'local', 'b8dd3bd19c3fee2b70ae95b508d86a2cc2db5327');
INSERT INTO `yc_attachment` VALUES (6, '', 1, 0, '/uploads/20220416/205d4c1f655dae34b35ac5d4948eb85b.png', '60', '60', 'png', 0, 'scbl.png', 2402, 'image/png', '', 1650105568, 1650105568, 1650105568, 'local', '0426d32c0cee6679255c06adbbcf8e1be863dd46');
INSERT INTO `yc_attachment` VALUES (7, '', 1, 0, '/uploads/20220416/2cbac8e1c1d3cef7e7b001214090eeea.png', '60', '60', 'png', 0, 'mscg.png', 3005, 'image/png', '', 1650105782, 1650105782, 1650105782, 'local', '9752e77a562c766904639b76ffe583e9a702738f');
INSERT INTO `yc_attachment` VALUES (8, '', 1, 0, '/uploads/20220416/12b53f16e546837f9fd4b004b743889e.png', '60', '60', 'png', 0, 'tdyp.png', 3361, 'image/png', '', 1650105858, 1650105858, 1650105858, 'local', 'fde996fc7440ae80f9fa29384b1e8f87fabf4b08');
INSERT INTO `yc_attachment` VALUES (9, '', 1, 0, '/uploads/20220416/05936dd68deec22d86c237f3383e1a32.png', '60', '60', 'png', 0, 'esxz.png', 3282, 'image/png', '', 1650105955, 1650105955, 1650105955, 'local', '8312a886de0e96e5434ec8814438cffa76c7bf9f');
INSERT INTO `yc_attachment` VALUES (10, '', 1, 0, '/uploads/20220417/1631472f066e3b900924574b4dfe5175.png', '60', '60', 'png', 0, 'hjpt.png', 2546, 'image/png', '', 1650124973, 1650124973, 1650124973, 'local', 'f34f467d75e01cf61c907b615f038e16aca96973');
INSERT INTO `yc_attachment` VALUES (11, '', 1, 0, '/uploads/20220417/8dfe4b687fc6ec53f51e89cef3008fde.png', '200', '200', 'png', 0, '求职.png', 7678, 'image/png', '', 1650167330, 1650167330, 1650167330, 'local', '7de9e1502add5eef8743353514867e51160b27fd');
INSERT INTO `yc_attachment` VALUES (12, '', 1, 0, '/uploads/20220417/764e9025071108bf8b7e5a9ae2c88bed.png', '248', '90', 'png', 0, 'cxdm.png', 26345, 'image/png', '', 1650167952, 1650167952, 1650167952, 'local', '43aef600249a6eba9ba41fa23ee38ece0e40f3cd');
INSERT INTO `yc_attachment` VALUES (13, '', 1, 0, '/uploads/20220417/756aadd19a7c2b906ee19b37d71cc596.jpg', '610', '610', 'jpg', 0, 'i4y3_w140h140.jpg', 74345, 'image/jpeg', '', 1650167952, 1650167952, 1650167952, 'local', '4044804587b500267de17db7ae6061e44d143d15');
INSERT INTO `yc_attachment` VALUES (14, '', 1, 0, '/uploads/20220417/0f8912f314765bef899a7dc5fcae1b15.png', '248', '90', 'png', 0, 'jemj.png', 25670, 'image/png', '', 1650167952, 1650167952, 1650167952, 'local', 'ee036c211c7c5c3eed572a086adb43a6ec054461');

-- ----------------------------
-- Table structure for yc_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `yc_auth_group`;
CREATE TABLE `yc_auth_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父组别',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '规则ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_auth_group
-- ----------------------------
INSERT INTO `yc_auth_group` VALUES (1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal');
INSERT INTO `yc_auth_group` VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal');
INSERT INTO `yc_auth_group` VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal');
INSERT INTO `yc_auth_group` VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal');
INSERT INTO `yc_auth_group` VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for yc_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `yc_auth_group_access`;
CREATE TABLE `yc_auth_group_access`  (
  `uid` int(10) UNSIGNED NOT NULL COMMENT '会员ID',
  `group_id` int(10) UNSIGNED NOT NULL COMMENT '级别ID',
  UNIQUE INDEX `uid_group_id`(`uid`, `group_id`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '权限分组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_auth_group_access
-- ----------------------------
INSERT INTO `yc_auth_group_access` VALUES (1, 1);

-- ----------------------------
-- Table structure for yc_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `yc_auth_rule`;
CREATE TABLE `yc_auth_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图标',
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '条件',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '拼音',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  INDEX `weigh`(`weigh`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '节点表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_auth_rule
-- ----------------------------
INSERT INTO `yc_auth_rule` VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal');
INSERT INTO `yc_auth_rule` VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 'cggl', 'changguiguanli', 1491635035, 1491635035, 137, 'normal');
INSERT INTO `yc_auth_rule` VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 1, NULL, '', 'flgl', 'fenleiguanli', 1491635035, 1650167004, 119, 'normal');
INSERT INTO `yc_auth_rule` VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', '', 'Addon tips', 1, NULL, '', 'cjgl', 'chajianguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 'qxgl', 'quanxianguanli', 1491635035, 1491635035, 99, 'normal');
INSERT INTO `yc_auth_rule` VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal');
INSERT INTO `yc_auth_rule` VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal');
INSERT INTO `yc_auth_rule` VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1491635035, 34, 'normal');
INSERT INTO `yc_auth_rule` VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal');
INSERT INTO `yc_auth_rule` VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal');
INSERT INTO `yc_auth_rule` VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal');
INSERT INTO `yc_auth_rule` VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal');
INSERT INTO `yc_auth_rule` VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal');
INSERT INTO `yc_auth_rule` VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal');
INSERT INTO `yc_auth_rule` VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal');
INSERT INTO `yc_auth_rule` VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal');
INSERT INTO `yc_auth_rule` VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal');
INSERT INTO `yc_auth_rule` VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal');
INSERT INTO `yc_auth_rule` VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal');
INSERT INTO `yc_auth_rule` VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal');
INSERT INTO `yc_auth_rule` VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal');
INSERT INTO `yc_auth_rule` VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal');
INSERT INTO `yc_auth_rule` VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal');
INSERT INTO `yc_auth_rule` VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal');
INSERT INTO `yc_auth_rule` VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal');
INSERT INTO `yc_auth_rule` VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal');
INSERT INTO `yc_auth_rule` VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal');
INSERT INTO `yc_auth_rule` VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal');
INSERT INTO `yc_auth_rule` VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal');
INSERT INTO `yc_auth_rule` VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal');
INSERT INTO `yc_auth_rule` VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal');
INSERT INTO `yc_auth_rule` VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal');
INSERT INTO `yc_auth_rule` VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal');
INSERT INTO `yc_auth_rule` VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal');
INSERT INTO `yc_auth_rule` VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal');
INSERT INTO `yc_auth_rule` VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal');
INSERT INTO `yc_auth_rule` VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal');
INSERT INTO `yc_auth_rule` VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal');
INSERT INTO `yc_auth_rule` VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal');
INSERT INTO `yc_auth_rule` VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal');
INSERT INTO `yc_auth_rule` VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal');
INSERT INTO `yc_auth_rule` VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal');
INSERT INTO `yc_auth_rule` VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal');
INSERT INTO `yc_auth_rule` VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal');
INSERT INTO `yc_auth_rule` VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal');
INSERT INTO `yc_auth_rule` VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal');
INSERT INTO `yc_auth_rule` VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal');
INSERT INTO `yc_auth_rule` VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal');
INSERT INTO `yc_auth_rule` VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal');
INSERT INTO `yc_auth_rule` VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal');
INSERT INTO `yc_auth_rule` VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal');
INSERT INTO `yc_auth_rule` VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal');
INSERT INTO `yc_auth_rule` VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal');
INSERT INTO `yc_auth_rule` VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal');
INSERT INTO `yc_auth_rule` VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (66, 'file', 0, 'user', 'User', 'fa fa-user-circle', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (85, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', '', 1, NULL, '', 'zxmlgl', 'zaixianminglingguanli', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (86, 'file', 85, 'command/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (87, 'file', 85, 'command/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (88, 'file', 85, 'command/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xq', 'xiangqing', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (89, 'file', 85, 'command/execute', '运行', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'yx', 'yunxing', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (90, 'file', 85, 'command/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (91, 'file', 85, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (92, 'file', 0, 'community', '小区信息', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'xqxx', 'xiaoquxinxi', 1650097532, 1650098157, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (93, 'file', 92, 'community/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650097532, 1650097532, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (94, 'file', 92, 'community/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650097532, 1650097532, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (95, 'file', 92, 'community/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650097533, 1650097533, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (96, 'file', 92, 'community/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650097533, 1650097533, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (97, 'file', 92, 'community/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650097533, 1650097533, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (98, 'file', 0, 'banner', '首页轮播', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'sylb', 'shouyelunbo', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (99, 'file', 98, 'banner/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (100, 'file', 98, 'banner/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (101, 'file', 98, 'banner/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (102, 'file', 98, 'banner/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (103, 'file', 98, 'banner/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (104, 'file', 0, 'modular', '首页模块', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'symk', 'shouyemokuai', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (105, 'file', 104, 'modular/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (106, 'file', 104, 'modular/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (107, 'file', 104, 'modular/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (108, 'file', 104, 'modular/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (109, 'file', 104, 'modular/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (110, 'file', 0, 'information', '信息管理', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'xxgl', 'xinxiguanli', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (111, 'file', 110, 'information/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (112, 'file', 110, 'information/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (113, 'file', 110, 'information/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (114, 'file', 110, 'information/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (115, 'file', 110, 'information/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (116, 'file', 110, 'information/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (117, 'file', 110, 'information/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` VALUES (118, 'file', 110, 'information/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650167874, 1650167874, 0, 'normal');

-- ----------------------------
-- Table structure for yc_banner
-- ----------------------------
DROP TABLE IF EXISTS `yc_banner`;
CREATE TABLE `yc_banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `weigh` int(11) NULL DEFAULT NULL COMMENT '排序',
  `community_id` int(11) NULL DEFAULT NULL COMMENT '展示小区',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播标题',
  `sub_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '轮播描述',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址',
  `jump_type` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转类型:0=不跳转,1=内部页面,2=外部页面',
  `jump_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '展示状态:0=隐藏,1=显示',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页轮播' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_banner
-- ----------------------------
INSERT INTO `yc_banner` VALUES (1, 1, 0, '平台试运营', '现在入驻，抢第一波流量啦', '/uploads/20220416/606192725820e51f66d13bb061794df3.png', '0', '', '1', 1650103440);
INSERT INTO `yc_banner` VALUES (2, 2, 0, '平台试运营', '现在入驻，抢第一波流量啦', '/uploads/20220416/f12882b9041108c28dc48d4d231dfa84.jpg', '1', '/pages/business/business?classify=1', '1', 1650104116);

-- ----------------------------
-- Table structure for yc_category
-- ----------------------------
DROP TABLE IF EXISTS `yc_category`;
CREATE TABLE `yc_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父ID',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `weigh`(`weigh`, `id`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_category
-- ----------------------------
INSERT INTO `yc_category` VALUES (14, 0, 'information', '二手闲置', '二手闲置', '', '/uploads/20220416/05936dd68deec22d86c237f3383e1a32.png', '', '', '', 1650167136, 1650167136, 14, 'normal');
INSERT INTO `yc_category` VALUES (15, 0, 'information', '招聘求职', '招聘求职', '', '/uploads/20220417/8dfe4b687fc6ec53f51e89cef3008fde.png', '', '', '', 1650167332, 1650167332, 15, 'normal');

-- ----------------------------
-- Table structure for yc_command
-- ----------------------------
DROP TABLE IF EXISTS `yc_command`;
CREATE TABLE `yc_command`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '命令',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '返回结果',
  `executetime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '执行时间',
  `createtime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) UNSIGNED NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线命令表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_command
-- ----------------------------
INSERT INTO `yc_command` VALUES (1, 'crud', '[\"--force=1\",\"--table=yc_community\",\"--local=0\"]', 'php think crud --force=1 --table=yc_community --local=0', 'Build Successed', 1650097527, 1650097527, 1650097527, 'successed');
INSERT INTO `yc_command` VALUES (2, 'menu', '[\"--controller=Community\"]', 'php think menu --controller=Community', 'Build Successed!', 1650097532, 1650097532, 1650097533, 'successed');
INSERT INTO `yc_command` VALUES (3, 'crud', '[\"--force=1\",\"--table=yc_banner\",\"--fields=id,image,jump_type,jump_url,status,createtime\",\"--local=0\",\"--relation=yc_community\",\"--relationmode=belongsto\",\"--relationforeignkey=community_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=yc_banner --fields=id,image,jump_type,jump_url,status,createtime --local=0 --relation=yc_community --relationmode=belongsto --relationforeignkey=community_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1650103259, 1650103259, 1650103259, 'successed');
INSERT INTO `yc_command` VALUES (4, 'menu', '[\"--controller=Banner\"]', 'php think menu --controller=Banner', 'Build Successed!', 1650103267, 1650103267, 1650103267, 'successed');
INSERT INTO `yc_command` VALUES (5, 'crud', '[\"--force=1\",\"--table=yc_banner\",\"--fields=id,image,jump_type,jump_url,status,createtime\",\"--local=0\",\"--relation=yc_community\",\"--relationmode=belongsto\",\"--relationforeignkey=community_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=yc_banner --fields=id,image,jump_type,jump_url,status,createtime --local=0 --relation=yc_community --relationmode=belongsto --relationforeignkey=community_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1650103949, 1650103949, 1650103949, 'successed');
INSERT INTO `yc_command` VALUES (6, 'crud', '[\"--force=1\",\"--table=yc_banner\",\"--fields=id,weigh,image,jump_type,jump_url,status,createtime\",\"--local=0\",\"--relation=yc_community\",\"--relationmode=belongsto\",\"--relationforeignkey=community_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=yc_banner --fields=id,weigh,image,jump_type,jump_url,status,createtime --local=0 --relation=yc_community --relationmode=belongsto --relationforeignkey=community_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1650103981, 1650103981, 1650103981, 'successed');
INSERT INTO `yc_command` VALUES (7, 'crud', '[\"--force=1\",\"--table=yc_modular\",\"--fields=id,title,ico_image,jump_type,jump_url,status,weigh,createtime\",\"--local=0\",\"--relation=yc_community\",\"--relationmode=belongsto\",\"--relationforeignkey=community_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=yc_modular --fields=id,title,ico_image,jump_type,jump_url,status,weigh,createtime --local=0 --relation=yc_community --relationmode=belongsto --relationforeignkey=community_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1650105124, 1650105124, 1650105124, 'successed');
INSERT INTO `yc_command` VALUES (8, 'menu', '[\"--controller=Modular\"]', 'php think menu --controller=Modular', 'Build Successed!', 1650105131, 1650105131, 1650105131, 'successed');
INSERT INTO `yc_command` VALUES (9, 'crud', '[\"--force=1\",\"--table=yc_information\",\"--fields=id,title,substance,images,contact,status,status_msg,createtime,updatetime\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=yc_information --fields=id,title,substance,images,contact,status,status_msg,createtime,updatetime --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1650167867, 1650167867, 1650167867, 'successed');
INSERT INTO `yc_command` VALUES (10, 'menu', '[\"--controller=Information\"]', 'php think menu --controller=Information', 'Build Successed!', 1650167874, 1650167874, 1650167874, 'successed');
INSERT INTO `yc_command` VALUES (11, 'crud', '[\"--force=1\",\"--table=yc_information\",\"--fields=id,title,substance,images,contact,status,status_msg,weigh,createtime,updatetime\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=yc_information --fields=id,title,substance,images,contact,status,status_msg,weigh,createtime,updatetime --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1650168386, 1650168386, 1650168386, 'successed');

-- ----------------------------
-- Table structure for yc_community
-- ----------------------------
DROP TABLE IF EXISTS `yc_community`;
CREATE TABLE `yc_community`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `no` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小区代码',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '小区名称',
  `city` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在省市',
  `address` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `longitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址经度',
  `latitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址纬度',
  `status` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核状态:0=待审核,1=已通过,2=不通过',
  `status_msg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核结果',
  `createtime` int(11) NOT NULL COMMENT '申请时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `no`(`no`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  INDEX `longitude`(`longitude`) USING BTREE,
  INDEX `latitude`(`latitude`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '社区信息' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_community
-- ----------------------------
INSERT INTO `yc_community` VALUES (1, 'CQ220401', '升伟一里南滨', '重庆/重庆市/南岸区', '重庆市南岸区南坪东路二巷20号', '106.57425979572295', '29.532681764428744', '1', '', 1650097868, 1650121600);
INSERT INTO `yc_community` VALUES (2, 'CQ220402', '东源锦悦', '重庆/重庆市/南岸区', '重庆市南岸区南坪东路2巷2号', '106.57310108142852', '29.53053471727576', '1', '', 1650098017, 1650121597);
INSERT INTO `yc_community` VALUES (3, 'CQ220403', '万寿华庭', '重庆/重庆市/南岸区', '重庆市南岸区花园路街道金山支路1号', '106.56043', '29.522746', '1', '', 1650120965, 1650121594);
INSERT INTO `yc_community` VALUES (4, 'CQ220404', '洋河南滨花园', '重庆/重庆市/南岸区', '重庆市南岸区南坪东路2巷2洋河南滨花园', '106.571005', '29.533296', '1', '', 1650130971, 1650130971);

-- ----------------------------
-- Table structure for yc_config
-- ----------------------------
DROP TABLE IF EXISTS `yc_config`;
CREATE TABLE `yc_config`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量名',
  `group` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '分组',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '可见条件',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量值',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '变量字典数据',
  `rule` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 26 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_config
-- ----------------------------
INSERT INTO `yc_config` VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', '智慧社区生活平台', '', 'required', '', NULL);
INSERT INTO `yc_config` VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', NULL);
INSERT INTO `yc_config` VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', '');
INSERT INTO `yc_config` VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '1.0.1', '', 'required', '', NULL);
INSERT INTO `yc_config` VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', NULL);
INSERT INTO `yc_config` VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', NULL);
INSERT INTO `yc_config` VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', NULL);
INSERT INTO `yc_config` VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', NULL);
INSERT INTO `yc_config` VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{\"information\":\"同城信息\"}', '', '', '', NULL);
INSERT INTO `yc_config` VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{\"basic\":\"基础配置\",\"email\":\"邮件配置\",\"dictionary\":\"字典配置\",\"user\":\"会员配置\",\"wechat_pay\":\"微信支付配置\",\"mini_wechat\":\"微信小程序配置\"}', '', '', '', NULL);
INSERT INTO `yc_config` VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '[\"请选择\",\"SMTP\"]', '', '', '');
INSERT INTO `yc_config` VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', '');
INSERT INTO `yc_config` VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', '');
INSERT INTO `yc_config` VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '10000', '', '', '', '');
INSERT INTO `yc_config` VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'string', '', 'password', '', '', '', '');
INSERT INTO `yc_config` VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `yc_config` VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '', '10000@qq.com', '', '', '', '');
INSERT INTO `yc_config` VALUES (18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{\"category1\":\"分类一\",\"category2\":\"分类二\",\"custom\":\"自定义\"}', '', '', '', NULL);
INSERT INTO `yc_config` VALUES (19, 'miniapp_appid', 'mini_wechat', 'APPID', '', 'string', '', 'wxf546a5881c82222e', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` VALUES (20, 'miniapp_secret', 'mini_wechat', 'AppSecret', '', 'text', '', 'ba4a5884aa4df84136f0f8c6669d4512', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` VALUES (21, 'wechat_pay_mch_id', 'wechat_pay', '商户号', '', 'string', '', '1608517040', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` VALUES (22, 'wechat_pay_key_v2', 'wechat_pay', '支付密钥V2', '', 'text', '', 'dacf3ffb62509a51556b60103b4b295e', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` VALUES (23, 'wechat_pay_cert_client', 'wechat_pay', 'cert_client证书', '', 'file', '', '/uploads/20220416/cc1faf4355ae2348d09c60529bb8eb6a.pem', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` VALUES (24, 'wechat_pay_cert_key', 'wechat_pay', 'cert_key证书', '', 'file', '', '/uploads/20220416/ad2f98ca9151d969693b7e28893375d8.pem', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` VALUES (25, 'baseImgUrl', 'basic', '文件根域名', '', 'string', '', 'http://192.168.10.13/', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');

-- ----------------------------
-- Table structure for yc_ems
-- ----------------------------
DROP TABLE IF EXISTS `yc_ems`;
CREATE TABLE `yc_ems`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '邮箱验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yc_information
-- ----------------------------
DROP TABLE IF EXISTS `yc_information`;
CREATE TABLE `yc_information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '发布者',
  `category_id` int(11) NOT NULL COMMENT '信息分类',
  `community_id` int(11) NULL DEFAULT NULL COMMENT '发布小区',
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息标题',
  `substance` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息内容',
  `images` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '相关图片',
  `contact` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `status` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '发布状态:0=待审核,1=已发布,2=不通过',
  `status_msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核结果',
  `weigh` int(11) NULL DEFAULT NULL COMMENT '排序',
  `longitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布者经度',
  `latitude` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发布者纬度',
  `is_thiscom` int(1) NOT NULL DEFAULT 0 COMMENT '仅小区可见:0=否,1=是',
  `look_num` int(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) NULL DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '信息管理' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_information
-- ----------------------------
INSERT INTO `yc_information` VALUES (1, 3, 14, 1, '测试测试测试测试测试', '测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试测试测试测试顺丰到付测试测试测是的是的试测试测试测试测试测试测试测试测是的是的试测试测试', '/uploads/20220417/764e9025071108bf8b7e5a9ae2c88bed.png,/uploads/20220417/756aadd19a7c2b906ee19b37d71cc596.jpg,/uploads/20220417/0f8912f314765bef899a7dc5fcae1b15.png', '17380287639', '1', '', 1, NULL, NULL, 0, 4614, 1650167962, 1650170724, NULL);
INSERT INTO `yc_information` VALUES (2, 4, 15, 2, '平台试运营平台试运营平台试运营平台试运营平台试运营', '平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营平台试运营', '/uploads/20220417/756aadd19a7c2b906ee19b37d71cc596.jpg', '17380287639', '1', '', 2, '106.572995', '29.530348', 0, 1, 1650175263, 1650210369, NULL);

-- ----------------------------
-- Table structure for yc_modular
-- ----------------------------
DROP TABLE IF EXISTS `yc_modular`;
CREATE TABLE `yc_modular`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `community_id` int(11) NULL DEFAULT NULL COMMENT '展示小区',
  `title` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块标题',
  `ico_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '模块ICO',
  `jump_type` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '跳转类型:0=不跳转,1=内部页面,2=外部页面',
  `jump_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '跳转地址',
  `status` enum('0','1') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '展示状态:0=隐藏,1=显示',
  `weigh` int(11) NULL DEFAULT NULL COMMENT '排序',
  `createtime` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '首页模块' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_modular
-- ----------------------------
INSERT INTO `yc_modular` VALUES (1, 0, '商超便利', '/uploads/20220416/205d4c1f655dae34b35ac5d4948eb85b.png', '1', '/pages/business/business?classify=1', '1', 3, 1650105656);
INSERT INTO `yc_modular` VALUES (2, 0, '美食餐馆', '/uploads/20220416/2cbac8e1c1d3cef7e7b001214090eeea.png', '1', '/pages/business/business?classify=2', '1', 1, 1650105784);
INSERT INTO `yc_modular` VALUES (3, 0, '甜点饮品', '/uploads/20220416/12b53f16e546837f9fd4b004b743889e.png', '1', '/pages/business/business?classify=3', '1', 2, 1650105871);
INSERT INTO `yc_modular` VALUES (4, 0, '二手闲置', '/uploads/20220416/05936dd68deec22d86c237f3383e1a32.png', '1', '/pages/second-hand/second-hand', '1', 4, 1650105979);
INSERT INTO `yc_modular` VALUES (5, 2, '帮买帮送', '/uploads/20220417/1631472f066e3b900924574b4dfe5175.png', '0', '', '0', 5, 1650124177);

-- ----------------------------
-- Table structure for yc_sms
-- ----------------------------
DROP TABLE IF EXISTS `yc_sms`;
CREATE TABLE `yc_sms`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证码',
  `times` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '验证次数',
  `ip` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'IP',
  `createtime` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '短信验证码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yc_test
-- ----------------------------
DROP TABLE IF EXISTS `yc_test`;
CREATE TABLE `yc_test`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) NULL DEFAULT 0 COMMENT '会员ID',
  `admin_id` int(10) NULL DEFAULT 0 COMMENT '管理员ID',
  `category_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '分类ID(单选)',
  `category_ids` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '分类ID(多选)',
  `tags` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标签',
  `week` enum('monday','tuesday','wednesday') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '内容',
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片',
  `images` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '附件',
  `keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '关键字',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '描述',
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '省市',
  `json` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `multiplejson` varchar(1500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '二维数组:title=标题,intro=介绍,author=作者,age=年龄',
  `price` decimal(10, 2) UNSIGNED NULL DEFAULT 0.00 COMMENT '价格',
  `views` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '点击',
  `workrange` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '时间区间',
  `startdate` date NULL DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime(0) NULL DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year NULL DEFAULT NULL COMMENT '年',
  `times` time(0) NULL DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) NULL DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) NULL DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `switch` tinyint(1) NULL DEFAULT 0 COMMENT '开关',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '测试表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_test
-- ----------------------------
INSERT INTO `yc_test` VALUES (1, 1, 1, 12, '12,13', '互联网,计算机', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', '[{\"title\":\"标题一\",\"intro\":\"介绍一\",\"author\":\"小明\",\"age\":\"21\"}]', 0.00, 0, '2020-10-01 00:00:00 - 2021-10-31 23:59:59', '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1491635035, 1491635035, 1491635035, NULL, 0, 1, 'normal', '1');

-- ----------------------------
-- Table structure for yc_user
-- ----------------------------
DROP TABLE IF EXISTS `yc_user`;
CREATE TABLE `yc_user`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `community_id` int(10) NULL DEFAULT NULL COMMENT '所属小区',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '组别ID',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像',
  `level` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '等级',
  `gender` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '性别',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '格言',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '积分',
  `successions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '连续登录天数',
  `maxsuccessions` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT '最大连续登录天数',
  `prevtime` int(10) NULL DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) NULL DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '失败次数',
  `joinip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) NULL DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'Token',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  `verification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '验证',
  `mini_openid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '小程序Openid',
  `mini_session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '小程序登录态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`) USING BTREE,
  INDEX `email`(`email`) USING BTREE,
  INDEX `mobile`(`mobile`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_user
-- ----------------------------
INSERT INTO `yc_user` VALUES (1, NULL, 1, 'admin', 'admin', 'e04d67c2ae8f0c3676d425e1055574ea', '41450b', 'admin@163.com', '13888888888', 'http://tc.cn/assets/img/avatar.png', 0, 0, '2017-04-08', '', 0.00, 0, 1, 1, 1491635035, 1491635035, '127.0.0.1', 0, '127.0.0.1', 1491635035, 0, 1491635035, '', 'normal', '', NULL, NULL);
INSERT INTO `yc_user` VALUES (3, 3, 1, 'oH_-A5fnFWbQXUuoAet5arm-IDDg', '江淮川', '83d755b1727d010cef2375f65d8d010b', 'N5oJXR', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/TicIdNMR9b27e7Llq2Z9M3ftrQdzkUibMsu7J0MfhPhvWZR9vD0athYxF2tdkY9ecBc4Wh4Xs2QKXicuicFRnkkfnw/132', 2, 0, NULL, '', 0.00, 200, 1, 1, 1650204030, 1650207231, '192.168.10.15', 0, '', NULL, 1650132984, 1650207231, '', 'normal', '', 'oH_-A5fnFWbQXUuoAet5arm-IDDg', 'sHuPDgaD7KEhSKGO61IeJg==');
INSERT INTO `yc_user` VALUES (4, NULL, 1, 'oH_-A5c3viPru4O_MpB0DglFRIS8', '千怡哥', '6377bdd2da2ac7b69aacaeb055164727', 'WIq9M5', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/f5RX1LUHqcibYU4qtWnLUwoF8skPWAevvicicJDjjkyEXZN4CaP7gF8vbgAiaNxpHFEqiaicfPfEjianoiaZMb3wxPdf3A/132', 1, 0, NULL, '', 0.00, 100, 1, 1, 1650138735, 1650138794, '192.168.10.10', 0, '', NULL, 1650138695, 1650138794, '', 'normal', '', 'oH_-A5c3viPru4O_MpB0DglFRIS8', 'uORJxRxOZw0SJfaMjqlWAQ==');

-- ----------------------------
-- Table structure for yc_user_group
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_group`;
CREATE TABLE `yc_user_group`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '组名',
  `rules` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '权限节点',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_user_group
-- ----------------------------
INSERT INTO `yc_user_group` VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');

-- ----------------------------
-- Table structure for yc_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_money_log`;
CREATE TABLE `yc_user_money_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `money` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更余额',
  `before` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更前余额',
  `after` decimal(10, 2) NOT NULL DEFAULT 0.00 COMMENT '变更后余额',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员余额变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yc_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_rule`;
CREATE TABLE `yc_user_rule`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` int(10) NULL DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '名称',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '标题',
  `remark` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) NULL DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NULL DEFAULT 0 COMMENT '权重',
  `status` enum('normal','hidden') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员规则表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_user_rule
-- ----------------------------
INSERT INTO `yc_user_rule` VALUES (1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal');
INSERT INTO `yc_user_rule` VALUES (2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal');
INSERT INTO `yc_user_rule` VALUES (3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal');
INSERT INTO `yc_user_rule` VALUES (4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal');
INSERT INTO `yc_user_rule` VALUES (5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal');
INSERT INTO `yc_user_rule` VALUES (6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal');
INSERT INTO `yc_user_rule` VALUES (7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal');
INSERT INTO `yc_user_rule` VALUES (8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal');
INSERT INTO `yc_user_rule` VALUES (9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal');
INSERT INTO `yc_user_rule` VALUES (10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal');
INSERT INTO `yc_user_rule` VALUES (11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal');
INSERT INTO `yc_user_rule` VALUES (12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');

-- ----------------------------
-- Table structure for yc_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_score_log`;
CREATE TABLE `yc_user_score_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT 0 COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT 0 COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT 0 COMMENT '变更后积分',
  `memo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员积分变动表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for yc_user_token
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_token`;
CREATE TABLE `yc_user_token`  (
  `token` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Token',
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '会员ID',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) NULL DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '会员Token表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of yc_user_token
-- ----------------------------
INSERT INTO `yc_user_token` VALUES ('00008d8bd13a00f4723046812371f42ad6a94e84', 3, 1650138173, 1652730173);
INSERT INTO `yc_user_token` VALUES ('05e78e39168c7b1be48e9937fbd7a6ae4f35e3e9', 3, 1650138230, 1652730230);
INSERT INTO `yc_user_token` VALUES ('095d1aafa76f5130a1e309e8bcdf6d1af531b8bc', 3, 1650136772, 1652728772);
INSERT INTO `yc_user_token` VALUES ('0be773c05cb4a7005c4f39e38002aa0562724567', 3, 1650173867, 1652765867);
INSERT INTO `yc_user_token` VALUES ('12f1d995e164191a2a98a558fbc21bf51c0a04c4', 3, 1650137128, 1652729128);
INSERT INTO `yc_user_token` VALUES ('19adf6ba0560d48a358b780477ea7a8b341e9b33', 3, 1650137325, 1652729325);
INSERT INTO `yc_user_token` VALUES ('1a1abb64b7d981718d1cf3e1f79307018e90f9f0', 3, 1650133012, 1652725012);
INSERT INTO `yc_user_token` VALUES ('1ac89a2685323f91d6d4c403dd1768a68b9c26c8', 3, 1650136795, 1652728795);
INSERT INTO `yc_user_token` VALUES ('1b9744c9b7011a6284f15acd60b1e33770e8d280', 4, 1650138695, 1652730695);
INSERT INTO `yc_user_token` VALUES ('1bcaced1c1e50f55197f2d51d2cc1b7336345cad', 3, 1650133206, 1652725206);
INSERT INTO `yc_user_token` VALUES ('20c67ecb118d6c768949eea043b48eb77c80ba44', 4, 1650138794, 1652730794);
INSERT INTO `yc_user_token` VALUES ('245f1ecea4547234690e6c348bc9dcedf67a1f84', 3, 1650134369, 1652726369);
INSERT INTO `yc_user_token` VALUES ('2f83f9ba9eb8d58c834622357129963069cfde6a', 3, 1650136623, 1652728623);
INSERT INTO `yc_user_token` VALUES ('37cb99f83651edaee9802a1e1eeb6f6f6fb94846', 3, 1650133503, 1652725503);
INSERT INTO `yc_user_token` VALUES ('3bf61549e47318c006567f4847a8b811e7e8000e', 3, 1650137159, 1652729159);
INSERT INTO `yc_user_token` VALUES ('3fe56982218176cd0933747c0806b415b0c0074b', 3, 1650137572, 1652729572);
INSERT INTO `yc_user_token` VALUES ('41bc399a18a586a422053ccf567cd8669e093f3b', 3, 1650207231, 1652799231);
INSERT INTO `yc_user_token` VALUES ('43506ea6459e00f123221cdbfdce8e632f865be3', 3, 1650138939, 1652730939);
INSERT INTO `yc_user_token` VALUES ('523278ce515b335383be79780793871f08dd4f68', 3, 1650134356, 1652726356);
INSERT INTO `yc_user_token` VALUES ('5e57b18cb42b45b7881b19ecf364c9e59a6f2435', 3, 1650180792, 1652772792);
INSERT INTO `yc_user_token` VALUES ('63d042f8df7099928ec1094792288af9e4c67732', 3, 1650136619, 1652728619);
INSERT INTO `yc_user_token` VALUES ('63f922d215d069c57a4ac3c2c395b33c1dc2421b', 3, 1650138295, 1652730295);
INSERT INTO `yc_user_token` VALUES ('6ad0e287905c7f0bf5567cb6a760151cae0f3640', 3, 1650133977, 1652725977);
INSERT INTO `yc_user_token` VALUES ('6d8ff614f3eab974e24b702e0e63f6fda4db1cbb', 3, 1650204030, 1652796030);
INSERT INTO `yc_user_token` VALUES ('6e8d8e0dfc0ad6e276b041e0cd72c2520090b899', 3, 1650134574, 1652726574);
INSERT INTO `yc_user_token` VALUES ('71ca6941faec7c355fc8c4594572780481ce8bb3', 3, 1650169274, 1652761274);
INSERT INTO `yc_user_token` VALUES ('785beeba90d41d228e794cd0f8ec89427f055ddb', 3, 1650178768, 1652770768);
INSERT INTO `yc_user_token` VALUES ('7d5b27c0ba0e911ac0cdf7f9869535eb9f87b7a4', 3, 1650138143, 1652730143);
INSERT INTO `yc_user_token` VALUES ('7f1b64c06758e4279bf413e1cd0d2105ab0bd474', 3, 1650133040, 1652725040);
INSERT INTO `yc_user_token` VALUES ('8bc1648fff14f607818132fcc9addd638d49a0c8', 3, 1650134503, 1652726503);
INSERT INTO `yc_user_token` VALUES ('944e84c2f77430f7d27d1d0028db3a1a034d7220', 3, 1650132984, 1652724984);
INSERT INTO `yc_user_token` VALUES ('97cdb3b1d8bc4d6c6fed367b290db57ef497cb18', 3, 1650136627, 1652728627);
INSERT INTO `yc_user_token` VALUES ('984478aa0bf9c6639daf96a883c4970e984fbcae', 3, 1650134515, 1652726515);
INSERT INTO `yc_user_token` VALUES ('a21127ad0c0c52b2c3089f7261b8a75abd097f61', 3, 1650136807, 1652728807);
INSERT INTO `yc_user_token` VALUES ('ad0e59c79fc65d2df0467adfa99c21735b81876b', 3, 1650136594, 1652728594);
INSERT INTO `yc_user_token` VALUES ('b02a17eee3d140faf3e86cd78cfb6e62223eb6c7', 3, 1650138544, 1652730544);
INSERT INTO `yc_user_token` VALUES ('b05c49662c237c1c95e49ab27c7a35a51a58d3cd', 3, 1650133246, 1652725246);
INSERT INTO `yc_user_token` VALUES ('bfe385aa4f25d4fc69b376c85efaa501a742944f', 3, 1650133585, 1652725585);
INSERT INTO `yc_user_token` VALUES ('c672907214aff6575d7f72cb4ca63d70d48791bc', 3, 1650133838, 1652725838);
INSERT INTO `yc_user_token` VALUES ('cd0ce52ea07096e187e62a432e37086d952ea952', 4, 1650138735, 1652730735);
INSERT INTO `yc_user_token` VALUES ('d6d2aea6ff58f5264d11525e53ce4ca1bf4c3315', 3, 1650133113, 1652725113);
INSERT INTO `yc_user_token` VALUES ('d7f7efe07523887b9da68902ba82f05f2765624b', 3, 1650133881, 1652725881);
INSERT INTO `yc_user_token` VALUES ('d92f326b108c2036cb1ba2fa2ba203251dcb136e', 3, 1650137495, 1652729495);
INSERT INTO `yc_user_token` VALUES ('df64c8551124af6ce284a3e0dc34fb7ebd900bb9', 3, 1650136800, 1652728800);
INSERT INTO `yc_user_token` VALUES ('e18fc8b1207a0ef85852be300660384ef7f25f03', 3, 1650133441, 1652725441);
INSERT INTO `yc_user_token` VALUES ('e62617d1f8d2f282ee564531b20e803cceda5764', 3, 1650133600, 1652725600);
INSERT INTO `yc_user_token` VALUES ('e988da0f3189db00aababbea5a79f1b959051c45', 3, 1650136709, 1652728709);
INSERT INTO `yc_user_token` VALUES ('ea740e4bb8a6ce2b92fafa7fe27b0d78290af419', 3, 1650133125, 1652725125);
INSERT INTO `yc_user_token` VALUES ('eaaa1ed1b915f46d694a5bf01e69cfabf11af541', 3, 1650136578, 1652728578);
INSERT INTO `yc_user_token` VALUES ('f24ccd3ffdc2a61df35b288907705c3ebb5381ba', 3, 1650138281, 1652730281);

-- ----------------------------
-- Table structure for yc_version
-- ----------------------------
DROP TABLE IF EXISTS `yc_version`;
CREATE TABLE `yc_version`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '包大小',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) UNSIGNED NOT NULL DEFAULT 0 COMMENT '强制更新',
  `createtime` int(10) NULL DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) NULL DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT 0 COMMENT '权重',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '版本表' ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
