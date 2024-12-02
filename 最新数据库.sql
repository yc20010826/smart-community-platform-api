/*
 Navicat Premium Dump SQL

 Source Server         : 开源-渝快同城v1线上
 Source Server Type    : MySQL
 Source Server Version : 50744 (5.7.44-log)
 Source Host           : 47.108.173.92:3306
 Source Schema         : yktc_public

 Target Server Type    : MySQL
 Target Server Version : 50744 (5.7.44-log)
 File Encoding         : 65001

 Date: 02/12/2024 22:58:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for yc_admin
-- ----------------------------
DROP TABLE IF EXISTS `yc_admin`;
CREATE TABLE `yc_admin` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `username` varchar(20) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` varchar(30) DEFAULT '' COMMENT '密码盐',
  `avatar` varchar(255) DEFAULT '' COMMENT '头像',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮箱',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT NULL COMMENT '登录IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(59) DEFAULT '' COMMENT 'Session标识',
  `status` varchar(30) NOT NULL DEFAULT 'normal' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `username` (`username`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='管理员表';

-- ----------------------------
-- Records of yc_admin
-- ----------------------------
BEGIN;
INSERT INTO `yc_admin` (`id`, `username`, `nickname`, `password`, `salt`, `avatar`, `email`, `loginfailure`, `logintime`, `loginip`, `createtime`, `updatetime`, `token`, `status`) VALUES (1, 'admin', 'Admin', 'b47dff3a42620eb526a603ef8e4ce7d8', 'C956gW', '/uploads/20231024/134497158ffa523997f6093c2c0a78c1.png', '1991361342@qq.com', 0, 1731737016, '14.106.123.228', 1491635035, 1731737016, '0c4ee427-4879-4e88-841d-f480a4719eae', 'normal');
COMMIT;

-- ----------------------------
-- Table structure for yc_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `yc_admin_log`;
CREATE TABLE `yc_admin_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `username` varchar(30) DEFAULT '' COMMENT '管理员名字',
  `url` varchar(1500) DEFAULT '' COMMENT '操作页面',
  `title` varchar(100) DEFAULT '' COMMENT '日志标题',
  `content` longtext NOT NULL COMMENT '内容',
  `ip` varchar(50) DEFAULT '' COMMENT 'IP',
  `useragent` varchar(255) DEFAULT '' COMMENT 'User-Agent',
  `createtime` int(10) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `name` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='管理员日志表';

-- ----------------------------
-- Records of yc_admin_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yc_area
-- ----------------------------
DROP TABLE IF EXISTS `yc_area`;
CREATE TABLE `yc_area` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` int(10) DEFAULT NULL COMMENT '父id',
  `shortname` varchar(100) DEFAULT NULL COMMENT '简称',
  `name` varchar(100) DEFAULT NULL COMMENT '名称',
  `mergename` varchar(255) DEFAULT NULL COMMENT '全称',
  `level` tinyint(4) DEFAULT NULL COMMENT '层级:1=省,2=市,3=区/县',
  `pinyin` varchar(100) DEFAULT NULL COMMENT '拼音',
  `code` varchar(100) DEFAULT NULL COMMENT '长途区号',
  `zip` varchar(100) DEFAULT NULL COMMENT '邮编',
  `first` varchar(50) DEFAULT NULL COMMENT '首字母',
  `lng` varchar(100) DEFAULT NULL COMMENT '经度',
  `lat` varchar(100) DEFAULT NULL COMMENT '纬度',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='地区表';

-- ----------------------------
-- Records of yc_area
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yc_attachment
-- ----------------------------
DROP TABLE IF EXISTS `yc_attachment`;
CREATE TABLE `yc_attachment` (
  `id` int(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `category` varchar(50) DEFAULT '' COMMENT '类别',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `url` varchar(255) DEFAULT '' COMMENT '物理路径',
  `imagewidth` varchar(30) DEFAULT '' COMMENT '宽度',
  `imageheight` varchar(30) DEFAULT '' COMMENT '高度',
  `imagetype` varchar(30) DEFAULT '' COMMENT '图片类型',
  `imageframes` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '图片帧数',
  `filename` varchar(100) DEFAULT '' COMMENT '文件名称',
  `filesize` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `mimetype` varchar(100) DEFAULT '' COMMENT 'mime类型',
  `extparam` varchar(255) DEFAULT '' COMMENT '透传数据',
  `createtime` int(10) DEFAULT NULL COMMENT '创建日期',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `uploadtime` int(10) DEFAULT NULL COMMENT '上传时间',
  `storage` varchar(100) NOT NULL DEFAULT 'local' COMMENT '存储位置',
  `sha1` varchar(40) DEFAULT '' COMMENT '文件 sha1编码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Records of yc_attachment
-- ----------------------------
BEGIN;
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (1, '', 1, 0, '/assets/img/qrcode.png', '150', '150', 'png', 0, 'qrcode.png', 21859, 'image/png', '', 1491635035, 1491635035, 1491635035, 'local', '17163603d0263e4838b9387ff2cd4877e8b018f6');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (2, '', 1, 0, '/uploads/20220416/cc1faf4355ae2348d09c60529bb8eb6a.pem', '', '', 'pem', 0, 'apiclient_cert.pem', 1432, 'application/octet-stream', '', 1650096399, 1650096399, 1650096399, 'local', '2d40756c2b3c7f525ab2e04b2e40dd2587ed7d40');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (3, '', 1, 0, '/uploads/20220416/ad2f98ca9151d969693b7e28893375d8.pem', '', '', 'pem', 0, 'apiclient_key.pem', 1704, 'application/octet-stream', '', 1650096401, 1650096401, 1650096401, 'local', '083b6060c83dc2fe7e41063eb85e7d743c624548');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (4, '', 1, 0, '/uploads/20220416/606192725820e51f66d13bb061794df3.png', '732', '284', 'png', 0, '微信截图_20220416180303.png', 525674, 'image/png', '', 1650103403, 1650103403, 1650103403, 'local', 'dc03b052363fc5fe362e5185118e7c51608ef5c4');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (5, '', 1, 0, '/uploads/20220416/f12882b9041108c28dc48d4d231dfa84.jpg', '1080', '810', 'jpg', 0, '照片呀.jpg', 100664, 'image/jpeg', '', 1650104086, 1650104086, 1650104086, 'local', 'b8dd3bd19c3fee2b70ae95b508d86a2cc2db5327');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (6, '', 1, 0, '/uploads/20220416/205d4c1f655dae34b35ac5d4948eb85b.png', '60', '60', 'png', 0, 'scbl.png', 2402, 'image/png', '', 1650105568, 1650105568, 1650105568, 'local', '0426d32c0cee6679255c06adbbcf8e1be863dd46');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (7, '', 1, 0, '/uploads/20220416/2cbac8e1c1d3cef7e7b001214090eeea.png', '60', '60', 'png', 0, 'mscg.png', 3005, 'image/png', '', 1650105782, 1650105782, 1650105782, 'local', '9752e77a562c766904639b76ffe583e9a702738f');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (8, '', 1, 0, '/uploads/20220416/12b53f16e546837f9fd4b004b743889e.png', '60', '60', 'png', 0, 'tdyp.png', 3361, 'image/png', '', 1650105858, 1650105858, 1650105858, 'local', 'fde996fc7440ae80f9fa29384b1e8f87fabf4b08');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (9, '', 1, 0, '/uploads/20220416/05936dd68deec22d86c237f3383e1a32.png', '60', '60', 'png', 0, 'esxz.png', 3282, 'image/png', '', 1650105955, 1650105955, 1650105955, 'local', '8312a886de0e96e5434ec8814438cffa76c7bf9f');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (10, '', 1, 0, '/uploads/20220417/1631472f066e3b900924574b4dfe5175.png', '60', '60', 'png', 0, 'hjpt.png', 2546, 'image/png', '', 1650124973, 1650124973, 1650124973, 'local', 'f34f467d75e01cf61c907b615f038e16aca96973');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (11, '', 1, 0, '/uploads/20220417/8dfe4b687fc6ec53f51e89cef3008fde.png', '200', '200', 'png', 0, '求职.png', 7678, 'image/png', '', 1650167330, 1650167330, 1650167330, 'local', '7de9e1502add5eef8743353514867e51160b27fd');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (12, '', 1, 0, '/uploads/20220417/764e9025071108bf8b7e5a9ae2c88bed.png', '248', '90', 'png', 0, 'cxdm.png', 26345, 'image/png', '', 1650167952, 1650167952, 1650167952, 'local', '43aef600249a6eba9ba41fa23ee38ece0e40f3cd');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (13, '', 1, 0, '/uploads/20220417/756aadd19a7c2b906ee19b37d71cc596.jpg', '610', '610', 'jpg', 0, 'i4y3_w140h140.jpg', 74345, 'image/jpeg', '', 1650167952, 1650167952, 1650167952, 'local', '4044804587b500267de17db7ae6061e44d143d15');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (14, '', 1, 0, '/uploads/20220417/0f8912f314765bef899a7dc5fcae1b15.png', '248', '90', 'png', 0, 'jemj.png', 25670, 'image/png', '', 1650167952, 1650167952, 1650167952, 'local', 'ee036c211c7c5c3eed572a086adb43a6ec054461');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (15, '', 1, 0, '/uploads/20220418/1e3d0bee2f29fe75c4d746bf4d584c94.jpg', '1080', '720', 'jpg', 0, '3.jpg', 146945, 'image/jpeg', '', 1650212371, 1650212371, 1650212371, 'local', '146f6e09505c7301d685d5ad27bde995bf846f00');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (16, '', 1, 0, '/uploads/20220418/9f05f601f0cf9251247c99ee77bcd997.jpg', '3840', '2160', 'jpg', 0, '4.jpg', 639430, 'image/jpeg', '', 1650212377, 1650212377, 1650212377, 'local', '453a46324cd351bac27ef0e61086657389cc6a35');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (17, '', 1, 0, '/uploads/20220418/72b3b54a5a74d0c3a2bf34b75169a33c.jpg', '1920', '1200', 'jpg', 0, '1.jpg', 259546, 'image/jpeg', '', 1650212389, 1650212389, 1650212389, 'local', '35a358aac7e40f5671625db5d107d173907744d0');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (18, '', 1, 0, '/uploads/20220418/f35f48dc6d1289356f732471d6bd1d3c.jpg', '3840', '2160', 'jpg', 0, '2.jpg', 1137726, 'image/jpeg', '', 1650212389, 1650212389, 1650212389, 'local', '4d34016f9bb0ebd5f0469bb213b8ec09fd8856a1');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (19, '', 1, 0, '/uploads/20220418/56f6701e1acc1a8eca2bd4b0575bba26.jpg', '3840', '2160', 'jpg', 0, '5.jpg', 664315, 'image/jpeg', '', 1650212391, 1650212391, 1650212391, 'local', '66d22b6b863da9d8208b26f6e58e387e0f9579c1');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (20, '', 0, 12, '/uploads/20220419/05936dd68deec22d86c237f3383e1a32.png', '60', '60', 'png', 0, 'jNVolp8eMpao05936dd68deec22d86c237f3383e1a32.png', 3282, 'image/png', '', 1650297864, 1650297864, 1650297864, 'local', '8312a886de0e96e5434ec8814438cffa76c7bf9f');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (21, '', 0, 12, '/uploads/20220419/1631472f066e3b900924574b4dfe5175.png', '60', '60', 'png', 0, 'xDBR9fg0Qfk81631472f066e3b900924574b4dfe5175.png', 2546, 'image/png', '', 1650298149, 1650298149, 1650298149, 'local', 'f34f467d75e01cf61c907b615f038e16aca96973');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (22, '', 0, 12, '/uploads/20220419/f9d5c2bf37493c5bb8d17ce33bd43ea9.jpg', '344', '344', 'jpg', 0, 'PTzl2RiTRSRwf9d5c2bf37493c5bb8d17ce33bd43ea9.jpg', 80494, 'image/jpeg', '', 1650298222, 1650298222, 1650298222, 'local', '442c8dc7b442b1cd7b77196c84e267d6ee746e72');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (23, '', 0, 12, '/uploads/20220419/2cbac8e1c1d3cef7e7b001214090eeea.png', '60', '60', 'png', 0, 'cIdBsdQ9gmkP2cbac8e1c1d3cef7e7b001214090eeea.png', 3005, 'image/png', '', 1650298370, 1650298370, 1650298370, 'local', '9752e77a562c766904639b76ffe583e9a702738f');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (24, '', 0, 12, '/uploads/20220419/205d4c1f655dae34b35ac5d4948eb85b.png', '60', '60', 'png', 0, 'kAppPmhipotH205d4c1f655dae34b35ac5d4948eb85b.png', 2402, 'image/png', '', 1650298372, 1650298372, 1650298372, 'local', '0426d32c0cee6679255c06adbbcf8e1be863dd46');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (25, '', 0, 12, '/uploads/20220419/8dfe4b687fc6ec53f51e89cef3008fde.png', '200', '200', 'png', 0, 'nMCfU7r01die8dfe4b687fc6ec53f51e89cef3008fde.png', 7678, 'image/png', '', 1650298373, 1650298373, 1650298373, 'local', '7de9e1502add5eef8743353514867e51160b27fd');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (26, '', 0, 13, '/uploads/20220419/33079116a5c99d84438b9f0cd453052c.jpg', '1276', '1702', 'jpg', 0, 'tmp_2436b7df48f00e2a570504d1c70568f9.jpg', 522742, 'image/jpeg', '', 1650301038, 1650301038, 1650301038, 'local', 'b7536e7bcdf12b8a5f87236a6925b43c5966829c');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (27, '', 0, 4, '/uploads/20220419/d03fce4c04a0331b675105cd4ccae2c2.jpg', '1079', '1031', 'jpg', 0, 'tmp_958733a52f03c3274dea115ff37d49c9c4fc73a7534e0b1e.jpg', 173714, 'image/jpeg', '', 1650301050, 1650301050, 1650301050, 'local', '36157eb1716d689587b33bb3926a3de3011b4bdc');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (28, '', 0, 4, '/uploads/20220419/38c56d903790a3263121dd7784c5a2a1.jpg', '1080', '1044', 'jpg', 0, 'tmp_aa3505213c3dddd09e6757568be26b8cb102f7496acce8eb.jpg', 175481, 'image/jpeg', '', 1650301052, 1650301052, 1650301052, 'local', '2cd5a8fa920480c7c3b0363e9796ed368b883471');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (29, '', 0, 4, '/uploads/20220419/a111e8979b595a40049878994594a907.jpg', '1080', '1057', 'jpg', 0, 'tmp_2f01f80e194129ecfff4fdc102ecaff6114df19f75f3f587.jpg', 584647, 'image/jpeg', '', 1650301053, 1650301053, 1650301053, 'local', '556a2f2326ccac4ea9b045d46a0ead27159e7884');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (30, '', 0, 13, '/uploads/20220419/59fe9c3a766c19394e4985051d422a4b.jpg', '828', '1792', 'jpg', 0, 'tmp_c23c533d653248fe227792474c1c1e70.jpg', 220803, 'image/jpeg', '', 1650301054, 1650301054, 1650301054, 'local', '11d04edc9c5f6314b16223b7ec35ea1417b2846e');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (31, '', 0, 4, '/uploads/20220419/9c2f9d0a7826dfe5e5d41b40e3ab8ef8.jpg', '1080', '1035', 'jpg', 0, 'tmp_09485a5c4905d7b321ce5f206757d706691530a6615ce870.jpg', 625755, 'image/jpeg', '', 1650301055, 1650301055, 1650301055, 'local', '2ed46192d1d615014d007fe47811de065a05f9f7');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (32, '', 0, 13, '/uploads/20220419/553b89f1b4c21479d4cd291aab437f35.jpg', '828', '1792', 'jpg', 0, 'tmp_e28415aa812c68b44a091a02e812ccb6.jpg', 176484, 'image/jpeg', '', 1650301055, 1650301055, 1650301055, 'local', 'ce987fb9df38d491e2bbe091e653f9ad8000bdb2');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (33, '', 0, 4, '/uploads/20220419/266c5fa81bf06512867753e2346d83ac.jpg', '1080', '1061', 'jpg', 0, 'tmp_a7860764e957dfa9a9993fb5bfbb349859feaa66526ec71f.jpg', 571993, 'image/jpeg', '', 1650301056, 1650301056, 1650301056, 'local', '59e82dd518fe203767accc9829ebed8789f1b6cf');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (34, '', 0, 13, '/uploads/20220419/b5bb6539b3dcbee3328c374b02c566b6.jpg', '1617', '1080', 'jpg', 0, 'tmp_d3c15d84ec5c45b0877cd0bd4a8a0f67.jpg', 214226, 'image/jpeg', '', 1650301056, 1650301056, 1650301056, 'local', 'ed549f5d9c620c4aa5e889ebba6de867f044dc5c');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (35, '', 0, 4, '/uploads/20220419/97c2f3ba457deb25861dcad04fe4e89b.jpg', '1080', '1054', 'jpg', 0, 'tmp_5a6d4bb4cf804c6d95d1a4df4b35d2e33b8cd8e390f6238d.jpg', 553729, 'image/jpeg', '', 1650301058, 1650301058, 1650301058, 'local', 'bcf1bb98b66397e0366e8153f381237cfc3614a0');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (36, '', 0, 13, '/uploads/20220419/2f3e430b41695493a4a4d47119eb6603.jpg', '639', '640', 'jpg', 0, 'LgLcpRY79S2d2f3e430b41695493a4a4d47119eb6603.jpg', 44943, 'image/jpeg', '', 1650339173, 1650339173, 1650339173, 'local', 'bc492483f367730f78bb5340aa969d24bb6ff391');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (37, '', 0, 13, '/uploads/20220419/5b604dab4e43ca976ec88a126b7640c0.png', '248', '216', 'png', 0, 'U27urLHY3RSV5b604dab4e43ca976ec88a126b7640c0.png', 26248, 'image/png', '', 1650339174, 1650339174, 1650339174, 'local', 'acdcdabc3aca148de054eaba752bd0b278baed23');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (38, '', 0, 13, '/uploads/20220419/bb4d034d3c658563aeb682bdfeb9d557.png', '600', '600', 'png', 0, 'BW20TpfeC6q5bb4d034d3c658563aeb682bdfeb9d557.png', 82849, 'image/png', '', 1650339176, 1650339176, 1650339176, 'local', '1f89d9d86de894a5357204a92ec17f2d54500d44');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (39, '', 0, 13, '/uploads/20220419/04914e311f809582874dcbac4030f81d.png', '136', '122', 'png', 0, '2tX26bRfwvhO04914e311f809582874dcbac4030f81d.png', 8008, 'image/png', '', 1650346124, 1650346124, 1650346124, 'local', 'd1150aadecd96bc5cd968af51b80ee8b9b01bcaa');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (40, '', 0, 13, '/uploads/20220419/5354274533e49d5811b49b62a346aee6.png', '452', '450', 'png', 0, 'QsKRya0ZiVlJ5354274533e49d5811b49b62a346aee6.png', 413240, 'image/png', '', 1650346738, 1650346738, 1650346738, 'local', '1d63711252605e97c78190f6c7087eddf5ee2678');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (41, '', 0, 13, '/uploads/20220419/9ab7a1f5de2789de5ae5ad78e97e3af9.jpg', '500', '500', 'jpg', 0, 'iGOL47loyMW59ab7a1f5de2789de5ae5ad78e97e3af9.jpg', 21913, 'image/jpeg', '', 1650347078, 1650347078, 1650347078, 'local', '0d6ca540e64d485391cb3a1b3dbfbd5ff18c80e1');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (42, '', 0, 13, '/uploads/20220419/cb3f8295da9b714bc218b443787c805d.jpg', '1276', '1702', 'jpg', 0, 'tmp_7f4fb79452412c4c47e5167defaa5bd1.jpg', 230179, 'image/jpeg', '', 1650347372, 1650347372, 1650347372, 'local', '71773c0863a318d705e62abc817d27d584f6d0f9');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (43, '', 0, 14, '/uploads/20220419/3abe14d6cbb33e2557fbaca552766b7b.jpg', '640', '1136', 'jpg', 0, 'tmp_hkd5iL97KFsVWi5Qv8V3r3qBFf1Evq2a.jpg', 132050, 'text/plain', '', 1650350852, 1650350852, 1650350852, 'local', '42e37faf378602b7211440fe4e610e9d41d34ad7');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (44, '', 0, 13, '/uploads/20220421/2e2a347f6cae8814a5e8230a961c94ad.jpg', '1702', '1276', 'jpg', 0, 'tmp_9fed2d3a7eaf3d607418f00dfbd3b956.jpg', 570921, 'image/jpeg', '', 1650535123, 1650535123, 1650535123, 'local', 'df5494b269f588ccd48b8c8eba6fb22fb49949c9');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (45, '', 0, 17, '/uploads/20220422/f9d5c2bf37493c5bb8d17ce33bd43ea9.jpg', '344', '344', 'jpg', 0, 'yFqy1X3TIH95f9d5c2bf37493c5bb8d17ce33bd43ea9.jpg', 80494, 'image/jpeg', '', 1650634815, 1650634815, 1650634815, 'local', '442c8dc7b442b1cd7b77196c84e267d6ee746e72');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (46, '', 0, 17, '/uploads/20220422/bd425bb1bae6df0cee88322fc006e240.jpg', '500', '500', 'jpg', 0, 'Y7DGZajMqNIEbd425bb1bae6df0cee88322fc006e240.jpg', 14581, 'image/jpeg', '', 1650634832, 1650634832, 1650634832, 'local', '560ac442995d2a03a50f69ee4395a163abcb94c8');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (47, '', 0, 17, '/uploads/20220422/dafebc72f1e3c3366b8bdd0eaf57de22.jpg', '1000', '1037', 'jpg', 0, 'tmp_e20e2cd7d50a12e94949c934459d445e.jpg', 164147, 'image/jpeg', '', 1650636341, 1650636341, 1650636341, 'local', 'e0952d30bb7f50ee038baa31897905d919edac11');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (48, '', 0, 17, '/uploads/20220422/a33c831d489394c2e99c29c87b3f154e.jpg', '977', '1024', 'jpg', 0, 'tmp_f16bf141f131bddab04ec27a49896d53.jpg', 199353, 'image/jpeg', '', 1650636343, 1650636343, 1650636343, 'local', '0f4dcf6584e927d2fe6f3e7b75c19825b82cd0d8');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (49, '', 0, 17, '/uploads/20220422/912e75312eb2afc8ba22d930e784383c.jpg', '1080', '1434', 'jpg', 0, 'tmp_2ac1b4245dfa2a0be2fd126bec0ddb5a.jpg', 149402, 'image/jpeg', '', 1650636403, 1650636403, 1650636403, 'local', '7a06d779be88d954ad5d5c2853c672c88291e3e4');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (50, '', 0, 17, '/uploads/20220422/c2af1b05bdca3c941e4650c07bfadf87.jpg', '1080', '1400', 'jpg', 0, 'tmp_7b3ed983a863064e0db2382477b85373.jpg', 236855, 'image/jpeg', '', 1650636405, 1650636405, 1650636405, 'local', 'ed5f7a1a6cd4e9048fce83160d23a93353212118');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (51, '', 0, 17, '/uploads/20220422/9fb3a0ad49a1e781627675b540683180.jpg', '1204', '1080', 'jpg', 0, 'tmp_c73a20e7e08d90ec140ad23cc67a4759.jpg', 250738, 'image/jpeg', '', 1650636406, 1650636406, 1650636406, 'local', '02040d090920956d864aeadaeeee9712d5d897ca');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (52, '', 0, 17, '/uploads/20220422/f82814f6ae3d1da7c1e4b91092171e43.jpg', '1080', '1254', 'jpg', 0, 'tmp_9adcfc90b2944d5556fdba35c3ea5402.jpg', 264298, 'image/jpeg', '', 1650636407, 1650636407, 1650636407, 'local', '280449d274402a279cc19be932b2a14ab23d43a9');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (53, '', 0, 17, '/uploads/20220422/b66850a79a4479ffa84b8d77919b4f09.jpg', '1158', '1544', 'jpg', 0, 'tmp_5dfabd5073ec80dafca45c9031c22c80.jpg', 225083, 'image/jpeg', '', 1650636409, 1650636409, 1650636409, 'local', '717d2c9da4778bd07f2c964172730506b675ebe3');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (54, '', 0, 17, '/uploads/20220422/3197977c173a8d92073f3cb00463a63d.jpg', '1226', '1080', 'jpg', 0, 'tmp_d1da1c55c58b83dc380d925b66f786a1.jpg', 223609, 'image/jpeg', '', 1650636410, 1650636410, 1650636410, 'local', '2986900b96ea1573002cd1d7d56735e976bec02b');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (55, '', 0, 17, '/uploads/20220422/63126c23886fd0c3cad013c3274c36ee.jpg', '1222', '1080', 'jpg', 0, 'tmp_4865aedb7a417b2bef5dfdc655f5730b.jpg', 211175, 'image/jpeg', '', 1650636412, 1650636412, 1650636412, 'local', '0886b766e21e904278c77c39fff2f308ba9e30c6');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (56, '', 0, 17, '/uploads/20220422/6fbdf2d5b98ba0e8096803e8cb62f736.jpg', '1090', '1080', 'jpg', 0, 'tmp_08a17b1fdc7b85c6cbd41fa90361bf07.jpg', 112374, 'image/jpeg', '', 1650636413, 1650636413, 1650636413, 'local', 'abc077fcd727f56819c610baedfe02e81ec08141');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (57, '', 0, 17, '/uploads/20220422/e8afdbf104b0f0226c3119b6a52d5eb2.jpg', '1024', '40', 'jpg', 0, 'tmp_778e92992fc1c6b2c6777ea5ead1a73d.jpg', 14604, 'image/jpeg', '', 1650636772, 1650636772, 1650636772, 'local', 'fe05e918bbcc4d1e1fb804dd01ad2b1ca4f687b0');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (58, '', 0, 17, '/uploads/20220422/212838a00cf74ec92e7f78f92dd3a315.jpg', '1082', '58', 'jpg', 0, 'tmp_b59e1e0074c70cd7442a083a7f897656.jpg', 21248, 'image/jpeg', '', 1650636773, 1650636773, 1650636773, 'local', 'ed271b3a0e3791bd42d792fd022cf8afc0e2423f');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (59, '', 0, 17, '/uploads/20220422/b0dd086e51ce2374370b84409d4b8262.jpg', '1152', '313', 'jpg', 0, 'tmp_7030d2fc3efe6724a16b434609122357.jpg', 22755, 'image/jpeg', '', 1650636774, 1650636774, 1650636774, 'local', '82fd833da9d0b203995a1db93cb7d2a0bb13192b');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (60, '', 0, 17, '/uploads/20220422/2cfbdc574cf694ce97cf4ddc4e92caaa.jpg', '866', '49', 'jpg', 0, 'tmp_4bd99d877c598060cc3d86c9ad5004a8.jpg', 17882, 'image/jpeg', '', 1650636776, 1650636776, 1650636776, 'local', '42495990e1f8f2dc334bae5f3db0112a288d95f1');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (61, '', 0, 17, '/uploads/20220422/4963fb82fe319b9e510a602b78f0b070.jpg', '888', '34', 'jpg', 0, 'tmp_b576f1a83229c7256ef1faf0fab456b4.jpg', 16139, 'image/jpeg', '', 1650636777, 1650636777, 1650636777, 'local', 'fd52a1a5f4f68b812f7ccb79ecfa84e56d358720');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (62, '', 0, 18, '/uploads/20220426/3abe14d6cbb33e2557fbaca552766b7b.jpg', '640', '1136', 'jpg', 0, 'tmp_d6yR4wTXv12RMBa9x5LJOEigk0zOScq6.jpg', 132050, 'text/plain', '', 1650959304, 1650959304, 1650959304, 'local', '42e37faf378602b7211440fe4e610e9d41d34ad7');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (63, '', 0, 17, '/uploads/20220426/8dfe4b687fc6ec53f51e89cef3008fde.png', '200', '200', 'png', 0, 'GshSrnlBoPXa8dfe4b687fc6ec53f51e89cef3008fde.png', 7678, 'image/png', '', 1650984615, 1650984615, 1650984615, 'local', '7de9e1502add5eef8743353514867e51160b27fd');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (64, '', 0, 17, '/uploads/20220426/6bc371cf75a2069f512dffd15db3ee0c.jpg', '1080', '1620', 'jpg', 0, 'tmp_46d92811b397410e3600494bb1eaf0b3.jpg', 693501, 'image/jpeg', '', 1650985037, 1650985037, 1650985037, 'local', 'e0d9f295248f3629a56d068b8d1de78f2533b4e7');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (65, '', 0, 17, '/uploads/20220426/e49289e82fdb4f5009c858ca331eb78c.jpg', '1706', '1279', 'jpg', 0, 'tmp_ed283cd29d5010484b75319ab64f162a.jpg', 537928, 'image/jpeg', '', 1650986332, 1650986332, 1650986332, 'local', 'e1e830a4308f58d0d99fc108db9ed6f5425379f1');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (66, '', 0, 17, '/uploads/20220426/f3a639369822b9e86ee7294a9f46fb4f.jpg', '1279', '1706', 'jpg', 0, 'tmp_982494cc43d1b97f19497f312ec50a38.jpg', 600027, 'image/jpeg', '', 1650986346, 1650986346, 1650986346, 'local', '7c628d9267a7c0754b1d051c272fd9ac8f6c3483');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (67, '', 0, 17, '/uploads/20220427/a4e5eca06aa7f2b7188906e0cbe603b8.jpg', '828', '1017', 'jpg', 0, 'tmp_cf301f2326d83da397ecab2d63d13646.jpg', 371752, 'image/jpeg', '', 1651035592, 1651035592, 1651035592, 'local', '1990e2f3f8d2bcad88d99501b65a118be35f9844');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (68, '', 0, 17, '/uploads/20220427/01c79dd31cd7f6b5dab6385e94f9870a.jpg', '828', '939', 'jpg', 0, 'tmp_df9c742a79e283c09b2508434bb6e473.jpg', 351464, 'image/jpeg', '', 1651035615, 1651035615, 1651035615, 'local', '84ff73abc47c3cdb6e9177ff536e9eff0638f653');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (69, '', 0, 17, '/uploads/20220427/250616a64a4d47bb0d383828d04ef1e2.jpg', '828', '1009', 'jpg', 0, 'tmp_ccedcb71a758a9794290d9bdc85f3ba1.jpg', 215478, 'image/jpeg', '', 1651035869, 1651035869, 1651035869, 'local', '1c58995b997a2caccde5cb377c115767d0443f20');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (70, '', 0, 17, '/uploads/20220427/9dcce3e80ce1d7d38c7da0b251502e22.jpg', '828', '974', 'jpg', 0, 'tmp_2d89e190ec1253bd10980a0a71888392.jpg', 222396, 'image/jpeg', '', 1651035870, 1651035870, 1651035870, 'local', 'e460f029da3fd9606419b91e99f65c33d6156e4a');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (71, '', 0, 17, '/uploads/20220427/473bdf89a8c5b2f499dcbb7710fee830.jpg', '828', '1006', 'jpg', 0, 'tmp_7c716796209c64990f4b8211acb90332.jpg', 360640, 'image/jpeg', '', 1651035872, 1651035872, 1651035872, 'local', '47822413ba7c3350a88f08f68acd3dab524b8bcf');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (72, '', 0, 17, '/uploads/20220427/07ed80442b23a044665583e76a057b63.jpg', '828', '983', 'jpg', 0, 'tmp_92de5bd8eb3dd30a917b365de8c56860.jpg', 176889, 'image/jpeg', '', 1651035873, 1651035873, 1651035873, 'local', 'a1434d07f7b8a8ad88ebc9c0cbf8ae8088980774');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (73, '', 0, 17, '/uploads/20220427/6e76cf10c4c73a5becff896df6b0c0ab.jpg', '828', '980', 'jpg', 0, 'tmp_79aae2d03b189f556ab8b3dc31357e10.jpg', 153049, 'image/jpeg', '', 1651035874, 1651035874, 1651035874, 'local', 'c056c815fd585188d521277d9eee4f681f5822e6');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (81, '', 1, 0, '/uploads/20220428/f9d5c2bf37493c5bb8d17ce33bd43ea9.jpg', '344', '344', 'jpg', 0, 'gh_d65d3dc92b8d_344.jpg', 80494, 'image/jpeg', '', 1651144398, 1651144398, 1651144398, 'local', '442c8dc7b442b1cd7b77196c84e267d6ee746e72');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (82, '', 1, 0, '/uploads/20220428/0961537bbee582b29de34886acf1d678.jpg', '314', '314', 'jpg', 0, '微信图片_20220417224409.jpg', 41877, 'image/jpeg', '', 1651144462, 1651144462, 1651144462, 'local', '98cebac8e923ad5804cea95c6d2a5ebb43991c70');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (83, '', 1, 0, '/uploads/20220428/8dfe4b687fc6ec53f51e89cef3008fde.png', '200', '200', 'png', 0, '求职.png', 7678, 'image/png', '', 1651150169, 1651150169, 1651150169, 'local', '7de9e1502add5eef8743353514867e51160b27fd');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (84, '', 1, 0, '/uploads/20220430/3c451e08721f898fc2d0a43d3b8953a4.png', '200', '200', 'png', 0, '最新公告.png', 9035, 'image/png', '', 1651327774, 1651327774, 1651327774, 'local', '07320187cb1449deb76e2e8e8ffcdf6a73e62c0c');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (85, '', 1, 0, '/uploads/20220430/5465b7b8abd0dcba2bc96d6a4080dd69.png', '200', '200', 'png', 0, '二手设备.png', 5034, 'image/png', '', 1651327927, 1651327927, 1651327927, 'local', '7638dd9cf68828e270c67f530e0765b76232924c');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (86, '', 1, 0, '/uploads/20220430/5ab6c5f2a02fc71072c405e20dab8e36.png', '309', '200', 'png', 0, '二手交易.png', 19928, 'image/png', '', 1651328046, 1651328046, 1651328046, 'local', '880d06246c084d17232c738e5a4900294749b6f0');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (87, '', 1, 0, '/uploads/20220430/80a3253ea4951feb09370468950b9c9c.png', '208', '200', 'png', 0, '二手紫黄.png', 8540, 'image/png', '', 1651328082, 1651328082, 1651328082, 'local', 'd945682ee9d9a37665083b548a8a8380f3ffb6df');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (88, '', 1, 0, '/uploads/20220430/b8f8e8ad4222b8f589891f4321b9a527.png', '200', '200', 'png', 0, '公告.png', 7589, 'image/png', '', 1651328139, 1651328139, 1651328139, 'local', 'bdf289ebab0b9e3d5bd8c7f77b0c78465096c971');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (89, '', 1, 0, '/uploads/20220430/a87caa2be07c129c689c3482eb1fe112.png', '200', '200', 'png', 0, '优惠券.png', 10506, 'image/png', '', 1651328182, 1651328182, 1651328182, 'local', 'd47ace5fd5c1577ccf8550e39c27740bdc21ea6d');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (90, '', 1, 0, '/uploads/20220430/82adb5e835d9a6e1f680266885c0df07.png', '200', '200', 'png', 0, '分享.png', 10409, 'image/png', '', 1651328324, 1651328324, 1651328324, 'local', '1adbf950560c7206d5e5feef4997a9bc1d5c5ef5');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (91, '', 1, 0, '/uploads/20220430/e7189daa12913bfa02a5829213d54e12.png', '200', '200', 'png', 0, '其他.png', 10899, 'image/png', '', 1651328389, 1651328389, 1651328389, 'local', '8cf4f3371fd2553e0485bdef1dfa109f56eaf00b');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (92, '', 1, 0, '/uploads/20220430/ff3d673edc8604e58eb82486535c67c5.png', '200', '200', 'png', 0, '商家.png', 6844, 'image/png', '', 1651328438, 1651328438, 1651328438, 'local', 'bdca1ac4cdcd5f756b93506832b6a72307bbdf4d');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (93, '', 1, 0, '/uploads/20220430/0961537bbee582b29de34886acf1d678.jpg', '314', '314', 'jpg', 0, '微信图片_20220417224409.jpg', 41877, 'image/jpeg', '', 1651329716, 1651329716, 1651329716, 'local', '98cebac8e923ad5804cea95c6d2a5ebb43991c70');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (94, '', 1, 0, '/uploads/20220430/ae92dde507ad84d032a4c345205b1223.png', '224', '200', 'png', 0, 'v商家.png', 7996, 'image/png', '', 1651330613, 1651330613, 1651330613, 'local', '4c2327d7c7d199392a7e51c2d77063fcf703e893');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (95, '', 1, 0, '/uploads/20220430/2230dddb9248e0395f34f692fbf0a56f.png', '200', '200', 'png', 0, '优惠券 (1).png', 7808, 'image/png', '', 1651330678, 1651330678, 1651330678, 'local', '55162ad62ac74a12e1233bb5253137396d36395d');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (96, '', 1, 0, '/uploads/20220430/7d8615f00e7750035c47c7e9210159e6.png', '200', '200', 'png', 0, '生活.png', 6545, 'image/png', '', 1651330817, 1651330817, 1651330817, 'local', '2dbb9e9d80d325b1e25e0984b249ad72c3749ab5');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (97, '', 1, 0, '/uploads/20220430/259744fcb9745e47a28d0dd7eb3ce4de.png', '200', '200', 'png', 0, '活动中心.png', 6085, 'image/png', '', 1651330970, 1651330970, 1651330970, 'local', '0d16cdce0ac380188e8dda42a19a63d7a560d25d');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (98, '', 1, 0, '/uploads/20220501/5ad6dabe964e3f6ca60e2c79d2411151.png', '200', '200', 'png', 0, '租房.png', 8727, 'image/png', '', 1651412540, 1651412540, 1651412540, 'local', '0d1e911a0c88528ddab642f9e8757c7de2aee8ca');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (99, '', 1, 0, '/uploads/20220507/21c21cb7c72d34cd3a931845c57ca1f8.png', '428', '436', 'png', 0, 'QQ截图20220507182046.png', 429715, 'image/png', '', 1651918857, 1651918857, 1651918857, 'local', '266a13e9db19bf68404a39b47c0e2e93c8e298da');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (100, '', 1, 0, '/uploads/20220517/5dad6edbf23a429d5290cceba74355b7.png', '902', '327', 'png', 0, '20220517102010.png', 221194, 'image/png', '', 1652754059, 1652754059, 1652754059, 'local', '58029dd97797a67840a62c3604aec18de7a223fe');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (101, '', 1, 0, '/uploads/20220517/64dfc337d3cdc6efe3641152996b0d32.png', '952', '404', 'png', 0, 'QQ截图20220517102355.png', 477032, 'image/png', '', 1652754276, 1652754276, 1652754276, 'local', 'd020b97496ee5f7eafe5e948f2e1a18a05713c50');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (102, '', 1, 0, '/uploads/20220517/e3ac5c9d4a22008fbf1c2601943b516b.png', '952', '403', 'png', 0, 'QQ截图20220517102659.png', 165791, 'image/png', '', 1652754456, 1652754456, 1652754456, 'local', 'f141399c77a3d88721e4e7ef820d2d94b81e2963');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (103, '', 1, 0, '/uploads/20220517/390b57f2dd20ac67a16cf13f8710fdf1.png', '360', '360', 'png', 0, 'tx.png', 185224, 'image/png', '', 1652772492, 1652772492, 1652772492, 'local', '4e1ec2f89152e7c2d2fcc40bac88db9ae8fb50f9');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (104, '', 1, 0, '/uploads/20220519/2eee23f53a20cc6a6a89430e2c9ee8b7.png', '200', '200', 'png', 0, 'sc.png', 8445, 'image/png', '', 1652951187, 1652951187, 1652951187, 'local', '01529efdcbb4dfcd73ec55498c2d52ff04b61a2a');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (105, '', 1, 0, '/uploads/20231024/134497158ffa523997f6093c2c0a78c1.png', '108', '108', 'png', 0, '108.png', 8857, 'image/png', '', 1698156401, 1698156401, 1698156401, 'local', '1cb19b09f37f83103fb9f650142a1fd87a49b081');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (106, '', 1, 0, '/uploads/20241114/2f78b0b3444011e75c3cb5e86aa37a6a.jpeg', '355', '355', 'jpeg', 0, '0.jpeg', 14938, 'image/jpeg', '', 1731555348, 1731555348, 1731555348, 'local', '407518a56e8675ea0f63ae601b0e5c4b1cc4c3f8');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (107, '', 1, 0, '/uploads/20241122/77ef0ca0c722b75cd04aaeb68b1e2db1.png', '750', '424', 'png', 0, '5fae4ca315b43.png', 381026, 'image/png', '', 1732268509, 1732268509, 1732268509, 'local', 'bb0c52b29b809fe7de897714b7a6f8883d8139ed');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (108, '', 1, 0, '/uploads/20241123/f7ed11cd11a82d09e5b285de5525eccc.png', '64', '64', 'png', 0, '垂钓.png', 1468, 'image/png', '', 1732291588, 1732291588, 1732291588, 'local', '9f6b04f7d04caf06f4410d9afb0e47389a6c6708');
INSERT INTO `yc_attachment` (`id`, `category`, `admin_id`, `user_id`, `url`, `imagewidth`, `imageheight`, `imagetype`, `imageframes`, `filename`, `filesize`, `mimetype`, `extparam`, `createtime`, `updatetime`, `uploadtime`, `storage`, `sha1`) VALUES (109, '', 1, 0, '/uploads/20241123/456b0cccacbbc13f782a5660e8f2685b.png', '586', '878', 'png', 0, 'wechat_2024-11-23_214810_967.png', 908887, 'image/png', '', 1732369696, 1732369696, 1732369696, 'local', '53cb68bef76c05165327094264dfde402f8d5059');
COMMIT;

-- ----------------------------
-- Table structure for yc_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `yc_auth_group`;
CREATE TABLE `yc_auth_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父组别',
  `name` varchar(100) DEFAULT '' COMMENT '组名',
  `rules` text NOT NULL COMMENT '规则ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='分组表';

-- ----------------------------
-- Records of yc_auth_group
-- ----------------------------
BEGIN;
INSERT INTO `yc_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (1, 0, 'Admin group', '*', 1491635035, 1491635035, 'normal');
INSERT INTO `yc_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (2, 1, 'Second group', '13,14,16,15,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,1,9,10,11,7,6,8,2,4,5', 1491635035, 1491635035, 'normal');
INSERT INTO `yc_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (3, 2, 'Third group', '1,4,9,10,11,13,14,15,16,17,40,41,42,43,44,45,46,47,48,49,50,55,56,57,58,59,60,61,62,63,64,65,5', 1491635035, 1491635035, 'normal');
INSERT INTO `yc_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (4, 1, 'Second group 2', '1,4,13,14,15,16,17,55,56,57,58,59,60,61,62,63,64,65', 1491635035, 1491635035, 'normal');
INSERT INTO `yc_auth_group` (`id`, `pid`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (5, 2, 'Third group 2', '1,2,6,7,8,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34', 1491635035, 1491635035, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for yc_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `yc_auth_group_access`;
CREATE TABLE `yc_auth_group_access` (
  `uid` int(10) unsigned NOT NULL COMMENT '会员ID',
  `group_id` int(10) unsigned NOT NULL COMMENT '级别ID',
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `group_id` (`group_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='权限分组表';

-- ----------------------------
-- Records of yc_auth_group_access
-- ----------------------------
BEGIN;
INSERT INTO `yc_auth_group_access` (`uid`, `group_id`) VALUES (1, 1);
COMMIT;

-- ----------------------------
-- Table structure for yc_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `yc_auth_rule`;
CREATE TABLE `yc_auth_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('menu','file') NOT NULL DEFAULT 'file' COMMENT 'menu为菜单,file为权限节点',
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `name` varchar(100) DEFAULT '' COMMENT '规则名称',
  `title` varchar(50) DEFAULT '' COMMENT '规则名称',
  `icon` varchar(50) DEFAULT '' COMMENT '图标',
  `url` varchar(255) DEFAULT '' COMMENT '规则URL',
  `condition` varchar(255) DEFAULT '' COMMENT '条件',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为菜单',
  `menutype` enum('addtabs','blank','dialog','ajax') DEFAULT NULL COMMENT '菜单类型',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展属性',
  `py` varchar(30) DEFAULT '' COMMENT '拼音首字母',
  `pinyin` varchar(100) DEFAULT '' COMMENT '拼音',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `weigh` (`weigh`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='节点表';

-- ----------------------------
-- Records of yc_auth_rule
-- ----------------------------
BEGIN;
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (1, 'file', 0, 'dashboard', 'Dashboard', 'fa fa-dashboard', '', '', 'Dashboard tips', 1, NULL, '', 'kzt', 'kongzhitai', 1491635035, 1491635035, 143, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (2, 'file', 0, 'general', 'General', 'fa fa-cogs', '', '', '', 1, NULL, '', 'cggl', 'changguiguanli', 1491635035, 1491635035, 137, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (3, 'file', 0, 'category', 'Category', 'fa fa-leaf', '', '', 'Category tips', 1, NULL, '', 'flgl', 'fenleiguanli', 1491635035, 1650167004, 119, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (4, 'file', 0, 'addon', 'Addon', 'fa fa-rocket', '', '', 'Addon tips', 1, NULL, '', 'cjgl', 'chajianguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (5, 'file', 0, 'auth', 'Auth', 'fa fa-group', '', '', '', 1, NULL, '', 'qxgl', 'quanxianguanli', 1491635035, 1491635035, 99, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (6, 'file', 2, 'general/config', 'Config', 'fa fa-cog', '', '', 'Config tips', 1, NULL, '', 'xtpz', 'xitongpeizhi', 1491635035, 1491635035, 60, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (7, 'file', 2, 'general/attachment', 'Attachment', 'fa fa-file-image-o', '', '', 'Attachment tips', 1, NULL, '', 'fjgl', 'fujianguanli', 1491635035, 1491635035, 53, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (8, 'file', 2, 'general/profile', 'Profile', 'fa fa-user', '', '', '', 1, NULL, '', 'grzl', 'gerenziliao', 1491635035, 1491635035, 34, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (9, 'file', 5, 'auth/admin', 'Admin', 'fa fa-user', '', '', 'Admin tips', 1, NULL, '', 'glygl', 'guanliyuanguanli', 1491635035, 1491635035, 118, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (10, 'file', 5, 'auth/adminlog', 'Admin log', 'fa fa-list-alt', '', '', 'Admin log tips', 1, NULL, '', 'glyrz', 'guanliyuanrizhi', 1491635035, 1491635035, 113, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (11, 'file', 5, 'auth/group', 'Group', 'fa fa-group', '', '', 'Group tips', 1, NULL, '', 'jsz', 'juesezu', 1491635035, 1491635035, 109, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (12, 'file', 5, 'auth/rule', 'Rule', 'fa fa-bars', '', '', 'Rule tips', 1, NULL, '', 'cdgz', 'caidanguize', 1491635035, 1491635035, 104, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (13, 'file', 1, 'dashboard/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 136, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (14, 'file', 1, 'dashboard/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 135, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (15, 'file', 1, 'dashboard/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 133, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (16, 'file', 1, 'dashboard/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 134, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (17, 'file', 1, 'dashboard/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 132, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (18, 'file', 6, 'general/config/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 52, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (19, 'file', 6, 'general/config/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 51, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (20, 'file', 6, 'general/config/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 50, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (21, 'file', 6, 'general/config/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 49, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (22, 'file', 6, 'general/config/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 48, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (23, 'file', 7, 'general/attachment/index', 'View', 'fa fa-circle-o', '', '', 'Attachment tips', 0, NULL, '', '', '', 1491635035, 1491635035, 59, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (24, 'file', 7, 'general/attachment/select', 'Select attachment', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 58, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (25, 'file', 7, 'general/attachment/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 57, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (26, 'file', 7, 'general/attachment/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 56, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (27, 'file', 7, 'general/attachment/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 55, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (28, 'file', 7, 'general/attachment/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 54, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (29, 'file', 8, 'general/profile/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 33, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (30, 'file', 8, 'general/profile/update', 'Update profile', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 32, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (31, 'file', 8, 'general/profile/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 31, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (32, 'file', 8, 'general/profile/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 30, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (33, 'file', 8, 'general/profile/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 29, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (34, 'file', 8, 'general/profile/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 28, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (35, 'file', 3, 'category/index', 'View', 'fa fa-circle-o', '', '', 'Category tips', 0, NULL, '', '', '', 1491635035, 1491635035, 142, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (36, 'file', 3, 'category/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 141, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (37, 'file', 3, 'category/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 140, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (38, 'file', 3, 'category/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 139, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (39, 'file', 3, 'category/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 138, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (40, 'file', 9, 'auth/admin/index', 'View', 'fa fa-circle-o', '', '', 'Admin tips', 0, NULL, '', '', '', 1491635035, 1491635035, 117, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (41, 'file', 9, 'auth/admin/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 116, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (42, 'file', 9, 'auth/admin/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 115, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (43, 'file', 9, 'auth/admin/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 114, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (44, 'file', 10, 'auth/adminlog/index', 'View', 'fa fa-circle-o', '', '', 'Admin log tips', 0, NULL, '', '', '', 1491635035, 1491635035, 112, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (45, 'file', 10, 'auth/adminlog/detail', 'Detail', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 111, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (46, 'file', 10, 'auth/adminlog/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 110, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (47, 'file', 11, 'auth/group/index', 'View', 'fa fa-circle-o', '', '', 'Group tips', 0, NULL, '', '', '', 1491635035, 1491635035, 108, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (48, 'file', 11, 'auth/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 107, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (49, 'file', 11, 'auth/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 106, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (50, 'file', 11, 'auth/group/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 105, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (51, 'file', 12, 'auth/rule/index', 'View', 'fa fa-circle-o', '', '', 'Rule tips', 0, NULL, '', '', '', 1491635035, 1491635035, 103, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (52, 'file', 12, 'auth/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 102, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (53, 'file', 12, 'auth/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 101, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (54, 'file', 12, 'auth/rule/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 100, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (55, 'file', 4, 'addon/index', 'View', 'fa fa-circle-o', '', '', 'Addon tips', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (56, 'file', 4, 'addon/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (57, 'file', 4, 'addon/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (58, 'file', 4, 'addon/del', 'Delete', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (59, 'file', 4, 'addon/downloaded', 'Local addon', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (60, 'file', 4, 'addon/state', 'Update state', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (63, 'file', 4, 'addon/config', 'Setting', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (64, 'file', 4, 'addon/refresh', 'Refresh', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (65, 'file', 4, 'addon/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (66, 'file', 0, 'user', 'User', 'fa fa-user-circle', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (67, 'file', 66, 'user/user', 'User', 'fa fa-user', '', '', '', 1, NULL, '', 'hygl', 'huiyuanguanli', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (68, 'file', 67, 'user/user/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (69, 'file', 67, 'user/user/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (70, 'file', 67, 'user/user/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (71, 'file', 67, 'user/user/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (72, 'file', 67, 'user/user/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (73, 'file', 66, 'user/group', 'User group', 'fa fa-users', '', '', '', 1, NULL, '', 'hyfz', 'huiyuanfenzu', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (74, 'file', 73, 'user/group/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (75, 'file', 73, 'user/group/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (76, 'file', 73, 'user/group/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (77, 'file', 73, 'user/group/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (78, 'file', 73, 'user/group/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (79, 'file', 66, 'user/rule', 'User rule', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'hygz', 'huiyuanguize', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (80, 'file', 79, 'user/rule/index', 'View', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (81, 'file', 79, 'user/rule/del', 'Del', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (82, 'file', 79, 'user/rule/add', 'Add', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (83, 'file', 79, 'user/rule/edit', 'Edit', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (84, 'file', 79, 'user/rule/multi', 'Multi', 'fa fa-circle-o', '', '', '', 0, NULL, '', '', '', 1491635035, 1491635035, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (85, 'file', 0, 'command', '在线命令管理', 'fa fa-terminal', '', '', '', 1, NULL, '', 'zxmlgl', 'zaixianminglingguanli', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (86, 'file', 85, 'command/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (87, 'file', 85, 'command/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (88, 'file', 85, 'command/detail', '详情', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'xq', 'xiangqing', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (89, 'file', 85, 'command/execute', '运行', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'yx', 'yunxing', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (90, 'file', 85, 'command/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (91, 'file', 85, 'command/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650093440, 1650093440, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (92, 'file', 0, 'community', '小区信息', 'fa fa-circle-o', '', '', '', 1, 'addtabs', '', 'xqxx', 'xiaoquxinxi', 1650097532, 1650098157, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (93, 'file', 92, 'community/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650097532, 1650097532, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (94, 'file', 92, 'community/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650097532, 1650097532, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (95, 'file', 92, 'community/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650097533, 1650097533, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (96, 'file', 92, 'community/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650097533, 1650097533, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (97, 'file', 92, 'community/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650097533, 1650097533, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (98, 'file', 0, 'banner', '首页轮播', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'sylb', 'shouyelunbo', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (99, 'file', 98, 'banner/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (100, 'file', 98, 'banner/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (101, 'file', 98, 'banner/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (102, 'file', 98, 'banner/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (103, 'file', 98, 'banner/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650103267, 1650103267, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (104, 'file', 0, 'modular', '首页模块', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'symk', 'shouyemokuai', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (105, 'file', 104, 'modular/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (106, 'file', 104, 'modular/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (107, 'file', 104, 'modular/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (108, 'file', 104, 'modular/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (109, 'file', 104, 'modular/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650105131, 1650105131, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (110, 'file', 0, 'information', '信息管理', 'fa fa-circle-o', '', '', '', 1, NULL, '', 'xxgl', 'xinxiguanli', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (111, 'file', 110, 'information/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (112, 'file', 110, 'information/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (113, 'file', 110, 'information/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (114, 'file', 110, 'information/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (115, 'file', 110, 'information/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (116, 'file', 110, 'information/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (117, 'file', 110, 'information/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (118, 'file', 110, 'information/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650167874, 1650167874, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (119, 'file', 0, 'pages', '单页内容', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'dynr', 'danyeneirong', 1650964380, 1650964380, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (120, 'file', 119, 'pages/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1650964380, 1650964389, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (121, 'file', 119, 'pages/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1650964380, 1650964389, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (122, 'file', 119, 'pages/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1650964380, 1650964389, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (123, 'file', 119, 'pages/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1650964380, 1650964389, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (124, 'file', 119, 'pages/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1650964380, 1650964389, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (125, 'file', 119, 'pages/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1650964380, 1650964389, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (126, 'file', 119, 'pages/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1650964380, 1650964390, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (127, 'file', 119, 'pages/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1650964380, 1650964390, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (128, 'file', 0, 'comment', '评论信息', 'fa fa-comment\r', '', '', '', 1, NULL, '', 'plxx', 'pinglunxinxi', 1651296980, 1651296980, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (129, 'file', 128, 'comment/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1651296980, 1651297046, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (130, 'file', 128, 'comment/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1651296980, 1651297046, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (131, 'file', 128, 'comment/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1651296980, 1651297047, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (132, 'file', 128, 'comment/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1651296980, 1651297047, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (133, 'file', 128, 'comment/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1651296980, 1651297047, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (134, 'file', 128, 'comment/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1651296980, 1651297047, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (135, 'file', 128, 'comment/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1651296980, 1651297047, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (136, 'file', 128, 'comment/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1651296980, 1651297047, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (137, 'file', 0, 'merchant', '商户管理', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'shgl', 'shanghuguanli', 1652772140, 1652772140, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (138, 'file', 137, 'merchant/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1652772140, 1652772140, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (139, 'file', 137, 'merchant/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1652772140, 1652772140, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (140, 'file', 137, 'merchant/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1652772140, 1652772140, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (141, 'file', 137, 'merchant/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1652772140, 1652772140, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (142, 'file', 137, 'merchant/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1652772140, 1652772140, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (143, 'file', 0, 'classif', '商品分类', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'spfl', 'shangpinfenlei', 1652773548, 1652773548, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (144, 'file', 143, 'classif/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1652773548, 1652773548, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (145, 'file', 143, 'classif/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1652773548, 1652773548, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (146, 'file', 143, 'classif/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1652773548, 1652773548, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (147, 'file', 143, 'classif/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1652773548, 1652773548, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (148, 'file', 143, 'classif/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1652773548, 1652773548, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (149, 'file', 0, 'message', '消息中心', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'xxzx', 'xiaoxizhongxin', 1652927315, 1652927315, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (150, 'file', 149, 'message/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1652927315, 1652927315, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (151, 'file', 149, 'message/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1652927315, 1652927315, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (152, 'file', 149, 'message/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1652927315, 1652927315, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (153, 'file', 149, 'message/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1652927315, 1652927315, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (154, 'file', 149, 'message/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1652927315, 1652927315, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (155, 'file', 0, 'goods', '商品管理', 'fa fa-circle-o\r', '', '', '', 1, NULL, '', 'spgl', 'shangpinguanli', 1652949543, 1652949543, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (156, 'file', 155, 'goods/index', '查看', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zk', 'zhakan', 1652949543, 1652949543, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (157, 'file', 155, 'goods/recyclebin', '回收站', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hsz', 'huishouzhan', 1652949543, 1652949543, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (158, 'file', 155, 'goods/add', '添加', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'tj', 'tianjia', 1652949543, 1652949543, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (159, 'file', 155, 'goods/edit', '编辑', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'bj', 'bianji', 1652949543, 1652949543, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (160, 'file', 155, 'goods/del', '删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'sc', 'shanchu', 1652949543, 1652949543, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (161, 'file', 155, 'goods/destroy', '真实删除', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'zssc', 'zhenshishanchu', 1652949543, 1652949543, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (162, 'file', 155, 'goods/restore', '还原', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'hy', 'huanyuan', 1652949543, 1652949543, 0, 'normal');
INSERT INTO `yc_auth_rule` (`id`, `type`, `pid`, `name`, `title`, `icon`, `url`, `condition`, `remark`, `ismenu`, `menutype`, `extend`, `py`, `pinyin`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (163, 'file', 155, 'goods/multi', '批量更新', 'fa fa-circle-o', '', '', '', 0, NULL, '', 'plgx', 'pilianggengxin', 1652949543, 1652949543, 0, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for yc_banner
-- ----------------------------
DROP TABLE IF EXISTS `yc_banner`;
CREATE TABLE `yc_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `weigh` int(11) DEFAULT NULL COMMENT '排序',
  `community_id` int(11) DEFAULT NULL COMMENT '展示小区',
  `title` varchar(50) DEFAULT NULL COMMENT '轮播标题',
  `sub_title` varchar(50) DEFAULT NULL COMMENT '轮播描述',
  `image` varchar(255) NOT NULL COMMENT '图片地址',
  `jump_type` enum('0','1','2') NOT NULL COMMENT '跳转类型:0=不跳转,1=内部页面,2=外部页面',
  `jump_url` varchar(200) DEFAULT NULL COMMENT '跳转地址',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '展示状态:0=隐藏,1=显示',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='首页轮播';

-- ----------------------------
-- Records of yc_banner
-- ----------------------------
BEGIN;
INSERT INTO `yc_banner` (`id`, `weigh`, `community_id`, `title`, `sub_title`, `image`, `jump_type`, `jump_url`, `status`, `createtime`) VALUES (1, 1, 0, '平台试运营', '现在关注我们，抢第一波流量啦', '/uploads/20220416/606192725820e51f66d13bb061794df3.png', '0', '', '1', 1650103440);
INSERT INTO `yc_banner` (`id`, `weigh`, `community_id`, `title`, `sub_title`, `image`, `jump_type`, `jump_url`, `status`, `createtime`) VALUES (3, 2, 0, '麻辣小龙虾特惠购', '', '/uploads/20220517/64dfc337d3cdc6efe3641152996b0d32.png', '1', '/pages/information/information?information_id=34', '0', 1652754281);
INSERT INTO `yc_banner` (`id`, `weigh`, `community_id`, `title`, `sub_title`, `image`, `jump_type`, `jump_url`, `status`, `createtime`) VALUES (4, 3, 0, '房屋租售正式开通啦', '平台发布不收取任何费用，房东客户直接沟通，无任何中间商，点击立即查看', '/uploads/20220517/e3ac5c9d4a22008fbf1c2601943b516b.png', '1', '/pages/information/lists?category_id=23', '1', 1652754496);
INSERT INTO `yc_banner` (`id`, `weigh`, `community_id`, `title`, `sub_title`, `image`, `jump_type`, `jump_url`, `status`, `createtime`) VALUES (5, 5, 0, '今日小雪', '玉气飘逸揽风华 迎冬藏物小雪至', '/uploads/20241122/77ef0ca0c722b75cd04aaeb68b1e2db1.png', '1', '/pages/information/information?information_id=76', '0', 1732268515);
COMMIT;

-- ----------------------------
-- Table structure for yc_buyandgive
-- ----------------------------
DROP TABLE IF EXISTS `yc_buyandgive`;
CREATE TABLE `yc_buyandgive` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` enum('1','2') NOT NULL DEFAULT '1' COMMENT '类型:1=帮买,2=帮送',
  `community_id` int(11) DEFAULT NULL COMMENT '所属小区',
  `user_id` int(11) NOT NULL COMMENT '发布人',
  `accept_user_id` int(11) DEFAULT NULL COMMENT '接单人',
  `biz_content` mediumtext NOT NULL COMMENT '需求内容',
  `estimated_price` decimal(10,2) DEFAULT NULL COMMENT '预估价格',
  `help_fee` decimal(10,2) NOT NULL COMMENT '帮帮费/跑腿费',
  `status` enum('0','1','2','3','4','5') NOT NULL DEFAULT '0' COMMENT '需求状态:0=待审核,1=已发布,2=已接单,3=已完成,4=已取消,5=已下架',
  `status_msg` mediumtext COMMENT '审核描述',
  `createtime` int(11) NOT NULL COMMENT '发布时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  `accept_time` int(11) DEFAULT NULL COMMENT '接单时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='帮买帮送';

-- ----------------------------
-- Records of yc_buyandgive
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yc_cart
-- ----------------------------
DROP TABLE IF EXISTS `yc_cart`;
CREATE TABLE `yc_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '购物车ID',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `merchant_id` int(11) NOT NULL COMMENT '商户ID',
  `total_price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总金额',
  `total_num` int(11) DEFAULT NULL COMMENT '总数量',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='购物车管理';

-- ----------------------------
-- Records of yc_cart
-- ----------------------------
BEGIN;
INSERT INTO `yc_cart` (`id`, `user_id`, `merchant_id`, `total_price`, `total_num`, `createtime`) VALUES (85, 409, 1, 2.00, 1, 1694923878);
INSERT INTO `yc_cart` (`id`, `user_id`, `merchant_id`, `total_price`, `total_num`, `createtime`) VALUES (89, 17, 1, 427.00, 18, 1731523033);
INSERT INTO `yc_cart` (`id`, `user_id`, `merchant_id`, `total_price`, `total_num`, `createtime`) VALUES (90, 544, 1, 75.00, 3, 1731552801);
COMMIT;

-- ----------------------------
-- Table structure for yc_cart_goods
-- ----------------------------
DROP TABLE IF EXISTS `yc_cart_goods`;
CREATE TABLE `yc_cart_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水ID',
  `cart_id` int(11) NOT NULL COMMENT '购物车ID',
  `goods_id` int(11) NOT NULL COMMENT '商品ID',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '小计金额',
  `createtime` int(11) DEFAULT NULL COMMENT '加入时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=COMPACT COMMENT='购物车商品';

-- ----------------------------
-- Records of yc_cart_goods
-- ----------------------------
BEGIN;
INSERT INTO `yc_cart_goods` (`id`, `cart_id`, `goods_id`, `num`, `subtotal`, `createtime`) VALUES (157, 85, 83, 1, 2.00, 1694923878);
INSERT INTO `yc_cart_goods` (`id`, `cart_id`, `goods_id`, `num`, `subtotal`, `createtime`) VALUES (168, 89, 84, 17, 425.00, 1731523033);
INSERT INTO `yc_cart_goods` (`id`, `cart_id`, `goods_id`, `num`, `subtotal`, `createtime`) VALUES (171, 89, 83, 1, 2.00, 1731523042);
INSERT INTO `yc_cart_goods` (`id`, `cart_id`, `goods_id`, `num`, `subtotal`, `createtime`) VALUES (172, 90, 84, 3, 75.00, 1731552801);
COMMIT;

-- ----------------------------
-- Table structure for yc_category
-- ----------------------------
DROP TABLE IF EXISTS `yc_category`;
CREATE TABLE `yc_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '父ID',
  `type` varchar(30) DEFAULT '' COMMENT '栏目类型',
  `name` varchar(30) DEFAULT '',
  `nickname` varchar(50) DEFAULT '',
  `flag` set('hot','index','recommend') DEFAULT '',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `diyname` varchar(30) DEFAULT '' COMMENT '自定义名称',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `weigh` (`weigh`,`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='分类表';

-- ----------------------------
-- Records of yc_category
-- ----------------------------
BEGIN;
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (14, 0, 'information', '二手闲置', '二手闲置', '', '/uploads/20220416/05936dd68deec22d86c237f3383e1a32.png', '', '', '', 1650167136, 1650167136, 14, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (15, 0, 'information', '招聘求职', '招聘求职', '', '/uploads/20220417/8dfe4b687fc6ec53f51e89cef3008fde.png', '', '', '', 1650167332, 1650348065, 15, 'hidden');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (16, 0, 'information', '通知信息', '通知信息', '', '', '', '', '', 1650213462, 1650349843, 16, 'hidden');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (17, 0, 'information', '其他信息', '其他信息', '', '', '', '', '', 1650348084, 1650348084, 22, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (18, 0, 'information', '附近优惠', '附近优惠', '', '', '', '', '', 1650348110, 1732198730, 17, 'hidden');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (19, 0, 'information', '日常分享', '日常分享', '', '', '', '', '', 1651150000, 1651150000, 18, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (20, 0, 'information', '活动召集', '活动召集', '', '', '', '', '', 1651325889, 1732267455, 19, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (22, 0, 'information', '商家钜惠', '商家钜惠', '', '', '', '', '', 1651325960, 1651326075, 21, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (23, 0, 'information', '房产租售', '房产租售', '', '', '', '', '', 1651412552, 1732267395, 23, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (24, 0, 'merchant', '餐饮美食', '餐饮美食', '', '', '', '', '', 1652772367, 1652772367, 24, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (25, 0, 'merchant', '娱乐网咖', '娱乐网咖', '', '', '', '', '', 1652772382, 1652772389, 25, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (26, 0, 'merchant', '商超便利', '商超便利', '', '', '', '', '', 1652772412, 1652772412, 26, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (27, 0, 'merchant', '小区服务', '小区服务', '', '', '', '', '', 1652772442, 1652772442, 27, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (28, 0, 'information', '垂钓交流', '垂钓交流', '', '', '', '', '', 1732291714, 1732291714, 28, 'normal');
INSERT INTO `yc_category` (`id`, `pid`, `type`, `name`, `nickname`, `flag`, `image`, `keywords`, `description`, `diyname`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (29, 0, 'information', '热点资讯', '热点资讯', '', '', '', '', '', 1732297785, 1732298336, 29, 'hidden');
COMMIT;

-- ----------------------------
-- Table structure for yc_classif
-- ----------------------------
DROP TABLE IF EXISTS `yc_classif`;
CREATE TABLE `yc_classif` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `merchant_id` int(11) NOT NULL COMMENT '商户信息',
  `classif_name` varchar(50) NOT NULL COMMENT '分类名称',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '分类状态:1=正常,0=禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='商品分类';

-- ----------------------------
-- Records of yc_classif
-- ----------------------------
BEGIN;
INSERT INTO `yc_classif` (`id`, `merchant_id`, `classif_name`, `status`) VALUES (1, 1, '生活用品', '1');
INSERT INTO `yc_classif` (`id`, `merchant_id`, `classif_name`, `status`) VALUES (2, 1, '宠物用品', '1');
INSERT INTO `yc_classif` (`id`, `merchant_id`, `classif_name`, `status`) VALUES (3, 1, '零食家族', '1');
INSERT INTO `yc_classif` (`id`, `merchant_id`, `classif_name`, `status`) VALUES (4, 1, '啤酒饮料', '1');
COMMIT;

-- ----------------------------
-- Table structure for yc_command
-- ----------------------------
DROP TABLE IF EXISTS `yc_command`;
CREATE TABLE `yc_command` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` varchar(30) NOT NULL DEFAULT '' COMMENT '类型',
  `params` varchar(1500) NOT NULL DEFAULT '' COMMENT '参数',
  `command` varchar(1500) NOT NULL DEFAULT '' COMMENT '命令',
  `content` mediumtext COMMENT '返回结果',
  `executetime` int(10) unsigned DEFAULT NULL COMMENT '执行时间',
  `createtime` int(10) unsigned DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) unsigned DEFAULT NULL COMMENT '更新时间',
  `status` enum('successed','failured') NOT NULL DEFAULT 'failured' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='在线命令表';

-- ----------------------------
-- Records of yc_command
-- ----------------------------
BEGIN;
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (1, 'crud', '[\"--force=1\",\"--table=yc_community\",\"--local=0\"]', 'php think crud --force=1 --table=yc_community --local=0', 'Build Successed', 1650097527, 1650097527, 1650097527, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (2, 'menu', '[\"--controller=Community\"]', 'php think menu --controller=Community', 'Build Successed!', 1650097532, 1650097532, 1650097533, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (3, 'crud', '[\"--force=1\",\"--table=yc_banner\",\"--fields=id,image,jump_type,jump_url,status,createtime\",\"--local=0\",\"--relation=yc_community\",\"--relationmode=belongsto\",\"--relationforeignkey=community_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=yc_banner --fields=id,image,jump_type,jump_url,status,createtime --local=0 --relation=yc_community --relationmode=belongsto --relationforeignkey=community_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1650103259, 1650103259, 1650103259, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (4, 'menu', '[\"--controller=Banner\"]', 'php think menu --controller=Banner', 'Build Successed!', 1650103267, 1650103267, 1650103267, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (5, 'crud', '[\"--force=1\",\"--table=yc_banner\",\"--fields=id,image,jump_type,jump_url,status,createtime\",\"--local=0\",\"--relation=yc_community\",\"--relationmode=belongsto\",\"--relationforeignkey=community_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=yc_banner --fields=id,image,jump_type,jump_url,status,createtime --local=0 --relation=yc_community --relationmode=belongsto --relationforeignkey=community_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1650103949, 1650103949, 1650103949, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (6, 'crud', '[\"--force=1\",\"--table=yc_banner\",\"--fields=id,weigh,image,jump_type,jump_url,status,createtime\",\"--local=0\",\"--relation=yc_community\",\"--relationmode=belongsto\",\"--relationforeignkey=community_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=yc_banner --fields=id,weigh,image,jump_type,jump_url,status,createtime --local=0 --relation=yc_community --relationmode=belongsto --relationforeignkey=community_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1650103981, 1650103981, 1650103981, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (7, 'crud', '[\"--force=1\",\"--table=yc_modular\",\"--fields=id,title,ico_image,jump_type,jump_url,status,weigh,createtime\",\"--local=0\",\"--relation=yc_community\",\"--relationmode=belongsto\",\"--relationforeignkey=community_id\",\"--relationprimarykey=id\",\"--relationfields=name\"]', 'php think crud --force=1 --table=yc_modular --fields=id,title,ico_image,jump_type,jump_url,status,weigh,createtime --local=0 --relation=yc_community --relationmode=belongsto --relationforeignkey=community_id --relationprimarykey=id --relationfields=name', 'Build Successed', 1650105124, 1650105124, 1650105124, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (8, 'menu', '[\"--controller=Modular\"]', 'php think menu --controller=Modular', 'Build Successed!', 1650105131, 1650105131, 1650105131, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (9, 'crud', '[\"--force=1\",\"--table=yc_information\",\"--fields=id,title,substance,images,contact,status,status_msg,createtime,updatetime\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=yc_information --fields=id,title,substance,images,contact,status,status_msg,createtime,updatetime --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1650167867, 1650167867, 1650167867, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (10, 'menu', '[\"--controller=Information\"]', 'php think menu --controller=Information', 'Build Successed!', 1650167874, 1650167874, 1650167874, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (11, 'crud', '[\"--force=1\",\"--table=yc_information\",\"--fields=id,title,substance,images,contact,status,status_msg,weigh,createtime,updatetime\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\"]', 'php think crud --force=1 --table=yc_information --fields=id,title,substance,images,contact,status,status_msg,weigh,createtime,updatetime --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname', 'Build Successed', 1650168386, 1650168386, 1650168386, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (12, 'crud', '[\"--force=1\",\"--table=yc_pages\",\"--local=0\"]', 'php think crud --force=1 --table=yc_pages --local=0', 'Build Successed', 1650964254, 1650964254, 1650964254, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (13, 'menu', '[\"--controller=Pages\"]', 'php think menu --controller=Pages', 'Build Successed!', 1650964380, 1650964380, 1650964380, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (14, 'crud', '[\"--force=1\",\"--table=yc_pages\",\"--local=0\"]', 'php think crud --force=1 --table=yc_pages --local=0', 'Build Successed', 1650964436, 1650964436, 1650964436, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (15, 'crud', '[\"--force=1\",\"--table=yc_pages\",\"--local=0\"]', 'php think crud --force=1 --table=yc_pages --local=0', 'Build Successed', 1650964502, 1650964502, 1650964502, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (16, 'crud', '[\"--table=yc_comment\",\"--fields=id,content,createtime,status\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=nickname\",\"--relation=yc_information\",\"--relationmode=belongsto\",\"--relationforeignkey=information_id\",\"--relationprimarykey=id\",\"--relationfields=title\"]', 'php think crud --table=yc_comment --fields=id,content,createtime,status --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=nickname --relation=yc_information --relationmode=belongsto --relationforeignkey=information_id --relationprimarykey=id --relationfields=title', 'Build Successed', 1651296969, 1651296969, 1651296969, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (17, 'menu', '[\"--controller=Comment\"]', 'php think menu --controller=Comment', 'Build Successed!', 1651296980, 1651296980, 1651296980, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (18, 'crud', '[\"--force=1\",\"--table=yc_merchant\",\"--fields=id,mer_name,mer_avatar_image,mer_address,mer_phone,is_business,distribution_mode,sales_scope,sales_volume,sales_amount,status,status_msg\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=username,nickname\"]', 'php think crud --force=1 --table=yc_merchant --fields=id,mer_name,mer_avatar_image,mer_address,mer_phone,is_business,distribution_mode,sales_scope,sales_volume,sales_amount,status,status_msg --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,nickname', 'Build Successed', 1652772129, 1652772129, 1652772129, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (19, 'menu', '[\"--controller=Merchant\"]', 'php think menu --controller=Merchant', 'Build Successed!', 1652772140, 1652772140, 1652772140, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (20, 'crud', '[\"--force=1\",\"--table=yc_merchant\",\"--fields=id,category_id,mer_name,mer_avatar_image,mer_address,mer_phone,is_business,sales_daterange,distribution_mode,sales_scope,sales_volume,sales_amount,status,status_msg\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=username,nickname\"]', 'php think crud --force=1 --table=yc_merchant --fields=id,category_id,mer_name,mer_avatar_image,mer_address,mer_phone,is_business,sales_daterange,distribution_mode,sales_scope,sales_volume,sales_amount,status,status_msg --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,nickname', 'Build Successed', 1652772291, 1652772291, 1652772291, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (21, 'crud', '[\"--force=1\",\"--table=yc_classif\",\"--fields=id,classif_name,status\",\"--local=0\",\"--relation=yc_merchant\",\"--relationmode=belongsto\",\"--relationforeignkey=merchant_id\",\"--relationprimarykey=id\",\"--relationfields=mer_name\"]', 'php think crud --force=1 --table=yc_classif --fields=id,classif_name,status --local=0 --relation=yc_merchant --relationmode=belongsto --relationforeignkey=merchant_id --relationprimarykey=id --relationfields=mer_name', 'Build Successed', 1652773536, 1652773536, 1652773536, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (22, 'menu', '[\"--controller=Classif\"]', 'php think menu --controller=Classif', 'Build Successed!', 1652773548, 1652773548, 1652773548, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (23, 'crud', '[\"--table=yc_message\",\"--fields=id,type,title,jump_type,jump_url,status,createtime,readtime\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=receive_user\",\"--relationprimarykey=id\",\"--relationfields=username,nickname\"]', 'php think crud --table=yc_message --fields=id,type,title,jump_type,jump_url,status,createtime,readtime --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=receive_user --relationprimarykey=id --relationfields=username,nickname', 'Build Successed', 1652927258, 1652927258, 1652927258, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (24, 'menu', '[\"--controller=Message\"]', 'php think menu --controller=Message', 'Build Successed!', 1652927315, 1652927315, 1652927315, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (25, 'crud', '[\"--table=yc_message\",\"--fields=id,type,title,jump_type,jump_url,status,createtime,readtime\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=receive_user\",\"--relationprimarykey=id\",\"--relationfields=username,nickname\"]', 'php think crud --table=yc_message --fields=id,type,title,jump_type,jump_url,status,createtime,readtime --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=receive_user --relationprimarykey=id --relationfields=username,nickname', 'Build Successed', 1652928068, 1652928068, 1652928069, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (26, 'crud', '[\"--force=1\",\"--table=yc_goods\",\"--fields=id,title,cover_images,price,weigh,status,sales_volume,createtime\",\"--local=0\",\"--relation=yc_merchant\",\"--relationmode=belongsto\",\"--relationforeignkey=merchant_id\",\"--relationprimarykey=id\",\"--relationfields=mer_name\",\"--relation=yc_classif\",\"--relationmode=belongsto\",\"--relationforeignkey=classif_id\",\"--relationprimarykey=id\",\"--relationfields=classif_name\"]', 'php think crud --force=1 --table=yc_goods --fields=id,title,cover_images,price,weigh,status,sales_volume,createtime --local=0 --relation=yc_merchant --relationmode=belongsto --relationforeignkey=merchant_id --relationprimarykey=id --relationfields=mer_name --relation=yc_classif --relationmode=belongsto --relationforeignkey=classif_id --relationprimarykey=id --relationfields=classif_name', 'Build Successed', 1652949515, 1652949515, 1652949515, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (27, 'menu', '[\"--controller=Goods\"]', 'php think menu --controller=Goods', 'Build Successed!', 1652949543, 1652949543, 1652949543, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (28, 'crud', '[\"--table=yc_cart\",\"--fields=id,total_amount,createtime\",\"--local=0\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=username,nickname\"]', 'php think crud --table=yc_cart --fields=id,total_amount,createtime --local=0 --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,nickname', 'Build Successed', 1653033628, 1653033628, 1653033628, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (29, 'crud', '[\"--table=yc_cart_goods\",\"--model=CartGoods\",\"--fields=id,num,subtotal,createtime\",\"--local=0\",\"--relation=yc_goods\",\"--relationmode=belongsto\",\"--relationforeignkey=goods_id\",\"--relationprimarykey=id\",\"--relationfields=title,price\",\"--relation=yc_cart\",\"--relationmode=belongsto\",\"--relationforeignkey=cart_id\",\"--relationprimarykey=id\"]', 'php think crud --table=yc_cart_goods --model=CartGoods --fields=id,num,subtotal,createtime --local=0 --relation=yc_goods --relationmode=belongsto --relationforeignkey=goods_id --relationprimarykey=id --relationfields=title,price --relation=yc_cart --relationmode=belongsto --relationforeignkey=cart_id --relationprimarykey=id', 'Build Successed', 1653033705, 1653033705, 1653033705, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (30, 'crud', '[\"--table=yc_cart\",\"--fields=id,total_amount,createtime\",\"--local=0\",\"--relation=yc_merchant\",\"--relationmode=belongsto\",\"--relationforeignkey=merchant_id\",\"--relationprimarykey=id\",\"--relationfields=mer_name\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=username,nickname\"]', 'php think crud --table=yc_cart --fields=id,total_amount,createtime --local=0 --relation=yc_merchant --relationmode=belongsto --relationforeignkey=merchant_id --relationprimarykey=id --relationfields=mer_name --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,nickname', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', 1653033743, 1653033743, 1653033743, 'failured');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (31, 'crud', '[\"--force=1\",\"--table=yc_cart\",\"--fields=id,total_amount,createtime\",\"--local=0\",\"--relation=yc_merchant\",\"--relationmode=belongsto\",\"--relationforeignkey=merchant_id\",\"--relationprimarykey=id\",\"--relationfields=mer_name\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=username,nickname\"]', 'php think crud --force=1 --table=yc_cart --fields=id,total_amount,createtime --local=0 --relation=yc_merchant --relationmode=belongsto --relationforeignkey=merchant_id --relationprimarykey=id --relationfields=mer_name --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,nickname', 'Build Successed', 1653033747, 1653033747, 1653033747, 'successed');
INSERT INTO `yc_command` (`id`, `type`, `params`, `command`, `content`, `executetime`, `createtime`, `updatetime`, `status`) VALUES (32, 'crud', '[\"--table=yc_cart\",\"--fields=id,total_amount,createtime\",\"--local=0\",\"--relation=yc_merchant\",\"--relationmode=belongsto\",\"--relationforeignkey=merchant_id\",\"--relationprimarykey=id\",\"--relationfields=mer_name\",\"--relation=yc_user\",\"--relationmode=belongsto\",\"--relationforeignkey=user_id\",\"--relationprimarykey=id\",\"--relationfields=username,nickname\"]', 'php think crud --table=yc_cart --fields=id,total_amount,createtime --local=0 --relation=yc_merchant --relationmode=belongsto --relationforeignkey=merchant_id --relationprimarykey=id --relationfields=mer_name --relation=yc_user --relationmode=belongsto --relationforeignkey=user_id --relationprimarykey=id --relationfields=username,nickname', 'controller already exists!\nIf you need to rebuild again, use the parameter --force=true', 1698148834, 1698148834, 1698148835, 'failured');
COMMIT;

-- ----------------------------
-- Table structure for yc_comment
-- ----------------------------
DROP TABLE IF EXISTS `yc_comment`;
CREATE TABLE `yc_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `pid` int(11) DEFAULT NULL COMMENT '上级评论',
  `user_id` int(11) NOT NULL COMMENT '发布者',
  `information_id` int(11) NOT NULL COMMENT '文章信息',
  `content` varchar(255) NOT NULL COMMENT '评论内容',
  `createtime` int(11) DEFAULT NULL COMMENT '发布时间',
  `deletetime` int(11) DEFAULT NULL COMMENT '删除时间',
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '发布状态:0=待审核,1=成功,2=隐藏',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb4 COMMENT='评论信息';

-- ----------------------------
-- Records of yc_comment
-- ----------------------------
BEGIN;
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (1, NULL, 17, 40, '测试测试测试测试测试测试', 1651297832, 1651302832, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (2, 1, 4, 40, '什么什么什么是什么什么什么是什么什么什么是什么什么什么是什么什么什么是什么什么什么是', 1651296832, 1651300659, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (3, 0, 17, 40, '测试信息发布', 1651300197, 1651300240, '0');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (4, 0, 17, 40, '测试测试测试测试测试', 1651300613, 1651302854, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (5, 1, 17, 40, '@是江淮川 测试测试', 1651300757, 1651302856, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (6, 0, 17, 30, '成色怎么样？', 1651301911, 1652948434, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (7, 0, 17, 40, '测试\n\n11111\n\n证明', 1651302291, 1651302860, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (8, 0, 17, 40, '这次测试', 1651302304, 1651302862, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (9, 0, 17, 36, '(*°ω°*)ﾉ&quot;', 1651303967, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (10, 0, 17, 40, '地址在海棠溪国瑞中心楼上，冲冲冲', 1651323061, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (11, 0, 17, 49, '平台监督管理唯一联系方式：个人中心-联系客服', 1651331311, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (12, 0, 17, 56, '不是公租房吧？', 1652797410, 1652797414, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (13, 0, 17, 56, '不是公租房吧？', 1652797410, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (14, NULL, 17, 56, '多少钱一个月？押一付三还是？', 1652797558, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (15, 0, 17, 52, '这是渝中区虎歇路那边', 1652800002, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (16, 0, 17, 56, '滴滴滴，完善一下详情呢，比如什么户型，多少钱一个月，付款周期什么的', 1652924119, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (17, 13, 219, 56, '@阿白 不是的亲', 1652924259, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (18, 14, 219, 56, '@阿白 押一付三', 1652924268, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (19, 16, 219, 56, '@阿白 加个微信吧', 1652924278, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (20, 0, 17, 54, '猫咪在哪里哟，好不好养', 1652938625, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (21, 0, 17, 51, '杨家坪那边', 1652939990, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (22, 15, 17, 52, '@阿白 去店里面，下单一样也是套餐价', 1652940292, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (23, 0, 17, 30, '没其他问题吧？', 1652948455, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (24, 23, 27, 30, '@阿白 无拆无修，正常使用', 1652948564, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (25, 0, 17, 26, '100块钱得行不？', 1652948834, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (26, 0, 17, 21, '哪里的', 1652949237, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (27, 10, 17, 40, '@阿白 优惠现在没有了好像', 1652954922, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (28, 15, 17, 52, '@是江淮川 测试', 1653017752, 1681848814, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (29, 0, 17, 27, '测试', 1653020054, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (30, 29, 17, 27, '@是江淮川 测试', 1653020065, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (31, 29, 17, 27, '@是江淮川 测试', 1653020087, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (32, 29, 17, 27, '@是江淮川 测试', 1653020092, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (33, 29, 17, 27, '@是江淮川 测试', 1653020130, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (34, 29, 17, 27, '@是江淮川 测试', 1653020134, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (35, 29, 17, 27, '@是江淮川 测试', 1653020138, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (36, 29, 17, 27, '@是江淮川 测试', 1653020141, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (37, 0, 64, 60, '应该是6+128  没有6+126的配置哦', 1654134903, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (38, 0, 64, 10, '什么型号？什么配置？写详细些方便出手哦', 1654135142, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (39, 37, 4, 60, '@美牙全瓷修复，全隐形矫正 是的', 1654145823, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (40, 29, 17, 27, '@是江淮川 测试', 1658459931, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (41, 29, 17, 27, '@阿白 3333', 1731522710, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (42, 0, 17, 62, '1111', 1731523414, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (43, 0, 2, 64, '这个地方我也去过，被跟团坑了几万块。。。。', 1731593899, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (44, 0, 16, 66, '测试', 1731671290, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (45, 0, 2, 70, '芜湖~', 1731750665, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (46, 0, 21, 71, '111', 1732196812, 1732196815, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (47, 0, 22, 70, '芜湖', 1732197568, NULL, '1');
INSERT INTO `yc_comment` (`id`, `pid`, `user_id`, `information_id`, `content`, `createtime`, `deletetime`, `status`) VALUES (48, 0, 17, 76, '6666', 1732271654, NULL, '1');
COMMIT;

-- ----------------------------
-- Table structure for yc_community
-- ----------------------------
DROP TABLE IF EXISTS `yc_community`;
CREATE TABLE `yc_community` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) DEFAULT NULL COMMENT '申请人',
  `no` varchar(20) DEFAULT NULL COMMENT '小区代码',
  `name` varchar(100) NOT NULL COMMENT '小区名称',
  `city` varchar(100) DEFAULT NULL COMMENT '所在省市',
  `address` varchar(100) NOT NULL COMMENT '详细地址',
  `longitude` varchar(100) NOT NULL COMMENT '地址经度',
  `latitude` varchar(100) NOT NULL COMMENT '地址纬度',
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '审核状态:0=待审核,1=已通过,2=不通过',
  `status_msg` varchar(200) DEFAULT NULL COMMENT '审核结果',
  `createtime` int(11) NOT NULL COMMENT '申请时间',
  `updatetime` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE,
  KEY `longitude` (`longitude`) USING BTREE,
  KEY `latitude` (`latitude`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='社区信息';

-- ----------------------------
-- Records of yc_community
-- ----------------------------
BEGIN;
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (1, NULL, 'CQ220401', '升伟一里南滨', '重庆/重庆市/南岸区', '重庆市南岸区南坪东路二巷20号', '106.57425979572295', '29.532681764428744', '1', '', 1650097868, 1650121600);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (2, NULL, 'CQ220402', '东源锦悦', '重庆/重庆市/南岸区', '重庆市南岸区南坪东路2巷2号', '106.57310108142852', '29.53053471727576', '1', '', 1650098017, 1650121597);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (3, NULL, 'CQ220403', '万寿华庭', '重庆/重庆市/南岸区', '重庆市南岸区花园路街道金山支路1号', '106.56043', '29.522746', '1', '', 1650120965, 1650121594);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (4, NULL, 'CQ220404', '洋河南滨花园', '重庆/重庆市/南岸区', '重庆市南岸区南坪东路2巷2洋河南滨花园', '106.571005', '29.533296', '1', '', 1650130971, 1650130971);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (5, NULL, 'CQ220405', '富邦金玖', '重庆/重庆市/九龙坡区', '重庆市九龙坡区石桥铺高新区六店子长新路12号', '106.490148', '29.540977', '1', '', 1650213976, 1650214325);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (6, 17, NULL, '金科·阳光小镇', '', '重庆市九龙坡区华岩镇华福大道北段18号', '106.440454', '29.447279', '1', '测试申请', 1651161230, 1651197912);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (7, 17, NULL, '泰正花园', '', '重庆市南岸区金紫街10号', '106.560682', '29.52094', '1', '', 1651161995, 1651197910);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (8, 17, NULL, '东方新苑', '', '重庆市南岸区南坪东路85号', '106.57539367676', '29.532600402832', '1', '', 1651163527, 1651163608);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (9, 17, NULL, '明发江南景苑', '', '重庆市南岸区南坪东路二巷16号', '106.57275390625', '29.531988143921', '1', '', 1651163541, 1651163608);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (10, 17, NULL, '阳光华庭', '', '重庆市南岸区福红路48', '106.57661437988', '29.537773132324', '1', '', 1651163558, 1651163608);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (11, 17, NULL, '阳光100阿尔勒', '', '重庆市巴南区渝南大道(轻轨3号线大山村站旁)', '106.55070495605', '29.410520553589', '1', '', 1651163647, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (12, 17, NULL, '龙洲南苑公租房', '', '重庆市巴南区金南路91号', '106.53410339355', '29.355617523193', '1', '', 1651163666, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (13, 17, NULL, '海棠晓月(E区)', '', '重庆市南岸区南坪东路516号', '106.57971954346', '29.534635543823', '1', '', 1651163954, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (14, 17, NULL, '康德国会山', '', '重庆市南岸区辅仁路8号', '106.57769012451', '29.527740478516', '1', '', 1651163968, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (15, 17, NULL, '天香丽苑', '', '重庆市南岸区辅仁路25号', '106.57872009277', '29.532236099243', '1', '', 1651163984, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (16, 17, NULL, '玛瑙花园', '', '重庆市南岸区南坪正街与南坪新街交汇处向南50米路东', '106.57127380371', '29.536186218262', '1', '', 1651164028, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (17, 17, NULL, '亚太商谷', '', '重庆市南岸区亚太路1号', '106.55925750732', '29.533832550049', '1', '', 1651164492, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (18, 17, NULL, '江南丽景', '', '重庆市南岸区辅仁路18号', '106.57991790771', '29.531888961792', '1', '', 1651193139, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (19, 17, NULL, '御峰·8坊', '', '重庆市南岸区烟雨路西侧', '106.58921051025', '29.536596298218', '1', '', 1651197015, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (20, 17, NULL, '和黄御峰', '', '重庆市南岸区御泰路47号', '106.58444213867', '29.534027099609', '1', '', 1651197744, 1651197894);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (21, 17, NULL, '国瑞中心', '', '重庆市南岸区烟雨路7号国瑞中心LG层国瑞壹街2,3号商铺', '106.58620452881', '29.536840438843', '1', '', 1651198245, 1651198267);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (22, 17, NULL, '东海·金香庭', '', '重庆市南岸区南坪东路546号', '106.58150482178', '29.536878585815', '1', '', 1651204631, 1651209763);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (23, 17, NULL, '雅典汇', '', '重庆市南岸区南坪东路600号', '106.58408355713', '29.538692474365', '1', '', 1651210786, 1651210815);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (24, 17, NULL, '御峰·尚都', '', '重庆市南岸区晨峰路与御泰路交叉口东80米', '106.58946228027', '29.534669876099', '1', '', 1651212206, 1651215319);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (25, 17, NULL, '和泓南山道', '', '重庆市南岸区海棠溪敦厚街36号(江南体育中心旁)', '106.58934020996', '29.540678024292', '1', '', 1651212225, 1651215319);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (26, 88, 'CQZJ20220012', '玛雅上层', '重庆/重庆市/渝北区', '重庆市重庆市渝北区紫荆路191号', '106.53225694444', '29.598387044271', '1', '', 1651230682, 1651230834);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (27, 17, NULL, '跃华新都', '', '重庆市九龙坡区杨家坪前进支路1号', '106.51382446289', '29.509309768677', '1', '', 1651242484, 1651247954);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (28, 17, '', '庆隆花园', '重庆/重庆市/南岸区', '重庆市南岸区南城大道200号A幢附2', '106.562669', '29.523903', '1', '', 1651249338, 1651249847);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (29, 17, '', '电商产业园', '重庆/重庆市/南岸区', '重庆市南岸区南城大道199号', '106.56347', '29.522138', '1', '', 1651251075, 1651252927);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (30, 17, '', '洋世达花园', '重庆/重庆市/南岸区', '重庆市南岸区金山支路16号', '106.559746', '29.519995', '1', '', 1651251467, 1651252857);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (31, 17, '', '上海城', '重庆/重庆市/南岸区', '重庆市南岸区南坪西路32号', '106.560396', '29.530323', '1', '', 1651253079, 1651253111);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (32, 17, '', '融创玖玺台', '重庆/重庆市/南岸区', '重庆市南岸区亚太路9号', '106.56006622314', '29.536706924438', '1', '', 1651256455, 1651256522);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (33, 17, '', '左岸阳光', '重庆/重庆市/南岸区', '重庆市南岸区福红路15号', '106.57976531982', '29.538040161133', '1', '', 1651298393, 1651298462);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (34, 4, '', '东东摩', '重庆/重庆市/南岸区', '重庆市重庆市南岸区南坪东路2号2巷', '106.57281', '29.530048', '1', '', 1651303661, 1651303689);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (35, 17, '', '阳光时代', '重庆/重庆市/南岸区', '重庆市南岸区南坪东路40号', '106.57563018799', '29.531301498413', '1', '', 1651330525, 1651332851);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (36, 17, '', '恒基·翔龙江畔', '重庆/重庆市/南岸区', '重庆市南岸区南滨西路28号(兰花路社区公园旁)', '106.55149841309', '29.506534576416', '1', '', 1651331425, 1651331443);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (37, 17, '', '松藻小区', '重庆/重庆市/南岸区', '重庆市南岸区烟雨堡46号', '106.5824508667', '29.535650253296', '1', '', 1651726983, 1651917785);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (38, 5, '', '佳馨小居', '重庆/重庆市/渝中区', '重庆市重庆市渝中区虎歇路65号', '106.50221', '29.543577', '1', '', 1651993202, 1651993247);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (39, 163, '', '东衡槟城', '重庆/重庆市/渝北区', '重庆市重庆市渝北区翠苹路11号', '106.59757', '29.690693', '1', '', 1652750459, 1652798249);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (40, 17, '', '绿地·保税中心', '重庆/重庆市/渝北区', '重庆市重庆市江北区金渝大道153号', '106.584656', '29.620623', '1', '', 1662026268, 1731526903);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (41, 292, '', '兴隆镇打龙沟', '重庆/重庆市/南川区', '重庆市重庆市南川区', '107.0221', '29.112848', '1', '注册＂渝快社区＂', 1666865707, 1694452142);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (42, 332, '', '临江镇中心小学', '重庆/重庆市/开州区', '重庆市重庆市开州区野园街37号', '108.22674', '31.09804', '1', '', 1673006152, 1694452124);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (43, 353, NULL, '康庄美地D区', '', '重庆市重庆市渝北区黄竹路100号', '106.48656', '29.638773', '1', '', 1677123370, 1681844635);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (44, 17, NULL, '重庆港职工住宅', '', '重庆市南岸区南坪正街', '106.57076951459', '29.534878882973', '1', '', 1681843674, 1681844635);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (45, 386, '', '重庆北站', '重庆/重庆市/渝北区', '重庆市重庆市渝北区昆仑大道51号附8号', '106.55081', '29.609201', '1', '', 1688968927, 1690426423);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (46, 17, '', '兰亭水云涧', '重庆/重庆市/渝北区', '重庆市渝北区宝桐一路653号', '106.60891935148', '29.684026669586', '1', '', 1690426554, 1690426996);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (49, 17, '', '尚滨国际', '重庆/重庆市/南岸区', '南坪街道南坪新街尚滨国际', '106.567302', '29.533678', '1', '', 1699708260, 1706271025);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (50, 4, NULL, '宁静小区', '', '重庆市南岸区响水路65-67号', '106.57347869873', '29.528057098389', '1', '', 1701437555, 1706271025);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (51, 544, '', '辅仁小区', '重庆/重庆市/南岸区', '重庆市南岸区辅仁路20号', '106.5813369751', '29.532545089722', '1', '', 1731527061, 1731527448);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (52, 17, '', '翠堤春晓', '重庆/重庆市/南岸区', '重庆市南岸区南坪白鹤路139号', '106.565457', '29.516386', '1', '', 1731554810, 1731554839);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (53, 17, '', '重庆万达银邸', '重庆/重庆市/南岸区', '重庆市南岸区珊瑚路8号', '106.566973', '29.527148', '1', '', 1731740391, 1731740495);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (54, 2, '', '花火休闲垂钓园', '重庆/重庆市/渝北区', '重庆市渝北区沙草公路', '106.724001', '29.801348', '1', '', 1732291982, 1732292003);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (55, 22, '', '重庆渝北光环', '重庆/重庆市/渝北区', '重庆市渝北区金州大道与湖彩路交叉口西北', '106.529182', '29.650089', '1', '', 1732299127, 1732299169);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (58, 22, '', '景苑', '重庆/重庆市/南岸区', '重庆市南岸区南坪镇', '106.57755279541', '29.529314041138', '1', '', 1732305960, 1732354474);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (59, 22, '', '重庆万垚酒店', '重庆/重庆市/南岸区', '重庆市南岸区辅仁路12号', '106.57651519775', '29.528646469116', '1', '', 1732305978, 1732354481);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (60, 22, '', '国会山公园', '重庆/重庆市/南岸区', '重庆市南岸区辅仁大道', '106.57493591309', '29.528066635132', '1', '', 1732306011, 1732354488);
INSERT INTO `yc_community` (`id`, `user_id`, `no`, `name`, `city`, `address`, `longitude`, `latitude`, `status`, `status_msg`, `createtime`, `updatetime`) VALUES (61, 2, '', '三虾行光环店', '重庆/重庆市/渝北区', '重庆市渝北区重光地铁口4A出口直走30米', '106.530903', '29.651013', '1', '', 1732367271, 1732367286);
COMMIT;

-- ----------------------------
-- Table structure for yc_config
-- ----------------------------
DROP TABLE IF EXISTS `yc_config`;
CREATE TABLE `yc_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT '' COMMENT '变量名',
  `group` varchar(30) DEFAULT '' COMMENT '分组',
  `title` varchar(100) DEFAULT '' COMMENT '变量标题',
  `tip` varchar(100) DEFAULT '' COMMENT '变量描述',
  `type` varchar(30) DEFAULT '' COMMENT '类型:string,text,int,bool,array,datetime,date,file',
  `visible` varchar(255) DEFAULT '' COMMENT '可见条件',
  `value` text COMMENT '变量值',
  `content` text COMMENT '变量字典数据',
  `rule` varchar(100) DEFAULT '' COMMENT '验证规则',
  `extend` varchar(255) DEFAULT '' COMMENT '扩展属性',
  `setting` varchar(255) DEFAULT '' COMMENT '配置',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='系统配置';

-- ----------------------------
-- Records of yc_config
-- ----------------------------
BEGIN;
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (1, 'name', 'basic', 'Site name', '请填写站点名称', 'string', '', 'YOUKE', '', 'required', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (2, 'beian', 'basic', 'Beian', '粤ICP备15000000号-1', 'string', '', '', '', '', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (3, 'cdnurl', 'basic', 'Cdn url', '如果全站静态资源使用第三方云储存请配置该值', 'string', '', '', '', '', '', '');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (4, 'version', 'basic', 'Version', '如果静态资源有变动请重新配置该值', 'string', '', '1.1.5', '', 'required', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (5, 'timezone', 'basic', 'Timezone', '', 'string', '', 'Asia/Shanghai', '', 'required', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (6, 'forbiddenip', 'basic', 'Forbidden ip', '一行一条记录', 'text', '', '', '', '', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (7, 'languages', 'basic', 'Languages', '', 'array', '', '{\"backend\":\"zh-cn\",\"frontend\":\"zh-cn\"}', '', 'required', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (8, 'fixedpage', 'basic', 'Fixed page', '请尽量输入左侧菜单栏存在的链接', 'string', '', 'dashboard', '', 'required', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (9, 'categorytype', 'dictionary', 'Category type', '', 'array', '', '{\"information\":\"同城分类\",\"merchant\":\"商户分类\"}', '', '', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (10, 'configgroup', 'dictionary', 'Config group', '', 'array', '', '{\"basic\":\"基础配置\",\"email\":\"邮件配置\",\"dictionary\":\"字典配置\",\"user\":\"会员配置\",\"wechat_pay\":\"微信支付配置\",\"mini_wechat\":\"微信小程序配置\",\"miniappSubscribeMessage\":\"小程序订阅消息模板\",\"qy_wechat\":\"企业微信配置\",\"qy_wechat_app1\":\"企业微信_微信客服\",\"alioss\":\"阿里云对象存储\",\"baidu_ai\":\"百度AI开放平台\",\"alisms\":\"阿里云短信平台\"}', '', '', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (11, 'mail_type', 'email', 'Mail type', '选择邮件发送方式', 'select', '', '1', '[\"请选择\",\"SMTP\"]', '', '', '');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (12, 'mail_smtp_host', 'email', 'Mail smtp host', '错误的配置发送邮件会导致服务器超时', 'string', '', 'smtp.qq.com', '', '', '', '');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (13, 'mail_smtp_port', 'email', 'Mail smtp port', '(不加密默认25,SSL默认465,TLS默认587)', 'string', '', '465', '', '', '', '');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (14, 'mail_smtp_user', 'email', 'Mail smtp user', '（填写完整用户名）', 'string', '', '10000', '', '', '', '');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (15, 'mail_smtp_pass', 'email', 'Mail smtp password', '（填写您的密码或授权码）', 'string', '', 'password', '', '', '', '');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (16, 'mail_verify_type', 'email', 'Mail vertify type', '（SMTP验证方式[推荐SSL]）', 'select', '', '2', '[\"无\",\"TLS\",\"SSL\"]', '', '', '');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (17, 'mail_from', 'email', 'Mail from', '', 'string', '', '10000@qq.com', '', '', '', '');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (18, 'attachmentcategory', 'dictionary', 'Attachment category', '', 'array', '', '{\"category1\":\"分类一\",\"category2\":\"分类二\",\"custom\":\"自定义\"}', '', '', '', NULL);
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (19, 'miniapp_appid', 'mini_wechat', 'APPID', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (20, 'miniapp_secret', 'mini_wechat', 'AppSecret', '', 'text', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (21, 'wechat_pay_mch_id', 'wechat_pay', '商户号', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (22, 'wechat_pay_key_v2', 'wechat_pay', '支付密钥V2', '', 'text', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (23, 'wechat_pay_cert_client', 'wechat_pay', 'cert_client证书', '', 'file', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (24, 'wechat_pay_cert_key', 'wechat_pay', 'cert_key证书', '', 'file', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (25, 'baseImgUrl', 'basic', '文件根域名', '', 'string', '', 'https://yktc.wangyunzhi.cn/', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (26, 'is_auto_approve', 'basic', '是否自动审核', '开启后发布的信息将自动审核通过', 'switch', '', '0', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (27, 'qy_wechat_corpid', 'qy_wechat', '企业ID', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (29, 'qy_wechat_app1_token', 'qy_wechat_app1', '企业应用TOKEN', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (30, 'qy_wechat_app1_encodingAESKey', 'qy_wechat_app1', '企业应用解密KEY', '', 'text', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (32, 'qy_wechat_app1_secret', 'qy_wechat_app1', '企业应用Secret', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (33, 'alioss_region', 'alioss', 'Bucket 域名', '', 'string', '', 'yktc-oss.ipv4net.com', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (34, 'alioss_accessKeyId', 'alioss', 'AccessKey ID', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (35, 'alioss_accessKeySecret', 'alioss', 'AccessKey Secret', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (36, 'alioss_city_value', 'alioss', 'OSS所在地域', '例如：cn-chengdu', 'string', '', 'cn-chengdu', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (37, 'alioss_roleArn', 'alioss', '角色策略ARN', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (38, 'alioss_bucket', 'alioss', 'Bucket 名称', '', 'string', '', 'yukuaitongcheng', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (39, 'baidu_ai_appid', 'baidu_ai', 'AppID', '', 'string', '', '26085514', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (40, 'baidu_ai_appKey', 'baidu_ai', 'API Key', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (41, 'baidu_ai_secretKey', 'baidu_ai', 'Secret Key', '', 'string', '', NULL, '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (42, 'alioss_sms_accessKeyId', 'alisms', 'AccessKey ID', '', 'string', '', NULL, NULL, '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (43, 'alioss_sms_accessKeySecret', 'alisms', 'AccessKey Secret', '', 'string', '', NULL, NULL, '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (44, 'alioss_sms_city_value', 'alisms', 'SMS所在地域', '例如：cn-chengdu', 'string', '', 'cn-chengdu', NULL, '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (45, 'miniSubMsg_information_approve', 'miniappSubscribeMessage', '信息发布审核模板', '', 'string', '', 'jgF8ePIJ8lAyxr546tDZtS831HuXQTx_Awrp-BzWzuA', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (46, 'miniSubMsg_community_approve', 'miniappSubscribeMessage', '小区申请审核模板', '', 'string', '', 'hi2eTTbIV8XUhbzVL4Wvql5YRXW6cYNSpUn85LMMFuw', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
INSERT INTO `yc_config` (`id`, `name`, `group`, `title`, `tip`, `type`, `visible`, `value`, `content`, `rule`, `extend`, `setting`) VALUES (47, 'user_sms_upper_limit', 'user', '用户每日频繁短信上限', '用户每日接收短信上限（仅评论等频繁发送）', 'number', '', '3', '', '', '', '{\"table\":\"\",\"conditions\":\"\",\"key\":\"\",\"value\":\"\"}');
COMMIT;

-- ----------------------------
-- Table structure for yc_ems
-- ----------------------------
DROP TABLE IF EXISTS `yc_ems`;
CREATE TABLE `yc_ems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) DEFAULT '' COMMENT '事件',
  `email` varchar(100) DEFAULT '' COMMENT '邮箱',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='邮箱验证码表';

-- ----------------------------
-- Records of yc_ems
-- ----------------------------
BEGIN;
INSERT INTO `yc_ems` (`id`, `event`, `email`, `code`, `times`, `ip`, `createtime`) VALUES (1, 'register', NULL, '4783', 0, '18.219.157.183', 1695036105);
COMMIT;

-- ----------------------------
-- Table structure for yc_goods
-- ----------------------------
DROP TABLE IF EXISTS `yc_goods`;
CREATE TABLE `yc_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `merchant_id` int(11) NOT NULL COMMENT '商户信息',
  `classif_id` int(11) NOT NULL COMMENT '商品分类',
  `bar_code` varchar(200) DEFAULT NULL COMMENT '商品条码',
  `title` varchar(100) NOT NULL COMMENT '商品名称',
  `company` varchar(10) DEFAULT NULL COMMENT '计量单位',
  `specs` varchar(100) NOT NULL COMMENT '商品规格',
  `storage_mode` varchar(100) DEFAULT NULL COMMENT '存储方式',
  `desc` mediumtext NOT NULL COMMENT '商品描述',
  `cover_images` mediumtext NOT NULL COMMENT '商品轮播',
  `details_content` mediumtext NOT NULL COMMENT '商品详情',
  `price` decimal(10,2) NOT NULL COMMENT '商品价格',
  `scr_price` decimal(10,2) DEFAULT NULL COMMENT '商品划线价',
  `keyword_tags` varchar(255) DEFAULT NULL COMMENT '商品关键词',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '商品权重',
  `shelf_life` varchar(100) DEFAULT NULL COMMENT '保质期限',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '商品状态:1=正常,0=下架',
  `stock` int(11) NOT NULL DEFAULT '100' COMMENT '商品库存',
  `sales_volume` int(11) NOT NULL DEFAULT '0' COMMENT '总销售数',
  `createtime` int(11) DEFAULT NULL COMMENT '上架时间',
  `deletetime` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COMMENT='商品管理';

-- ----------------------------
-- Records of yc_goods
-- ----------------------------
BEGIN;
INSERT INTO `yc_goods` (`id`, `merchant_id`, `classif_id`, `bar_code`, `title`, `company`, `specs`, `storage_mode`, `desc`, `cover_images`, `details_content`, `price`, `scr_price`, `keyword_tags`, `weigh`, `shelf_life`, `status`, `stock`, `sales_volume`, `createtime`, `deletetime`) VALUES (83, 1, 4, '', '燕京菠萝啤250ml', '瓶', '250ml/瓶', '', '菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤菠萝啤', 'https://yktc-oss.ipv4net.com/information/images/1651329987125136.png,https://yktc-oss.ipv4net.com/information/images/1651329987125136.png,https://yktc-oss.ipv4net.com/information/images/1651329987125136.png', '<p>菠萝啤菠萝啤<br></p><p><br></p><p>菠萝啤菠萝啤<b>菠萝啤菠萝啤菠萝啤</b><br></p>', 2.00, 0.00, '菠萝啤,啤酒,饮料', 83, '', '1', 100, 0, 1652949849, NULL);
INSERT INTO `yc_goods` (`id`, `merchant_id`, `classif_id`, `bar_code`, `title`, `company`, `specs`, `storage_mode`, `desc`, `cover_images`, `details_content`, `price`, `scr_price`, `keyword_tags`, `weigh`, `shelf_life`, `status`, `stock`, `sales_volume`, `createtime`, `deletetime`) VALUES (84, 1, 3, '', '喵喵脆小包', '袋', '250g/袋', '', '喵喵脆小包', 'https://yktc-oss.ipv4net.com/information/images/165119808202228.png,https://yktc-oss.ipv4net.com/information/images/165119808202228.png', '<p>喵喵脆小包喵喵脆小包喵喵脆小包喵喵脆小包喵喵脆小包<br></p>', 25.00, 0.00, '', 84, '', '1', 100, 0, 1653015239, NULL);
COMMIT;

-- ----------------------------
-- Table structure for yc_information
-- ----------------------------
DROP TABLE IF EXISTS `yc_information`;
CREATE TABLE `yc_information` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(11) NOT NULL COMMENT '发布者',
  `category_id` int(11) NOT NULL COMMENT '信息分类',
  `community_id` int(11) DEFAULT NULL COMMENT '发布小区',
  `title` varchar(100) NOT NULL COMMENT '信息标题',
  `substance` mediumtext NOT NULL COMMENT '信息内容',
  `images` mediumtext COMMENT '相关图片',
  `price` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单价',
  `cycle` int(1) NOT NULL DEFAULT '0' COMMENT '付款周期',
  `contact` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `status` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '发布状态:0=待审核,1=已发布,2=不通过,3=已下架',
  `status_msg` mediumtext COMMENT '审核结果',
  `weigh` int(11) DEFAULT NULL COMMENT '排序',
  `longitude` varchar(100) DEFAULT NULL COMMENT '发布者经度',
  `latitude` varchar(100) DEFAULT NULL COMMENT '发布者纬度',
  `is_thiscom` int(1) NOT NULL DEFAULT '0' COMMENT '仅小区可见:0=否,1=是',
  `look_num` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `createtime` int(11) NOT NULL COMMENT '创建时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='信息管理';

-- ----------------------------
-- Records of yc_information
-- ----------------------------
BEGIN;
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (1, 1, 16, 1, '渝快同城上线试运营啦', '畅游平潭’可向游客提供游前特色景点美食推荐、游后旅游心得快速分享，并且提供线上投诉通道，满足游客全面旅游需求，实现平潭开心游、放心游和省心游。” 福建腾蓝信息产业有限公司工作人员张华辉说。\r\n\r\n定制专属旅游计划、一键订房、智能语音解说、智能找厕所、移动餐车……如今，来岚游客只须通过一部手机，便可体验到涵盖吃、住、行、游、购、娱等方面的智能服务。\r\n\r\n打开“畅游平潭”App，智能景区、景点风光、台胞服务等版块应有尽有。在网红景点版块，游客还可直观了解平潭各处网红景点的简要介绍、开放时间等。谈及使用感受，游客张小姐直言自己对“直播”功能留下了深刻印象。“去海边旅游最担心碰上下雨天，如今通过‘直播’功能，可以实时观看景区情况，以防不时之需，既贴心又方便。”她说。\r\n\r\n值得一提的是，为了给游客最佳的游玩体验，“畅游平潭”还推出“智慧导览”功能模块，为景区绘制风格鲜明的手绘地图，补齐常规景区地图内缺乏的路线导航空白，为游客提供更加直观的景区内智能导览导航服务。\r\n\r\n张华辉说，作为福建省第一个全域落地实施的智慧文旅项目，“畅游平潭”全域智慧文旅平台将依托腾讯的平台优势，积极推进线上线下深度融合，让游客感受到“一部手机畅游平潭”的绝佳体验，轻松自由地“智游”平潭，助推平潭国际旅游岛建设。', '/uploads/20220418/1e3d0bee2f29fe75c4d746bf4d584c94.jpg,/uploads/20220418/9f05f601f0cf9251247c99ee77bcd997.jpg,/uploads/20220418/72b3b54a5a74d0c3a2bf34b75169a33c.jpg,/uploads/20220418/f35f48dc6d1289356f732471d6bd1d3c.jpg,/uploads/20220418/56f6701e1acc1a8eca2bd4b0575bba26.jpg', 0.00, 0, '17380287639', '2', '', 3, '106.57425979572295', '29.532681764428744', 0, 4691, 1650167962, 1651144862, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (2, 1, 16, 2, '关于本平台版权声明', '1.	用户发表并将其上传到本平台的任何内容，本平台在全世界范围内不限形式和载体地享有永久的、不可撤销的、免费的、非独家的使用权和转授权的权利，包括但不限于修改、复制、发行、展览、改编、汇编、出版、翻译、信息网络传播、广播、表演和再创作及著作权法等法律法规确定的其他权利。\r\n2.	本平台特有的标识、版面设计、编排方式等版权均属本平台享有，未经本平台许可，不得任意复制或转载。\r\n3.	用户从本平台的服务中获得的信息，未经本平台许可，不得任意复制或转载。\r\n4.	使用本平台的任何内容均应注明来源及署上作者姓名，按法律规定需要支付稿酬的，应当通知本平台及作者及支付稿酬，并独立承担一切法律责任。\r\n5.	本平台享有所有作品用于其它用途的使用权和优先权，包括但不限于网站、电子杂志、平面出版等，作者在本平台发布内容时视为同意本条款。\r\n6.	本平台所有内容仅代表作者自己的立场和观点，与本平台无关，由作者本人承担一切法律责任。\r\n7.	恶意转载本平台内容的，本平台保留将其诉诸法律的权利。', '', 0.00, 0, '17380287639', '2', '', 1, '106.572995', '29.530348', 0, 33, 1650175263, 1661345412, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (3, 1, 14, 5, '老男人一枚，有没有要的', '老男人一枚，有没有要的，随时带走', '/uploads/20220418/1e3d0bee2f29fe75c4d746bf4d584c94.jpg,/uploads/20220418/9f05f601f0cf9251247c99ee77bcd997.jpg', 0.00, 0, '17623616799', '1', '', 2, '106.490148', '29.540977', 0, 13, 1650214644, 1650348032, 1650348032);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (4, 1, 14, 3, '测试发布内容', '测试发布内容测试发布内容测试发布内容测试发布内容测试发布内容测试发布内容测试发布内容测试发布内容测试发布内容', '/uploads/20220419/2f3e430b41695493a4a4d47119eb6603.jpg,/uploads/20220419/5b604dab4e43ca976ec88a126b7640c0.png,/uploads/20220419/04914e311f809582874dcbac4030f81d.png', 0.00, 0, '17380287639', '1', '', 4, '106.56256', '29.52168', 0, 3, 1650346596, 1650348032, 1650348032);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (5, 1, 14, 3, '电饭锅9新出售', '电饭锅9新出售\n没有磕碰\n完全正常', '/uploads/20220419/5354274533e49d5811b49b62a346aee6.png', 0.00, 0, '17380287639', '0', NULL, 5, '106.56256', '29.52168', 0, 0, 1650346744, 1650348038, 1650348038);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (6, 1, 14, 3, '平台发布信息规范（必读）', '平台发布信息规范（必读）平台发布信息规范（必读）平台发布信息规范（必读）平台发布信息规范（必读）平台发布信息规范（必读）平台发布信息', 'https://yukuaitongcheng.oss-cn-chengdu.aliyuncs.com/information/images/1651122064530131.png,https://yukuaitongcheng.oss-cn-chengdu.aliyuncs.com/information/images/165112207352383.png', 0.00, 0, '123456', '2', '内容不符合社区规范', 6, '106.56256', '29.52168', 0, 15, 1650347088, 1690426629, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (7, 1, 16, 3, '平台发布信息规范（必读）', '平台发布信息规范（必读）平台发布信息规范（必读）平台发布信息规范（必读）平台发布信息规范（必读）', '/uploads/20220419/9ab7a1f5de2789de5ae5ad78e97e3af9.jpg', 0.00, 0, '17380287639', '0', NULL, 7, '106.56256', '29.52168', 0, 0, 1650347142, 1650348027, 1650348027);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (8, 1, 17, 3, '关于本平台隐私政策', '1.本平台不对外公开或向第三方提供单个用户的注册资料及用户在使用网络服务时存储在本平台的非公开内容，但下列情况除外：\r\n     (1) 事先获得用户的明确授权；\r\n     (2) 根据有关的法律法规要求；\r\n     (3) 按照相关政府部门的要求；\r\n     (4) 为维护社会公众的利益。\r\n2.本平台可能会与第三方合作向用户提供相关的网络服务，在此情况下，如该第三方同意承担与本社区同等的保护用户隐私的责任，则本平台有权将用户的注册资料等提供给该第三方。\r\n3.在不透露单个用户隐私资料的前提下，本社区有权对整个用户数据库进行分析并对用户数据库进行商业上的利用。', '', 0.00, 0, '17380287639', '0', '', 8, '106.56256', '29.52168', 0, 18, 1650347160, 1651128820, 1651128820);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (9, 1, 16, 3, '测试信息测试信息测试信息测试信息', '测试信息测试信息测试信息测试信息测试信息测试信息测试信息测试信息', '/uploads/20220419/9ab7a1f5de2789de5ae5ad78e97e3af9.jpg,/uploads/20220419/2f3e430b41695493a4a4d47119eb6603.jpg', 0.00, 0, '17380287639', '1', NULL, 9, '106.56256', '29.52168', 0, 3, 1650347242, 1650348040, 1650348040);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (10, 1, 14, 3, '没有使用过几次的手机，有想要的来拿', '价格1100\r\n自提\r\n一里南滨', '/uploads/20220419/cb3f8295da9b714bc218b443787c805d.jpg,/uploads/20220422/3197977c173a8d92073f3cb00463a63d.jpg', 0.00, 0, '17380287639', '1', '', 10, '106.58619737413', '29.536871473524', 0, 65, 1650347375, 1732211121, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (11, 1, 17, 3, '日你妈', '测试', '', 0.00, 0, '17380287639', '1', NULL, 11, '106.58611572266', '29.536862792969', 0, 0, 1650349522, 1650349539, 1650349539);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (12, 1, 18, 3, '是是是', '特3456书yuuo莞6543李zxcz蒜7782法fgnv级', '', 0.00, 0, '17380287639', '1', NULL, 12, '106.56256', '29.52168', 0, 0, 1650349941, 1650349956, 1650349956);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (13, 1, 14, 3, '测试测试测试测试', '测试测试测试测试', '', 0.00, 0, '17380287639', '1', NULL, 13, '106.56256', '29.52168', 0, 0, 1650352930, 1650353109, 1650353109);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (14, 1, 14, 3, '黑丝', '习大大走好黑丝恋童巨乳', '', 0.00, 0, '17380287639', '1', NULL, 14, '106.56256', '29.52168', 0, 0, 1650353088, 1650353108, 1650353108);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (15, 1, 14, 3, '测试', '测试测试测试测试', '', 0.00, 0, '17380287639', '0', NULL, 15, '106.56256', '29.52168', 0, 0, 1650353136, 1650978623, 1650978623);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (16, 1, 18, 3, '渝中区嫩芽餐厅99套餐特惠', '不多说，看图说话，99还是很划算了\r\n\r\n测试数据请勿当真', 'https://yktc.wangyunzhi.cn//uploads/20220421/2e2a347f6cae8814a5e8230a961c94ad.jpg,https://yktc.wangyunzhi.cn//uploads/20220426/6bc371cf75a2069f512dffd15db3ee0c.jpg', 0.00, 0, '17380287639', '1', '', 16, '106.56256', '29.52168', 0, 35, 1650535196, 1731698445, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (17, 1, 17, 2, '渝快同城上线咯', '渝快同城上线咯，这里可以发布任何信息哟，但是不能发布非法内容嗷，如有查实依法追责！', 'https://yktc.wangyunzhi.cn//uploads/20220422/f9d5c2bf37493c5bb8d17ce33bd43ea9.jpg,https://yktc.wangyunzhi.cn//uploads/20220422/bd425bb1bae6df0cee88322fc006e240.jpg,https://yktc.wangyunzhi.cn//uploads/20220426/8dfe4b687fc6ec53f51e89cef3008fde.png', 0.00, 0, '17380287639', '1', '', 17, '106.58619222005', '29.536944444444', 0, 414, 1650634893, 1731513822, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (18, 1, 19, 3, '陈八方的表情包分享', '只有丑的人才谈恋爱，我们美的卖空调', 'https://yktc-oss.ipv4net.com/information/images/165115009085941.png,https://yktc-oss.ipv4net.com/information/images/1651150091195136.png,https://yktc-oss.ipv4net.com/information/images/1651150091387139.png,https://yktc-oss.ipv4net.com/information/images/165115009176772.png,https://yktc-oss.ipv4net.com/information/images/1651150091963149.png,https://yktc-oss.ipv4net.com/information/images/165115009218668.png,https://yktc-oss.ipv4net.com/information/images/1651150092434144.png,https://yktc-oss.ipv4net.com/information/images/165115009263373.png,https://yktc-oss.ipv4net.com/information/images/165115009281915.png', 0.00, 0, '123456', '1', '数据不准确', 18, '106.57435763889', '29.531989474826', 0, 1285, 1650636426, 1731528082, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (19, 1, 14, 1, '华硕笔记本电脑XJ500', '用了好几年了\r\n\r\n1000提走\r\n\r\n测试数据', '/uploads/20220426/e49289e82fdb4f5009c858ca331eb78c.jpg,/uploads/20220426/f3a639369822b9e86ee7294a9f46fb4f.jpg', 0.00, 0, '17380287639', '1', '', 19, '106.57436035156', '29.531929253472', 0, 265, 1650986069, 1732306079, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (20, 1, 18, 3, '这绝对是重庆最好吃小龙虾 貅小龙虾拌面香掉头', '兴吃小龙虾的季节又来咯，这不立马就安排上这顿小龙\r\n虾了嘛然超人气的靓靓蒸虾，味道一如既往的好吃\r\n，\r\n- 口下去满满的虾肉，满足感爆棚嗷。\r\n『秘制卤虾\r\n这个卤虾真的是一绝哦②，一口下去回味无穷，卤香味\r\n十足学，虾肉的肉质很鲜嫩，而且超入味\r\n②蒜蓉龙虾\r\n蒜蓉加一切都好好吃（，龙虾自然也是不例外啦，蒜香\r\n味浓郁，龙虾肉吸满了蒜蓉汤汁，吃起来超带劲\r\n③靓靓蒸虾齂\r\n店内一大招牌，每一只龙虾都很大只②，品质很好，只\r\n只爆黄，吃到龙虾原本的鲜味，入口Q弹鲜甜哦\r\n门这一次还在他们家吃到了藤椒味的小龙虾、金味虾\r\n球、高压锅生蚝 和椒盐皮皮虾电，味道都超给力。\r\n）在重庆吃小龙虾真的是要认准靓靓蒸虾然，值得n\r\n刷\r\n°店铺：靓靓蒸虾•海鲜烧烤(江北店)\r\n合地址：洋河北路8号九鼎花园东门（九鼎花园公交站\r\n背后)八\r\n靓靓', '/uploads/20220427/a4e5eca06aa7f2b7188906e0cbe603b8.jpg,/uploads/20220427/01c79dd31cd7f6b5dab6385e94f9870a.jpg', 0.00, 0, '17380287639', '1', '', 20, '106.58619737413', '29.536941460503', 0, 215, 1651035619, 1731741010, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (21, 1, 18, 4, '20元实现樱桃自由?', '重庆的樱桃季又到了\r\n每年的必备活动\r\n百胜乌皮樱桃基地\r\n我们一般去山顶那家\r\n今年入园 30元一人\r\n带走 30元一斤\r\n因为我们每年都要去\r\n给我们算的 20元一人\r\n樱桃已经全部孰透了\r\n颜色乌红又大颗\r\n一把入口才过瘾G\r\n甜蜜蜜的，不带果酸了\r\n20块吃遍整片山的樱桃\r\n实现了樱桃自由品\r\n\r\n地址：鱼洞街道百胜村11号社', 'https://yktc.wangyunzhi.cn//uploads/20220427/250616a64a4d47bb0d383828d04ef1e2.jpg,https://yktc.wangyunzhi.cn//uploads/20220427/9dcce3e80ce1d7d38c7da0b251502e22.jpg,https://yktc.wangyunzhi.cn//uploads/20220427/473bdf89a8c5b2f499dcbb7710fee830.jpg,https://yktc.wangyunzhi.cn//uploads/20220427/07ed80442b23a044665583e76a057b63.jpg,https://yktc.wangyunzhi.cn//uploads/20220427/6e76cf10c4c73a5becff896df6b0c0ab.jpg', 0.00, 0, '17380287639', '1', '', 21, '106.58619222005', '29.536944444444', 0, 234, 1651035877, 1731528027, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (22, 1, 18, 3, '20元实现樱桃自由?', '重庆的樱桃季又到了\n每年的必备活动\n百胜乌皮樱桃基地\n我们一般去山顶那家\n今年入园 30元一人\n带走 30元一斤\n因为我们每年都要去\n给我们算的 20元一人\n樱桃已经全部孰透了\n颜色乌红又大颗\n一把入口才过瘾G\n甜蜜蜜的，不带果酸了\n20块吃遍整片山的樱桃\n实现了樱桃自由品', '', 0.00, 0, '17380287639', '0', NULL, 22, '106.58619737413', '29.536941460503', 0, 0, 1651035882, 1651035888, 1651035888);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (23, 1, 18, 5, '出手二手杨成一枚', '价格实惠，只要9.9，还包邮哦，赶快来抢不然就没了。', 'https://yktc.wangyunzhi.cn//uploads/20220427/5c434073b2f26916111d79761a033e97.jpg,https://yktc.wangyunzhi.cn//uploads/20220427/34eeb12d97c03eb348497a8a598f4afc.jpg,https://yktc.wangyunzhi.cn//uploads/20220427/e0a862c11ae269a8c0dc19111b3cc80d.jpg,https://yktc.wangyunzhi.cn//uploads/20220427/d3cf9347ca62b4d9ba599deda1e21db3.jpg,https://yktc.wangyunzhi.cn//uploads/20220427/b67afeb50569ed973a218dea7881bd14.jpg', 0.00, 0, '17623616799', '0', '图片过大，荷载过高，不允许通过', 23, '106.48998291016', '29.533543294271', 0, 1, 1651037855, 1651039269, 1651039269);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (24, 1, 17, 3, '测试阿里云OSS上传', '测试阿里云OSS上传测试阿里云OSS上传测试阿里云OSS上传\n\n测试阿里云OSS上传', 'https://yukuaitongcheng.oss-cn-chengdu.aliyuncs.com/images/165112130352860.png,https://yukuaitongcheng.oss-cn-chengdu.aliyuncs.com/images/1651121346073142.png,https://yukuaitongcheng.oss-cn-chengdu.aliyuncs.com/images/165112134613538.png,https://yukuaitongcheng.oss-cn-chengdu.aliyuncs.com/images/1651121346198114.png,https://yukuaitongcheng.oss-cn-chengdu.aliyuncs.com/images/165112134629919.png,https://yukuaitongcheng.oss-cn-chengdu.aliyuncs.com/images/1651121346417121.png', 0.00, 0, '17380287639', '0', NULL, 24, '106.56256', '29.52168', 0, 0, 1651121361, 1651123232, 1651123232);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (25, 1, 18, 3, '鸿恩寺公园风景特别好ꉂ ೭(˵¯̴͒ꇴ¯̴͒˵)౨”', '建议去看看', 'https://yktc-oss.ipv4net.com/information/images/165112302800923.png,https://yktc-oss.ipv4net.com/information/images/165112302815826.png,https://yktc-oss.ipv4net.com/information/images/1651123028213126.png,https://yktc-oss.ipv4net.com/information/images/1651123028264135.png,https://yktc-oss.ipv4net.com/information/images/165112302832514.png,https://yktc-oss.ipv4net.com/information/images/165112302837752.png,https://yktc-oss.ipv4net.com/information/images/165112302842560.png,https://yktc-oss.ipv4net.com/information/images/1651123028470133.png,https://yktc-oss.ipv4net.com/information/images/165112302851956.png', 0.00, 0, '17380287639', '1', '', 25, '106.5861593967', '29.536893174913', 0, 179, 1651123076, 1732203818, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (26, 1, 14, 1, '闲置小米蓝牙耳机air2，200带走', '几乎全新\r\n\r\n原价都是600多的\r\n\r\n需要的联系我', 'https://yktc-oss.ipv4net.com/information/images/165112739608044.png,https://yktc-oss.ipv4net.com/information/images/165112739593184.png,https://yktc-oss.ipv4net.com/information/images/1651127396126126.png,https://yktc-oss.ipv4net.com/information/images/1651127396174120.png', 0.00, 0, '17380287639', '1', '', 26, '106.5861585829', '29.53680202908', 0, 254, 1651127462, 1731698358, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (27, 1, 18, 3, '南山巴倒烫火锅', '南山巴倒烫火锅，这可能是我吃过最好的火锅了\r\n\r\n人均90左右，人多更实惠啦\r\n\r\n导航：重庆南坪南山陆派火锅火锅巴倒烫南山总店', 'https://yktc-oss.ipv4net.com/information/images/1651128385593114.png,https://yktc-oss.ipv4net.com/information/images/165112838616854.png,https://yktc-oss.ipv4net.com/information/images/1651128386331146.png', 0.00, 0, '17380287639', '1', '审核通过', 27, '106.56256', '29.52168', 0, 1286, 1651128557, 1731527994, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (28, 1, 17, 5, 'p图', '请把第一张图片里右下角的人p掉，谢谢！', 'https://yktc-oss.ipv4net.com/information/images/165113656307765.png,https://yktc-oss.ipv4net.com/information/images/1651136619763139.png', 0.00, 0, '17623616799', '2', '发布无效内容，不符合社区规范', 28, '106.48992214627', '29.534521755642', 0, 0, 1651136632, 1651154302, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (29, 1, 14, 5, '请把杨成卖掉', '你是不是要癫。。。?☺️??????♥(｡￫v￩｡)♥', 'https://yktc-oss.ipv4net.com/information/images/165113672455725.png,https://yktc-oss.ipv4net.com/information/images/165113672472476.png,https://yktc-oss.ipv4net.com/information/images/165113672476852.png,https://yktc-oss.ipv4net.com/information/images/165113672482747.png,https://yktc-oss.ipv4net.com/information/images/165113672487926.png,https://yktc-oss.ipv4net.com/information/images/1651136724933120.png,https://yktc-oss.ipv4net.com/information/images/165113672498616.png,https://yktc-oss.ipv4net.com/information/images/165113672506339.png,https://yktc-oss.ipv4net.com/information/images/16511367251239.png', 0.00, 0, '17623611111', '2', '未符合社区规范', 29, '106.48992214627', '29.534521755642', 0, 0, 1651136834, 1651326795, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (30, 1, 14, 3, '苹果笔记本', '直接看图9888元，无拆无修，无包装盒。', 'https://yktc-oss.ipv4net.com/information/images/165114012515557.png,https://yktc-oss.ipv4net.com/information/images/165114012715242.png,https://yktc-oss.ipv4net.com/information/images/165114012732922.png,https://yktc-oss.ipv4net.com/information/images/165114012746747.png,https://yktc-oss.ipv4net.com/information/images/1651140127600129.png,https://yktc-oss.ipv4net.com/information/images/165114012857336.png', 0.00, 0, '15683753191', '1', '审核通过', 52, '106.54065863715', '29.527205132378', 0, 380, 1651140148, 1732193389, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (31, 1, 17, 7, '吃货都是善良的，因为每天只想着吃，没时间去算计别人', '✨ ☁️\r\nℍ ˙Ⱉ˙ฅ\r\n开开心心，没有脑袋', 'https://yktc-oss.ipv4net.com/information/images/165114123317170.png,https://yktc-oss.ipv4net.com/information/images/165114123365280.png,https://yktc-oss.ipv4net.com/information/images/1651141357689143.png', 0.00, 0, '000000', '1', '', 30, '106.58653537326', '29.538561469184', 0, 59, 1651141365, 1731698316, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (32, 1, 17, 3, '1111', '11111', '', 0.00, 0, '17380287639', '1', NULL, 32, '106.56256', '29.52168', 0, 0, 1651143412, 1651143417, 1651143417);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (33, 1, 14, 3, '1111', '11111', '', 0.00, 0, '17380287639', '1', NULL, 33, '106.56256', '29.52168', 0, 0, 1651143652, 1651143658, 1651143658);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (34, 1, 16, 10, '平台上线试运营期间，暂免费置顶推广信息，请点击个人中心联系客服', '平台上线试运营期间，暂免费置顶推广信息，请点击个人中心联系客服\r\n\r\n温馨提示：目前仅接受二手闲置类目免费置顶推广', 'https://yktc.wangyunzhi.cn//uploads/20220428/f9d5c2bf37493c5bb8d17ce33bd43ea9.jpg,https://yktc.wangyunzhi.cn//uploads/20220428/0961537bbee582b29de34886acf1d678.jpg', 0.00, 0, '17380287639', '1', '', 31, '106.58596299913', '29.536738009983', 0, 151, 1651144637, 1731576808, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (35, 1, 14, 3, '色情什么什么', '低价色情片什么什么', '', 0.00, 0, '17380287639', '0', NULL, 35, '106.56256', '29.52168', 0, 0, 1651148499, 1651148507, 1651148507);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (36, 1, 19, 1, '一路风景', '我想踏实过日子，我比较浪漫，我想要很多爱。', 'https://yktc-oss.ipv4net.com/information/images/165115544232184.png,https://yktc-oss.ipv4net.com/information/images/1651155442757103.png,https://yktc-oss.ipv4net.com/information/images/1651155442856106.png,https://yktc-oss.ipv4net.com/information/images/1651155442944143.png,https://yktc-oss.ipv4net.com/information/images/165115544313561.png,https://yktc-oss.ipv4net.com/information/images/165115544319844.png', 0.00, 0, '19864083725', '1', '', 34, '106.57415608724', '29.532072211372', 0, 17, 1651155512, 1666419149, 1666419149);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (37, 1, 14, 3, '测试分享测试分享测试分享', '测试分享测试分享测试分享', '', 0.00, 0, '17380287639', '2', NULL, 37, '106.56256', '29.52168', 0, 0, 1651155926, 1651163900, 1651163900);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (38, 1, 19, 3, '测试', '测试数据', 'https://yktc-oss.ipv4net.com/information/images/1651164607121118.png,https://yktc-oss.ipv4net.com/information/images/165116460772610.png,https://yktc-oss.ipv4net.com/information/images/165116460806315.png,https://yktc-oss.ipv4net.com/information/images/1651164608377109.png,https://yktc-oss.ipv4net.com/information/images/165116460869688.png,https://yktc-oss.ipv4net.com/information/images/165116460899858.png,https://yktc-oss.ipv4net.com/information/images/165116460928680.png,https://yktc-oss.ipv4net.com/information/images/165116460956214.png,https://yktc-oss.ipv4net.com/information/images/1651164609909102.png', 0.00, 0, '17380287639', '1', NULL, 38, '106.57437635634', '29.531947157118', 0, 0, 1651164712, 1651164723, 1651164723);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (39, 1, 18, 5, '改变颜值，相亲，升职，改变气质颜值', '专业做美牙，保护原牙！采用最新国际流行的全瓷贴面美牙技术，修复牙黑，牙黄，大牙缝，牙齿残缺，四环素牙，以及牙齿全隐形矫正等等，', 'https://yktc-oss.ipv4net.com/information/images/16511942460354.png,https://yktc-oss.ipv4net.com/information/images/1651194246271120.png,https://yktc-oss.ipv4net.com/information/images/1651194246357105.png,https://yktc-oss.ipv4net.com/information/images/165119424648952.png,https://yktc-oss.ipv4net.com/information/images/165119424657068.png,https://yktc-oss.ipv4net.com/information/images/16511942466353.png,https://yktc-oss.ipv4net.com/information/images/1651194246728106.png,https://yktc-oss.ipv4net.com/information/images/165119424682552.png,https://yktc-oss.ipv4net.com/information/images/1651194246885124.png', 0.00, 0, '17347745166', '1', '', 36, '106.53343641493', '29.574941948785', 0, 421, 1651194284, 1731527790, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (40, 1, 18, 21, '海棠溪国瑞中心香港冰室158单人餐', '158元一人，到店任点任食\r\n\r\n香港冰室任点任食：\r\n\r\n周一至周五\r\n11:30-14:30,17:30-21:00\r\n\r\n下单方式：大众点评搜索 “香港冰室” 就有了，158价格最近才有，抓紧哟！', 'https://yktc-oss.ipv4net.com/information/images/165119808202228.png,https://yktc-oss.ipv4net.com/information/images/1651198082217119.png,https://yktc-oss.ipv4net.com/information/images/1651198082267117.png,https://yktc-oss.ipv4net.com/information/images/165119808231222.png,https://yktc-oss.ipv4net.com/information/images/1651198082358121.png', 0.00, 0, '！！！请前往大众点评下单！！！', '1', '', 46, '106.58615342882', '29.536952039931', 0, 307, 1651198087, 1732203792, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (41, 1, 17, 7, '测试发布', '测试发布测试发布测试发布测试发布', '', 0.00, 0, '17380287639', '1', NULL, 41, '106.56256', '29.52168', 0, 0, 1651203218, 1651203231, 1651203231);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (42, 1, 14, 14, '测试', '测试测试测试测试', '', 0.00, 0, '17380287639', '0', NULL, 42, '106.56256', '29.52168', 0, 0, 1651203441, 1651203464, 1651203464);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (43, 1, 14, 7, '测试', '测试测试测试测试', '', 0.00, 0, '17380287639', '0', NULL, 43, '106.56256', '29.52168', 0, 0, 1651203455, 1651203464, 1651203464);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (44, 1, 18, 23, '雅典汇食寨年代石锅土鲫鱼2-3人套餐69.9', '雅典汇食寨年代石锅土鲫鱼2-3人套餐69.9\r\n\r\n到店吃套餐\r\n\r\n•特色菜品\r\n\r\n士鲫鱼，网友推荐 TOP.1 商家招牌    3斤\r\n\r\n•配菜\r\n\r\n黑豆腐 网友推荐    一份\r\n\r\n魔芋网友推荐    一份\r\n\r\n`涼菜\r\n\r\n焾拌藕丁一份\r\n\r\n下单方式：美团搜索店铺名称下单\r\n\r\n导航地址：食寨年代石锅土鲫鱼（雅典汇店）', 'https://yktc-oss.ipv4net.com/information/images/165121054494333.png,https://yktc-oss.ipv4net.com/information/images/1651210545134126.png,https://yktc-oss.ipv4net.com/information/images/165121054518973.png,https://yktc-oss.ipv4net.com/information/images/16512105452388.png,https://yktc-oss.ipv4net.com/information/images/165121054528638.png,https://yktc-oss.ipv4net.com/information/images/1651210545338131.png', 0.00, 0, '请使用美团下单联系商家', '1', '', 39, '106.58600287543', '29.536896972656', 0, 204, 1651210828, 1731693507, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (45, 1, 14, 29, '测试测试测试测试', '测试测试测试测试', '', 0.00, 0, '17380287639', '1', '', 45, '106.56256', '29.52168', 0, 0, 1651254074, 1651255283, 1651255283);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (46, 1, 19, 29, '☘️爱在南山⛅️', '三月份的南山，留个纪念', 'https://yktc-oss.ipv4net.com/information/images/165125694518378.png,https://yktc-oss.ipv4net.com/information/images/165125694627146.png,https://yktc-oss.ipv4net.com/information/images/1651256946704100.png,https://yktc-oss.ipv4net.com/information/images/165125694764112.png,https://yktc-oss.ipv4net.com/information/images/1651256948284105.png,https://yktc-oss.ipv4net.com/information/images/1651256949228142.png', 0.00, 0, '对方不想让你联系他', '1', '', 40, '106.57438096788', '29.531959364149', 0, 20, 1651257060, 1732210341, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (47, 1, 18, 1, '一里南滨，芦荟小屋5.1节活动来了', '一里南滨，芦荟小屋5.1节活动来了，昭贵纯植物护肤品，补水，美白，祛痘，皮肤问题。\r\n\r\n详情欢迎客户宝宝进店咨询，也可以线上免费邮寄，微信18983300977\r\n\r\n地址：重庆市南岸区南坪东路一里南滨5栋', 'https://yktc-oss.ipv4net.com/information/images/165132054922985.png,https://yktc-oss.ipv4net.com/information/images/165132054977160.png,https://yktc-oss.ipv4net.com/information/images/165132054991928.png', 0.00, 0, '18983300977', '1', '', 47, '106.57441107856', '29.531947428385', 0, 203, 1651320567, 1731749066, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (48, 1, 22, 1, '一里南滨5栋菜鸟驿站便利店，菠萝啤2元一罐，满20送货上门哟', '菠萝啤 长得乖 又解渴 夏日清凉神器\r\n\r\n​解渴价2块一罐\r\n\r\n还有其他食品什么的，点击下方联系ta获取联系方式哟！\r\n\r\n送货上门满20起送，烟不单送', 'https://yktc-oss.ipv4net.com/information/images/1651329987125136.png,https://yktc-oss.ipv4net.com/information/images/165132998765858.png,https://yktc-oss.ipv4net.com/information/images/1651329988117148.png,https://yktc-oss.ipv4net.com/information/images/1651329988506111.png', 0.00, 0, '18623019905', '1', '', 50, '106.57437445747', '29.531918674045', 0, 153, 1651330072, 1731750978, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (49, 1, 20, 0, '线下活动板块内容发布规则', '1、线下活动组织与平台无关，请各位用户仔细甄别信息。\r\n\r\n2、平台不参与任何活动的组织及发起，平台仅提供信息的公布。\r\n\r\n3、禁止发布任何现行法律不允许的信息及活动。\r\n\r\n4、活动仅允许发布：组团团购、组团旅游等', '/uploads/20220430/0961537bbee582b29de34886acf1d678.jpg,/uploads/20220430/259744fcb9745e47a28d0dd7eb3ce4de.png', 0.00, 0, '投诉电话：17380287639', '1', '', 44, '106.572554', '29.532744', 0, 482, 1651331196, 1732197578, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (50, 2, 23, 1, '房东直租，一里南滨1300元/月，没有中介费，价格便宜', '房东直租，没有中介费，房租1300，一里南滨,，单间配套，价格便宜。\r\n\r\n联系电话15310416550', 'https://yktc-oss.ipv4net.com/information/images/165141265214041.png,https://yktc-oss.ipv4net.com/information/images/165141265249143.png,https://yktc-oss.ipv4net.com/information/images/1651412652753116.png,https://yktc-oss.ipv4net.com/information/images/165141265302052.png,https://yktc-oss.ipv4net.com/information/images/1651412653303116.png,https://yktc-oss.ipv4net.com/information/images/1651412665583131.png', 1300.00, 2, '15310416550', '1', '', 48, '106.57441053602', '29.53189046224', 0, 655, 1651412742, 1733141510, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (51, 1, 22, 21, '杨家坪蚝门海鲜自助烤肉79一位，生蚝不限量，肥的很', '杨家坪蚝门海鲜自助烤肉79一位，生蚝不限量，肥的很，生蚝也大个，不限量，冲冲冲\r\n\r\n?导航：杨家坪金鹰女人街蚝门自助\r\n\r\n?下单方式：大众点评搜索“蚝门”然后下单就行了\r\n\r\n最近数字人民币重庆有优惠，立减10元', 'https://yktc-oss.ipv4net.com/information/images/1651918891353122.png,https://yktc-oss.ipv4net.com/information/images/165191852255564.png,https://yktc-oss.ipv4net.com/information/images/1651918522594126.png,https://yktc-oss.ipv4net.com/information/images/165191852263626.png,https://yktc-oss.ipv4net.com/information/images/165191852267356.png,https://yktc-oss.ipv4net.com/information/images/165191852271872.png,https://yktc-oss.ipv4net.com/information/images/165191852275539.png,https://yktc-oss.ipv4net.com/information/images/165191852278362.png,https://yktc-oss.ipv4net.com/information/images/1651918522828127.png', 0.00, 0, '前往大众点评下单', '1', '', 53, '106.58596625434', '29.536798231337', 0, 219, 1651918609, 1731750976, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (52, 1, 18, 38, '渝中区太圣甲 甲鱼汤锅 120元4-5人餐', '看图说话，味道一流，现杀的甲鱼，现杀的，新鲜得很，甲鱼配鸽子简直巴适\r\n\r\n下单方式：大众点评搜索“太圣甲甲鱼汤锅”\r\n\r\n地址：渝中区虎威路94号（阿辉黔江鸡杂旁边）', 'https://yktc-oss.ipv4net.com/information/images/1652002872439108.png,https://yktc-oss.ipv4net.com/information/images/165200287298179.png,https://yktc-oss.ipv4net.com/information/images/1652002873097136.png,https://yktc-oss.ipv4net.com/information/images/165200287320651.png,https://yktc-oss.ipv4net.com/information/images/165200287334944.png,https://yktc-oss.ipv4net.com/information/images/165200287346366.png', 0.00, 0, '大众点评搜索“太圣甲甲', '1', '', 54, '106.51182698568', '29.536210394965', 0, 481, 1652002899, 1731698191, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (53, 1, 19, 1, '你今天吃了什么？', '是否有东西让你吃起来回味？', 'https://yktc-oss.ipv4net.com/information/images/165215085822330.png,https://yktc-oss.ipv4net.com/information/images/1652150875972114.png', 0.00, 0, '19864083725', '1', '', 49, '106.57423990885', '29.531983778212', 0, 245, 1652150932, 1731698276, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (54, 1, 19, 1, '3-4个月的小猫咪，免费送，只不过没有打疫苗', '3-4个月的小猫咪，免费送，只不过没有打疫苗\r\n\r\n哑子喜欢聋子，\r\n聋子不喜欢哑子。\r\n瞎子喜欢哑子，\r\n最后哑子跟瞎子在一起了，\r\n但是在一起期间他们没有并没有快乐。\r\n哑子开不了口说话，\r\n他永远也不会用行动去爱瞎子。\r\n瞎子看不见所有东西，\r\n但会用一些证明来爱哑子。', 'https://yktc-oss.ipv4net.com/information/images/165226988791823.png,https://yktc-oss.ipv4net.com/information/images/165226989053316.png,https://yktc-oss.ipv4net.com/information/images/1652269891823138.png', 0.00, 0, '19864083725', '1', '', 54, '106.574113227', '29.532062174479', 0, 249, 1652270399, 1731767981, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (55, 1, 19, 1, '开始你就特别', '时间会让我们明白恋爱和爱情不一样。', 'https://yktc-oss.ipv4net.com/information/images/165275012608129.png,https://yktc-oss.ipv4net.com/information/images/165275012713589.png,https://yktc-oss.ipv4net.com/information/images/165275012788625.png,https://yktc-oss.ipv4net.com/information/images/165275012856696.png,https://yktc-oss.ipv4net.com/information/images/165275012927635.png', 0.00, 0, '19864083725', '1', '', 51, '106.57415500217', '29.531896701389', 0, 154, 1652750170, 1666419144, 1666419144);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (56, 17, 23, 11, '巴南区 龙洲湾 房屋出租', '近轻轨站拎包入住 家电齐全需要的滴滴', 'https://yktc-oss.ipv4net.com/information/images/1652780508224149.png,https://yktc-oss.ipv4net.com/information/images/1652780508445114.png,https://yktc-oss.ipv4net.com/information/images/165278050854874.png,https://yktc-oss.ipv4net.com/information/images/165278050860181.png,https://yktc-oss.ipv4net.com/information/images/165278050868846.png,https://yktc-oss.ipv4net.com/information/images/1652780508890149.png', 0.00, 5, '13368023708', '1', '房屋情况不完整，请完善相关价格及户型，以便平台推广', 56, '106.54350423177', '29.402668457031', 0, 378, 1652780538, 1733140872, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (57, 1, 23, 17, '南坪香弥山2号二室二厅二卫1550', '二室二厅二卫跃层精装修，空调，洗衣机，电视，冰箱全套1550', 'https://yktc-oss.ipv4net.com/information/images/1652948763657111.png,https://yktc-oss.ipv4net.com/information/images/16529487643983.png,https://yktc-oss.ipv4net.com/information/images/165294876547853.png,https://yktc-oss.ipv4net.com/information/images/1652948766955148.png,https://yktc-oss.ipv4net.com/information/images/165294876834871.png,https://yktc-oss.ipv4net.com/information/images/165294876957757.png', 1550.00, 2, '15683753191', '1', '', 57, '106.54963161892', '29.532259114583', 0, 317, 1652948829, 1732211137, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (58, 1, 18, 31, '逃离地表', '沉浸式酒馆', 'https://yktc-oss.ipv4net.com/information/images/16533269459316.png,https://yktc-oss.ipv4net.com/information/images/165332694784350.png,https://yktc-oss.ipv4net.com/information/images/165332694798599.png,https://yktc-oss.ipv4net.com/information/images/165332694817188.png,https://yktc-oss.ipv4net.com/information/images/1653326948325116.png,https://yktc-oss.ipv4net.com/information/images/1653326948445128.png,https://yktc-oss.ipv4net.com/information/images/16533269485673.png,https://yktc-oss.ipv4net.com/information/images/165332694868538.png', 0.00, 0, '19864083725', '1', '', 58, '106.56297471788', '29.528179796007', 0, 674, 1653326963, 1666419125, 1666419125);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (59, 1, 17, 1, '寻狗启事', '大家可以都关注一下', 'https://yktc-oss.ipv4net.com/information/images/165333435396232.png,https://yktc-oss.ipv4net.com/information/images/1653334704068141.png', 0.00, 0, '19864083725', '1', '', 59, '106.57414008247', '29.532019042969', 0, 456, 1653334714, 1666419131, 1666419131);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (60, 1, 14, 1, '真我手机Q2，6GB+126GB', '真我Q2，6GB+126GB，冲浪蓝孩，全通5G，有需要联系，同城优先 \r\n功能一切正常，打游戏完全流畅，轻微外壳划痕，换苹果了暂时不用了，有需要的朋友可以来联系。', 'https://yktc-oss.ipv4net.com/information/images/165355075811562.png,https://yktc-oss.ipv4net.com/information/images/16535507588655.png,https://yktc-oss.ipv4net.com/information/images/165355075921275.png', 0.00, 0, '19864083725', '1', '', 60, '106.57406222873', '29.532065972222', 0, 605, 1653550761, 1666419116, 1666419116);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (61, 1, 18, 1, '享哆味', '59.9的优惠活动', 'https://yktc-oss.ipv4net.com/information/images/165570030925946.png,https://yktc-oss.ipv4net.com/information/images/165570031019641.png', 0.00, 0, '19864083725', '1', NULL, 61, '106.57401312934', '29.531934136285', 0, 4, 1655700370, 1666419120, 1666419120);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (62, 1, 18, 1, '飞机票', '最近作者发现飞机票好优惠，打工人也有梦想，想要环游世界，这几个月，想要去旅游的小伙伴可以安排上哦。', 'https://yktc-oss.ipv4net.com/information/images/165785430617367.png,https://yktc-oss.ipv4net.com/information/images/165785442877289.png', 0.00, 0, '19864083725', '1', NULL, 62, '106.5740242513', '29.531960177951', 0, 82, 1657854430, 1732215839, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (63, 1, 19, 21, '海风，椰林，沙滩', '位置∶广东湛江', 'https://yktc-oss.ipv4net.com/information/images/1658460032287131.png,https://yktc-oss.ipv4net.com/information/images/1658460033685107.png,https://yktc-oss.ipv4net.com/information/images/165846003491449.png,https://yktc-oss.ipv4net.com/information/images/165846003541623.png,https://yktc-oss.ipv4net.com/information/images/165846003640753.png,https://yktc-oss.ipv4net.com/information/images/165846003753231.png,https://yktc-oss.ipv4net.com/information/images/165846003819816.png,https://yktc-oss.ipv4net.com/information/images/165846003830975.png,https://yktc-oss.ipv4net.com/information/images/1658460038921120.png', 0.00, 0, '17380287639', '1', '', 63, '106.58673963759', '29.536743977865', 0, 981, 1658460090, 1732215837, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (64, 1, 19, 31, '泰兰德的夏天永不停歇', '泰兰德之旅', 'https://yktc-oss.ipv4net.com/information/images/1731528214305124.png,https://yktc-oss.ipv4net.com/information/images/17315282144573.png,https://yktc-oss.ipv4net.com/information/images/173152821459140.png,https://yktc-oss.ipv4net.com/information/images/173152821472947.png,https://yktc-oss.ipv4net.com/information/images/173152821484583.png,https://yktc-oss.ipv4net.com/information/images/1731528214978106.png,https://yktc-oss.ipv4net.com/information/images/1731528215117133.png,https://yktc-oss.ipv4net.com/information/images/173152821523391.png', 0.00, 0, '17380287639', '1', '', 64, '106.57996609158', '29.531644151476', 0, 49, 1731528291, 1732296423, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (65, 2, 14, 18, '毛泽东是傻逼', '毛泽东设备', '', 0.00, 0, '17380287639', '2', '内容包含违法违规或政治敏感内容，不予通过', 65, '106.57996609158', '29.531644151476', 0, 2, 1731558065, 1731558141, 1731558141);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (66, 2, 19, 0, '🇹🇭 泰兰德的芭提雅', '🛩️报团出国千万不要，坑死人的，虽然景色和玩的还不错，但是带你去购物店🛍️就很恶心了', 'https://yktc-oss.ipv4net.com/information/images/173155890771643.png,https://yktc-oss.ipv4net.com/information/images/1731558907891113.png,https://yktc-oss.ipv4net.com/information/images/1731558908035119.png,https://yktc-oss.ipv4net.com/information/images/1731558908163113.png,https://yktc-oss.ipv4net.com/information/images/1731558908275148.png,https://yktc-oss.ipv4net.com/information/images/173155890841994.png', 0.00, 0, '17380287639', '1', '', 66, '106.57996609158', '29.531644151476', 0, 85, 1731559096, 1732203751, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (67, 15, 14, 41, '今日犹存免费成人网站', '没吃过好东西生奸内射的玩意儿，那现在怎么办', 'https://yktc-oss.ipv4net.com/information/images/173157852881921.png,https://yktc-oss.ipv4net.com/information/images/1731578617960129.png', 0.00, 0, '13416472917', '0', NULL, 67, '113.325505', '23.099438', 0, 0, 1731578713, 1731578740, 1731578740);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (68, 2, 14, 18, '🐱找合适的主人（200元）', '新接回家的🐱，原住民不愿意在一起，一直干架，两只猫目前适应不了，如果再有一段时间还不行就找个人接手了\r\n\r\n注意：建议一个猫都没有的家庭，不然两只🐱会干架！', 'https://yktc-oss.ipv4net.com/information/images/173175287894045.png,https://yktc-oss.ipv4net.com/information/images/173175289192750.png', 200.00, 0, '17380287639', '3', '', 68, '106.57996609158', '29.531644151476', 0, 2072, 1731696827, 1732210184, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (69, 16, 18, 0, '🛒（重庆版胖东来）南坪万达永辉重新开业啦🥬', '关停调改一个月之后的永辉学习胖东来模式又又又开业咯，去看了一下，全是人！人山人海', 'https://yktc-oss.ipv4net.com/information/images/173169858837761.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90,https://yktc-oss.ipv4net.com/information/images/173169858864743.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90,https://yktc-oss.ipv4net.com/information/images/17316985903989.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90,https://yktc-oss.ipv4net.com/information/images/17316985908642.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90,https://yktc-oss.ipv4net.com/information/images/1731698591974125.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90,https://yktc-oss.ipv4net.com/information/images/173169859286841.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90,https://yktc-oss.ipv4net.com/information/images/173169859306175.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90,https://yktc-oss.ipv4net.com/information/images/173169859441362.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90,https://yktc-oss.ipv4net.com/information/images/173169859498659.png?x-oss-process=image/resize,m_fill,w_800,quality,q_90', 0.00, 0, '17723084280', '1', '', 69, '106.58012288411', '29.531725531684', 0, 6, 1731698784, 1731699205, 1731699205);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (70, 16, 19, 18, '💐三周年快乐', '三年时光匆匆，但爱你的心从未改变❤️', 'https://yktc-oss.ipv4net.com/information/images/1731746050063125.png,https://yktc-oss.ipv4net.com/information/images/173174605018749.png,https://yktc-oss.ipv4net.com/information/images/173174605032431.png,https://yktc-oss.ipv4net.com/information/images/173174605044616.png,https://yktc-oss.ipv4net.com/information/images/173174605058585.png,https://yktc-oss.ipv4net.com/information/images/173174605071937.png', 0.00, 0, '17380287639', '1', '', 70, '106.57996609158', '29.531644151476', 0, 20, 1731746128, 1732215807, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (71, 2, 19, 18, '🌠 晚上啦，又饿啦～', '结束战斗，今晚我是自由的小鸟', 'https://yktc-oss.ipv4net.com/information/images/17317811408439.png,https://yktc-oss.ipv4net.com/information/images/173178114099358.png,https://yktc-oss.ipv4net.com/information/images/173178114112433.png,https://yktc-oss.ipv4net.com/information/images/173178114124881.png,https://yktc-oss.ipv4net.com/information/images/173178114138545.png,https://yktc-oss.ipv4net.com/information/images/1731781141536119.png', 0.00, 0, '17380287639', '1', NULL, 71, '106.58003607856', '29.531602918837', 0, 33, 1731781301, 1732215820, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (72, 22, 20, 18, '2024季度活动结束啦🔚', '烧烤➕🍺绝配', 'https://yktc-oss.ipv4net.com/information/images/173221060890133.png,https://yktc-oss.ipv4net.com/information/images/1732210609023131.png,https://yktc-oss.ipv4net.com/information/images/1732210609138109.png,https://yktc-oss.ipv4net.com/information/images/173221060926029.png,https://yktc-oss.ipv4net.com/information/images/1732210609386137.png,https://yktc-oss.ipv4net.com/information/images/173221060948289.png', 0.00, 0, '17380287639', '1', '', 72, '106.57997992622', '29.531635742188', 0, 19, 1732210614, 1732296418, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (73, 17, 19, 18, '关于南京鸭血粉丝汤和🍕的搭配', '🍕和粉丝汤的💥', 'https://yktc-oss.ipv4net.com/information/images/1732210703416135.png,https://yktc-oss.ipv4net.com/information/images/173221070352383.png,https://yktc-oss.ipv4net.com/information/images/1732210703637149.png', 0.00, 0, '17380287639', '1', '', 73, '106.57997992622', '29.531635742188', 0, 7, 1732210706, 1732293601, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (74, 1, 19, 18, '故宫与凉亭', '💡', 'https://yktc-oss.ipv4net.com/information/images/173221075018463.png,https://yktc-oss.ipv4net.com/information/images/1732210750346113.png,https://yktc-oss.ipv4net.com/information/images/1732210750461109.png', 0.00, 0, '17380287639', '1', '', 74, '106.57997992622', '29.531635742188', 0, 14, 1732210787, 1732268146, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (75, 16, 19, 18, '🇰🇷济州岛的🛩️', '韩国（济州岛）七日游结束咯，留个纪念咯', 'https://yktc-oss.ipv4net.com/information/images/173221082578319.png,https://yktc-oss.ipv4net.com/information/images/173221082590134.png,https://yktc-oss.ipv4net.com/information/images/1732210825994138.png,https://yktc-oss.ipv4net.com/information/images/1732210826106124.png,https://yktc-oss.ipv4net.com/information/images/173221082623334.png,https://yktc-oss.ipv4net.com/information/images/1732210826367128.png,https://yktc-oss.ipv4net.com/information/images/173221082648128.png,https://yktc-oss.ipv4net.com/information/images/173221082659363.png', 0.00, 0, '17380287639', '1', '', 75, '106.57997992622', '29.531635742188', 0, 55, 1732210879, 1732295561, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (76, 1, 16, 0, '今日小雪丨玉气飘逸揽风华 迎冬藏物小雪至', '2024年11月22日\r\n（农历甲辰年十月廿二日）\r\n3时56分迎节气“小雪”\r\n气寒将雪，地寒未甚\r\n温养内守，以待日光\r\n\r\n\r\n小雪·三候\r\n一候 虹藏不见\r\n气候干冷，彩虹匿迹\r\n二候 天气上升地气下降\r\n阴阳不交，生机殆尽\r\n三候 闭塞而成冬\r\n天地闭塞，严冬将至', 'https://yktc-oss.ipv4net.com/information/images/1732268704052129.png,https://yktc-oss.ipv4net.com/information/images/1732268704277113.png', 0.00, 0, '17380287639', '1', '', 76, '106.58003146701', '29.531625434028', 0, 109, 1732268772, 1732296410, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (77, 1, 28, 54, '重庆花火垂钓园放福利咯~', '周六小福利来咯\r\n\r\n11/22日 周五下午六点封塘 放湘鲫500-600斤\r\n\r\n11/23日周六早上7点抽顺序号开钓，7点以后随到随钓，38/12小时。\r\n\r\n550斤湘鲫已下塘 11/23日周六早上7点抽顺序号开钓，7点以后随到随钓，38/12小时。\r\n\r\n23日周六中午12点抽奖送出土鸡2只，牛皮饵料5包，可乐10瓶，一共17个中奖名额，一个钓费一次抽奖机会，12点以前来就可以抽奖。\r\n\r\n地址：导航重庆花火垂钓园', 'https://yktc-oss.ipv4net.com/information/images/173229195753317.png,https://yktc-oss.ipv4net.com/information/images/173229195921644.png', 0.00, 0, '17380287610', '1', '', 77, '106.562561', '29.521681', 0, 330, 1732292015, 1732946627, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (78, 1, 29, 0, '四川盆地又增添一储量超千亿立方米的大型气田', '央视网消息：记者11月21日从中国石化获悉，位于四川盆地的通南巴气田新增天然气探明地质储量551.59亿立方米，累计提交天然气探明地质储量达到1066亿立方米，标志着四川盆地又增添了一个储量超千亿立方米的大型气田。\r\n\r\n通南巴气田位于四川省巴中市，发现天然气气藏埋深3500米至5500米，是典型的深层-超深层致密砂岩气藏，构造复杂、储层薄、岩性致密，勘探开发难度大。\r\n\r\n针对复杂构造区致密砂岩前期测试产量低、储量动用难度大的问题，技术人员加快工程工艺迭代升级，攻关大规模体积压裂技术，不断优化工程参数和施工程序，持续探索大斜度井和水平井钻探，单井测试日产量从早期3万立方米逐步增加到最高超30万立方米。\r\n\r\n目前，中国石化在四川盆地探明天然气地质储量近3万亿立方米，年产达到260亿立方米，累计生产天然气超2000亿立方米。', 'https://yktc-oss.ipv4net.com/information/images/173229782569148.png', 0.00, 0, '17380287639', '1', '', 78, '106.56256103516', '29.521680831909', 0, 9, 1732297829, 1732297858, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (79, 1, 29, 0, '“决战椰树之巅” 攀椰竞速首次列入这个运动会', '攀椰竞速，源自海南岛上群众爬树摘椰子的生活劳作场景，经过不断发展和推广，这一项目首次被列为全国少数民族传统体育运动会的正式比赛项目。届时，将有来自11支队伍的59名队员参加今年的比赛，比赛日期为11月23至24日两天。\r\n\r\n攀椰竞速比赛场地，设在西南大学三亚中学的操场，昨天下午是各支队伍赛前最后一次适应正式比赛的场地和比赛用具。\r\n\r\n只见队员两三个箭步冲刺到赛场上的仿真椰子树下，轻快一跳，双手和双脚紧扒住树干，手脚一齐发力，速度快的队员仅用几秒钟的时间便已到达“椰树之巅”。轻轻一拍计时牌就完成了比赛，过程充满了趣味性和观赏性。攀椰竞速关键在于起跑和攀爬的节奏，考验的是队员的攀爬技巧，体能耐力和核心力量。\r\n\r\n从2008年起，攀椰竞速被列为海南黎族苗族传统节日“三月三”节庆活动的体育比赛项目，2010年，该项目被列为海南省少数民族传统体育运动会的正式比赛项目。直到2024年，攀椰竞速被首次列为第十二届全国少数民族传统体育运动会的正式竞赛项目。\r\n\r\n攀椰竞速设立男子攀椰9米竞速和女子攀椰7米竞速两个项目，比赛要求运动员使用统一提供的攀椰运动用具，快速地攀爬至椰树顶部并按下计时器，用时短者获胜。', 'https://yktc-oss.ipv4net.com/information/images/173229840592436.jpg', 0.00, 0, '17380287639', '1', '', 79, '106.56256103516', '29.521680831909', 0, 23, 1732298411, 1732306066, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (80, 1, 28, 0, '重庆沙坪坝区沙滨路不文明垂钓曝光', '重庆市沙坪坝区沙滨路沙滨城市小区对面河边，长期有大量的人，用十几根鱼竿在嘉陵江钓鱼，已经超过休闲垂钓，\r\n\r\n内容来源于：重庆问政平台', 'https://yktc-oss.ipv4net.com/information/images/1732298557389131.jpg,https://yktc-oss.ipv4net.com/information/images/1732298559479149.jpg', 0.00, 0, '17380287639', '1', '', 80, '106.56256103516', '29.521680831909', 0, 13, 1732298571, 1732298827, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (81, 22, 22, 61, '渝北光环三虾行送200无门槛酒水券', '渝北光环三虾行烧烤开业钜惠，免费注册会员享受无门槛酒水券200元；\r\n\r\n搜索小程序“三虾行餐饮”注册会员后即可免费获得200元无门槛酒水券，全店酒水任意畅享！', 'https://yktc-oss.ipv4net.com/information/images/173229905881749.jpg,https://yktc-oss.ipv4net.com/information/images/173229906331957.jpg,https://yktc-oss.ipv4net.com/information/images/17322990893014.png', 0.00, 0, '17380287639', '1', '', 81, '106.529182', '29.650089', 0, 69, 1732299152, 1732819016, NULL);
INSERT INTO `yc_information` (`id`, `user_id`, `category_id`, `community_id`, `title`, `substance`, `images`, `price`, `cycle`, `contact`, `status`, `status_msg`, `weigh`, `longitude`, `latitude`, `is_thiscom`, `look_num`, `createtime`, `updatetime`, `deletetime`) VALUES (82, 1, 22, 61, '渝北光环三虾行广式打边炉即将上线', '冬季严寒，围炉而食，三虾行餐饮应季特别推出广式打边炉特色美食！\r\n\r\n对广式打边炉而言，“真功夫”在锅里，广东人重汤头，打边炉自然也以上好高汤为底，加入各式食材入味。根据时令变化，广东人还喜好搭配各类药膳入锅。\r\n\r\n“打边炉”是广州人吃的艺术之一，外省有类似的火锅菜，但“打边炉”与一般的所谓“火锅”不同。火锅是坐下来吃的，而“打边炉”是站着吃的；火锅用金属器具，中间烧木炭，“打边炉”是用瓦罉，“打边炉”的筷子也是竹制的，而且特别长，约比普通筷子长一倍，便于站立涮食。另有一番情趣。\r\n\r\n打边炉实际为打甂炉，是一道色香味俱全的名肴，属于粤菜系。广式火锅。主要食材是生鱼片、鱿鱼片、生虾片等。主要烹饪工艺是煮。\r\n\r\n🦐菜品特色🦐\r\n\r\n广州人称火锅为“打甂炉”〔经常有人写错为“边”，但是古汉语词典上是“甂”读bian 一声〕。虽然没有重庆人那么嗜爱火锅，但是在美食上相当兼容并蓄的港人对于火锅也是很中意的，日式、台式、川式各种火锅在这里都有一席之地，当然他们觉得还是自己的港式火锅最耐吃。港式火锅有点类似我们这边的砂锅，注重汤底的鲜香，有各色配好料的锅底，从菜单上看起来就是色彩缤纷的。在涮菜上跟豆捞的涮菜比较类似，制作精细，除了海鲜和牛羊肉还有各色丸子，很丰富。\r\n\r\n欢迎各位客官随时到店品鉴！\r\n\r\n导航：重庆光环三虾行铁板烧烤（点击下方可直接导航）', '/uploads/20241123/456b0cccacbbc13f782a5660e8f2685b.png,https://yktc-oss.ipv4net.com/information/images/1732366984266118.jpg,https://yktc-oss.ipv4net.com/information/images/1732366988313106.jpg', 0.00, 0, '17380287610', '1', '', 82, '106.530903', '29.651013', 0, 10089, 1732367296, 1733140855, NULL);
COMMIT;

-- ----------------------------
-- Table structure for yc_merchant
-- ----------------------------
DROP TABLE IF EXISTS `yc_merchant`;
CREATE TABLE `yc_merchant` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商户ID',
  `category_id` int(11) NOT NULL COMMENT '商户类别',
  `user_id` int(11) NOT NULL COMMENT '绑定用户',
  `mer_name` varchar(100) NOT NULL COMMENT '商户名称',
  `mer_avatar_image` varchar(255) NOT NULL COMMENT '商户头像',
  `mer_bg_image` varchar(255) DEFAULT NULL COMMENT '商户背景',
  `mer_address` varchar(200) NOT NULL COMMENT '商户地址',
  `mer_longitude` varchar(100) NOT NULL COMMENT '商家经度',
  `mer_latitude` varchar(100) NOT NULL COMMENT '商家纬度',
  `mer_phone` varchar(100) NOT NULL COMMENT '商户电话',
  `mer_password` varchar(100) DEFAULT NULL COMMENT '商户密码',
  `mer_saf_pass` varchar(100) DEFAULT NULL COMMENT '商户安全码',
  `is_business` enum('1','0') NOT NULL COMMENT '是否营业:1=营业中,2=打烊',
  `sales_daterange` varchar(100) DEFAULT NULL COMMENT '营业时间',
  `distribution_mode` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '配送方式:1=仅自提,2=送货上门,3=兼并',
  `sales_scope` int(11) DEFAULT NULL COMMENT '销售范围(KM)',
  `sales_volume` int(11) NOT NULL DEFAULT '0' COMMENT '总销售数',
  `sales_amount` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '总销售额',
  `status` enum('0','1','2','3') NOT NULL DEFAULT '0' COMMENT '商户状态:0=待审核,1=正常,2=不通过,3=冻结',
  `status_msg` varchar(100) DEFAULT NULL COMMENT '状态描述',
  `mer_notice` varchar(255) DEFAULT NULL COMMENT '商户公告',
  `createtime` int(11) NOT NULL COMMENT '入驻时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COMMENT='商户管理';

-- ----------------------------
-- Records of yc_merchant
-- ----------------------------
BEGIN;
INSERT INTO `yc_merchant` (`id`, `category_id`, `user_id`, `mer_name`, `mer_avatar_image`, `mer_bg_image`, `mer_address`, `mer_longitude`, `mer_latitude`, `mer_phone`, `mer_password`, `mer_saf_pass`, `is_business`, `sales_daterange`, `distribution_mode`, `sales_scope`, `sales_volume`, `sales_amount`, `status`, `status_msg`, `mer_notice`, `createtime`) VALUES (1, 26, 17, '翻斗小区便利店', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTI3T3ljicuzurGH9AOVb5YAPmwic2qJqgLUHkoKPx2fM2SXRJKITmKSV2OMsxsS5zAuuWtpHeOmqdwQ/132', 'http://yktc.wangyunzhi.cn/uploads/20220416/606192725820e51f66d13bb061794df3.png', '重庆市南岸区南坪东路56号', '106.574083', '29.531815', '17380287639', '', '', '1', '', '1', 3, 0, 0.00, '1', '', '本店为线上下单线下核销，请下单后在24小时内前往门店进行消费，超时将自动退款！', 0);
COMMIT;

-- ----------------------------
-- Table structure for yc_message
-- ----------------------------
DROP TABLE IF EXISTS `yc_message`;
CREATE TABLE `yc_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `type` enum('1','2','3','4','0') NOT NULL DEFAULT '1' COMMENT '消息类型:1=系统消息,2=推广消息,3=评论通知,0=其他消息',
  `send_user` int(11) NOT NULL DEFAULT '0' COMMENT '发送人',
  `receive_user` int(11) NOT NULL COMMENT '接收者',
  `title` varchar(100) NOT NULL COMMENT '信息标题',
  `content` mediumtext COMMENT '消息内容',
  `jump_type` enum('0','1','2') NOT NULL COMMENT '跳转方式:0=不跳转,1=内部页面,2=外部页面',
  `jump_url` varchar(255) DEFAULT NULL COMMENT '跳转地址',
  `status` enum('0','1','2') NOT NULL DEFAULT '0' COMMENT '消息状态:0=已发送,1=已阅读,2=发送失败',
  `createtime` int(11) NOT NULL COMMENT '发送时间',
  `readtime` int(11) DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `receive_user` (`receive_user`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COMMENT='消息中心';

-- ----------------------------
-- Records of yc_message
-- ----------------------------
BEGIN;
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (1, '1', 0, 2, '内容审核结果通知', '您发布的内容《🇹🇭 泰兰德的芭提雅》已通过审核！', '1', NULL, '1', 1731561923, 1731561934);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (2, '3', 0, 1, '有用户给您留言评论啦，快去看看吧~', '有用户给您留言评论啦，快去看看吧~', '1', '/pages/information/information?information_id=64', '0', 1731593899, NULL);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (3, '3', 0, 2, '有用户给您留言评论啦，快去看看吧~', '有用户给您留言评论啦，快去看看吧~', '1', '/pages/information/information?information_id=66', '1', 1731671290, 1731671330);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (4, '1', 0, 2, '内容审核结果通知', '您发布的内容《🐱找合适的主人（200元）》已通过审核！', '1', NULL, '1', 1731696862, 1731697084);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (5, '1', 0, 16, '内容审核结果通知', '您发布的内容《🛒（重庆版胖东来）南坪万达永辉重新开业啦🥬》已通过审核！', '1', NULL, '1', 1731698892, 1731698976);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (6, '1', 0, 16, '内容审核结果通知', '您发布的内容《🛒（重庆版胖东来）南坪万达永辉重新开业啦🥬》已通过审核！', '1', NULL, '1', 1731699145, 1731699227);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (7, '1', 0, 2, '内容审核结果通知', '您发布的内容《🐱找合适的主人（200元）》已通过审核！', '1', NULL, '1', 1731699932, 1731700558);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (8, '1', 0, 2, '内容审核结果通知', '您发布的内容《🇹🇭 泰兰德的芭提雅》已通过审核！', '1', NULL, '1', 1731700093, 1731700555);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (9, '1', 0, 17, '建点结果通知', '您的申请已通过，即日起大众均可在定位列表发现到这个点位，感谢您对社区的贡献！', '1', NULL, '0', 1731740496, NULL);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (10, '1', 0, 2, '内容审核结果通知', '您发布的内容《💐三周年快乐》已通过审核！', '1', '', '1', 1731746141, 1731933725);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (11, '3', 0, 16, '💐三周年快乐', '您的内容收到了新评论，快快点击查看~', '1', '/pages/information/information?information_id=70', '0', 1731750665, NULL);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (12, '3', 0, 2, '🌠 晚上啦，又饿啦～', '您的内容收到了新评论，快快点击查看~', '1', '/pages/information/information?information_id=71', '1', 1732196812, 1732201146);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (13, '3', 0, 16, '💐三周年快乐', '您的内容收到了新评论，快快点击查看~', '1', '/pages/information/information?information_id=70', '0', 1732197568, NULL);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (14, '3', 0, 1, '今日小雪丨玉气飘逸揽风华 迎冬藏物小雪至', '您的内容收到了新评论，快快点击查看~', '1', '/pages/information/information?information_id=76', '0', 1732271654, NULL);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (15, '1', 0, 2, '建点结果通知', '您的申请已通过，即日起大众均可在定位列表发现到这个点位，感谢您对社区的贡献！', '1', NULL, '1', 1732292004, 1732292037);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (16, '1', 0, 22, '建点结果通知', '您的申请已通过，即日起大众均可在定位列表发现到这个点位，感谢您对社区的贡献！', '1', NULL, '1', 1732299140, 1732304260);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (17, '1', 0, 22, '建点结果通知', '您的申请已通过，即日起大众均可在定位列表发现到这个点位，感谢您对社区的贡献！', '1', NULL, '1', 1732354474, 1732354739);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (18, '1', 0, 22, '建点结果通知', '您的申请已通过，即日起大众均可在定位列表发现到这个点位，感谢您对社区的贡献！', '1', NULL, '1', 1732354481, 1732354741);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (19, '1', 0, 22, '建点结果通知', '您的申请已通过，即日起大众均可在定位列表发现到这个点位，感谢您对社区的贡献！', '1', NULL, '1', 1732354489, 1732354737);
INSERT INTO `yc_message` (`id`, `type`, `send_user`, `receive_user`, `title`, `content`, `jump_type`, `jump_url`, `status`, `createtime`, `readtime`) VALUES (20, '1', 0, 2, '建点结果通知', '您的申请已通过，即日起大众均可在定位列表发现到这个点位，感谢您对社区的贡献！', '1', NULL, '1', 1732367287, 1732367809);
COMMIT;

-- ----------------------------
-- Table structure for yc_modular
-- ----------------------------
DROP TABLE IF EXISTS `yc_modular`;
CREATE TABLE `yc_modular` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `community_id` int(11) DEFAULT NULL COMMENT '展示小区',
  `title` varchar(20) NOT NULL COMMENT '模块标题',
  `ico_image` varchar(255) NOT NULL COMMENT '模块ICO',
  `jump_type` enum('0','1','2') NOT NULL COMMENT '跳转类型:0=不跳转,1=内部页面,2=外部页面',
  `jump_url` varchar(200) DEFAULT NULL COMMENT '跳转地址',
  `status` enum('0','1') NOT NULL DEFAULT '1' COMMENT '展示状态:0=隐藏,1=显示',
  `weigh` int(11) DEFAULT NULL COMMENT '排序',
  `createtime` int(11) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='首页模块';

-- ----------------------------
-- Records of yc_modular
-- ----------------------------
BEGIN;
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (1, 0, '其他信息', '/uploads/20220430/e7189daa12913bfa02a5829213d54e12.png', '1', '/pages/information/lists?category_id=17', '0', 1, 1650105656);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (2, 0, '最新公告', '/uploads/20220430/b8f8e8ad4222b8f589891f4321b9a527.png', '1', '/pages/information/lists?category_id=16', '1', 10, 1650105784);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (3, 0, '附近优惠', '/uploads/20220430/a87caa2be07c129c689c3482eb1fe112.png', '1', '/pages/information/lists?category_id=18', '0', 5, 1650105871);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (4, 0, '二手闲置', '/uploads/20220430/80a3253ea4951feb09370468950b9c9c.png', '1', '/pages/information/lists?category_id=14', '1', 7, 1650105979);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (5, 0, '帮买帮送', '/uploads/20220417/1631472f066e3b900924574b4dfe5175.png', '0', '', '0', 6, 1650124177);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (6, 0, '日常分享', '/uploads/20220430/7d8615f00e7750035c47c7e9210159e6.png', '1', '/pages/information/lists?category_id=19', '1', 3, 1651150188);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (7, 0, '商家钜惠', '/uploads/20220430/ff3d673edc8604e58eb82486535c67c5.png', '1', '/pages/information/lists?category_id=22', '1', 4, 1651328466);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (8, 0, '活动召集', '/uploads/20220430/259744fcb9745e47a28d0dd7eb3ce4de.png', '1', '/pages/information/lists?category_id=20', '1', 8, 1651330979);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (9, 0, '房产租售', '/uploads/20220501/5ad6dabe964e3f6ca60e2c79d2411151.png', '1', '/pages/information/lists?category_id=23', '1', 9, 1651412559);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (10, 0, '测试商超', '/uploads/20220519/2eee23f53a20cc6a6a89430e2c9ee8b7.png', '1', '/pages/shop/shop?merchant_id=1', '0', 11, 1652951201);
INSERT INTO `yc_modular` (`id`, `community_id`, `title`, `ico_image`, `jump_type`, `jump_url`, `status`, `weigh`, `createtime`) VALUES (11, 0, '垂钓专区', '/uploads/20241123/f7ed11cd11a82d09e5b285de5525eccc.png', '1', '/pages/information/lists?category_id=28', '1', 2, 1732291726);
COMMIT;

-- ----------------------------
-- Table structure for yc_pages
-- ----------------------------
DROP TABLE IF EXISTS `yc_pages`;
CREATE TABLE `yc_pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `identification` varchar(100) NOT NULL COMMENT '页面标识',
  `title` varchar(100) NOT NULL COMMENT '页面标题',
  `desc` mediumtext COMMENT '页面描述',
  `content` mediumtext COMMENT '页面内容',
  `status` enum('1','0') NOT NULL DEFAULT '1' COMMENT '页面状态:1=正常,0=隐藏',
  `createtime` int(11) NOT NULL COMMENT '发布时间',
  `updatetime` int(11) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(11) DEFAULT NULL COMMENT '删除时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `identification` (`identification`),
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COMMENT='单页内容';

-- ----------------------------
-- Records of yc_pages
-- ----------------------------
BEGIN;
INSERT INTO `yc_pages` (`id`, `identification`, `title`, `desc`, `content`, `status`, `createtime`, `updatetime`, `deletetime`) VALUES (1, '', '', '', '', '1', 1650964405, 1650964408, 1650964408);
INSERT INTO `yc_pages` (`id`, `identification`, `title`, `desc`, `content`, `status`, `createtime`, `updatetime`, `deletetime`) VALUES (2, 'PRIVACY_POLICY', '隐私政策', '欢迎使用渝快同城信息平台（下列简称为“同城信息”）提供的服务。在使用前请您阅读如下服务协议', '<p>尊敬的用户，欢迎使用<b>渝快同城</b>信息平台（下列简称为“<b>同城信息</b>”）提供的服务。在使用前请您阅读如下服务协议，使用本应用即表示您同意接受本协议，本协议产生法律效力，特别涉及免除或者限制维聚责任的条款，请仔细阅读。如有任何问题，可向同城信息咨询。</p><p>1. 服务条款的确认和接受</p><p>通过访问或使用本应用，表示用户同意接受本协议的所有条件和条款。</p><p>2. 服务条款的变更和修改</p><p>同城信息有权在必要时修改服务条款，服务条款一旦发生变更，将会在重要页面上提示修改内容。如果不同意所改动的内容，用户可以放弃获得的本应用信息服务。如果用户继续享用本应用的信息服务，则视为接受服务条款的变更。本应用保留随时修改或中断服务而不需要通知用户的权利。本应用行使修改或中断服务的权利，不需对用户或第三方负责。</p><p>3. 用户行为</p><p>3.1 用户账号、密码和安全</p><p>用户一旦注册成功，便成为同城信息的合法用户，将得到一个密码和帐号。同时，此账号密码可登录同城信息的所有网页和APP。因此用户应采取合理措施维护其密码和帐号的安全。用户对利用该密码和帐号所进行的一切活动负全部责任；由该等活动所导致的任何损失或损害由用户承担，同城信息不承担任何责任。 用户的密码和帐号遭到未授权的使用或发生其他任何安全问题，用户可以立即通知同城信息，并且用户在每次连线结束，应结束帐号使用，否则用户可能得不到同城信息的安全保护。对于用户长时间未使用的帐号，同城信息有权予以关闭并注销其内容。</p><p>3.2 账号注册时的禁止行为</p><p>（1）请勿以党和国家领导人或其他社会名人的真实姓名、字号、艺名、笔名注册；</p><p>（2）冒充任何人或机构，或以虚伪不实的方式谎称或使人误认为与任何人或任何机构有关的名称；</p><p>（3）请勿注册和其他网友之名相近、相仿的名字；</p><p>（4）请勿注册不文明、不健康名字，或包含歧视、侮辱、猥亵类词语的名字；</p><p>（5）请勿注册易产生歧义、引起他人误解的名字；</p><p>3.3 用户在本应用上不得发布下列违法信息和照片：</p><p>（1）反对宪法所确定的基本原则的；</p><p>（2）危害国家安全，泄露国家秘密，颠覆国家政权，破坏国家统一的；</p><p>（3）损害国家荣誉和利益的；</p><p>（4）煽动民族仇恨、民族歧视，破坏民族团结的；</p><p>（5）破坏国家宗教政策，宣扬邪教和封建迷信的；</p><p>（6）散布谣言，扰乱社会秩序，破坏社会稳定的；</p><p>（7）散布淫秽、色情、赌博、暴力、凶杀、恐怖或者教唆犯罪的；</p><p>（8）侮辱或者诽谤他人，侵害他人合法权益的；</p><p>（9）含有法律、行政法规禁止的其他内容的；</p><p>（10）禁止骚扰、毁谤、威胁、仿冒网站其他用户；</p><p>（11）严禁煽动非法集会、结社、游行、示威、聚众扰乱社会秩序；</p><p>（12）严禁发布可能会妨害第三方权益的文件或者信息，例如（包括但不限于）：病毒代码、黑客程序、软件破解注册信息。</p><p>（13）禁止上传他人作品。其中包括你从互联网上下载、截图或收集的他人的作品；</p><p>（14）禁止上传广告、横幅、标志等网络图片；</p><p>4. 上传或发布的内容</p><p>用户上传的内容是指用户在同城信息上传或发布的视频或其它任何形式的内容包括文字、图片、音频等。除非同城信息收到相关通知，否则同城信息将用户视为其在本应用上传或发布的内容的版权拥有人。作为内容的发表者，需自行对所发表内容负责，因所发表内容引发的一切纠纷，由该内容的发表者承担全部法律及连带责任。同城信息不承担任何法律及连带责任。</p><p>对于经由本应用而传送的内容，同城信息不保证前述其合法性、正当性、准确性、完整性或品质。用户在使用本应用时，有可能会接触到令人不快、不适当或令人厌恶的内容。在任何情况下，同城信息均不对任何内容承担任何责任，包括但不限于任何内容发生任何错误或纰漏以及衍生的任何损失或损害。同城信息有权（但无义务）自行拒绝或删除经由本应用提供的任何内容。</p><p>个人或单位如认为同城信息存在侵犯自身合法权益的内容，应准备好具有法律效应的证明材料，及时与同城信息取得联系，以便同城信息迅速作出处理。</p><p>隐私条款</p><p>1.用户信息公开情况说明</p><p>尊重用户个人隐私是同城信息的一项基本政策。所以，同城信息不会在未经合法用户授权时公开、编辑或透露其注册资料及保存在本应用中的非公开内容，除非有下列情况：</p><p>（1）有关法律规定或同城信息合法服务程序规定；</p><p>（2）在紧急情况下，为维护用户及公众的权益；</p><p>（3）为维护同城信息的商标权、专利权及其他任何合法权益；</p><p>（4）其他需要公开、编辑或透露个人信息的情况；</p><p>在以下（包括但不限于）几种情况下，同城信息有权使用用户的个人信息：</p><p>（1）在进行促销或抽奖时，同城信息可能会与赞助商共享用户的个人信息，在这些情况下维聚会在发送用户信息之前进行提示，并且用户可以通过不参与来终止传送过程；</p><p>（2）同城信息可以将用户信息与第三方数据匹配；</p><p>（3）同城信息会通过透露合计用户统计数据，向未来的合作伙伴、广告商及其他第三方以及为了其他合法目的而描述同城信息的服务；</p><p>2.隐私权政策适用范围</p><p>（1）用户在登录本应用服务器时留下的个人身份信息；</p><p>（2）用户通过本应用服务器与其他用户或非用户之间传送的各种资讯；</p><p>（3）本应用与商业伙伴共享的其他用户或非用户的各种信息；</p><p>3.资讯公开与共享</p><p>同城信息不会将用户的个人信息和资讯故意透露、出租或出售给任何第三方。但以下情况除外：</p><p>（1）用户本人同意与第三方共享信息和资讯;</p><p>（2）只有透露用户的个人信息和资讯，才能提供用户所要求的某种产品和服务;</p><p>（3）应代表本应用提供产品或服务的主体的要求提供（除非我们另行通知，否则该等主体无权将相关用户个人信息和资讯用于提供产品和服务之外的其他用途）：根据法律法规或行政命令的要求提供;因外部审计需要而提供;用户违反了本应用服务条款或任何其他产品及服务的使用规定;经本站评估，用户的帐户存在风险，需要加以保护。</p><p>4.Cookies、日志档案和webbeacon</p><p>通过使用cookies，本应用向用户提供简单易行并富个性化的网络体验。cookies能帮助我们确定用户连接的页面和内容，并将该等信息储存。我们使用自己的cookies和webbeacon，用于以下用途：</p><p>（1）记住用户身份。例如：cookies和webbeacon有助于我们辨认用户作为我们的注册用户的身份，或保存用户向我们提供有关用户的喜好或其他信息；</p><p>（2）分析用户使用我们服务的情况。我们可利用cookies和webbeacon来了解用户使用我们的服务进行什么活动、或哪些网页或服务最受欢迎； 我们为上述目的使用cookies和webbeacon的同时，可能将通过cookies和webbeacon收集的非个人身份信息汇总提供给广告商和其他伙伴，用于分析您和其他用户如何使用我们的服务并用于广告服务。用户可以通过浏览器或用户选择机制拒绝或管理cookies或webbeacon。但请用户注意，如果用户停用cookies或webbeacon，我们有可能无法为您提供最佳的服务体验，某些服务也可能无法正常使用。</p><p>（3）当你使用本站的服务时，我们的主机会自动记录用户的浏览器在访问网站时所发送的信息和资讯。主机日志资讯包括但不限于用户的网路请求、IP地址、浏览器类型、浏览器使用的语言、请求的日期和时间，以及一个或多个可以对用户的浏览器进行辨识的cookie。</p><p>5.账户删除申请</p><p>用户有权在任何时候编辑用户在同城信息的帐户信息和资讯，用户也可以填写相关申请表格，要求删除个人帐户，但是用户无条件同意在你的帐户删除后，该帐户内及与该帐户相关的信息和资讯仍然保留在本网站档案记录中，除上述第三条规定的情况外，同城信息将为用户保密。</p>', '1', 1650964774, 1650964774, NULL);
INSERT INTO `yc_pages` (`id`, `identification`, `title`, `desc`, `content`, `status`, `createtime`, `updatetime`, `deletetime`) VALUES (3, 'ABOUT_US', '关于我们', '', '<p>渝快同城，是重庆网云智网络科技有限公司及荣昌区字符串网络科技工作室旗下信息网站，渝快同城网即渝快同城生活信息网或渝快同城分类信息网，简称渝快同城，一直战战兢兢，一直如履薄冰，一群朝气蓬勃的年轻人，有着自己的信念、目标、追求及爱好；我们更是一群充满激情、坚定自己理想、不断进取和学习的创业者；我们将一直致力于分类生活信息领域技术和服务的探索与追。渝快同城网-2018年创立于重庆市，隶属重庆网云智网络科技有限公司及荣昌区字符串网络科技工作室。中国分类信息门户网站之一，主要为用户提供：房屋租售、二手买卖、招聘求职、生活服务、教育培训、征婚交友、休闲娱乐、批发采购、商务服务等信息的免费发布和方便查询服务。</p><p>渝快同城网--分站已经开通全国350个城市，用户可以通过渝快同城的平台，免费发布和查询自己需要的信息。</p><h3>服务内容</h3><p>渝快同城网的信息栏目覆盖生活中多个方面，其中主要包括房产信息、物品交易、车辆买卖与服务、宠物/宠物用品、票务/优惠券、教育培训、同城活动、同城交友、生活服务、商务服务、企业招聘、求职简历、餐饮美食、休闲娱乐等生活信息。经过不断创新和优化网站版块，使用户在使用习惯及体验上得到了改善；将通过坚持不懈的努力，继续为用户提供更多深入的服务。</p><h3>目标使命</h3><p>一直秉承着“服务于百姓的生活信息平台”的愿景，持续为用户提供“本地、免费、真实”的生活服务。我们的目标是做中国最专业的网络分类生活信息平台，这个目标对我们来说很远大也很艰难，需要机会和我们不断的努力。在网络时代竞争这么激烈的年代，不少企业靠的是风险投资来进行资本扩张，而我们就凭着自己的热情、执着和坚持。相信通过时间不断努力能够不断实现人生价值。</p><p>价值观--简单、专业、实用、实现价值。</p>', '1', 1650966191, 1650966191, NULL);
COMMIT;

-- ----------------------------
-- Table structure for yc_sms
-- ----------------------------
DROP TABLE IF EXISTS `yc_sms`;
CREATE TABLE `yc_sms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `event` varchar(30) DEFAULT '' COMMENT '事件',
  `mobile` varchar(20) DEFAULT '' COMMENT '手机号',
  `code` varchar(10) DEFAULT '' COMMENT '验证码',
  `times` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '验证次数',
  `ip` varchar(30) DEFAULT '' COMMENT 'IP',
  `createtime` int(10) unsigned DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='短信验证码表';

-- ----------------------------
-- Records of yc_sms
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yc_test
-- ----------------------------
DROP TABLE IF EXISTS `yc_test`;
CREATE TABLE `yc_test` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `user_id` int(10) DEFAULT '0' COMMENT '会员ID',
  `admin_id` int(10) DEFAULT '0' COMMENT '管理员ID',
  `category_id` int(10) unsigned DEFAULT '0' COMMENT '分类ID(单选)',
  `category_ids` varchar(100) DEFAULT NULL COMMENT '分类ID(多选)',
  `tags` varchar(255) DEFAULT '' COMMENT '标签',
  `week` enum('monday','tuesday','wednesday') DEFAULT NULL COMMENT '星期(单选):monday=星期一,tuesday=星期二,wednesday=星期三',
  `flag` set('hot','index','recommend') DEFAULT '' COMMENT '标志(多选):hot=热门,index=首页,recommend=推荐',
  `genderdata` enum('male','female') DEFAULT 'male' COMMENT '性别(单选):male=男,female=女',
  `hobbydata` set('music','reading','swimming') DEFAULT NULL COMMENT '爱好(多选):music=音乐,reading=读书,swimming=游泳',
  `title` varchar(100) DEFAULT '' COMMENT '标题',
  `content` text COMMENT '内容',
  `image` varchar(100) DEFAULT '' COMMENT '图片',
  `images` varchar(1500) DEFAULT '' COMMENT '图片组',
  `attachfile` varchar(100) DEFAULT '' COMMENT '附件',
  `keywords` varchar(255) DEFAULT '' COMMENT '关键字',
  `description` varchar(255) DEFAULT '' COMMENT '描述',
  `city` varchar(100) DEFAULT '' COMMENT '省市',
  `json` varchar(255) DEFAULT NULL COMMENT '配置:key=名称,value=值',
  `multiplejson` varchar(1500) DEFAULT '' COMMENT '二维数组:title=标题,intro=介绍,author=作者,age=年龄',
  `price` decimal(10,2) unsigned DEFAULT '0.00' COMMENT '价格',
  `views` int(10) unsigned DEFAULT '0' COMMENT '点击',
  `workrange` varchar(100) DEFAULT '' COMMENT '时间区间',
  `startdate` date DEFAULT NULL COMMENT '开始日期',
  `activitytime` datetime DEFAULT NULL COMMENT '活动时间(datetime)',
  `year` year(4) DEFAULT NULL COMMENT '年',
  `times` time DEFAULT NULL COMMENT '时间',
  `refreshtime` int(10) DEFAULT NULL COMMENT '刷新时间(int)',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `deletetime` int(10) DEFAULT NULL COMMENT '删除时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `switch` tinyint(1) DEFAULT '0' COMMENT '开关',
  `status` enum('normal','hidden') DEFAULT 'normal' COMMENT '状态',
  `state` enum('0','1','2') DEFAULT '1' COMMENT '状态值:0=禁用,1=正常,2=推荐',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='测试表';

-- ----------------------------
-- Records of yc_test
-- ----------------------------
BEGIN;
INSERT INTO `yc_test` (`id`, `user_id`, `admin_id`, `category_id`, `category_ids`, `tags`, `week`, `flag`, `genderdata`, `hobbydata`, `title`, `content`, `image`, `images`, `attachfile`, `keywords`, `description`, `city`, `json`, `multiplejson`, `price`, `views`, `workrange`, `startdate`, `activitytime`, `year`, `times`, `refreshtime`, `createtime`, `updatetime`, `deletetime`, `weigh`, `switch`, `status`, `state`) VALUES (1, 1, 1, 12, '12,13', '互联网,计算机', 'monday', 'hot,index', 'male', 'music,reading', '我是一篇测试文章', '<p>我是测试内容</p>', '/assets/img/avatar.png', '/assets/img/avatar.png,/assets/img/qrcode.png', '/assets/img/avatar.png', '关键字', '描述', '广西壮族自治区/百色市/平果县', '{\"a\":\"1\",\"b\":\"2\"}', '[{\"title\":\"标题一\",\"intro\":\"介绍一\",\"author\":\"小明\",\"age\":\"21\"}]', 0.00, 0, '2020-10-01 00:00:00 - 2021-10-31 23:59:59', '2017-07-10', '2017-07-10 18:24:45', 2017, '18:24:45', 1491635035, 1491635035, 1491635035, NULL, 0, 1, 'normal', '1');
COMMIT;

-- ----------------------------
-- Table structure for yc_user
-- ----------------------------
DROP TABLE IF EXISTS `yc_user`;
CREATE TABLE `yc_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `community_id` int(10) DEFAULT NULL COMMENT '所属小区',
  `group_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '组别ID',
  `username` varchar(32) DEFAULT '' COMMENT '用户名',
  `nickname` varchar(50) DEFAULT '' COMMENT '昵称',
  `password` varchar(32) DEFAULT '' COMMENT '密码',
  `salt` varchar(30) DEFAULT '' COMMENT '密码盐',
  `email` varchar(100) DEFAULT '' COMMENT '电子邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号',
  `avatar` varchar(255) NOT NULL DEFAULT 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132' COMMENT '头像',
  `level` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `gender` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `bio` varchar(100) DEFAULT '' COMMENT '格言',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '积分',
  `successions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '连续登录天数',
  `maxsuccessions` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '最大连续登录天数',
  `prevtime` int(10) DEFAULT NULL COMMENT '上次登录时间',
  `logintime` int(10) DEFAULT NULL COMMENT '登录时间',
  `loginip` varchar(50) DEFAULT '' COMMENT '登录IP',
  `loginfailure` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '失败次数',
  `joinip` varchar(50) DEFAULT '' COMMENT '加入IP',
  `jointime` int(10) DEFAULT NULL COMMENT '加入时间',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `token` varchar(50) DEFAULT '' COMMENT 'Token',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  `verification` varchar(255) DEFAULT '' COMMENT '验证',
  `mini_openid` varchar(100) DEFAULT NULL COMMENT '小程序Openid',
  `mini_session_key` varchar(255) DEFAULT NULL COMMENT '小程序登录态',
  `sms_upper_limit` int(4) NOT NULL DEFAULT '3' COMMENT '短信接收上限（每日重置）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `username` (`username`) USING BTREE,
  KEY `email` (`email`) USING BTREE,
  KEY `mobile` (`mobile`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='会员表';

-- ----------------------------
-- Records of yc_user
-- ----------------------------
BEGIN;
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (1, 29, 1, '18888888888', '渝快同城', '000a3d4b576c1efcdae4ae591f2a83ce', 'mPrf2Y', '', '18888888888', 'https://yktc.wangyunzhi.cn/uploads/20241114/2f78b0b3444011e75c3cb5e86aa37a6a.jpeg', 1, 0, NULL, '', 0.00, 100, 1, 1, 1731555090, 1731555186, '14.106.123.228', 0, '127.0.0.1', 1731555024, 1731555024, 1731593899, '', 'normal', '', 'o65Fz7UoprFsQkSriql3s4544', '', 2);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (2, 18, 1, '17380287639', '是小杨呀', 'b6b848de19cfbad485e69ea13df47a08', 'psP31R', '', '17380287639', 'https://yktc-oss.ipv4net.com/information/images/tx/173156103872197.png', 1, 0, '2001-08-26', '', 0.00, 100, 3, 3, 1731733665, 1731740171, '14.106.123.228', 0, '17380287639', 1731555429, 1731555429, 1731740171, '', 'normal', '', 'o65Fz7UoprFsQkSriqlClIEBDc_U', 'OxcaHRsLqcVZo/ziWfjRfg==', 2);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (3, 41, 1, 'o65Fz7fbJXHstocmNMKhz_mywFiY', '', '15825ad2ed8425680d5a4c5cb0b90fc5', 'oJQU8A', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1731562897, '81.68.150.93', 0, '', 1731562897, 1731562897, 1731562897, '', 'normal', '', 'o65Fz7fbJXHstocmNMKhz_mywFiY', '538/1JgcQoXanMoldNH1uQ==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (4, 40, 1, 'o65Fz7Qf5gOWJHFZROvLhSSU05kc', '', 'ba35a03ea3d897e68212f92fbd907653', 'UpQKlX', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, 1731577316, 1731577316, '175.24.97.136', 0, '', 1731562912, 1731562912, 1731577316, '', 'normal', '', 'o65Fz7Qf5gOWJHFZROvLhSSU05kc', 'ape7ESZCNOtJGaKSX5Xl6A==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (5, 41, 1, 'o65Fz7R3bBfDLDoMCHtxdwyKwdfw', '', 'bff9398639cc68291997bb4ae23c3b7b', 'rzLiPF', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, 1731564097, 1731565565, '175.24.9.239', 0, '', 1731564097, 1731564097, 1731565565, '', 'normal', '', 'o65Fz7R3bBfDLDoMCHtxdwyKwdfw', 'JlGNOO5UMXSvEl42sBQvug==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (6, 41, 1, 'o65Fz7cmgClEOgXMEKLP3THg1az0', '', 'dc216e000f7a79aeb4cfd3215f7c60f0', 'Dmboyl', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1731565398, '59.36.121.178', 0, '', 1731565398, 1731565398, 1731565398, '', 'normal', '', 'o65Fz7cmgClEOgXMEKLP3THg1az0', '+2mLQwy9UjcVsjI2IkglmA==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (7, 41, 1, 'o65Fz7eC5KTPRjGeZ95zbsifbOOw', '', '639ea012c53df9f808b93250890168ee', 'X9h8zH', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1731565565, '175.24.68.121', 0, '', 1731565565, 1731565565, 1731565565, '', 'normal', '', 'o65Fz7eC5KTPRjGeZ95zbsifbOOw', 'u2yukfrE3xfDJaSzigkBzg==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (8, 41, 1, 'o65Fz7XR-w4a_56WJLIJeKTJCrzc', 'wxid_xonrque65em212', '8ddc4252082934e628d12bbff28ee81e', 'BtlJgQ', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1731567442, '59.36.121.173', 0, '', 1731567442, 1731567442, 1731567697, '', 'normal', '', 'o65Fz7XR-w4a_56WJLIJeKTJCrzc', 'rdQiBU57yu2XY/z2g9rmCg==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (9, 41, 1, 'o65Fz7XsgdQ4oiGH9QKVjuioda3Q', '', 'c7e00516174adffd5c758d5018819c25', 'OMWDw3', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1731567903, '175.24.110.223', 0, '', 1731567903, 1731567903, 1731567903, '', 'normal', '', 'o65Fz7XsgdQ4oiGH9QKVjuioda3Q', 'JUHAn+9hKhZu5aPGCB0drg==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (10, 41, 1, 'o65Fz7c2kEpzCiafYWHf6-j0CuNY', '', '1facabfbeadffcbe06482f82e202cea7', 'Tz2ih5', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1731568202, '175.24.213.72', 0, '', 1731568202, 1731568202, 1731568202, '', 'normal', '', 'o65Fz7c2kEpzCiafYWHf6-j0CuNY', 'WEqVgRi+K7FAuXnEFL/9HQ==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (11, 42, 1, 'o65Fz7T8KK59oUlk7bFxTiApM_hY', '', '51aa9cff8269faa5c2b25eb352fda7cb', 'b1kq0t', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, 1731571674, 1731571674, '111.75.54.153', 0, '', 1731571674, 1731571674, 1731571674, '', 'normal', '', 'o65Fz7T8KK59oUlk7bFxTiApM_hY', '459/R3yZ8jaxSoowmyJqCw==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (12, 43, 1, '13416472917', '测试', '328cbf262abcfcf87b1da419a6809739', 'B81CGs', '', '13416472917', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, 1731573328, 1731573346, '221.182.3.211', 0, '', 1731573328, 1731573328, 1731573346, '', 'normal', '', 'o65Fz7cuM1tY3TDDhzsPgXYi1puM', 'How805ZtR3xgA+wBYS0yNg==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (13, 41, 1, 'o65Fz7TP-7iCDIf0Z0PKJuiP6abs', '', 'e81d8f0de278615ea6f33e2e544932ae', 'TcbRYu', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1731576699, '81.68.168.141', 0, '', 1731576699, 1731576699, 1731576699, '', 'normal', '', 'o65Fz7TP-7iCDIf0Z0PKJuiP6abs', 'SEpSfCUuqtvcSSJYJ2mXGg==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (14, 41, 1, 'o65Fz7RBgVAvH-w5VmR8_d1aEB4Y', '', '5dcfed5bae2a1d7b83edc7a89cabb0c4', 'QEkJzn', '', '', 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5GOOicqib08HyxZ4j0mUOZ4nRCCyUUqNpRBRQjauyKruKP9f2Kvs9yHR3Qc7wdJfe1o18LrV5Qg7hQ/132', 0, 0, NULL, '', 0.00, 0, 1, 1, NULL, 1731576699, '175.24.79.3', 0, '', 1731576699, 1731576699, 1731576699, '', 'normal', '', 'o65Fz7RBgVAvH-w5VmR8_d1aEB4Y', 'FrTZ25dqZckTT7Xmzt3RtA==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (16, 18, 1, '17723084280', '千怡姐姐', '6bdb0c24fd0c6d9769b3db9c031bef12', 'AEdNIG', '', '17723084280', 'https://yktc-oss.ipv4net.com/information/images/tx/173167122038630.png', 0, 0, NULL, '', 0.00, 0, 1, 1, 1731671188, 1731671272, '14.106.123.228', 0, '', 1731671187, 1731671187, 1731698818, '', 'normal', '', 'o65Fz7cvJ2NeDwdfpoQXX74kr5Zw', 'TKFwjp319v5yVpgeSm3BXw==', 3);
INSERT INTO `yc_user` (`id`, `community_id`, `group_id`, `username`, `nickname`, `password`, `salt`, `email`, `mobile`, `avatar`, `level`, `gender`, `birthday`, `bio`, `money`, `score`, `successions`, `maxsuccessions`, `prevtime`, `logintime`, `loginip`, `loginfailure`, `joinip`, `jointime`, `createtime`, `updatetime`, `token`, `status`, `verification`, `mini_openid`, `mini_session_key`, `sms_upper_limit`) VALUES (17, 50, 1, '18716659243', '。', 'a4658cdf1726e70c136dc68bb97a6eea', 'yNKXxQ', '', '18716659243', 'https://yktc-oss.ipv4net.com/information/images/tx/1731740194349125.png', 0, 0, NULL, '', 0.00, 0, 1, 1, 1731740181, 1731740206, '183.227.45.17', 0, '', 1731740181, 1731740181, 1731740206, '', 'normal', '', 'o65Fz7dHI77nlIk-TqoKcwwZa2Ig', 'l5SW7wEySnAU3TEVvdTGIw==', 3);
COMMIT;

-- ----------------------------
-- Table structure for yc_user_group
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_group`;
CREATE TABLE `yc_user_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT '' COMMENT '组名',
  `rules` text COMMENT '权限节点',
  `createtime` int(10) DEFAULT NULL COMMENT '添加时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='会员组表';

-- ----------------------------
-- Records of yc_user_group
-- ----------------------------
BEGIN;
INSERT INTO `yc_user_group` (`id`, `name`, `rules`, `createtime`, `updatetime`, `status`) VALUES (1, '默认组', '1,2,3,4,5,6,7,8,9,10,11,12', 1491635035, 1491635035, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for yc_user_money_log
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_money_log`;
CREATE TABLE `yc_user_money_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更余额',
  `before` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更前余额',
  `after` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '变更后余额',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='会员余额变动表';

-- ----------------------------
-- Records of yc_user_money_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yc_user_rule
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_rule`;
CREATE TABLE `yc_user_rule` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) DEFAULT NULL COMMENT '父ID',
  `name` varchar(50) DEFAULT NULL COMMENT '名称',
  `title` varchar(50) DEFAULT '' COMMENT '标题',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `ismenu` tinyint(1) DEFAULT NULL COMMENT '是否菜单',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) DEFAULT '0' COMMENT '权重',
  `status` enum('normal','hidden') DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='会员规则表';

-- ----------------------------
-- Records of yc_user_rule
-- ----------------------------
BEGIN;
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (1, 0, 'index', 'Frontend', '', 1, 1491635035, 1491635035, 1, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (2, 0, 'api', 'API Interface', '', 1, 1491635035, 1491635035, 2, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (3, 1, 'user', 'User Module', '', 1, 1491635035, 1491635035, 12, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (4, 2, 'user', 'User Module', '', 1, 1491635035, 1491635035, 11, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (5, 3, 'index/user/login', 'Login', '', 0, 1491635035, 1491635035, 5, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (6, 3, 'index/user/register', 'Register', '', 0, 1491635035, 1491635035, 7, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (7, 3, 'index/user/index', 'User Center', '', 0, 1491635035, 1491635035, 9, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (8, 3, 'index/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 4, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (9, 4, 'api/user/login', 'Login', '', 0, 1491635035, 1491635035, 6, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (10, 4, 'api/user/register', 'Register', '', 0, 1491635035, 1491635035, 8, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (11, 4, 'api/user/index', 'User Center', '', 0, 1491635035, 1491635035, 10, 'normal');
INSERT INTO `yc_user_rule` (`id`, `pid`, `name`, `title`, `remark`, `ismenu`, `createtime`, `updatetime`, `weigh`, `status`) VALUES (12, 4, 'api/user/profile', 'Profile', '', 0, 1491635035, 1491635035, 3, 'normal');
COMMIT;

-- ----------------------------
-- Table structure for yc_user_score_log
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_score_log`;
CREATE TABLE `yc_user_score_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `score` int(10) NOT NULL DEFAULT '0' COMMENT '变更积分',
  `before` int(10) NOT NULL DEFAULT '0' COMMENT '变更前积分',
  `after` int(10) NOT NULL DEFAULT '0' COMMENT '变更后积分',
  `memo` varchar(255) DEFAULT '' COMMENT '备注',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='会员积分变动表';

-- ----------------------------
-- Records of yc_user_score_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for yc_user_token
-- ----------------------------
DROP TABLE IF EXISTS `yc_user_token`;
CREATE TABLE `yc_user_token` (
  `token` varchar(50) NOT NULL COMMENT 'Token',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员ID',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `expiretime` int(10) DEFAULT NULL COMMENT '过期时间',
  PRIMARY KEY (`token`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='会员Token表';

-- ----------------------------
-- Records of yc_user_token
-- ----------------------------
BEGIN;
INSERT INTO `yc_user_token` (`token`, `user_id`, `createtime`, `expiretime`) VALUES ('c231c47afa9b528d14be1533817a2af0d315107f', 452, 1698157600, 1700749600);
COMMIT;

-- ----------------------------
-- Table structure for yc_version
-- ----------------------------
DROP TABLE IF EXISTS `yc_version`;
CREATE TABLE `yc_version` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `oldversion` varchar(30) DEFAULT '' COMMENT '旧版本号',
  `newversion` varchar(30) DEFAULT '' COMMENT '新版本号',
  `packagesize` varchar(30) DEFAULT '' COMMENT '包大小',
  `content` varchar(500) DEFAULT '' COMMENT '升级内容',
  `downloadurl` varchar(255) DEFAULT '' COMMENT '下载地址',
  `enforce` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '强制更新',
  `createtime` int(10) DEFAULT NULL COMMENT '创建时间',
  `updatetime` int(10) DEFAULT NULL COMMENT '更新时间',
  `weigh` int(10) NOT NULL DEFAULT '0' COMMENT '权重',
  `status` varchar(30) DEFAULT '' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='版本表';

-- ----------------------------
-- Records of yc_version
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
