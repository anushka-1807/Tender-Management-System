-- ============================================================
-- Tender Management System - Database Initialization Script
-- This file is auto-executed by Railway's MySQL service
-- on first startup to create tables and load seed data.
-- ============================================================

CREATE DATABASE IF NOT EXISTS tender;
USE tender;

-- ---------------------------------------------------------------
-- Table: notice
-- ---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `notice` (
  `id`    int(3)       NOT NULL AUTO_INCREMENT,
  `title` varchar(35)  DEFAULT NULL,
  `info`  varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `notice` VALUES
  (2, 'Gandhi Setu Construction',        'Construction is going to be started tommorow'),
  (3, 'KOLKATA-HALDIA BRIDGE CONTRUCTION','ASSINGNED ENGINEER NEED TO REPORT AT THE CONSTRUCTION SITE BY TOMMOROW');

-- ---------------------------------------------------------------
-- Table: vendor
-- ---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `vendor` (
  `vid`      varchar(15)  NOT NULL,
  `password` varchar(20)  DEFAULT NULL,
  `vname`    varchar(30)  DEFAULT NULL,
  `vmob`     varchar(12)  DEFAULT NULL,
  `vemail`   varchar(40)  DEFAULT NULL,
  `company`  varchar(15)  DEFAULT NULL,
  `address`  varchar(100) DEFAULT NULL,
  PRIMARY KEY (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `vendor` VALUES
  ('V20190725020951','12345', 'Ayush Vikas',  '07501 070485','piyushvikasdutta@gmail.com',    'Infosys','K-3, LANE NO-6 AYODHAYAPURI NEAR AIRTEL TOWER'),
  ('V20190725022813','aaina', 'Aaina Rishu',  '12345679',    'aaina@gmail.com',               'Infosys','Dhanbad ,Jharkhand'),
  ('V20190725023446','ayush', 'Ayush Vikas',  '9851273081',  'ayushvikasdutta1296@gmail.com', 'Infosys','siwan near durga mandir, bihar '),
  ('V20190725100730','shashi','Shashi Raj',   '9547462319',  'shashi@gmail.com',              'Wipro',  'Jain , Colony Belhariya More, Tekari, Gaya, (Bihar) ');

-- ---------------------------------------------------------------
-- Table: tender
-- ---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tender` (
  `tid`       varchar(15)  NOT NULL,
  `tname`     varchar(40)  DEFAULT NULL,
  `ttype`     varchar(20)  DEFAULT NULL,
  `tprice`    int(11)      DEFAULT NULL,
  `tdesc`     varchar(300) DEFAULT NULL,
  `tdeadline` date         DEFAULT NULL,
  `tloc`      varchar(70)  DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `tender` VALUES
  ('T20190725022124','Gandhi Setu Highway',                  'maintainence',50000,   'lkjhgfd',                                                                                                                                                     '2019-07-19','Patna, Bihar'),
  ('T20190725022416','MEGA CITY CONNECTING ROAD CONTRUCTION','construction', 100000, 'mega city road contruction',                                                                                                                                   '2019-09-14','Delhi'),
  ('T20190725022601','KOKATA HALDIA BRIDGE CONTRUCTION',     'construction', 5000000,'bridge contruction from kolkata to haldia',                                                                                                                    '2019-07-28','KOLATA-HALDIA'),
  ('T20190725101239','Game Development',                     'software',     150000, 'We are going to start a project on game development using GPS specification. Interested condidates are required to bid as soon as possible','2019-07-19','Banglore, India'),
  ('T20190725101322','Game Development',                     'software',     150000, 'We are going to start a project on game development using GPS specification. Interested condidates are required to bid as soon as possible','2019-07-19','Banglore, India');

-- ---------------------------------------------------------------
-- Table: bidder
-- ---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `bidder` (
  `bid`       varchar(15) NOT NULL,
  `vid`       varchar(15) DEFAULT NULL,
  `tid`       varchar(15) DEFAULT NULL,
  `bidamount` int(11)     DEFAULT NULL,
  `deadline`  date        DEFAULT NULL,
  `status`    varchar(10) DEFAULT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `bidder` VALUES
  ('B20190725022953','V20190725022813','T20190725022124',51000,   '2019-07-19','Pending'),
  ('B20190725023010','V20190725022813','T20190725022124',52000,   '2019-07-19','Accepted'),
  ('B20190725023248','V20190725022813','T20190725022416',100001,  '2019-09-14','Rejected'),
  ('B20190725023512','V20190725023446','T20190725022416',200000,  '2019-09-14','Accepted'),
  ('B20190725024125','V20190725023446','T20190725022601',5000001, '2019-07-28','Rejected'),
  ('B20190725024243','V20190725022813','T20190725022601',6000000, '2019-07-28','Accepted'),
  ('B20190725101444','V20190725100730','T20190725101322',1500000, '2019-07-19','Rejected'),
  ('B20190725101519','V20190725023446','T20190725101239',150005,  '2019-07-19','Rejected'),
  ('B20190725101525','V20190725023446','T20190725101239',150050,  '2019-07-19','Rejected'),
  ('B20190725101554','V20190725022813','T20190725101322',160000,  '2019-07-19','Accepted');

-- ---------------------------------------------------------------
-- Table: tenderstatus
-- ---------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `tenderstatus` (
  `tid`    varchar(15) NOT NULL,
  `bid`    varchar(15) DEFAULT NULL,
  `status` varchar(15) NOT NULL,
  `vid`    varchar(15) DEFAULT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT IGNORE INTO `tenderstatus` VALUES
  ('T20190725022124','B20190725023010','Assigned','V20190725022813'),
  ('T20190725022416','B20190725023512','Assigned','V20190725023446'),
  ('T20190725022601','B20190725024243','Assigned','V20190725022813'),
  ('T20190725101322','B20190725101554','Assigned','V20190725022813');
