/*
SQLyog Ultimate v12.5.0 (64 bit)
MySQL - 5.7.26 : Database - db1
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


USE `tinyid-db1`;

/*Table structure for table `tiny_id_info` */

DROP TABLE IF EXISTS `tiny_id_info`;

CREATE TABLE `tiny_id_info` (
  `id` BIGINT(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `biz_type` VARCHAR(63) NOT NULL DEFAULT '' COMMENT '业务类型，唯一',
  `begin_id` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '开始id，仅记录初始值，无其他含义。初始化时begin_id和max_id应相同',
  `max_id` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '当前最大id',
  `step` INT(11) DEFAULT '0' COMMENT '步长',
  `delta` INT(11) NOT NULL DEFAULT '1' COMMENT '每次id增量',
  `remainder` INT(11) NOT NULL DEFAULT '0' COMMENT '余数',
  `create_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' COMMENT '创建时间',
  `update_time` TIMESTAMP NOT NULL DEFAULT '2010-01-01 00:00:00' COMMENT '更新时间',
  `version` BIGINT(20) NOT NULL DEFAULT '0' COMMENT '版本号',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_biz_type` (`biz_type`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='id信息表';

/*Data for the table `tiny_id_info` */

insert  into `tiny_id_info`(`id`,`biz_type`,`begin_id`,`max_id`,`step`,`delta`,`remainder`,`create_time`,`update_time`,`version`) values 
(1,'test',1,1,30,2,0,'2018-07-21 23:52:58','2018-07-22 23:19:27',1);

/*Table structure for table `tiny_id_token` */

DROP TABLE IF EXISTS `tiny_id_token`;

CREATE TABLE `tiny_id_token` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `token` varchar(255) NOT NULL DEFAULT '' COMMENT 'token',
  `biz_type` varchar(63) NOT NULL DEFAULT '' COMMENT '此token可访问的业务类型标识',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注',
  `create_time` timestamp NOT NULL DEFAULT '2010-01-01 00:00:00' COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '2010-01-01 00:00:00' COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='token信息表';

/*Data for the table `tiny_id_token` */

insert  into `tiny_id_token`(`id`,`token`,`biz_type`,`remark`,`create_time`,`update_time`) values 
(1,'dddddd','test','1','2017-12-14 16:36:46','2017-12-14 16:36:48');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
