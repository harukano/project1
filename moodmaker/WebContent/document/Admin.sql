/*
SQLyog Enterprise - MySQL GUI v8.1 
MySQL - 5.5.50 : Database - mood_maker
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`mood_maker` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mood_maker`;

/*Table structure for table `tab_popup` */

DROP TABLE IF EXISTS `tab_popup`;

CREATE TABLE `tab_popup` (
  `SEQ` int(2) NOT NULL COMMENT 'SEQ',
  `TITLE` longtext NOT NULL COMMENT '제목',
  `STRDATE` date DEFAULT NULL COMMENT '시작일',
  `STRTIME` varchar(10) DEFAULT NULL COMMENT '시작시간',
  `ENDDATE` date DEFAULT NULL COMMENT '종료일',
  `ENDTIME` varchar(10) DEFAULT NULL COMMENT '종료시간',
  `USEYN` varchar(1) DEFAULT NULL COMMENT '사용유무',
  `WIDSIZE` varchar(3) DEFAULT NULL COMMENT '팝업가로사이즈',
  `HEISIZE` varchar(3) DEFAULT NULL COMMENT '팝업세로사이즈',
  `WIDLOC` varchar(4) DEFAULT NULL COMMENT '팝업가로위치',
  `HEILOC` varchar(4) DEFAULT NULL COMMENT '팝업세로위치',
  `SHORTCUTYN` varchar(1) DEFAULT NULL COMMENT '바로가기사용유무',
  `SHORTCUTLINK` varchar(100) DEFAULT NULL COMMENT '바로가기링크주소',
  `CONTEXT` longtext,
  `LOCTYPE` varchar(5) DEFAULT NULL COMMENT '팝업 오픈 위치(홈페이지 위치)',
  `POPGRPYN` varchar(1) DEFAULT 'N' COMMENT '팝업 그룹',
  KEY `HPPOPMST_PK` (`SEQ`)
) ENGINE=InnoDB DEFAULT CHARSET=euckr COMMENT='메인팝업관리';

/*Data for the table `tab_popup` */

insert  into `tab_popup`(SEQ,TITLE,STRDATE,STRTIME,ENDDATE,ENDTIME,USEYN,WIDSIZE,HEISIZE,WIDLOC,HEILOC,SHORTCUTYN,SHORTCUTLINK,CONTEXT,LOCTYPE,POPGRPYN) values (1,'파리폴리 팝업 테스트 진행중입니다.','2016-07-19','0000','2016-07-23','1159','Y','310','545','0','0','Y','http://www.naver.com','<p><img alt=\"\" src=\"http://localhost:8080/upload/paris.jpg\" style=\"height:490px; width:300px\" /></p>\r\n','HOME',NULL),(2,'채피 팝업 TEST','2016-07-19','0000','2016-07-30','2359','Y','330','730','320','0','N','','<p><img alt=\"\" src=\"http://localhost:8080/upload/cheppie.jpg\" style=\"height:670px; width:315px\" /></p>\r\n','HOME',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
