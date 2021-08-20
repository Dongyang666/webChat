/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.40 : Database - webchat
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`webchat` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `webchat`;

/*Table structure for table `chatroom` */

DROP TABLE IF EXISTS `chatroom`;

CREATE TABLE `chatroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `chat_name` varchar(20) DEFAULT NULL,
  `speaker_name` varchar(20) DEFAULT NULL,
  `profile` varchar(50) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

/*Data for the table `chatroom` */

insert  into `chatroom`(`id`,`chat_name`,`speaker_name`,`profile`,`status`) values (10,'面向对象方法学','董丽丽','难受11',1),(11,'java程序设计','张翔','java',1),(19,'c++课设12','董丽丽','课设123',0),(20,'面向对象分析','董丽丽','我的答疑室',0);

/*Table structure for table `log` */

DROP TABLE IF EXISTS `log`;

CREATE TABLE `log` (
  `id` varchar(255) DEFAULT NULL COMMENT '日志编号',
  `userid` varchar(255) DEFAULT NULL COMMENT '用户名',
  `time` varchar(255) DEFAULT NULL COMMENT '操作时间',
  `type` varchar(255) DEFAULT NULL COMMENT '操作类型',
  `detail` varchar(255) DEFAULT NULL COMMENT '详情',
  `ip` varchar(255) DEFAULT NULL COMMENT 'ip',
  KEY `fk_log_userid` (`userid`),
  CONSTRAINT `fk_log_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `log` */

insert  into `log`(`id`,`userid`,`time`,`type`,`detail`,`ip`) values ('9e7ae1f144634c08a7a9031ee618a4f8','admin','2017-12-12 09:08:49','登陆','用户登陆',NULL),('c0675971a0b749a698b3554b7a0d4b38','admin','2017-12-12 09:11:28','登陆','用户登陆',NULL),('362551c98f944ffbbab361589347d0fc','admin','2017-12-12 09:15:51','登陆','用户登陆',NULL),('e983b5936c6742d7b7a342ac44c3e1e5','admin','2017-12-12 09:20:16','登陆','用户登陆',NULL),('114dfb2318c448bf83cb80d181cf4e8f','admin','2017-12-12 09:26:07','登陆','用户登陆',NULL),('1ceece4b2f04435b8fc5724d926e13ea','admin','2017-12-12 09:27:28','登陆','用户登陆',NULL),('7e0396fb784949b5bad797b58224cb87','admin','2017-12-12 09:37:19','登陆','用户登陆',NULL),('cd460356a07d444bab8bc08c6c9de3a5','admin','2017-12-12 09:40:14','登陆','用户登陆',NULL),('dd5c7e4f3a5c44ff9a3d2356dbfa09fe','admin','2017-12-12 09:56:02','登陆','用户登陆',NULL),('b42a1c177b0c4087a3070efeb0fe742c','admin','2017-12-12 09:57:34','登陆','用户登陆',NULL),('7354abcaa0e54e0d80d193e84adf0ab7','admin','2017-12-12 09:58:55','登陆','用户登陆',NULL),('aa241251ce814ef1a85d55f51ea59c83','admin','2017-12-12 10:05:49','登陆','用户登陆',NULL),('d412ced1baff46458a4c74747457379f','admin','2017-12-12 10:08:18','登陆','用户登陆',NULL),('7a3fd954c95742f382be9b62ebb8f23d','140607224','2017-12-12 10:21:01','登陆','用户登陆',NULL),('4a0f294f7eda4eb6a0e682063eedd10a','admin','2017-12-12 10:21:56','登陆','用户登陆',NULL),('074078d1464a4443bfeeaec4b52056f4','140607224','2017-12-12 10:23:07','登陆','用户登陆',NULL),('6d8cde0d9ec1486dacc562377c25a064','admin','2017-12-12 10:26:08','登陆','用户登陆',NULL),('757c96b6e3d64dd6a8360870fe89f1c0','140607224','2017-12-12 10:26:26','登陆','用户登陆',NULL),('e1b8c4eaefa3427e8923f76930a284a3','admin','2017-12-12 10:27:16','登陆','用户登陆',NULL),('301934da015a499fb2b8939694dd61ff','admin','2017-12-12 10:29:25','登陆','用户登陆',NULL),('54e904d0ab1e4fb89b8adace81572c51','admin','2017-12-12 10:40:55','登陆','用户登陆',NULL),('8440bec22e4f46adac55bacbcce6d9a7','admin','2017-12-12 10:44:05','登陆','用户登陆',NULL),('c9f759154dd0411fa22ed36e2196a1d2','admin','2017-12-12 10:48:07','登陆','用户登陆',NULL),('9a5f04c149774d9584caeff6dc153a9b','admin','2017-12-12 10:50:54','登陆','用户登陆',NULL),('e6d4d53caa0d4a6d99837e88ad64ce84','admin','2017-12-12 10:53:34','登陆','用户登陆',NULL),('82e89f91e5e94255961a37b25def3b58','admin','2017-12-12 10:54:27','更新','更新用户资料',NULL),('47d33b10b4d644e9982dc67f1fb46ecd','140607224','2017-12-12 10:55:11','登陆','用户登陆',NULL),('992f6a81be7f4f22a242ef74bdbb6c88','admin','2017-12-12 10:58:33','登陆','用户登陆',NULL),('61668f9408be426abe4de0f24ade9e1c','admin','2017-12-12 11:02:27','登陆','用户登陆',NULL),('6853abf4c07a4bf6921e846929228e48','admin','2017-12-12 11:04:49','登陆','用户登陆',NULL),('aff6e103e7094540a085b49093c6e4ee','140607224','2017-12-12 11:07:38','登陆','用户登陆',NULL),('c9efd801ab214068b5d5fb04386f80a7','admin','2017-12-12 11:10:12','登陆','用户登陆',NULL),('8418579140964e7b91a54de993f8b2d9','140607224','2017-12-12 11:37:40','登陆','用户登陆',NULL),('819987ab65504f6bbcca0cd9571028f6','140607224','2017-12-12 11:47:28','登陆','用户登陆',NULL),('a3dca21ef0334ec1a12ad6d75cec6db3','140607224','2017-12-12 12:15:51','登陆','用户登陆',NULL),('71422d3557904998a065ab9dbb2912d0','140607224','2017-12-12 12:16:51','登陆','用户登陆',NULL),('14238f6524f44d43bf3724171be14094','admin','2017-12-12 12:44:21','登陆','用户登陆',NULL),('690e7b57a2f24f3493036f069a2b3793','140607224','2017-12-12 12:48:13','登陆','用户登陆',NULL),('6f8381705d21427db7821c02b19d4b40','admin','2017-12-12 12:48:52','登陆','用户登陆',NULL),('22211c8b29b042119116992ba8d59bd4','140607224','2017-12-12 13:04:34','登陆','用户登陆',NULL),('f849d8cd254b4d1fb818095f3d81480b','140607224','2017-12-12 13:22:55','登陆','用户登陆',NULL),('ba0ba5a55a27474987bf0c1d10eb304f','140607224','2017-12-12 13:47:22','登陆','用户登陆',NULL),('6d1d90dd19f04091910058b0a2fddc76','admin','2017-12-12 14:05:04','登陆','用户登陆',NULL),('a776f9704ac9454a96e1c81652476892','admin','2017-12-12 19:46:09','登陆','用户登陆',NULL),('9a8ac2f76b864b58b5e3d3a2d7663748','admin','2017-12-12 19:56:15','登陆','用户登陆',NULL),('4040f2786bdd4e6bb04a8fc700b0aff8','admin','2017-12-12 20:42:46','登陆','用户登陆',NULL),('7a6fe2325747456cbd37a9be97b7520b','140607224','2017-12-12 20:46:09','登陆','用户登陆',NULL),('38a27f6db2404303a525068631c1ef67','admin','2017-12-13 01:08:39','登陆','用户登陆',NULL),('2a670336b2ef47a5be30308ad6a0a97f','admin','2017-12-13 09:03:06','登陆','用户登陆',NULL),('98cf780f14b743c1a83c817ed6d185a5','admin','2017-12-13 11:06:23','登陆','用户登陆',NULL),('cdbf054803d24a6ba4401ecc9756b613','123456','2017-12-13 11:06:57','登陆','用户登陆',NULL),('ca59e0cbae7741c99815da4f0d08bca3','140607224','2017-12-13 11:11:08','登陆','用户登陆',NULL),('5fee81e7365c4de18026fe8fa8aea391','admin','2017-12-13 11:19:43','登陆','用户登陆',NULL),('c73c41a7913e4d7c902a2560151c5d0b','123456','2017-12-13 11:21:33','更新','更新用户资料',NULL),('ba933cfef27a4a41a1cdd4420226d4f2','admin','2017-12-13 11:27:00','登陆','用户登陆',NULL),('bd4a11ce9602445b832d3c0056b0766b','admin','2017-12-13 11:29:03','登陆','用户登陆',NULL),('12013284e0134243ad5db72d4c6a4862','admin','2017-12-13 11:32:40','登陆','用户登陆',NULL),('06540f4cd17249e78804b000bbf3a974','admin','2017-12-13 11:34:19','登陆','用户登陆',NULL),('f0b1e5f8b2ec40b392a039b3f394f087','admin','2017-12-13 11:40:49','登陆','用户登陆',NULL),('363a8b58f92d439a80cf6cbd445e291a','140607224','2017-12-13 12:01:29','登陆','用户登陆',NULL),('c4d9fdaabc184fd4ac48d321b9e1d191','140607224','2017-12-13 12:20:09','登陆','用户登陆',NULL),('4ef8bf4ce8be494ba85005b3939095ff','admin','2017-12-13 12:20:12','登陆','用户登陆',NULL),('88e3044c32b04235bc9de0b333e441e2','admin','2017-12-13 12:28:06','登陆','用户登陆',NULL),('702a2ae88c7a464ebeddc3346d956ec6','admin','2017-12-13 13:01:07','登陆','用户登陆',NULL),('d72e3485c52c4ebb8eb6224306b1a78f','140607224','2017-12-13 13:04:14','登陆','用户登陆',NULL),('1bcd54949eab4066b57e7efc574167e2','140607224','2017-12-13 17:26:17','登陆','用户登陆',NULL),('fa004499748f44e1a583ac768e3b4aaa','140607224','2017-12-13 17:26:51','更新','更新用户头像',NULL),('e18d3da34e414f28a7305f77d7a3c5ae','140607224','2017-12-13 17:28:47','更新','更新用户头像',NULL),('e8f88ad5d445476a8615a7dfb2cc879d','140607224','2017-12-13 17:30:22','更新','更新用户头像',NULL),('00f3056379c4490c8a18c7b2d93e22d1','140607224','2017-12-13 18:05:15','登陆','用户登陆',NULL),('be47b40dc9d44c818ac092774f90cdde','140607224','2017-12-13 18:07:05','登陆','用户登陆',NULL),('01e3d4a117e640709d8e7270c8763540','140607224','2017-12-13 18:13:42','登陆','用户登陆',NULL),('8db0eecd450043d085fd6ff59e59c516','admin','2017-12-13 18:14:04','登陆','用户登陆',NULL),('c02effa1ee96484fb45c84ab700a78e2','140607224','2017-12-13 18:15:08','登陆','用户登陆',NULL),('06e07009a7b14e72be0751ca467b496d','140607224','2017-12-13 18:16:14','登陆','用户登陆',NULL),('c0e215f558a447bb9c6817a571bdc401','140607224','2017-12-13 18:18:10','登陆','用户登陆',NULL),('647f05e2b19f4a4097ab343bebde2ea2','140607224','2017-12-13 18:21:18','登陆','用户登陆',NULL),('d1053f37bec6436696cbdc5cf997d056','140607224','2017-12-13 18:24:17','登陆','用户登陆',NULL),('9313b3980fae415b8963a62297ebdb5e','140607224','2017-12-13 19:19:43','登陆','用户登陆',NULL),('ed95d4850f2f43329708a029a0ec2ebe','140607224','2017-12-13 19:20:01','更新','更新用户头像',NULL),('cdaff79815d840ac8921d7bcb7aa1d73','140607224','2017-12-13 19:59:50','登陆','用户登陆',NULL),('6ceb214de3504c6ba275d16f72e8c7a3','140607224','2017-12-13 20:01:00','更新','更新用户头像',NULL),('8cf524ce527f42748e4f51db33dc7791','123456','2017-12-13 20:10:02','登陆','用户登陆',NULL),('dd2afd62d18d449aa52a10ba51ec99c2','140607224','2017-12-13 20:20:23','登陆','用户登陆',NULL);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `userid` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) DEFAULT NULL COMMENT '密码',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `sex` int(1) DEFAULT NULL COMMENT '性别',
  `age` int(5) DEFAULT NULL COMMENT '年龄',
  `profilehead` varchar(255) DEFAULT NULL COMMENT '头像',
  `profile` varchar(255) DEFAULT NULL COMMENT '简介',
  `firsttime` varchar(255) DEFAULT NULL COMMENT '注册时间',
  `lasttime` varchar(255) DEFAULT NULL COMMENT '最后登录时间',
  `status` int(1) DEFAULT '1' COMMENT '账号状态(1正常 0禁用)',
  `identity` int(1) DEFAULT '0' COMMENT '身份信息（0为学生 1为老师）',
  PRIMARY KEY (`userid`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`userid`,`password`,`nickname`,`sex`,`age`,`profilehead`,`profile`,`firsttime`,`lasttime`,`status`,`identity`) values ('123456','123456','张翔',1,23,NULL,'im',NULL,'2017-12-13 20:10:02',1,1),('140607221','123456','白杨',1,30,NULL,'222',NULL,NULL,1,0),('140607224','a331335278a','刘东阳',1,20,'upload/140607224/140607224.jpg','千阳铁头娃',NULL,'2017-12-13 20:20:23',1,0),('admin','123456','董丽丽',0,23,'','i\'m admin','2017-01-11 19:22:21','2017-12-13 18:14:04',1,1);
