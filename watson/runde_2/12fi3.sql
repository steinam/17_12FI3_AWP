﻿/* SQL Manager Lite for MySQL                              5.6.3.49012 */
/* ------------------------------------------------------------------- */
/* Host     : localhost                                                */
/* Port     : 3306                                                     */
/* Database : watson_12fi3                                             */


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES 'utf8' */;

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `watson_12fi3`
    CHARACTER SET 'utf8'
    COLLATE 'utf8_general_ci';

USE `watson_12fi3`;

/* Struktur für die Tabelle `computer`:  */

CREATE TABLE `computer` (
  `computerID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `mac` VARCHAR(17) COLLATE latin1_swedish_ci NOT NULL,
  `os` VARCHAR(45) COLLATE latin1_swedish_ci NOT NULL,
  `hostname` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY USING BTREE (`computerID`)
) ENGINE=InnoDB
AUTO_INCREMENT=2 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Struktur für die Tabelle `user`:  */

CREATE TABLE `user` (
  `userID` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY USING BTREE (`userID`)
) ENGINE=InnoDB
AUTO_INCREMENT=7 CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Struktur für die Tabelle `report`:  */

CREATE TABLE `report` (
  `reportID` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `reportType` INTEGER(11) NOT NULL,
  `eventTime` VARCHAR(45) COLLATE latin1_swedish_ci NOT NULL,
  `bucketID` VARCHAR(45) COLLATE latin1_swedish_ci NOT NULL,
  `appName` VARCHAR(50) COLLATE latin1_swedish_ci NOT NULL,
  `userID` INTEGER(11) NOT NULL,
  `computerID` INTEGER(11) NOT NULL,
  PRIMARY KEY USING BTREE (`reportID`),
  KEY `userID` USING BTREE (`userID`),
  KEY `computerID` USING BTREE (`computerID`),
  CONSTRAINT `computerID` FOREIGN KEY (`computerID`) REFERENCES `computer` (`computerID`),
  CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`)
) ENGINE=InnoDB
CHARACTER SET 'latin1' COLLATE 'latin1_swedish_ci'
;

/* Data for the `computer` table  (LIMIT 0,500) */

INSERT INTO `computer` (`computerID`, `mac`, `os`, `hostname`) VALUES
  (1,'90:1B:0E:C9:C5:70','Microsoft Windows 7 Professional |C:Windows|D','A202-10');
COMMIT;

/* Data for the `user` table  (LIMIT 0,500) */

INSERT INTO `user` (`userID`, `name`) VALUES
  (1,'Admin'),
  (2,'Administrator'),
  (3,'lang'),
  (4,'m.weiss'),
  (5,'P.von Thuengen'),
  (6,'Public');
COMMIT;

/* Data for the `report` table  (LIMIT 0,500) */

INSERT INTO `report` (`reportID`, `reportType`, `eventTime`, `bucketID`, `appName`, `userID`, `computerID`) VALUES
  ('0496bde8-8d9f-11e3-85c8-f0def1706fca',99,'02/04/2014 14:19:47','1365921976','Gerätetreiberinstallation',4,1),
  ('07016bd5-5bf7-11e3-ad08-f0def1706fca',99,'12/03/2013 09:43:49','1666951804','Gerätetreiberinstallation',4,1),
  ('08bf7888-eb2b-11e0-86f0-028037ec0200',99,'09/30/2011 08:11:29','1267225681','Gerätetreiberinstallation',4,1),
  ('0bbb9240-eb2b-11e0-86f0-028037ec0200',99,'09/30/2011 08:11:34','1267224891','Gerätetreiberinstallation',4,1),
  ('0c36e563-39f3-11e2-bc8a-f0def1706fca',99,'11/29/2012 08:04:42','1302581026','Gerätetreiberinstallation',4,1),
  ('0c90d4d3-b18d-11e2-9739-f0def1706fca',99,'04/30/2013 13:56:54','2876217715','Gerätetreiberinstallation',4,1),
  ('0eb7abf8-eb2b-11e0-86f0-028037ec0200',99,'09/30/2011 08:11:39','1267225006','Gerätetreiberinstallation',4,1),
  ('0f340180-da98-11e3-a331-f0def1706fca',3,'05/13/2014 14:13:58','54507390','WindowsExplorer',4,1),
  ('11b3c5b0-eb2b-11e0-86f0-028037ec0200',99,'09/30/2011 08:11:44','1267225612','Gerätetreiberinstallation',4,1),
  ('1729488d-2394-11e3-b1cd-f0def1706fca',99,'09/22/2013 16:34:31','1138132679','Gerätetreiberinstallation',4,1),
  ('17ca3aeb-d349-11e2-b0fb-b51b1c98e6f4',99,'06/12/2013 12:16:07','2806099774','USB-Massenspeichergerät',4,1),
  ('1955a11a-beec-11e3-a33e-f0def1706fca',99,'04/08/2014 09:05:00','1223982013','Gerätetreiberinstallation',4,1),
  ('1a6ff455-2394-11e3-b1cd-f0def1706fca',99,'09/22/2013 16:34:36','1138132809','Gerätetreiberinstallation',4,1),
  ('1c6548aa-39f3-11e2-bc8a-f0def1706fca',99,'11/29/2012 08:05:10','1233576197','Gerätetreiberinstallation',4,1),
  ('1de9799c-9c63-11e3-9d9e-f0def1706fca',99,'02/23/2014 09:18:48','388111150','Unknown Device',4,1),
  ('205ba629-bd3b-11e0-8d12-028037ec0200',99,'08/02/2011 21:10:47','1138132679','Gerätetreiberinstallation',4,1),
  ('2337f348-bd3b-11e0-8d12-028037ec0200',99,'08/02/2011 21:10:52','1138132809','Gerätetreiberinstallation',4,1),
  ('248180e5-e8cd-11e0-ad39-028037ec0200',99,'09/27/2011 07:54:20','1267225681','Gerätetreiberinstallation',4,1),
  ('277d9a9c-e8cd-11e0-ad39-028037ec0200',99,'09/27/2011 07:54:25','1267224891','Gerätetreiberinstallation',4,1),
  ('2a79b454-e8cd-11e0-ad39-028037ec0200',99,'09/27/2011 07:54:30','1267225612','Gerätetreiberinstallation',4,1),
  ('2bd19d5a-bd3b-11e0-8d12-028037ec0200',99,'08/02/2011 21:11:06','1138132529','Gerätetreiberinstallation',4,1),
  ('2d782f6d-e8cd-11e0-ad39-028037ec0200',99,'09/27/2011 07:54:35','1267225006','Gerätetreiberinstallation',4,1),
  ('32cdfdc3-035f-11e4-9c85-f0def1706fca',3,'07/04/2014 11:40:14','54507390','WindowsExplorer',4,1),
  ('3418e16e-39f1-11e2-bc8a-f0def1706fca',99,'11/29/2012 07:51:30','1233576197','Gerätetreiberinstallation',4,1),
  ('343a9e5b-fbe0-11e3-b525-f0def1706fca',3,'06/24/2014 22:43:32','55769560','WindowsExplorer',4,1),
  ('34429f92-181b-11e4-afb8-f0def1706fca',3,'07/30/2014 20:56:26','60516248','Microsoft Word',4,1),
  ('3d207e7b-e59b-11e3-a724-f0def1706fca',2,'05/27/2014 14:34:27','210328511','DAVINCI LOOK 6 Programmdatei',4,1),
  ('4117dade-5b58-11e3-8c9a-f0def1706fca',99,'12/02/2013 14:47:16','1045973700','Gerätetreiberinstallation',4,1),
  ('41934ab6-d6b6-11e3-8790-f0def1706fca',3,'05/08/2014 15:40:03','54507390','WindowsExplorer',4,1),
  ('4e4c8cd4-deb2-11e0-986c-028037ec0200',99,'09/14/2011 11:17:03','1178946239','Gerätetreiberinstallation',4,1),
  ('5171ba2f-deb2-11e0-986c-028037ec0200',99,'09/14/2011 11:17:08','1178946239','Gerätetreiberinstallation',4,1),
  ('53c500d3-e994-11e0-841e-028037ec0200',99,'09/28/2011 07:40:10','1130529712','Microsoft Visio',4,1),
  ('5d4fba9a-020b-11e4-9eb7-f0def1706fca',2,'07/02/2014 19:07:37','2166324312','PowerGUI',4,1),
  ('5f4303b3-f345-11e0-8ec8-028037ec0200',99,'10/10/2011 15:40:10','462660546','Gerätetreiberinstallation',4,1),
  ('60d549dd-beec-11e3-a33e-f0def1706fca',99,'04/08/2014 09:07:00','1223982013','Gerätetreiberinstallation',4,1),
  ('621f58f6-11f0-11e2-b883-f0def1706fca',99,'10/09/2012 11:04:52','1666951804','Gerätetreiberinstallation',4,1),
  ('64bd778c-8cdc-11e3-8317-f0def1706fca',99,'02/03/2014 15:06:37','1019114223','Gerätetreiberinstallation',4,1),
  ('679202a6-d1e7-11e3-9ebb-f0def1706fca',3,'05/02/2014 12:49:16','54507390','WindowsExplorer',4,1),
  ('67d366db-2122-11e3-9ea4-f0def1706fca',99,'09/19/2013 13:55:41','1199039247','Gerätetreiberinstallation',4,1),
  ('683436fb-f8aa-11e0-8f27-028037ec0200',99,'10/17/2011 12:26:00','776953355','Gerätetreiberinstallation',4,1),
  ('6a8abfc1-51c1-11e2-8c8d-f0def1706fca',99,'12/29/2012 15:09:54','1138132679','Gerätetreiberinstallation',4,1),
  ('6ab5d11a-2122-11e3-9ea4-f0def1706fca',99,'09/19/2013 13:55:46','1199039622','Gerätetreiberinstallation',4,1),
  ('6ab5d11b-2122-11e3-9ea4-f0def1706fca',99,'09/19/2013 13:55:49','1199038716','Gerätetreiberinstallation',4,1),
  ('6ab5d11c-2122-11e3-9ea4-f0def1706fca',99,'09/19/2013 13:55:56','1260680720','Gerätetreiberinstallation',4,1),
  ('6c8bb83f-8cdc-11e3-8317-f0def1706fca',99,'02/03/2014 15:06:50','852311529','Gerätetreiberinstallation',4,1),
  ('6c8bb840-8cdc-11e3-8317-f0def1706fca',99,'02/03/2014 15:06:53','1019114283','Gerätetreiberinstallation',4,1),
  ('6d6f25d8-51c1-11e2-8c8d-f0def1706fca',99,'12/29/2012 15:09:59','1138132809','Gerätetreiberinstallation',4,1),
  ('6ed2903b-6839-11e1-aae5-028037ec0200',99,'03/07/2012 10:39:28','1159221087','Gerätetreiberinstallation',4,1),
  ('6f193118-f706-11e0-8f92-028037ec0200',99,'10/15/2011 10:19:43','452704182','Assistent für Problembehandlung per Diagnose',4,1),
  ('706b8119-51c1-11e2-8c8d-f0def1706fca',99,'12/29/2012 15:10:04','1138132529','Gerätetreiberinstallation',4,1),
  ('73c4aa3a-bada-11e0-a48f-cc52afe2d81f',99,'07/30/2011 20:33:43','1801173967','Gerätetreiberinstallation',4,1),
  ('75df0931-2122-11e3-9ea4-f0def1706fca',99,'09/19/2013 13:56:05','1199039094','Gerätetreiberinstallation',4,1),
  ('75df0932-2122-11e3-9ea4-f0def1706fca',99,'09/19/2013 13:56:10','1199039399','Gerätetreiberinstallation',4,1),
  ('77d0edd2-18b9-11e4-a345-f0def1706fca',2,'07/31/2014 15:49:19','2166324312','PowerGUI',4,1),
  ('78c02842-0882-11e2-bd08-f0def1706fca',99,'09/27/2012 11:05:24','1302581026','Gerätetreiberinstallation',4,1),
  ('7c20254c-1ec8-11e3-ba96-f0def1706fca',99,'09/16/2013 14:06:58','1199039247','Gerätetreiberinstallation',4,1),
  ('7c753a81-2122-11e3-9ea4-f0def1706fca',99,'09/19/2013 13:56:16','1260680845','Gerätetreiberinstallation',4,1),
  ('7ff1ffef-eb4b-11e0-86f0-028037ec0200',99,'09/30/2011 12:03:53','2382344953','Assistent für Problembehandlung per Diagnose',4,1),
  ('86e76bd1-20f2-11e3-9ea4-f0def1706fca',99,'09/19/2013 08:12:57','1260680720','Gerätetreiberinstallation',4,1),
  ('875e1e30-1ec8-11e3-ba96-f0def1706fca',99,'09/16/2013 14:07:17','1199039622','Gerätetreiberinstallation',4,1),
  ('875e1e31-1ec8-11e3-ba96-f0def1706fca',99,'09/16/2013 14:07:21','1199038716','Gerätetreiberinstallation',4,1),
  ('88fad74e-d765-11e3-b612-f0def1706fca',3,'05/09/2014 12:34:45','54507390','WindowsExplorer',4,1),
  ('89e2406c-20f2-11e3-9ea4-f0def1706fca',99,'09/19/2013 08:13:02','1199039094','Gerätetreiberinstallation',4,1),
  ('89e2406d-20f2-11e3-9ea4-f0def1706fca',99,'09/19/2013 08:13:06','1199039399','Gerätetreiberinstallation',4,1),
  ('89e2406e-20f2-11e3-9ea4-f0def1706fca',99,'09/19/2013 08:13:09','1260680845','Gerätetreiberinstallation',4,1),
  ('90ab424b-20f2-11e3-9ea4-f0def1706fca',99,'09/19/2013 08:13:14','1199039247','Gerätetreiberinstallation',4,1),
  ('90ab424c-20f2-11e3-9ea4-f0def1706fca',99,'09/19/2013 08:13:17','1199039622','Gerätetreiberinstallation',4,1),
  ('90ab424d-20f2-11e3-9ea4-f0def1706fca',99,'09/19/2013 08:13:20','1199038716','Gerätetreiberinstallation',4,1),
  ('91b4bb4d-2393-11e3-b1cd-f0def1706fca',99,'09/22/2013 16:30:47','1138132529','Gerätetreiberinstallation',4,1),
  ('93df3ac1-25a8-11e3-b734-f0def1706fca',99,'09/25/2013 08:06:12','1321711379','Gerätetreiberinstallation',4,1),
  ('95ecd5c0-e806-11e0-9a6a-028037ec0200',99,'09/26/2011 08:13:01','1178946239','Gerätetreiberinstallation',4,1),
  ('962d018c-d69b-11e3-8790-f0def1706fca',99,'05/08/2014 12:29:09','1068450269','Assistent für Problembehandlung per Diagnose',4,1),
  ('98b50222-e008-11e3-bfd8-f0def1706fca',3,'05/20/2014 12:22:09','54507390','WindowsExplorer',4,1),
  ('a0ca0efb-1ec8-11e3-ba96-f0def1706fca',99,'09/16/2013 14:08:00','1260680720','Gerätetreiberinstallation',4,1),
  ('a0ca0efc-1ec8-11e3-ba96-f0def1706fca',99,'09/16/2013 14:08:04','1260680845','Gerätetreiberinstallation',4,1),
  ('a0ca0efd-1ec8-11e3-ba96-f0def1706fca',99,'09/16/2013 14:08:09','1199039094','Gerätetreiberinstallation',4,1),
  ('a5f46371-1602-11e7-954f-901b0ec9c570',99,'03/31/2017 13:10:29','10','Gerätetreiberinstallation',1,1),
  ('a77124d8-dc16-11e3-a1d1-f0def1706fca',3,'05/15/2014 11:52:41','54507390','WindowsExplorer',4,1),
  ('a83323c2-1ec8-11e3-ba96-f0def1706fca',99,'09/16/2013 14:08:12','1199039399','Gerätetreiberinstallation',4,1),
  ('af2d814d-5331-11e1-bcca-028037ec0200',99,'02/09/2012 16:21:06','388111150','Unknown Device',4,1),
  ('b6bc34b0-dd29-11e0-a860-028037ec0200',99,'09/12/2011 12:26:46','1321711379','Gerätetreiberinstallation',4,1),
  ('bb2dfe87-e995-11e0-841e-028037ec0200',99,'09/28/2011 07:50:13','1130529712','Microsoft Visio',4,1),
  ('bbdb667f-7740-11e1-a6eb-028037ec0200',99,'03/26/2012 14:39:32','1302581026','Gerätetreiberinstallation',4,1),
  ('c62bf528-de42-11e2-b8a6-f04e14c73829',99,'06/26/2013 11:28:35','1551783018','Gerätetreiberinstallation',4,1),
  ('ca646141-dded-11e0-b9c8-028037ec0200',99,'09/13/2011 11:50:20','1135371291','Gerätetreiberinstallation',4,1),
  ('cf75d69c-dea0-11e0-986c-028037ec0200',99,'09/14/2011 09:11:48','1321711379','Gerätetreiberinstallation',4,1),
  ('cfe3696f-2d8c-11e2-910a-f0def1706fca',99,'11/13/2012 13:22:39','452704182','Assistent für Problembehandlung per Diagnose',4,1),
  ('d05f30e5-de42-11e2-b8a6-f04e14c73829',99,'06/26/2013 11:28:52','1551783018','Gerätetreiberinstallation',4,1),
  ('d2fe94dc-49a8-11e2-b0e1-f0def1706fca',99,'12/19/2012 07:53:42','388111150','Unknown Device',4,1),
  ('d58782ad-8ae0-11e1-8763-028037ec0200',99,'04/20/2012 14:03:26','452704182','Assistent für Problembehandlung per Diagnose',4,1),
  ('d61d21ad-c5d0-11e2-95f7-f0def1706fca',99,'05/26/2013 08:52:32','1138132679','Gerätetreiberinstallation',4,1),
  ('d90449e5-d431-11e3-8446-f0def1706fca',2,'05/05/2014 10:47:12','80940756','Windows-Explorer',4,1),
  ('d91229d3-c5d0-11e2-95f7-f0def1706fca',99,'05/26/2013 08:52:37','1138132809','Gerätetreiberinstallation',4,1),
  ('daa5af49-ea26-11e3-9c0a-f0def1706fca',2,'06/02/2014 09:23:56','2758854673','MySQL Workbench',4,1),
  ('dbff8092-faac-11e3-a2a8-f0def1706fca',2,'06/23/2014 10:03:29','19486805','Müller Foto.exe',4,1),
  ('df7498f6-3259-11e3-b63c-f0def1706fca',99,'10/11/2013 11:45:34','1914225191','USB-Massenspeichergerät',4,1),
  ('e100fe0d-d4e8-11e3-a010-f0def1706fca',3,'05/06/2014 08:37:23','54507390','WindowsExplorer',4,1),
  ('e4be8583-9a80-11e1-ae14-028037ec0200',99,'05/10/2012 11:16:59','772937264','Gerätetreiberinstallation',4,1),
  ('e4cd736c-2955-11e1-be12-028037ec0200',99,'12/18/2011 09:54:29','5353263','Gerätetreiberinstallation',4,1),
  ('e5ff4f9c-031a-11e1-8041-028037ec0200',99,'10/30/2011 18:16:27','2078954956','Bing Client Extensions',4,1),
  ('e97420fc-c5d0-11e2-95f7-f0def1706fca',99,'05/26/2013 08:53:04','1138132529','Gerätetreiberinstallation',4,1),
  ('ed3703e7-be81-11e0-91b9-028037ec0200',99,'08/04/2011 12:10:07','4592850','Gerätetreiberinstallation',4,1),
  ('eeb8e9a7-2229-11e4-a487-f0def1706fca',1,'08/12/2014 16:07:03','3951428486','powershell',4,1),
  ('f93e8cce-11ee-11e2-b883-f0def1706fca',99,'10/09/2012 10:54:46','1267224891','Gerätetreiberinstallation',4,1),
  ('fc3c5bfb-11ee-11e2-b883-f0def1706fca',99,'10/09/2012 10:54:51','1267225006','Gerätetreiberinstallation',4,1),
  ('fc3c5bfc-11ee-11e2-b883-f0def1706fca',99,'10/09/2012 10:54:54','1267225612','Gerätetreiberinstallation',4,1),
  ('fdeb8f80-4dc4-11e3-91de-f0def1706fca',99,'11/15/2013 08:10:23','388111150','Unknown Device',4,1),
  ('fe3c8509-8d9e-11e3-85c8-f0def1706fca',99,'02/04/2014 14:19:37','1365923196','Gerätetreiberinstallation',4,1),
  ('fe3c850a-8d9e-11e3-85c8-f0def1706fca',99,'02/04/2014 14:19:41','1365923544','Gerätetreiberinstallation',4,1),
  ('fe3c850b-8d9e-11e3-85c8-f0def1706fca',99,'02/04/2014 14:19:44','1365923646','Gerätetreiberinstallation',4,1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;