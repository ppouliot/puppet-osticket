-- MySQL dump 10.13  Distrib 5.5.38, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: osticket
-- ------------------------------------------------------
-- Server version	5.5.38-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ost_api_key`
--

DROP TABLE IF EXISTS `ost_api_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_api_key` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ipaddr` varchar(64) NOT NULL,
  `apikey` varchar(255) NOT NULL,
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_exec_cron` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` text,
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `apikey` (`apikey`),
  KEY `ipaddr` (`ipaddr`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_api_key`
--

LOCK TABLES `ost_api_key` WRITE;
/*!40000 ALTER TABLE `ost_api_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_api_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_attachment`
--

DROP TABLE IF EXISTS `ost_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_attachment` (
  `object_id` int(11) unsigned NOT NULL,
  `type` char(1) NOT NULL,
  `file_id` int(11) unsigned NOT NULL,
  `inline` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`file_id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_attachment`
--

LOCK TABLES `ost_attachment` WRITE;
/*!40000 ALTER TABLE `ost_attachment` DISABLE KEYS */;
INSERT INTO `ost_attachment` VALUES (1,'C',3,0),(8,'T',1,1),(9,'T',1,1),(10,'T',1,1),(11,'T',1,1),(12,'T',1,1),(13,'T',1,1);
/*!40000 ALTER TABLE `ost_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_canned_response`
--

DROP TABLE IF EXISTS `ost_canned_response`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_canned_response` (
  `canned_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL DEFAULT '',
  `response` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`canned_id`),
  UNIQUE KEY `title` (`title`),
  KEY `dept_id` (`dept_id`),
  KEY `active` (`isenabled`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_canned_response`
--

LOCK TABLES `ost_canned_response` WRITE;
/*!40000 ALTER TABLE `ost_canned_response` DISABLE KEYS */;
INSERT INTO `ost_canned_response` VALUES (1,0,1,'What is osTicket (sample)?','osTicket is a widely-used open source support ticket system, an attractive alternative to higher-cost and complex customer support systems - simple, lightweight, reliable, open source, web-based and easy to setup and use.','en_US','','2014-10-02 15:49:48','2014-10-02 15:49:48'),(2,0,1,'Sample (with variables)','Hi %{ticket.name.first}, <br /> <br /> Your ticket #%{ticket.number} created on %{ticket.create_date} is in %{ticket.dept.name} department.','en_US','','2014-10-02 15:49:48','2014-10-02 15:49:48');
/*!40000 ALTER TABLE `ost_canned_response` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_config`
--

DROP TABLE IF EXISTS `ost_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `namespace` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `namespace` (`namespace`,`key`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_config`
--

LOCK TABLES `ost_config` WRITE;
/*!40000 ALTER TABLE `ost_config` DISABLE KEYS */;
INSERT INTO `ost_config` VALUES (1,'core','admin_email','ppouliot@microsoft.com','2014-10-02 19:49:50'),(2,'core','helpdesk_url','http://breaker.pouliot.net/','2014-10-02 19:49:50'),(3,'core','helpdesk_title','OpenStack CI','2014-10-02 19:49:50'),(4,'core','schema_signature','8f99b8bf9bee63c8e4dc274ffbdda383','2014-10-02 19:49:50'),(5,'dept.1','assign_members_only','','2014-10-02 19:49:38'),(6,'dept.2','assign_members_only','','2014-10-02 19:49:38'),(7,'dept.3','assign_members_only','','2014-10-02 19:49:39'),(8,'sla.1','transient','0','2014-10-02 19:49:39'),(9,'core','time_format','h:i A','2014-10-02 19:49:42'),(10,'core','date_format','m/d/Y','2014-10-02 19:49:42'),(11,'core','datetime_format','m/d/Y g:i a','2014-10-02 19:49:42'),(12,'core','daydatetime_format','D, M j Y g:ia','2014-10-02 19:49:42'),(13,'core','default_timezone_id','8','2014-10-02 19:49:42'),(14,'core','default_priority_id','2','2014-10-02 19:49:42'),(15,'core','enable_daylight_saving','0','2014-10-02 19:49:42'),(16,'core','reply_separator','-- reply above this line --','2014-10-02 19:49:43'),(17,'core','allowed_filetypes','.doc, .pdf, .jpg, .jpeg, .gif, .png, .xls, .docx, .xlsx, .txt','2014-10-02 19:49:43'),(18,'core','isonline','1','2014-10-02 19:49:43'),(19,'core','staff_ip_binding','0','2014-10-02 19:49:43'),(20,'core','staff_max_logins','4','2014-10-02 19:49:43'),(21,'core','staff_login_timeout','2','2014-10-02 19:49:43'),(22,'core','staff_session_timeout','30','2014-10-02 19:49:43'),(23,'core','passwd_reset_period','0','2014-10-02 19:49:43'),(24,'core','client_max_logins','4','2014-10-02 19:49:43'),(25,'core','client_login_timeout','2','2014-10-02 19:49:43'),(26,'core','client_session_timeout','30','2014-10-02 19:49:43'),(27,'core','max_page_size','25','2014-10-02 19:49:43'),(28,'core','max_open_tickets','0','2014-10-02 19:49:43'),(29,'core','max_file_size','1048576','2014-10-02 19:49:43'),(30,'core','max_user_file_uploads','1','2014-10-02 19:49:43'),(31,'core','max_staff_file_uploads','1','2014-10-02 19:49:43'),(32,'core','autolock_minutes','3','2014-10-02 19:49:43'),(33,'core','default_smtp_id','0','2014-10-02 19:49:43'),(34,'core','use_email_priority','0','2014-10-02 19:49:44'),(35,'core','enable_kb','0','2014-10-02 19:49:44'),(36,'core','enable_premade','1','2014-10-02 19:49:44'),(37,'core','enable_captcha','0','2014-10-02 19:49:44'),(38,'core','enable_auto_cron','0','2014-10-02 19:49:44'),(39,'core','enable_mail_polling','0','2014-10-02 19:49:44'),(40,'core','send_sys_errors','1','2014-10-02 19:49:44'),(41,'core','send_sql_errors','1','2014-10-02 19:49:44'),(42,'core','send_login_errors','1','2014-10-02 19:49:44'),(43,'core','save_email_headers','1','2014-10-02 19:49:44'),(44,'core','strip_quoted_reply','1','2014-10-02 19:49:45'),(45,'core','ticket_autoresponder','0','2014-10-02 19:49:45'),(46,'core','message_autoresponder','0','2014-10-02 19:49:45'),(47,'core','ticket_notice_active','1','2014-10-02 19:49:45'),(48,'core','ticket_alert_active','1','2014-10-02 19:49:45'),(49,'core','ticket_alert_admin','1','2014-10-02 19:49:45'),(50,'core','ticket_alert_dept_manager','1','2014-10-02 19:49:45'),(51,'core','ticket_alert_dept_members','0','2014-10-02 19:49:45'),(52,'core','message_alert_active','1','2014-10-02 19:49:45'),(53,'core','message_alert_laststaff','1','2014-10-02 19:49:45'),(54,'core','message_alert_assigned','1','2014-10-02 19:49:45'),(55,'core','message_alert_dept_manager','0','2014-10-02 19:49:45'),(56,'core','note_alert_active','0','2014-10-02 19:49:45'),(57,'core','note_alert_laststaff','1','2014-10-02 19:49:45'),(58,'core','note_alert_assigned','1','2014-10-02 19:49:46'),(59,'core','note_alert_dept_manager','0','2014-10-02 19:49:46'),(60,'core','transfer_alert_active','0','2014-10-02 19:49:46'),(61,'core','transfer_alert_assigned','0','2014-10-02 19:49:46'),(62,'core','transfer_alert_dept_manager','1','2014-10-02 19:49:46'),(63,'core','transfer_alert_dept_members','0','2014-10-02 19:49:46'),(64,'core','overdue_alert_active','1','2014-10-02 19:49:46'),(65,'core','overdue_alert_assigned','1','2014-10-02 19:49:46'),(66,'core','overdue_alert_dept_manager','1','2014-10-02 19:49:46'),(67,'core','overdue_alert_dept_members','0','2014-10-02 19:49:46'),(68,'core','assigned_alert_active','1','2014-10-02 19:49:46'),(69,'core','assigned_alert_staff','1','2014-10-02 19:49:46'),(70,'core','assigned_alert_team_lead','0','2014-10-02 19:49:46'),(71,'core','assigned_alert_team_members','0','2014-10-02 19:49:46'),(72,'core','auto_claim_tickets','1','2014-10-02 19:49:46'),(73,'core','show_related_tickets','1','2014-10-02 19:49:46'),(74,'core','show_assigned_tickets','1','2014-10-02 19:49:46'),(75,'core','show_answered_tickets','0','2014-10-02 19:49:47'),(76,'core','hide_staff_name','0','2014-10-02 19:49:47'),(77,'core','overlimit_notice_active','0','2014-10-02 19:49:47'),(78,'core','email_attachments','1','2014-10-02 19:49:47'),(79,'core','random_ticket_ids','1','2014-10-02 19:49:47'),(80,'core','log_level','2','2014-10-02 19:49:47'),(81,'core','log_graceperiod','12','2014-10-02 19:49:47'),(82,'core','client_registration','public','2014-10-02 19:49:47'),(83,'core','landing_page_id','1','2014-10-02 19:49:47'),(84,'core','thank-you_page_id','2','2014-10-02 19:49:47'),(85,'core','offline_page_id','3','2014-10-02 19:49:47'),(86,'core','system_language','en_US','2014-10-02 19:49:48'),(87,'core','default_email_id','1','2014-10-02 19:49:50'),(88,'core','alert_email_id','2','2014-10-02 19:49:50'),(89,'core','default_dept_id','1','2014-10-02 19:49:50'),(90,'core','default_sla_id','1','2014-10-02 19:49:50'),(91,'core','default_template_id','1','2014-10-02 19:49:50');
/*!40000 ALTER TABLE `ost_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_content`
--

DROP TABLE IF EXISTS `ost_content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `content_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `type` varchar(32) NOT NULL DEFAULT 'other',
  `name` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_content`
--

LOCK TABLES `ost_content` WRITE;
/*!40000 ALTER TABLE `ost_content` DISABLE KEYS */;
INSERT INTO `ost_content` VALUES (1,1,1,'landing','Landing','<h1>Welcome to the Support Center</h1> <p> In order to streamline support requests and better serve you, we utilize a support ticket system. Every support request is assigned a unique ticket number which you can use to track the progress and responses online. For your reference we provide complete archives and history of all your support requests. A valid email address is required to submit a ticket. </p>','en_US','The Landing Page refers to the content of the Customer Portal\'s intial view. The template modifies the content seen above the two links <strong>Open a New Ticket</strong> and <strong>Check Ticket Status</strong>.','2014-10-02 15:49:47','2014-10-02 15:49:47'),(2,2,1,'thank-you','Thank You','<div>%{ticket.name},\n<br>\n<br>\nThank you for contacting us.\n<br>\n<br>\nA support ticket request has been created and a representative will be\ngetting back to you shortly if necessary.</p>\n<br>\n<br>\nSupport Team\n</div>','en_US','This template defines the content displayed on the Thank-You page after a\nClient submits a new ticket in the Client Portal.','2014-10-02 15:49:47','2014-10-02 15:49:47'),(3,3,1,'offline','Offline','<div><h1>\n<span style=\"font-size: medium\">Support Ticket System Offline</span>\n</h1>\n<p>Thank you for your interest in contacting us.</p>\n<p>Our helpdesk is offline at the moment, please check back at a later\ntime.</p>\n</div>','en_US','The Offline Page appears in the Customer Portal when the Help Desk is offline.','2014-10-02 15:49:47','2014-10-02 15:49:47'),(4,4,1,'registration-staff','Welcome to osTicket','<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System<br /> %{company.name}</em> </div>','en_US','This template defines the initial email (optional) sent to Agents when an account is created on their behalf.','2014-10-02 15:49:47','2014-10-02 15:49:47'),(5,5,1,'pwreset-staff','osTicket Staff Password Reset','<h3><strong>Hi %{staff.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width: 126px\" /> </div>','en_US','This template defines the email sent to Staff who select the <strong>Forgot My Password</strong> link on the Staff Control Panel Log In page.','2014-10-02 15:49:47','2014-10-02 15:49:47'),(6,6,1,'banner-staff','Authentication Required','','en_US','This is the initial message and banner shown on the Staff Log In page. The first input field refers to the red-formatted text that appears at the top. The latter textarea is for the banner content which should serve as a disclaimer.','2014-10-02 15:49:47','2014-10-02 15:49:47'),(7,7,1,'registration-client','Welcome to %{company.name}','<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> We\'ve created an account for you at our help desk at %{url}.<br /> <br /> Please follow the link below to confirm your account and gain access to your tickets.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>','en_US','This template defines the email sent to Clients when their account has been created in the Client Portal or by an Agent on their behalf. This email serves as an email address verification. Please use %{link} somewhere in the body.','2014-10-02 15:49:48','2014-10-02 15:49:48'),(8,8,1,'pwreset-client','%{company.name} Help Desk Access','<h3><strong>Hi %{user.name.first},</strong></h3> <div> A password reset request has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> If you feel that this has been done in error, delete and disregard this email. Your account is still secure and no one has been given access to it. It is not locked and your password has not been reset. Someone could have mistakenly entered your email address.<br /> <br /> Follow the link below to login to the help desk and change your password.<br /> <br /> <a href=\"%{link}\">%{link}</a><br /> <br /> <em style=\"font-size: small\">Your friendly Customer Support System <br /> %{company.name}</em> </div>','en_US','This template defines the email sent to Clients who select the <strong>Forgot My Password</strong> link on the Client Log In page.','2014-10-02 15:49:48','2014-10-02 15:49:48'),(9,9,1,'banner-client','Sign in to %{company.name}','To better serve you, we encourage our Clients to register for an account.','en_US','This composes the header on the Client Log In page. It can be useful to inform your Clients about your log in and registration policies.','2014-10-02 15:49:48','2014-10-02 15:49:48'),(10,10,1,'registration-confirm','Account registration','<div><strong>Thanks for registering for an account.</strong><br/> <br /> We\'ve just sent you an email to the address you entered. Please follow the link in the email to confirm your account and gain access to your tickets. </div>','en_US','This templates defines the page shown to Clients after completing the registration form. The template should mention that the system is sending them an email confirmation link and what is the next step in the registration process.','2014-10-02 15:49:48','2014-10-02 15:49:48'),(11,11,1,'registration-thanks','Account Confirmed!','<div> <strong>Thanks for registering for an account.</strong><br /> <br /> You\'ve confirmed your email address and successfully activated your account. You may proceed to open a new ticket or manage existing tickets.<br /> <br /> <em>Your friendly support center</em><br /> %{company.name} </div>','en_US','This template defines the content displayed after Clients successfully register by confirming their account. This page should inform the user that registration is complete and that the Client can now submit a ticket or access existing tickets.','2014-10-02 15:49:48','2014-10-02 15:49:48'),(12,12,1,'access-link','Ticket [#%{ticket.number}] Access Link','<h3><strong>Hi %{recipient.name.first},</strong></h3> <div> An access link request for ticket #%{ticket.number} has been submitted on your behalf for the helpdesk at %{url}.<br /> <br /> Follow the link below to check the status of the ticket #%{ticket.number}.<br /> <br /> <a href=\"%{recipient.ticket_link}\">%{recipient.ticket_link}</a><br /> <br /> If you <strong>did not</strong> make the request, please delete and disregard this email. Your account is still secure and no one has been given access to the ticket. Someone could have mistakenly entered your email address.<br /> <br /> --<br /> %{company.name} </div>','en_US','This template defines the notification for Clients that an access link was sent to their email. The ticket number and email address trigger the access link.','2014-10-02 15:49:48','2014-10-02 15:49:48');
/*!40000 ALTER TABLE `ost_content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_department`
--

DROP TABLE IF EXISTS `ost_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_department` (
  `dept_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `autoresp_email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `manager_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_name` varchar(128) NOT NULL DEFAULT '',
  `dept_signature` text NOT NULL,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_membership` tinyint(1) NOT NULL DEFAULT '0',
  `ticket_auto_response` tinyint(1) NOT NULL DEFAULT '1',
  `message_auto_response` tinyint(1) NOT NULL DEFAULT '0',
  `updated` datetime NOT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`dept_id`),
  UNIQUE KEY `dept_name` (`dept_name`),
  KEY `manager_id` (`manager_id`),
  KEY `autoresp_email_id` (`autoresp_email_id`),
  KEY `tpl_id` (`tpl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_department`
--

LOCK TABLES `ost_department` WRITE;
/*!40000 ALTER TABLE `ost_department` DISABLE KEYS */;
INSERT INTO `ost_department` VALUES (1,0,0,0,0,0,'Support','Support Department',1,1,1,1,'2014-10-02 15:49:38','2014-10-02 15:49:38'),(2,0,1,0,0,0,'Sales','Sales and Customer Retention',1,1,1,1,'2014-10-02 15:49:38','2014-10-02 15:49:38'),(3,0,0,0,0,0,'Maintenance','Maintenance Department',0,0,1,1,'2014-10-02 15:49:39','2014-10-02 15:49:39');
/*!40000 ALTER TABLE `ost_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_draft`
--

DROP TABLE IF EXISTS `ost_draft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_draft` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `staff_id` int(11) unsigned NOT NULL,
  `namespace` varchar(32) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `extra` text,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_draft`
--

LOCK TABLES `ost_draft` WRITE;
/*!40000 ALTER TABLE `ost_draft` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_draft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email`
--

DROP TABLE IF EXISTS `ost_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email` (
  `email_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `noautoresp` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  `userid` varchar(255) NOT NULL,
  `userpass` varchar(255) CHARACTER SET ascii NOT NULL,
  `mail_active` tinyint(1) NOT NULL DEFAULT '0',
  `mail_host` varchar(255) NOT NULL,
  `mail_protocol` enum('POP','IMAP') NOT NULL DEFAULT 'POP',
  `mail_encryption` enum('NONE','SSL') NOT NULL,
  `mail_port` int(6) DEFAULT NULL,
  `mail_fetchfreq` tinyint(3) NOT NULL DEFAULT '5',
  `mail_fetchmax` tinyint(4) NOT NULL DEFAULT '30',
  `mail_archivefolder` varchar(255) DEFAULT NULL,
  `mail_delete` tinyint(1) NOT NULL DEFAULT '0',
  `mail_errors` tinyint(3) NOT NULL DEFAULT '0',
  `mail_lasterror` datetime DEFAULT NULL,
  `mail_lastfetch` datetime DEFAULT NULL,
  `smtp_active` tinyint(1) DEFAULT '0',
  `smtp_host` varchar(255) NOT NULL,
  `smtp_port` int(6) DEFAULT NULL,
  `smtp_secure` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_auth` tinyint(1) NOT NULL DEFAULT '1',
  `smtp_spoofing` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`email_id`),
  UNIQUE KEY `email` (`email`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email`
--

LOCK TABLES `ost_email` WRITE;
/*!40000 ALTER TABLE `ost_email` DISABLE KEYS */;
INSERT INTO `ost_email` VALUES (1,0,2,1,0,'ci_lab@microsoft.com','Support','','',0,'','POP','NONE',NULL,5,30,NULL,0,0,NULL,NULL,0,'',NULL,1,1,0,NULL,'2014-10-02 15:49:50','2014-10-02 15:49:50'),(2,0,2,1,0,'alerts@microsoft.com','osTicket Alerts','','',0,'','POP','NONE',NULL,5,30,NULL,0,0,NULL,NULL,0,'',NULL,1,1,0,NULL,'2014-10-02 15:49:50','2014-10-02 15:49:50'),(3,0,2,1,0,'noreply@microsoft.com','','','',0,'','POP','NONE',NULL,5,30,NULL,0,0,NULL,NULL,0,'',NULL,1,1,0,NULL,'2014-10-02 15:49:50','2014-10-02 15:49:50');
/*!40000 ALTER TABLE `ost_email` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email_account`
--

DROP TABLE IF EXISTS `ost_email_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `protocol` varchar(64) NOT NULL DEFAULT '',
  `host` varchar(128) NOT NULL DEFAULT '',
  `port` int(11) NOT NULL,
  `username` varchar(128) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `options` varchar(512) DEFAULT NULL,
  `errors` int(11) unsigned DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `lastconnect` timestamp NULL DEFAULT NULL,
  `lasterror` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email_account`
--

LOCK TABLES `ost_email_account` WRITE;
/*!40000 ALTER TABLE `ost_email_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_email_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email_template`
--

DROP TABLE IF EXISTS `ost_email_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email_template` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `tpl_id` int(11) unsigned NOT NULL,
  `code_name` varchar(32) NOT NULL,
  `subject` varchar(255) NOT NULL DEFAULT '',
  `body` text NOT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `template_lookup` (`tpl_id`,`code_name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email_template`
--

LOCK TABLES `ost_email_template` WRITE;
/*!40000 ALTER TABLE `ost_email_template` DISABLE KEYS */;
INSERT INTO `ost_email_template` VALUES (1,1,'ticket.autoresp','Support Ticket Opened [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> <p> A request for support has been created and assigned #%{ticket.number}. A representative will follow-up with you as soon as possible. You can <a href=\"%{recipient.ticket_link}\">view this ticket\'s progress online</a>. </p> <br /> <div style=\"color:rgb(127, 127, 127)\"> Your %{company.name} Team, <br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%{recipient.ticket_link}\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>',NULL,'2014-10-02 15:49:48','2014-10-02 15:49:48'),(2,1,'ticket.autoreply','Re: %{ticket.subject} [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> A request for support has been created and assigned ticket <a href=\"%{recipient.ticket_link}\">#%{ticket.number}</a> with the following automatic reply <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\">Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>We hope this response has sufficiently answered your questions. If you wish to provide additional comments or informatione, please reply to this email or <a href=\"%{recipient.ticket_link}\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(3,1,'message.autoresp','Message Confirmation','<h3><strong>Dear %{recipient.name.first},</strong></h3> Your reply to support request <a href=\"%{recipient.ticket_link}\">#%{ticket.number}</a> has been noted <br /> <br /> <div style=\"color:rgb(127, 127, 127)\"> Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>You can view the support request progress <a href=\"%{recipient.ticket_link}\">online here</a></em> </div>',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(4,1,'ticket.notice','%{ticket.subject} [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> Our customer care team has created a ticket, <a href=\"%{recipient.ticket_link}\">#%{ticket.number}</a> on your behalf, with the following details and summary: <br /> <br /> Topic: <strong>%{ticket.topic.name}</strong> <br /> Subject: <strong>%{ticket.subject}</strong> <br /> <br /> %{message} <br /> <br /> If need be, a representative will follow-up with you as soon as possible. You can also <a href=\"%{recipient.ticket_link}\">view this ticket\'s progress online</a>. <br /> <br /> <div style=\"color:rgb(127, 127, 127)\"> Your %{company.name} Team,<br /> %{signature}</div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small\"><em>If you wish to provide additional comments or information regarding the issue, please reply to this email or <a href=\"%{recipient.ticket_link}\"><span style=\"color:rgb(84, 141, 212)\">login to your account</span></a> for a complete archive of your support requests.</em></div>',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(5,1,'ticket.overlimit','Open Tickets Limit Reached','<h3><strong>Dear %{ticket.name.first},</strong></h3> You have reached the maximum number of open tickets allowed. To be able to open another ticket, one of your pending tickets must be closed. To update or add comments to an open ticket simply <a href=\"%{url}/tickets.php?e=%{ticket.email}\">login to our helpdesk</a>. <br /> <br /> Thank you,<br /> Support Ticket System',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(6,1,'ticket.reply','Re: %{ticket.subject} [#%{ticket.number}]','<h3><strong>Dear %{recipient.name},</strong></h3> %{response} <br /> <br /> <div style=\"color:rgb(127, 127, 127)\"> Your %{company.name} Team,<br /> %{signature} </div> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"><em>We hope this response has sufficiently answered your questions. If not, please do not send another email. Instead, reply to this email or <a href=\"%{recipient.ticket_link}\" style=\"color:rgb(84, 141, 212)\">login to your account</a> for a complete archive of all your support requests and responses.</em></div>',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(7,1,'ticket.activity.notice','Re: %{ticket.subject} [#%{ticket.number}]','<h3><strong>Dear %{recipient.name.first},</strong></h3> <div> <em>%{poster.name}</em> just logged a message to a ticket in which you participate. </div> <br /> %{message} <br /> <br /> <hr /> <div style=\"color:rgb(127, 127, 127);font-size:small;text-align:center\"> <em>You\'re getting this email because you are a collaborator on ticket <a href=\"%{recipient.ticket_link}\" style=\"color:rgb(84, 141, 212)\">#%{ticket.number}</a>. To participate, simply reply to this email or <a href=\"%{recipient.ticket_link}\" style=\"color:rgb(84, 141, 212)\">click here</a> for a complete archive of the ticket thread.</em> </div>',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(8,1,'ticket.alert','New Ticket Alert','<h2>Hi %{recipient.name},</h2> New ticket #%{ticket.number} created <br /> <br /> <table> <tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Department</strong>: </td> <td> %{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%{ticket.staff_link}\">login</a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"http://osticket.com/\"><img width=\"126\" height=\"19\" style=\"width:126px\" alt=\"Powered By osTicket\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(9,1,'message.alert','New Message Alert','<h3><strong>Hi %{recipient.name},</strong></h3> New message appended to ticket <a href=\"%{ticket.staff_link}\">#%{ticket.number}</a> <br /> <br /> <table> <tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Department</strong>: </td> <td> %{ticket.dept.name} </td> </tr> </tbody> </table> <br /> %{message} <br /> <br /> <hr /> <div>To view or respond to the ticket, please <a href=\"%{ticket.staff_link}\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"color:rgb(127,127,127);font-size:small\">Your friendly Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(10,1,'note.alert','New Internal Note Alert','<h3><strong>Hi %{recipient.name},</strong></h3> An internal note has been appended to ticket <a href=\"%{ticket.staff_link}\">#%{ticket.number}</a> <br /> <br /> <table> <tbody> <tr> <td> <strong>From</strong>: </td> <td> %{note.poster} </td> </tr> <tr> <td> <strong>Title</strong>: </td> <td> %{note.title} </td> </tr> </tbody> </table> <br /> %{note.message} <br /> <br /> <hr /> To view/respond to the ticket, please <a href=\"%{ticket.staff_link}\">login</a> to the support ticket system <br /> <br /> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(11,1,'assigned.alert','Ticket Assigned to you','<h3><strong>Hi %{assignee.name.first},</strong></h3> Ticket <a href=\"%{ticket.staff_link}\">#%{ticket.number}</a> has been assigned to you by %{assigner.name.short} <br /> <br /> <table> <tbody> <tr> <td> <strong>From</strong>: </td> <td> %{ticket.name} &lt;%{ticket.email}&gt; </td> </tr> <tr> <td> <strong>Subject</strong>: </td> <td> %{ticket.subject} </td> </tr> </tbody> </table> <br /> %{comments} <br /> <br /> <hr /> <div>To view/respond to the ticket, please <a href=\"%{ticket.staff_link}\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system</div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" alt=\"Powered by osTicket\" width=\"126\" height=\"19\" style=\"width:126px\" />',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(12,1,'transfer.alert','Ticket #%{ticket.number} transfer - %{ticket.dept.name}','<h3>Hi %{recipient.name},</h3> Ticket <a href=\"%{ticket.staff_link}\">#%{ticket.number}</a> has been transferred to the %{ticket.dept.name} department by <strong>%{staff.name.short}</strong> <br /> <br /> <blockquote><div> %{comments} </div></blockquote> <hr /> <div>To view or respond to the ticket, please <a href=\"%{ticket.staff_link}\">login</a> to the support ticket system. </div> <em style=\"font-size:small\">Your friendly Customer Support System</em> <br /> <a href=\"http://osticket.com/\"><img width=\"126\" height=\"19\" alt=\"Powered By osTicket\" style=\"width:126px\" src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" /></a>',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49'),(13,1,'ticket.overdue','Stale Ticket Alert','<h3><strong>Hi %{recipient.name}</strong>,</h3> A ticket, <a href=\"%{ticket.staff_link}\">#%{ticket.number}</a> is seriously overdue. <br /> <br /> We should all work hard to guarantee that all tickets are being addressed in a timely manner. <br /> <br /> Signed,<br /> %{ticket.dept.manager.name} <hr /> <div>To view or respond to the ticket, please <a href=\"%{ticket.staff_link}\"><span style=\"color:rgb(84, 141, 212)\">login</span></a> to the support ticket system. You\'re receiving this notice because the ticket is assigned directly to you or to a team or department of which you\'re a member.</div> <em style=\"font-size:small\">Your friendly <span style=\"font-size:smaller\">(although with limited patience)</span> Customer Support System</em><br /> <img src=\"cid:b56944cb4722cc5cda9d1e23a3ea7fbc\" height=\"19\" alt=\"Powered by osTicket\" width=\"126\" style=\"width:126px\" />',NULL,'2014-10-02 15:49:49','2014-10-02 15:49:49');
/*!40000 ALTER TABLE `ost_email_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_email_template_group`
--

DROP TABLE IF EXISTS `ost_email_template_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_email_template_group` (
  `tpl_id` int(11) NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL DEFAULT '',
  `lang` varchar(16) NOT NULL DEFAULT 'en_US',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`tpl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_email_template_group`
--

LOCK TABLES `ost_email_template_group` WRITE;
/*!40000 ALTER TABLE `ost_email_template_group` DISABLE KEYS */;
INSERT INTO `ost_email_template_group` VALUES (1,1,'osTicket Default Template (HTML)','en_US','Default osTicket templates','2014-10-02 15:49:48','2014-10-02 19:49:48');
/*!40000 ALTER TABLE `ost_email_template_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq`
--

DROP TABLE IF EXISTS `ost_faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq` (
  `faq_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ispublished` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `question` varchar(255) NOT NULL,
  `answer` text NOT NULL,
  `keywords` tinytext,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`faq_id`),
  UNIQUE KEY `question` (`question`),
  KEY `category_id` (`category_id`),
  KEY `ispublished` (`ispublished`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq`
--

LOCK TABLES `ost_faq` WRITE;
/*!40000 ALTER TABLE `ost_faq` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq_category`
--

DROP TABLE IF EXISTS `ost_faq_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq_category` (
  `category_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) DEFAULT NULL,
  `description` text NOT NULL,
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`category_id`),
  KEY `ispublic` (`ispublic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq_category`
--

LOCK TABLES `ost_faq_category` WRITE;
/*!40000 ALTER TABLE `ost_faq_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_faq_topic`
--

DROP TABLE IF EXISTS `ost_faq_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_faq_topic` (
  `faq_id` int(10) unsigned NOT NULL,
  `topic_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`faq_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_faq_topic`
--

LOCK TABLES `ost_faq_topic` WRITE;
/*!40000 ALTER TABLE `ost_faq_topic` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_faq_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_file`
--

DROP TABLE IF EXISTS `ost_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_file` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ft` char(1) NOT NULL DEFAULT 'T',
  `bk` char(1) NOT NULL DEFAULT 'D',
  `type` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `size` bigint(20) unsigned NOT NULL DEFAULT '0',
  `key` varchar(86) CHARACTER SET ascii NOT NULL,
  `signature` varchar(86) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `attrs` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ft` (`ft`),
  KEY `key` (`key`),
  KEY `signature` (`signature`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_file`
--

LOCK TABLES `ost_file` WRITE;
/*!40000 ALTER TABLE `ost_file` DISABLE KEYS */;
INSERT INTO `ost_file` VALUES (1,'T','D','image/png',5128,'b56944cb4722cc5cda9d1e23a3ea7fbc','h6zc6UtnLiOrQZq9HwTtUacr_1w3kYqn','powered-by-osticket.png',NULL,'2014-10-02 15:49:42'),(2,'T','D','image/png',6879,'6fe1efdea357534d238b86e7860a7c5a','fiak1C25LaMYZhVXc2weGfgAaiVKnzAJ','kangaroo.png',NULL,'2014-10-02 15:49:42'),(3,'T','D','text/plain',24,'FSkC3MWtx86n3ccfeGGNagoRoTDtol7o','MWtx86n3ccfeGGNafaacpitTxmJ4h3Ls','osTicket.txt',NULL,'2014-10-02 15:49:48');
/*!40000 ALTER TABLE `ost_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_file_chunk`
--

DROP TABLE IF EXISTS `ost_file_chunk`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_file_chunk` (
  `file_id` int(11) NOT NULL,
  `chunk_id` int(11) NOT NULL,
  `filedata` longblob NOT NULL,
  PRIMARY KEY (`file_id`,`chunk_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_file_chunk`
--

LOCK TABLES `ost_file_chunk` WRITE;
/*!40000 ALTER TABLE `ost_file_chunk` DISABLE KEYS */;
INSERT INTO `ost_file_chunk` VALUES (1,0,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0Ô\0\0\0$\0\0\0a_mŒ\0\0\0sBIT|dà\0\0\0	pHYs\0\0a\0\0aï√∏∂\0\0\0tEXtSoftware\0www.inkscape.orgõÓ<\Z\0\0ÖIDATxúÌúy|U’µ«øÎ‹!I\0Å&ôDÎlµŒ∂J´ü≠Z«“¢•µˆYáˆ=¨•}æjùãJùxA©C}(÷Ò)ääÛBH íê‰ﬁ‰ûs÷˚cÔKN.7Â¡˝}>˜Û9{Ìiù{Œ⁄k⁄˚à™íA;w∆	\'˚\ZπŸ	Èá·„ˇ˝N˜Â+GjvÒ›Ò˙Í≥Ú\',€¸UÛ∑∑√˘™»‡ˇ/¥©apdË≈gÑäæ˝ãƒk?ﬂ§YEØEÜO8:\'øˇ≥_5o˚2¬õ¡N√ÒÍ™4^âÙÿ?äÔJx»˜r˜@\n<.1„õ◊}’¸ÌÌ»o;çP√÷w©]∫@r#9≈\08=«ÑµaÌ›Õ”O\Z˚ï2∏ó##º˚\Z˛qNI‚ÒCépß<%>µdp∑∆öT]Ám[:GÎW˘8Y€…í›q¬a«ﬂˆˇıç!›e9ÉÙêL¿j/«]Ér‹~%ˇ™ésæì[R,y#˚„D@}]’ÊÕç~√∫u“\\≥ÃO$~ΩÚ√/:=ˆÉCz7ÁÊO«ãç\r8SBÖ\'∂‘y1‘ã„ñÕ^ØŸ|T˛Ñ2¨]ååÓ•®®®0;ËT…|¢StZoâÓ◊~/ÜøÂ√fø~U©ì”™s÷†;a≤ü∂ÌÖynœ·7ÉsÖ”Ô∏ß˜°‡D”è´^˘ãÎ¸˙ïÂ¯ÓÙHÕ⁄\'ôT]◊Õ€ÀÄåÓÖqßtÉÊM\n˙Œ….ÍZwı´‚◊}QèÔ-uvc[k¬˛Êp¬’B\'∑¬Pﬁ»1N·âC%ª∆ı—ÿ¸m+÷yu+ßG/û{k◊À ·›ã–<µh¨ì7Ïè°í≥èïºë›–O†\r•hSí’O….líHAvwÜ‘¶jºço<>ˇÈÒ›Êo@D~	<ß™ˇÿâ˛∑á⁄‚c™˙‹.dØ]Ñø¨â2ÿçòZíõàLqú>.<‡¨ë]át\"H˛$Ä\0›\\‹F‹µO≠Iƒó˝lWøx\"rpg∫¸Û˛?hÀ„E§PUõ∫8ıq¿∑Ïıª]Ï€-Ï”¬+\"´ÍgÌ‘,WU˜Kd´Kh˙k…9NÓÄ_áá]1F≤˚˜ÿ°Åü\0ø	¬yªüı7ΩUÎ◊ØZ~æÔ‚≈≤‘käà8ı>ûz™?…Ω™j√nòΩ7pF⁄OV™ÄÊ›¿W∑!\"\0ÁÔ™Í√IzXDÆ∑◊\n‘ÎÄwTuèºë]	èaL¶∂p!Ê¡ÓQà=4®$íï˚P∏‰åC∆\r7äqG¯[!˘√ë›,º~˝Jﬂ[7sÖ∆™oéNX˜•ôéAÄT≠ô∏N≠SU≠ë—¿◊Ä7tœı!o∆bRª-¬‹à1!\0zÁ˜ä»u™˙ÊóÀcbñÑ‹ÿÿ…·Ç°WÑˆøt†D˜K/µ~Õb¬}øﬁµ9¸&Çy€é‡UΩ]´õﬁô…I\\ eÎ∫ºËãHå\ZÄ≈™Z—F€(∆«à—ö•¿™:üÄY/\"%¿˙@◊™∫>e¨,å|Ù∂§ô/ÀÚ5\n£‹V©Í™NﬁW mT’≠Å˙æ¿!@>Ö€O„å‡ÙëÏµÍTuFJá—¿K\"2FU„ùa4É›è¶ßO:]ö$\\tJ±”ÁòPGÌ5V]¥¯µy+~ıB∆u¢±G¢t∆:ÍW›π¸”;Ó–\Z\"\"¿OÄˇ\0Ç&ø\'\"≥ÅÎTµ*–˛\n‡˜¿Äî°jEd0°ã⁄s∞»^˚Û99W∏¯I·˚3‡Ù∂ò¿ΩM.≥§e¿Ò∂Æx83•€Zô®™/€˛?~®?◊˛\0 “˙º™∫TDæ¿H¸˚ÜäÄo\0Ö¿\'¿º‰ü%\"\'clÚD†}!–_U?Mπ±”Tıµ@yêΩ±\\å…æ,•˝±™:_DN\0™Uuf†˛Îò’x#∫™÷¶ﬁì]±é≈¨÷Ôa¸ùŒ¿ë!∂o>±™æo«DTuá±DdåÂ≥≤ìÛ¥çW.‡÷îœá˜;¬zyD¬˘˜qpWO√Èstßß—D-ÓÚ˚ïú≥c]|í]ÿBH‘˙ÕÀXÂ%™.Õπ∫laß\'içáÅ´”–C¿x‡(9LUkD‰4å0§≥4zªÿÏ}ë∂}Ë¨ˆ◊‚O¥Ó‡U›,\"˝Ä≈J\"ÅY ÜsDd0∏ªΩ	⁄K∆ÄÌôw˘>PÑ1/.˛!\"Ωmì`;àkÅø	\"2\0∏%Pæ¯∆|©˛,\"ìR∆˘Ω\rÈ_l¬òVàH∂àLæá˘ÉäÄπ6–úÛ6‡.[T‡◊¿Âò’∂#úÉYÌ£@#p£àLµ+c¯s˝¬<îù«¨ãÚºÁ/ôÊ≈+C/¸zhË˜;\'∏~âïÅ&‘ˇ‘NM•â:‹Â˜¢Õ[p\nF∑nÀ\"êEØ€ñoM|˙õZ?∂a‚Œ\nÆà\\ ˝	8	Û\\í⁄v(üˆz-Ç˚2–#\0I°˛ÀŒ—o„i\\˛\0ú\\L•m°ÚmˇõÄ,≠#∏•∂<Ö¡}c6bﬁ…$Ó√¯Ëß\0≥Ùπñv\npQZÕ+\"=0Z˜[\\ú§™1€Ïi˘p;0	òco¯Õ¿PßÎEdê™ñY⁄i¿´v‹°¿‡TUı,ÌÔ¿|y!p√£ÅUΩ6Ö’ÎÅ˘™z_Ä˜ÖA=√ñèéŒ¯Oâ»T:∑∑˚õ™zI†<]DûŒU’ÁE$œ¶6xT®jıˆ^Ê5Esf;9%#$úC≤\Zà‰mïhÔ*âˆ⁄Ï{n3~Ã#˜%^ﬁ«oÆ:‹…)ÌÙóﬂŸç\ZﬂÑ_Û	˛ñ˜—¶ÕDº±ï–µøˆsº“h¢\'$ÑZ2B~›¥π\Zgø#Lπ‚•U^≈‹û®Œ»˛QÂkmçŸ	L§EﬂR’Ìı€\"íÉY¸\0.ëÄ†˚v(pà™æºnª¡˜Ï	UΩ)Pûï⁄8Ä\Z´åÓ∞Â8pN2£a˝Á†•1%iïä»ÔÅÉ0~Ú`U}SDÇf–∆`jª⁄ËkÃs=0YU∑ŸÍ˜7âGÄ•÷?x¯%V´ä»!”t>p-+„i¿=ˆ˙:‡û§‡®™\'\"Oﬂ¶ÂÊ˙q\r&ê∞™∫HDäD$WUÅ+ÅªSü„4c¶‚oihwc¸°ÁÅ\'ÄKiùcº£\rZpÌ¶zojøÀ?˛th‡≈ﬂêÏ\"Ø	ıõ¿o&$aƒâömÜNÑéE@—Ü2#∞5ã—¯FK¬É«”°–{ç$÷<±NÎñˆVBM\"ë®ﬂ∞&î¯¯¶zu¢[qBaß`Ã∞‡Ò~≥&V‹ˇÖ÷ó>Ì]ÒG∆∑<≥ùD0êÛ^J]∞‹8£n¡ò‘E¿Î\"Úpª™æÿM^R1,p›ï≥…É1`0\Z˚bU}\'P?Z=⁄	\"rMcç¶◊.ëó1*øX\\©™ÂÅv#ÄŸ©ù≠†≠\0ˆW’Â\"“(\"E÷œªs„\03hﬁCÄèÌı@£ıRØ	î´ÉÅ\0kÆá1@*kÊ|«DS±&\r- “–ñ˚€ÎgÄW∞¬k#å\'c≤V»ùPU—8≠ﬂ≈¨ùÒ∏”c»·N—iΩ%“≥›hÒv¯	¸∆Úò÷Ø™–Ü’\r\Zﬂ\\§â-˝]£√&ﬁ#Y}	Ω…ﬁˆXÍ„W/‹‡VÃ˝TU˜eı⁄8áı£âwl§OÂ\"÷å&\n‰JÈ1¯ˆ†ço¨qóﬂSÍyu7dO®‹UZ.x⁄Ë£î∫œ\0óÂ“WUÁÿ˝.LVLöÔY\0úﬂ	?¥CÿÁ70@ÍJN˙÷\0œ§ÓröRnoóYÔvÍ¿NT¶™Ö≥Åmm‘m√¿¯\"ßc¥—òU±YDTD˙€vÀÅÖ^@≠‡5åÄ$ë™Òì}k”Ù¯-zo€.ﬂùAC\ZZU’Yb+a\"à/ß—Ù\0ÿ\r\nﬂjú÷Ø8\\˝ﬁ5Dq¬=˚í3 èPnƒAÒUuºF/æY›mö®-•©zÅ¯î™û$·¨KB˝O≈È{<⁄∞wÕ„Ñ\nO&Trv€á¸&ºÕÛ‚~ÕÁÔK¨Ù&Ò‹*ß\'∂]Ø=‹<ıÙ˚åWœù6‚È w¬Eß˜Ò´ﬂ_Í≠õπ—≈Ω4Áö ıÈﬁ)4ÆSè\r”zQÄ™>&\"/\07aÃÓd\0‡`&&òŸ-®™+\"1Z¢ﬂù2lGÛæ$˚> \"T5˘.SQ	`2FCßCÍÇñv≤Œ`1F”§S„˚…º◊‡ß\"Ú!&˜ñÃ˘ÕŒ∆¨Fs}◊arzÛ;…GÂ@45Õïeò‘¬äzj∫°-Ùc«’∑ò÷\Z9ô¯cBﬂB∞B|{≤‹8µﬂÄ∞Ü{{æ∆Ω,/ûÎ‰5r≈öÌS”√√G9yLp≤˚¸Lzé=¿)8 ‰◊-¡Øx¢Ωà<â§œ¥±,Ên˙ﬂµ[_¶~‚ﬂ\"?¯x!w\r iŒınF∏QEûãf˚Á≈õ≤èqgú˙ph‘OèîÏ¬wÌSÔ˙[ΩÌU˛áH˜Õ‰T¨¿XE`Ñ/à‘Úˆgß™[Äõ¨èxc[uºàÙigÿyîbLuÄ£h«iã1Œ{1˚%ÚÄô\"rå›vTH`Å™vd…Öªïï÷Y·ùèâ.ø\Z$ä»HÃNï-òãèEd‡õ¥vÏgcÃù‡ﬂÙ7Ï∏]^´—7â»™∫®ù¶0ë T·=1M€t8ÛPÇ¯Åj”XSDd?L ¢SI¸ r\'TU`5\0≥ézètY}ˇÖúADF\\>⁄…?†@cÂ¯[?∆´˝Èy °¡ﬂe«Ïâ¢ı´‹™y•\Z//ï¯÷g#±⁄Y≠é‚˝º,Ö…ÒGãß9æ˛©9&ı·ºí\r··WˆÒ∑≠éªk˛ˆ™_øiR÷ƒÚeÏÃƒ<ÄSìœ—Kh˜¶µnŒ¡?\0P’Z˘mJ€V˘ÿn`!-¬˚y’æ€p∆≠¸Iö~”UµÃö˜Gcƒ◊0.’uñÁÖ∂.9ˆº‡^\nåU’Á-)Ë.û \"9™\Zë˛,Q’;∫˘&—<’ö√Ä\'Å[Uı≠@ªG0f–Ÿ¡Mﬁ÷‹AUœ\r–ÃÇ0x4ô#∂¡ÆÚ‰**\"KUµu˛¬–√µ&™Íáññ°™Ûl9xò§™o[⁄°”´PUOkÁû_™Åø®ÍK;∞:YUÎmoƒ¿Ê®Í˝üÌ°˘·‚ÛùûﬂÍw‚…ô•MU¯[°çeHﬁpú>G#ëTwJ—m´∂πUÔñJlCô€T˝˜lógòX∫5Ì$)hz∞h!Á<;‘í¨ äπLNo˙Ô\nÿ ÁBZN‰ÄYº˙“\"Ñpò™~*\"èa“H¿R`+∆ÁM~\rdÖ™n^ é;¨•Ÿau8ÅM\Z™\Z≤Ù°vé‡6≥Õ6äy7⁄∂si9òKU˝£•üéq#ì+ÎwUıY˚ÓΩOã‚¨\0>ƒ∏¶É0ÿˇQ’≥Ï8g/¯®∑ø¢∞˝;É0ªafäH/Ãä0QU?Ii78^w<ùÒ4&öΩ™Íã»∑1ªX^±πS∞òhöñGU˝HD.~cñãÒèü√$πQ’mˆè¸ùà¸⁄÷/«ÑÏ;˙H⁄ÀòS\'∑ã»≠@∆‘\\ãÈò\\]∫M]Ç†ßÑá]›q≤‹Â˜B¥°æ«!≈©r€™\Zø˙Ω’\Z´X©Ò Ÿ—Ê¯K\\ª©æ´\'N≤&VÆ¶%æ€°™	9; íÉÆÃ&‡á©|lõTóg&◊ø´x[kﬂ´ø…ØÙ\r4Èp◊°™Œë{ÄüY“#\"≤»jÄ˚1¬:\08+•{p¿åez¨-ÁŸ_Ê<ÔÆÇàú\\®™∫;ñ˚ÿòg¬coª?Å∑Òµî≠ää÷ØŸÏm˘`Ö6ñ-ÒÀü…“ıˇdÇvoC»Wk}ùâ1°ã1±åœÄgUus†]€ÓHåàb‚ü\0ˇm”Ç¡qÛiŸ≥pß™÷•¥Ä…≠Ç—º∑ß‘ﬂJ0⁄˜S‡qU≠±m.£≈wüõ¥¯l]&uî\\K?T’l];ˆA¿Hå6≠ﬁ^—÷;£ñœ#0V…b`qFxw¨[0ŸFúw\Zç”˙Géûﬁˇä¥y+Zø\ngøñÉOﬁÍ«Í¥nÒ·´À_áÃ√€óë˘zd7`Õ|¨˘ß›\\Äp\"tÇ”˚»!\0\Z€ÄdımUÔ{\r’·´◊øñ‹2¬€=ú%\"obÃü´:h€)H¥˜ôN¡®¡\0∫mÂ¬+HgTd∞ócü˛íFw°ÊõG]˛ÓQ{êú√Õ&≈Ø_E(|^`B¸xj\0\'É}Õª!˛hÒÈ9f ÄWı§Ïãkó∏4mûõ∂s˚2¬ª!úUta®œëC¥±øbn9%KÇıZÛÒñ∞÷Ãk´˚2¬ªA√Ωép◊ø∞…-}˙‹˙„√}o9õÁ≈–Ê∫y\\U’Ÿ=ŸÏÂ»Ôi(˝$ˇ`t‰“˘?îú¢s$oî=π§∏´ßU∫\rKohÑˆ%dV{¬WØJ~5….>&˘˝eØÚüÕÍ5L…æ¶≤≥«3ÿêﬁ=M<~î6◊‡oxqù6◊<π‰˝˚øjæ2ÿ≥êﬁ=zÆ∑Ò-èäWût›∫[sÆYø+œ—f∞ó‡ˇ\0l˛Îeë∏ˇ\0\0\0\0IENDÆB`Ç'),(2,0,'âPNG\r\n\Z\n\0\0\0\rIHDR\0\0\0°\0\0\0[\0\0\0XÂ…\0\0\Z¶IDATxÌ]	ºTıu>wôá ã,≤ *\n∏!† †BÉKâfi”&©&mL”∆ÏçY‹¢iå—¥1§Qcõ&6≠5j5IcEAAïEŸë}ï˝›≠ﬂwÓ{03oﬁõô7wÊÕÃªˇﬂﬁ,wÓrÓπÁŒwŒ˘˛FÄ!Òà%–Ç0[ÿÒ°c	®b%l•ä8«≤^ypxß¯ªﬂÕ∫]°ÿÖÓ ˛}eI¿ﬂΩB‹%èK∞où»Ègä5¯z±¸âH¢] Ö¯[Êã≥‰1ë„§Ê⁄üã—°W ˜Qæ1bü0Jqñˇæú7~,bµ≥Î`Òﬁ}V¸ÌK†`Ω≈æÙo≈\Z0Yƒ=ÆJÍÆ˘ù‘\\ıè‚o~M¸∂HÕ‰â≈ô8cKX˛zÌ€/FóÅbù;Y¨˛WIp`Éx^gŒ›‚≠zVƒ;!˛÷7$1Â«bûu©]â˜¸-‚Ω˜ÇXÉÆãˆ\\Íˆ+aQƒZ∆;5	m	<ﬂ„å˛b_r´–ˇÛﬁ˘µû∏5ÚSb\r¸êæ6⁄t{‰Õ‚.|XÃﬁóâ—ÓÃ»/Æ8ˆ5Ú”åwïå∂]≈ﬂ≥\n%‰](§´8Aßiùö/¸l¯]›ˇ&¨¶ÿm°à”S>èÍM¨ÑQI≤Bˆct ´GﬂN^x÷Ñä€úet≈<˜\Z1:ˆIπ\Z#—V¨°7ä∑Ú∑‚mûõÚ]ob%åBä¥£˚8G≈ﬂª\Zñ/ëtÊPD,î0”∞˙MD}∫∏Ûî\0~eî#V¬(•Y˚2aÂå3˙	!òîhäi¥Ô)F∑°Ø¬Ëÿ[Ã3°¿ªñ´(&⁄b%Ã(Ú*˛–¥√©uÕ$8≤äh·Çï#ªÄˆ„¥Œô/ø3∫\rQÎÈ≠|Z‹’œgﬁÆü∆Jÿ°U˙O¨S¬@É`¥Ä¯üp≥P¬¶°µû^≠∏Û~®cS€Á˙]—‰*©§ÌËSá∂â¿z«ˆIÄ¨Ç‘∆~∏ï›•#˛ui◊-úÊ∑\\ÜQ”AÏÀ˛^úóæ°Áf_Ñh¯Ë.a\0“‘0NÔÆñ–:ˇœƒ€2OúóoóƒuèàŸ˘‹¶~ñıª8cíUD\Zëg\r\0k¯Ôø)˛Œ∑$¯`´¶\'±O–Ö‘úé◊H{1£\0ÏMú#ú8*&ñàAeÑøE¨çæ˝≤ñÅúxÓf	\0L[√?ÿfïòù˙K‚ö˚=-ˇz	ˆøá‡eäZ¡⁄?~Aå∂]$1uzAä+a£\"á>¡	˜÷æ ˛¶ŸPƒ#bûqÆò}†D=/å—;Ùü“rÆ\'w«=†u<æ_|XÕ`Á€‚ÔxKo∂`:c⁄Ãƒ¥H|Œh÷…üï‚\"w—øËµâãáÑiºûâ5Ú”bùsuŒß‡o_,ŒÃØ„·≥†ºàŸÎ‚úõºa¨Ñ…“‡k(è∑Â5d˛ño°ù˙â5‰‡gìa)ŒNﬂ:Ô˜¡—=à0óâ∑n¶x[ÁãÅÃÖyˆX£øÄÖñ˜˛Ú˘$o’s»\r√<∏U”wƒ≠A◊ä…®òAJû#Ä/ÈÃΩÿ€b_¸7b\r˚8ŒNyÌ%V¬$q1ôÔ.~≈ÎbÙ.ˆ)Ê9Weıïívë◊K*§øañ∏»ŸòÍ¨~Wj\nÕË2(Ø˝d€8pèâ•wﬂ˙•¿i…Õ°”‘Íq:-x¿ÒV=Ø˚W¿ªœX‰ùë‚Î‘Væ\\ëÆ8D0û·`±B(> öº•ø@í˛ˇ‘\"Xp‘≠˛·˜%Éπ§’Gn\"¨Ø˚ˆØ†$kB±á≤‡Ú)Oﬁ˙®ñy.<˙é{ÿGT	SÅÍh.$8ÒÅ¯<ﬁ⁄?™Î°{ÖøÃ|3˝`≥œ1˚^KâÏL“h’J€ãˇkÒñˇ\'‡âû∞BüC9‡¯H-2êœı6æÌ	≠⁄ÉÆs‡T‹¿Û¬@(áì¢øGﬂ”ÉÖ•*¿˝xMúr””q9ÏÆŸõ¯7IÄô≈€∂H‰¿F¯≈Ôã∞Çô=Ó€bA!ÎGÎTB¯a¿ZÁÕÈàdèâ}·gƒÏ†QnΩdZÚ/¶Oı›ñ?©PJÕû¬JC	(◊¥˝7LÉ¥>¡ëù(R}/L≈Än””·(U>≥˚pDÓ-ÙP’ÀE¡ÒÉ»Ww¡O4˝óòxO˝∑ã[Y£S\0(ÇÖù:¨¡7†òÛÛZ‘yR\"ÂÙàøc©xåŒw≠@q)†!≈#ëÁeAòÿ˝:PT8≥˜(DÒÁ‡Û‘JÈr∏,¬Vµø˝®ò®ÊN\\ˆ≈ìßÑ´hÉO¢üÀ}ÁWbt(5Yì¶Ñ≤îå>ˇ±Ù*8kB†èAL≤^	>ãUSñóê|RﬁäˇFff£ÿ∞“…£U(!Àè‹˘?“¬M˚“/ù˛ü¢íÔB.ØMK-û–ÍÂ≤}ôm„Ôﬂ Ó“Ö/8V,`í…£™ïê	zeﬂ}\Z÷dú$&?ê8Z¯#YòÒÎÃ >ÈŒπ¨/ˆÿo40\0U´Ñﬁ∫≈AÌùa{¬]bπ”W˛`lf±∆üÊ*∂\r8Øﬁç÷—e0¬o=ø¡O´N	É√;ƒAÊ£[ÃD\n ˚ıH2\r$◊\Z>@ıµøc	\"¬+(‘`˛®œte1ÚÊ_˙§ÙQQ¶-Ù]µ{ÔÕ£M©π˛1M\rf[UE«Iù◊√≠kÏW≈˙a|3?YEl\ræÆô{®–üR!Ñ•drêêf?ò]©«P—ï\'µP4˘q*\\ÌÃ:«4Ä‚å£0‡$´ﬂ±G¿l‘ÿ®\nK»Ã@h˝~Îwçÿó\r÷Ø*8ù _‹öî0\0∞ÏºÜ~„≠Øãâí~{Ùó`¡FB©†D)Ì\0P)¯xÇl+áVyhöb9õFÓâPi≥åÏ[dŸAKÌ≠˘=¨ﬂCb‡Èµ\'›ÎﬂØ\0ÎW=¥Ä2vüT8°˛˚j¸Îmú-Ó+w(ˆX3ıgP¬+õæL YÅ6EÏ´ÑLO9˛Y|L¡¨p±1˝Fa˝Í•Óo{~–ﬁíóY’ø¥‡ßO†Z˙nå@Y÷≈Ïÿ∑dßPyJ»î€ÍﬂâK:$lPUÿC¶ÖqdbPuÚ¢F”≥%∏0%@·œq&Ò†Ñ,Y≥«ﬂ—†¿†ÿó_QJË#?JÂÛë‰∑LkÃW`˝¢bYVÂmöÉt^1QäT“·ûè)≈≥ë%iF}_>ÁJ’ôı-ÒQd`_q;rË7G‚ ‰s‹∂2îê$=<3‹O\\Û ÇÖkq˙≈±.öºYÎ«ZBÊfK9ú%èjEO—tÌåØb6Ò§ÊÜ_h¡C)Ø3˘XeØÑÙÕú7˛	eIÀPµ˚±G°Ø°]˜‰kàÙ5k}h\Zâ”¥$“ùgŸôª‚)îï=)57˝&ÀñÖ}Ì!Úug}GÃb˙˝N]—ia˚,‰◊e´ÑÑ]‹≈è° Û†Ï√$q√„(8]»µfˇ-¨Ç˚ÊOµÉN:ˆ¬î8>˚o\"⁄¬[˚øö⁄2z]î_Ä•†Óúß\\ˆ√•±G|\ZD∑‚Ïã3õ‰#ñ≤S¬\0SØ÷“aÍ•ÄÏ+æâZøèùIÛπ∫<∑ıV>É ‡óqXC˚>¥≈1œ}4gsÖôÊ|`Ôq(>`ë\\!&`sJˆ≠Å(XÕv`‡yÓ¢üiob¸w≈:Ô¶lø(Ÿ˜e•Ñ>Çöjø≈ê£qÊØµ/∂“ \'üÛ∆C8\"S†˚ˆ˘/≈aÖ˛ß˚⁄¬tò£^öÛqù´Ogv>ß…ﬂGÄ‡>:mìñìÚƒÀB	˝ÌKµÃﬂ∂\0ÈIL¸^ÿ˝’§h£˚í\nX˚“7ëÜBÍ	u{ËsÕ3&⁄£;\"ˆÑ©ﬂ°ªÅR˛0À\0ûÌzÀ·@ƒıX§—Ê∆\'ö‹⁄G1¨ÛÍ]ZjœñŒR=\\MûT⁄óPB`b{◊ÍƒÜmÊfz&◊)!máπæ’04ììnå˝´ÏYM\\˜®X`-Ÿ@⁄âS?ÛÕÇ2yŒiFá≥¥◊§òÁ¿í|≤[y´û¡q≈`*÷\"[4‘gﬁ∫˙{>¨MQwxk‡gÇÆ#8∫ÈGÙvÄ≥% öR\\î€5ß\"^…yCåˆxMéêl´í≤lú]h˘ñE!·›´Lﬁ∂≈¿˙fk•∞Ÿ{àπë\"J+t,¶∞Ç⁄CJâ´úÕ†≥‡ÉB\"®wCÆ‘(b∂¿G7ùÉ⁄∫`;\ZÄ¥\Z∫Œõ√k´wˆ¿ãm©Œ¨o£ÍC\0óˇ4£ò»⁄]ÙsÒ@êN˙_ﬁW2Ø≤˝≤áN«‰/nó9XΩ∞é{Và`zdÇ: çKt®|h◊SedEE[ºfbäi á{ \r‰@WÂl!O8[ÿ}%M‰x…Ö¬NŒq°<&9ïΩ∑dT 88öô®◊º&Âë≈Õ≤Fﬁ“ËçÕ˘8MlËÅ… %‹D¨˙jnO˘í&ÖM\r-.ò	˛‹£6-õJ˚©Ä9˛¶W1˜«√ç©ûó µyu⁄ñÂÛ6•îÀôáx“y5qEbmá”ÖñÎ†—FÈ-HAxÄÎaÄ·ìäß7U≠\nnj@•5°pß£®@ftÂÉPá=ßTÿîõP$yê®à|z∞FÛ<q8_µ‰8«â—†¿<MìÓÅAƒπE<T1¿˘Ï#›®r	üX}jU>z^N«¥ê¸9&ˇÚ≥Ñ∫2jWÅF$}¯[à3˚\\ü-	¥U*-G6<•üwä™≥<Á>‹∞πao(3ï2î˚ÂêÆœAÚ\"”;’Ñ-ê,3bIë∫ºÈuÉ•H¨°7Ö†m˛X˝Os˘ÀÑä«6«‡ˆpaª&=|∞Ò ≥Hî%P¸ãD?Áy¡\'7xŒlbÚÒv∏E5Snò›@0≈∆yg·OƒÍ{Ö$PIﬁîØòÀπórõT%‰ë!\0∂Dzh\n7±dÄ}—gƒåòñ\"íd;d]ø≠ˆ‹í5ã´°ÚÖmë:Ì”Í¬Ø\rŸÍq£’Í‘ù÷÷∆æ¯sa q ÊÔ|¿˜t]K≈Ï?QixMPıÍåÄcÅ.Ig.V√.À‡É„8w≤yÒ‹@Ëπ≥O‘$¨∑=˘U≤d˘qjw^ª_»|`Å&ÅåíZ˙‰ç ¸uC%¨;aç\ZÁ?†S≤5Ï£ï¶ÖÕ◊Ù\rK9ËìR©m≈t∫A1DÚ-–·œõFAÁ;IâËÄ≥Œ÷ËÔ]ÖLƒ}ß¨ ›∂L[cÈø±µ\'Aê˚÷ø£“Áy§≈FÑ%fl@odh\'æSÂL€ÜL\nŒ_T+Æ¨WË)N\Z§ºÚ]»·ÄZ?BKï8\ZUB^å+X€Ç’G°\"†0ÄÂô∞0at—ecJ·t‰c⁄¢e\0˘¿áá’ÑÇ£˚`<¯óÄ@£∆^òS&oãFµ:›¢§ÿÅX´ˇ$\rû∏øœ~RIÄt:Êîá©–:ÔFÖ+¢ú≤TVÀû˝><ˆ®øi÷2<¥T\ZbìƒEç.É√»5çüÖ4Jb	∂˝ƒ’®ÔK§1[πKˇ\r‹—?\rù>|ÅDï›≈fÌ¶I%¨ﬂ#Û∏d,‡ìÁo[\0hÂ|éÓJrct!úÉ52≈Å{—2Ö>7vCﬂˇ‰†ˇÉ0\Z)sø‰(A#çx>√ÁÙã@8iÇ˙¬ `ó\"åÚPfØÖºlb_˙xàÌa⁄2ŸÀäáŸÁÚ0Ë¡XPÇ¥˛™ˇ	œELe\'∞/˘|§Ö	$éÙñ˝F|ê)ë˜ÖÂPd–\0£^Ä∞‘°Åãæø §úk◊l©_Ç¢N¬V©≥9°kÁ~_Y∫WﬁâÎ&´U8¥ïÅŸèı3≈BÔÜ=˙Àx8·gV»I	SÆ=§D·ï”ô;µã”@WVüh…∑A∏¶N∏¥rÙs<DÿPï9∑•œ∆àêÉRW@—XHH#¬§)ñÁ‡Ô^	à’‘gÈ\r7˚çWÚÆ$O«Zu\r0ÿGQÄ˙VÄ)Ïü\niﬁrËyHπﬁLoÃ¯€@#∑Ú)]˚ç\\1ˆp–»a:§Bı˜≠Q◊Å÷⁄ﬂÛ.fïÕ·Ckl¢\Z(W@Ø3iˇdV‡ IﬁÚˇÇØz+˙Xn»±npù9Á’{¬Èw<HÖÿ P#%LøhZ.Ló¡ë⁄ô&\'‡h;X®EARlLE¢ìMZ]·$P$ã\0ˇ1\ZÕâ¿Ú)æÊ,o˝KÍ;ô‡ê±»VE6˘§¡\Z@ÆœÊÇ‡íøâ*˛¨Åà— ‰Q‡PÂ⁄íVv≥¿ñÅÜu¡üáE⁄k¿√√È¢ı ÿ</|‡Ù\ZÒ@2∏sõV∞$?4¸ïè~,¨®nVÍè˙ÛÖª·.~\04¯óå~sMÔ’Ô¢úˇÆÑ≈∏:Xíˇ0´B|èØ…H≈eQ9ı\ZPÊìÉU7∏ÈÏ5Ò¡Ò«a@6aîJjÅ~‹ºˇ¯x€Å3\"˘Ô¡è#ˆi°£èdJö_Æ∑ˆi{ÁÏ‡≥l\n‘ÏøÂòòtÚ“SNm	ñVRWJBıWŸ¥Gﬂñb!†∆‘ÃÓ7ñëÙu˚´iîáBÈSxh¥ò“CDKKfê◊÷ÃÖG zªTRﬁ<∞è”`}ÕÓ#†x†Ω•_ò\']mÉJƒ‚¡ÍÒÊ«?–\0ÄæûïÁ˛Y§T$,ŸGƒn¥ÌÜ√†Å≈”©\Z∞˘Ø5ROYM	¥≈ù˘»b·z„æÎxEÉS≠ÜZF	1≈“:¯Ô/B∞É‡p&N∆“}ÊêÕ≥«) õRœG≈ÉrrJˆ1Õqj…«±d*ß[FÎ*Ö^HwÒ/Ò:}H0…á\0äR»†Bª(Ω‚µ\ZtäànØ÷-¡ﬁé$Î¶#røD\0¨>¨ˆ≥Í?r¸r˛mÈîêæ£`DuÃk2»Ä\'%˝&¬¬åV\'%“CCL–„ohÒ\0Ã2\'ÎΩ*j!DÊ∞Ä;˙\Z≠\"‚o!2ﬁZ≈mˆø\n≈H°uÍÉs¨Æ\"∏ãJ\\éuÉΩÂO·x\0÷Ò–i4\rhâ«\0I˘õÊ*ıy•π÷àí\\FpÏrﬁE…îê÷ÖÎ^(ﬁHá~ï:2ì±2Ú$á4èî∑ÄpòàÁ⁄†MÆRŸà÷§†i}¡SC•£o •ßã‡ B∑∏∂¨s≠)÷∑…6ˇKVè≥√-@èáuQH£´¨!¸ui	úO≥Æ≥˘ß’bø,ô≤ÇÿÉì^ÉÖW´iïÕ[?ñr¨‰rL?ùÚ∞dò=`4ß˝ëS8|2Vl3h—¥òΩƒ‰H—E§q”çñLÚ„°S*\r¶Ò¯0≤∏¢ï\r\\ui£<É7úÎ£%\rN≥.{;∞¶á†Œœ`ÿÑªUI“Yﬁì~÷¯À∫)úÂZÏÊq…EMbF{‹Ìb—⁄ëß&Ì!h|áE˛Üóç≠xîN	aëå‹tÃ≥Ü1ëj≥–¶¨Ó…”s.7@9S|\\´√c≠ R}¨œc4i^võF∂F€ŒπÏ)ﬁ¶$P%‘‚Vd¨akpâL‡[®dIå˝Zﬁ÷âÂQÃ±j∞É ÉU‡ÃÎZ›`uÌ¬Í\'πJ£ÑúÃöiS±¶Úÿ[Å¥ZŒ”#1<`n.ÿ∏∏<óÆ”ÅJ˚Ú3(ÕÒ#kº√|$P%d⁄M∏Ù*ó*M\ZZ°çîWœ6XË¿QN∑t‰)€Ë3X£+^6Òïı˜•QB@∫*s≈…+`bŒÃ	àıbU UO£¨È~çö[4¢MæÜ¯u¡@uAqáˆyÏ^8dlÉ±‡@+nr(E\nºc»äÙQ-V¿¢¨ËäÆÑƒ¸ÿ ≈*„Ù°e˜®019‘√ù8¨”v’0ÈÁøoY	_	¡%»™ﬂLπ]ﬂZ$Ùù$’Ã5&éÄS7˚f[!ò€òL™ÂÛ¢*°ñ3aÌ`f&RRsu“0MÁ¥Ú$2(ßíKÿ´EaäqEUBV`À#øL˙–R&`{πL\\C[	‚Q}(Æ¢üt\"ôñÚ\"l√r.£Sˇ¨R’û]B9ÏeâG’I†hJHfÊÖMÚ´$¿¬ê6|‘jOJuÄ>⁄;√~îi{âﬂVÉäßÑ‡≤a§ôR-äåc\\3C˝AŸd\\¡ú}¬J)ím„¯˚äì@—î–Cq&3!ô‘cYó∞N’ )˝\"ôƒßçNÀ\0Ò µè™î@qî˛õN≈lJ\"kW“Q¡Ã≈ó-|ŒV\'Ë\0ÎäQãŒWùtéÒÀ“J†(J» ËLS1õÊI[´|1¿˚4ïóÂz…T@,QÏ≥l]ô(éÇyU\')K¬@≈ù}zq1M≥®˝F∑°MK\ruÇz2ÿAGƒxTßä£Ñ\\!íçKu˝¡dÇu–_‚mù\'÷,ˆxfP≤1áj MÊÿ¡‚QΩàºäF¥\0©pù])\\0∫	XH€L∏S˚;HÊC_ë’œM\rw≈ì\0®áhÛOS€≈ﬂU∂¢WBTPÎ‘ã‡#@P¡©7qıN0 ⁄eÔ0[<õ*de´\'Àıìæü1ÂWŸbèœ>Y—+!´®èÓBK±NR÷¶≤Òs•Ä`ˇ:1«~%˘<R_CQ›Ö”ëiÇ÷–â©ﬂ≈Ô™Në+!±øöiøÑÚ]íQXÑnË+röml∏´üCãÊ<Âfé´f\ZìRı|πö=F6.ùäg\"ï7Íd–íæ1s \\{√\Z˘W!Òw˙Ò˚™ì@Q¢„∆§ƒ5<t…∞Fhm‡ãŒã_V>ö»,„—:$PZ%d*èlÆ‡YI$ˇ©˝hœ¿Pü¿jÓZˆüæQ¸æ*%˘t‹®î@wAf*s‡L≈ß¯ı„∏`&ıñ<¶≈Øå§I†è÷#Åí)°øg58˜ã\rF˝‡¯AeI–∆uˆ£òÅh⁄\0gFZèˆ’]iÈîÑD,bufﬂ	n¡=P¬≠ …ß+b°@≥o√nºVw7ZÈóF	AúŒRRºë“vhÙFÜ¡\0≥˚∂R—«ó]/Å“P√qÈ–ÎRò◊ü|¸∑:$P\Z%¨Y≈WQ$	î¢)“5ƒª≠p	ƒJX·7∞\ZN?V¬j∏ã~\rˇ0çÕPf•j\0\0\0\0IENDÆB`Ç'),(3,0,'Canned Attachments Rock!');
/*!40000 ALTER TABLE `ost_file_chunk` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_filter`
--

DROP TABLE IF EXISTS `ost_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_filter` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `execorder` int(10) unsigned NOT NULL DEFAULT '99',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `match_all_rules` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `stop_onmatch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `reject_ticket` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `use_replyto_email` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disable_autoresponder` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `canned_response_id` int(11) unsigned NOT NULL DEFAULT '0',
  `email_id` int(10) unsigned NOT NULL DEFAULT '0',
  `priority_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(11) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_id` varchar(11) DEFAULT NULL,
  `target` enum('Any','Web','Email','API') NOT NULL DEFAULT 'Any',
  `name` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `target` (`target`),
  KEY `email_id` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_filter`
--

LOCK TABLES `ost_filter` WRITE;
/*!40000 ALTER TABLE `ost_filter` DISABLE KEYS */;
INSERT INTO `ost_filter` VALUES (1,99,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,NULL,'Email','SYSTEM BAN LIST','Internal list for email banning. Do not remove','2014-10-02 15:49:40','2014-10-02 15:49:40');
/*!40000 ALTER TABLE `ost_filter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_filter_rule`
--

DROP TABLE IF EXISTS `ost_filter_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_filter_rule` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `filter_id` int(10) unsigned NOT NULL DEFAULT '0',
  `what` varchar(32) NOT NULL,
  `how` enum('equal','not_equal','contains','dn_contain','starts','ends','match','not_match') NOT NULL,
  `val` varchar(255) NOT NULL,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `notes` tinytext NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `filter` (`filter_id`,`what`,`how`,`val`),
  KEY `filter_id` (`filter_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_filter_rule`
--

LOCK TABLES `ost_filter_rule` WRITE;
/*!40000 ALTER TABLE `ost_filter_rule` DISABLE KEYS */;
INSERT INTO `ost_filter_rule` VALUES (1,1,'email','equal','test@example.com',1,'','2014-10-02 15:49:40','2014-10-02 15:49:40');
/*!40000 ALTER TABLE `ost_filter_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_form`
--

DROP TABLE IF EXISTS `ost_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_form` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(8) NOT NULL DEFAULT 'G',
  `deletable` tinyint(1) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `instructions` varchar(512) DEFAULT NULL,
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_form`
--

LOCK TABLES `ost_form` WRITE;
/*!40000 ALTER TABLE `ost_form` DISABLE KEYS */;
INSERT INTO `ost_form` VALUES (1,'U',1,'Contact Information',NULL,NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(2,'T',1,'Ticket Details','Please Describe Your Issue','This form will be attached to every ticket, regardless of its source.\nYou can add any fields to this form and they will be available to all\ntickets, and will be searchable with advanced search and filterable.','2014-10-02 15:49:39','2014-10-02 15:49:39'),(3,'C',1,'Company Information','Details available in email templates',NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(4,'O',1,'Organization Information','Details on user organization',NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40');
/*!40000 ALTER TABLE `ost_form` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_form_entry`
--

DROP TABLE IF EXISTS `ost_form_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_form_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `object_id` int(11) unsigned DEFAULT NULL,
  `object_type` char(1) NOT NULL DEFAULT 'T',
  `sort` int(11) unsigned NOT NULL DEFAULT '1',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_lookup` (`object_type`,`object_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_form_entry`
--

LOCK TABLES `ost_form_entry` WRITE;
/*!40000 ALTER TABLE `ost_form_entry` DISABLE KEYS */;
INSERT INTO `ost_form_entry` VALUES (1,4,1,'O',1,'2014-10-02 15:49:41','2014-10-02 15:49:41'),(2,3,NULL,'C',1,'2014-10-02 15:49:50','2014-10-02 15:49:50'),(3,1,1,'U',1,'2014-10-02 15:49:51','2014-10-02 15:49:51'),(4,2,1,'T',1,'2014-10-02 15:49:51','2014-10-02 15:49:51');
/*!40000 ALTER TABLE `ost_form_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_form_entry_values`
--

DROP TABLE IF EXISTS `ost_form_entry_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_form_entry_values` (
  `entry_id` int(11) unsigned NOT NULL,
  `field_id` int(11) unsigned NOT NULL,
  `value` text,
  `value_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`,`field_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_form_entry_values`
--

LOCK TABLES `ost_form_entry_values` WRITE;
/*!40000 ALTER TABLE `ost_form_entry_values` DISABLE KEYS */;
INSERT INTO `ost_form_entry_values` VALUES (1,28,'420 Desoto Street\nAlexandria, LA 71301',NULL),(1,29,'3182903674',NULL),(1,30,'http://osticket.com',NULL),(1,31,'Not only do we develop the software, we also use it to manage support for osTicket. Let us help you quickly implement and leverage the full potential of osTicket\'s features and functionality. Contact us for professional support or visit our website for documentation and community support.',NULL),(2,23,'OpenStack CI',NULL),(2,24,NULL,NULL),(2,25,NULL,NULL),(2,26,NULL,NULL),(3,3,NULL,NULL),(3,4,NULL,NULL),(4,20,'osTicket Installed!',NULL),(4,22,NULL,2);
/*!40000 ALTER TABLE `ost_form_entry_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_form_field`
--

DROP TABLE IF EXISTS `ost_form_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_form_field` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `form_id` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL DEFAULT 'text',
  `label` varchar(255) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `edit_mask` tinyint(1) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL,
  `configuration` text,
  `sort` int(11) unsigned NOT NULL,
  `hint` varchar(512) DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_form_field`
--

LOCK TABLES `ost_form_field` WRITE;
/*!40000 ALTER TABLE `ost_form_field` DISABLE KEYS */;
INSERT INTO `ost_form_field` VALUES (1,1,'text','Email Address',1,0,15,'email','{\"size\":40,\"length\":64,\"validator\":\"email\"}',1,NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(2,1,'text','Full Name',1,0,15,'name','{\"size\":40,\"length\":64}',2,NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(3,1,'phone','Phone Number',0,0,0,'phone',NULL,3,NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(4,1,'memo','Internal Notes',0,1,0,'notes','{\"rows\":4,\"cols\":40}',4,NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(20,2,'text','Issue Summary',1,0,15,'subject','{\"size\":40,\"length\":50}',1,NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(21,2,'thread','Issue Details',1,0,15,'message',NULL,2,'Details on the reason(s) for opening the ticket.','2014-10-02 15:49:39','2014-10-02 15:49:39'),(22,2,'priority','Priority Level',0,1,3,'priority',NULL,3,NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(23,3,'text','Company Name',1,0,3,'name','{\"size\":40,\"length\":64}',1,NULL,'2014-10-02 15:49:39','2014-10-02 15:49:39'),(24,3,'text','Website',0,0,0,'website','{\"size\":40,\"length\":64}',2,NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40'),(25,3,'phone','Phone Number',0,0,0,'phone','{\"ext\":false}',3,NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40'),(26,3,'memo','Address',0,0,0,'address','{\"rows\":2,\"cols\":40,\"html\":false,\"length\":100}',4,NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40'),(27,4,'text','Name',1,0,15,'name','{\"size\":40,\"length\":64}',1,NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40'),(28,4,'memo','Address',0,0,0,'address','{\"rows\":2,\"cols\":40,\"length\":100,\"html\":false}',2,NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40'),(29,4,'phone','Phone',0,0,0,'phone',NULL,3,NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40'),(30,4,'text','Website',0,0,0,'website','{\"size\":40,\"length\":0}',4,NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40'),(31,4,'memo','Internal Notes',0,0,0,'notes','{\"rows\":4,\"cols\":40}',5,NULL,'2014-10-02 15:49:40','2014-10-02 15:49:40');
/*!40000 ALTER TABLE `ost_form_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_group_dept_access`
--

DROP TABLE IF EXISTS `ost_group_dept_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_group_dept_access` (
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `group_dept` (`group_id`,`dept_id`),
  KEY `dept_id` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_group_dept_access`
--

LOCK TABLES `ost_group_dept_access` WRITE;
/*!40000 ALTER TABLE `ost_group_dept_access` DISABLE KEYS */;
INSERT INTO `ost_group_dept_access` VALUES (1,1),(2,1),(3,1),(1,2),(2,2),(3,2),(1,3),(2,3),(3,3);
/*!40000 ALTER TABLE `ost_group_dept_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_groups`
--

DROP TABLE IF EXISTS `ost_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_groups` (
  `group_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `group_enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `group_name` varchar(50) NOT NULL DEFAULT '',
  `can_create_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_edit_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_post_ticket_reply` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_delete_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_close_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_assign_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_transfer_tickets` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `can_ban_emails` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_premade` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_manage_faq` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `can_view_staff_stats` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`group_id`),
  KEY `group_active` (`group_enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_groups`
--

LOCK TABLES `ost_groups` WRITE;
/*!40000 ALTER TABLE `ost_groups` DISABLE KEYS */;
INSERT INTO `ost_groups` VALUES (1,1,'Lion Tamers',1,1,1,1,1,1,1,1,1,1,0,'System overlords. These folks (initially) have full control to all the departments they have access to.','2014-10-02 15:49:41','2014-10-02 15:49:41'),(2,1,'Elephant Walkers',1,1,1,1,1,1,1,1,1,1,0,'Inhabitants of the ivory tower','2014-10-02 15:49:41','2014-10-02 15:49:41'),(3,1,'Flea Trainers',1,1,1,0,1,1,1,0,0,0,0,'Lowly staff members','2014-10-02 15:49:41','2014-10-02 15:49:41');
/*!40000 ALTER TABLE `ost_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_help_topic`
--

DROP TABLE IF EXISTS `ost_help_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_help_topic` (
  `topic_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `topic_pid` int(10) unsigned NOT NULL DEFAULT '0',
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `ispublic` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noautoresp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `priority_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `dept_id` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `page_id` int(10) unsigned NOT NULL DEFAULT '0',
  `form_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sort` int(10) unsigned NOT NULL DEFAULT '0',
  `topic` varchar(32) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`topic_id`),
  UNIQUE KEY `topic` (`topic`,`topic_pid`),
  KEY `topic_pid` (`topic_pid`),
  KEY `priority_id` (`priority_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`,`team_id`),
  KEY `sla_id` (`sla_id`),
  KEY `page_id` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_help_topic`
--

LOCK TABLES `ost_help_topic` WRITE;
/*!40000 ALTER TABLE `ost_help_topic` DISABLE KEYS */;
INSERT INTO `ost_help_topic` VALUES (1,0,1,1,0,2,1,0,0,0,0,0,1,'General Inquiry','Questions about products or services','2014-10-02 15:49:40','2014-10-02 15:49:40'),(2,0,1,1,0,1,1,0,0,0,0,0,0,'Feedback','Tickets that primarily concern the sales and billing departments','2014-10-02 15:49:40','2014-10-02 15:49:40'),(10,0,1,1,0,2,1,0,0,0,0,0,0,'Report a Problem','Product, service, or equipment related issues','2014-10-02 15:49:40','2014-10-02 15:49:40'),(11,10,1,1,0,3,1,0,0,1,0,0,0,'Access Issue','Report an inability access a physical or virtual asset','2014-10-02 15:49:40','2014-10-02 15:49:40');
/*!40000 ALTER TABLE `ost_help_topic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_list`
--

DROP TABLE IF EXISTS `ost_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_list` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `name_plural` varchar(255) DEFAULT NULL,
  `sort_mode` enum('Alpha','-Alpha','SortCol') NOT NULL DEFAULT 'Alpha',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_list`
--

LOCK TABLES `ost_list` WRITE;
/*!40000 ALTER TABLE `ost_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_list_items`
--

DROP TABLE IF EXISTS `ost_list_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_list_items` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `list_id` int(11) DEFAULT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '1',
  `value` varchar(255) NOT NULL,
  `extra` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL DEFAULT '1',
  `properties` text,
  PRIMARY KEY (`id`),
  KEY `list_item_lookup` (`list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_list_items`
--

LOCK TABLES `ost_list_items` WRITE;
/*!40000 ALTER TABLE `ost_list_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_list_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_note`
--

DROP TABLE IF EXISTS `ost_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_note` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned DEFAULT NULL,
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ext_id` varchar(10) DEFAULT NULL,
  `body` text,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `sort` int(11) unsigned NOT NULL DEFAULT '0',
  `created` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_note`
--

LOCK TABLES `ost_note` WRITE;
/*!40000 ALTER TABLE `ost_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_organization`
--

DROP TABLE IF EXISTS `ost_organization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_organization` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL DEFAULT '',
  `manager` varchar(16) NOT NULL DEFAULT '',
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `domain` varchar(256) NOT NULL DEFAULT '',
  `extra` text,
  `created` timestamp NULL DEFAULT NULL,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_organization`
--

LOCK TABLES `ost_organization` WRITE;
/*!40000 ALTER TABLE `ost_organization` DISABLE KEYS */;
INSERT INTO `ost_organization` VALUES (1,'osTicket','',0,'',NULL,'2014-10-02 19:49:41',NULL);
/*!40000 ALTER TABLE `ost_organization` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_plugin`
--

DROP TABLE IF EXISTS `ost_plugin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `install_path` varchar(60) NOT NULL,
  `isphar` tinyint(1) NOT NULL DEFAULT '0',
  `isactive` tinyint(1) NOT NULL DEFAULT '0',
  `version` varchar(64) DEFAULT NULL,
  `installed` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_plugin`
--

LOCK TABLES `ost_plugin` WRITE;
/*!40000 ALTER TABLE `ost_plugin` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_plugin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_session`
--

DROP TABLE IF EXISTS `ost_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_session` (
  `session_id` varchar(255) CHARACTER SET ascii NOT NULL DEFAULT '',
  `session_data` blob,
  `session_expire` datetime DEFAULT NULL,
  `session_updated` datetime DEFAULT NULL,
  `user_id` varchar(16) COLLATE utf8_unicode_ci NOT NULL DEFAULT '0' COMMENT 'osTicket staff/client ID',
  `user_ip` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`session_id`),
  KEY `updated` (`session_updated`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_session`
--

LOCK TABLES `ost_session` WRITE;
/*!40000 ALTER TABLE `ost_session` DISABLE KEYS */;
INSERT INTO `ost_session` VALUES ('eo55lv1hnh0fq28071dtm220d1','cfg:core|a:1:{s:9:\"tz_offset\";s:4:\"-5.0\";}csrf|a:2:{s:5:\"token\";s:40:\"ba96c4acce9b3ef8229d91af250ed73f1389e623\";s:4:\"time\";i:1412279417;}TZ_OFFSET|s:4:\"-5.0\";TZ_DST|s:1:\"0\";','2014-10-03 15:50:17','2014-10-02 15:50:17','0','64.119.130.115','Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/32.0.1689.0 Safari/537.36');
/*!40000 ALTER TABLE `ost_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_sla`
--

DROP TABLE IF EXISTS `ost_sla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_sla` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `enable_priority_escalation` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disable_overdue_alerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `grace_period` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_sla`
--

LOCK TABLES `ost_sla` WRITE;
/*!40000 ALTER TABLE `ost_sla` DISABLE KEYS */;
INSERT INTO `ost_sla` VALUES (1,1,1,0,48,'Default SLA','','2014-10-02 15:49:39','2014-10-02 15:49:39');
/*!40000 ALTER TABLE `ost_sla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_staff`
--

DROP TABLE IF EXISTS `ost_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_staff` (
  `staff_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `group_id` int(10) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `timezone_id` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(32) NOT NULL DEFAULT '',
  `firstname` varchar(32) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `passwd` varchar(128) DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `phone` varchar(24) NOT NULL DEFAULT '',
  `phone_ext` varchar(6) DEFAULT NULL,
  `mobile` varchar(24) NOT NULL DEFAULT '',
  `signature` text NOT NULL,
  `notes` text,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `isvisible` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `onvacation` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `assigned_only` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `show_assigned_tickets` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `daylight_saving` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `change_passwd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `max_page_size` int(11) unsigned NOT NULL DEFAULT '0',
  `auto_refresh_rate` int(10) unsigned NOT NULL DEFAULT '0',
  `default_signature_type` enum('none','mine','dept') NOT NULL DEFAULT 'none',
  `default_paper_size` enum('Letter','Legal','Ledger','A4','A3') NOT NULL DEFAULT 'Letter',
  `created` datetime NOT NULL,
  `lastlogin` datetime DEFAULT NULL,
  `passwdreset` datetime DEFAULT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`),
  KEY `dept_id` (`dept_id`),
  KEY `issuperuser` (`isadmin`),
  KEY `group_id` (`group_id`,`staff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_staff`
--

LOCK TABLES `ost_staff` WRITE;
/*!40000 ALTER TABLE `ost_staff` DISABLE KEYS */;
INSERT INTO `ost_staff` VALUES (1,1,1,8,'ppouliot','Peter','Pouliot','$2a$08$4b2YLzKI9uLfo5jVW7cTPODJ//UMbyISkQQa6Po6vCGrrxiCopNOO',NULL,'ppouliot@microsoft.com','',NULL,'','',NULL,1,1,1,0,0,0,0,0,25,0,'none','Letter','2014-10-02 15:49:50',NULL,NULL,'0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_syslog`
--

DROP TABLE IF EXISTS `ost_syslog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_syslog` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `log_type` enum('Debug','Warning','Error') NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL,
  `logger` varchar(64) NOT NULL,
  `ip_address` varchar(64) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `log_type` (`log_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_syslog`
--

LOCK TABLES `ost_syslog` WRITE;
/*!40000 ALTER TABLE `ost_syslog` DISABLE KEYS */;
INSERT INTO `ost_syslog` VALUES (1,'Debug','osTicket installed!','Congratulations osTicket basic installation completed!\n\nThank you for choosing osTicket!','','64.119.130.115','2014-10-02 15:49:52','2014-10-02 15:49:52');
/*!40000 ALTER TABLE `ost_syslog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_team`
--

DROP TABLE IF EXISTS `ost_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_team` (
  `team_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `lead_id` int(10) unsigned NOT NULL DEFAULT '0',
  `isenabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `noalerts` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(125) NOT NULL DEFAULT '',
  `notes` text,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`),
  UNIQUE KEY `name` (`name`),
  KEY `isnabled` (`isenabled`),
  KEY `lead_id` (`lead_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_team`
--

LOCK TABLES `ost_team` WRITE;
/*!40000 ALTER TABLE `ost_team` DISABLE KEYS */;
INSERT INTO `ost_team` VALUES (1,0,1,0,'Level I Support','Tier 1 support, responsible for the initial iteraction with customers','2014-10-02 15:49:40','2014-10-02 15:49:40');
/*!40000 ALTER TABLE `ost_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_team_member`
--

DROP TABLE IF EXISTS `ost_team_member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_team_member` (
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`team_id`,`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_team_member`
--

LOCK TABLES `ost_team_member` WRITE;
/*!40000 ALTER TABLE `ost_team_member` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_team_member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket`
--

DROP TABLE IF EXISTS `ost_ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket` (
  `ticket_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `number` varchar(20) DEFAULT NULL,
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `dept_id` int(10) unsigned NOT NULL DEFAULT '0',
  `sla_id` int(10) unsigned NOT NULL DEFAULT '0',
  `topic_id` int(10) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `team_id` int(10) unsigned NOT NULL DEFAULT '0',
  `email_id` int(11) unsigned NOT NULL DEFAULT '0',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `status` enum('open','closed') NOT NULL DEFAULT 'open',
  `source` enum('Web','Email','Phone','API','Other') NOT NULL DEFAULT 'Other',
  `isoverdue` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isanswered` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `duedate` datetime DEFAULT NULL,
  `reopened` datetime DEFAULT NULL,
  `closed` datetime DEFAULT NULL,
  `lastmessage` datetime DEFAULT NULL,
  `lastresponse` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `user_id` (`user_id`),
  KEY `dept_id` (`dept_id`),
  KEY `staff_id` (`staff_id`),
  KEY `team_id` (`staff_id`),
  KEY `status` (`status`),
  KEY `created` (`created`),
  KEY `closed` (`closed`),
  KEY `duedate` (`duedate`),
  KEY `topic_id` (`topic_id`),
  KEY `sla_id` (`sla_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket`
--

LOCK TABLES `ost_ticket` WRITE;
/*!40000 ALTER TABLE `ost_ticket` DISABLE KEYS */;
INSERT INTO `ost_ticket` VALUES (1,'246468',1,0,1,1,1,0,0,0,'64.119.130.115','open','Web',0,0,NULL,NULL,NULL,'2014-10-02 15:49:51',NULL,'2014-10-02 15:49:51','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_attachment`
--

DROP TABLE IF EXISTS `ost_ticket_attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_attachment` (
  `attach_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `file_id` int(10) unsigned NOT NULL DEFAULT '0',
  `ref_id` int(11) unsigned NOT NULL DEFAULT '0',
  `inline` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL,
  PRIMARY KEY (`attach_id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `ref_id` (`ref_id`),
  KEY `file_id` (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_attachment`
--

LOCK TABLES `ost_ticket_attachment` WRITE;
/*!40000 ALTER TABLE `ost_ticket_attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_collaborator`
--

DROP TABLE IF EXISTS `ost_ticket_collaborator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_collaborator` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `isactive` tinyint(1) NOT NULL DEFAULT '1',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `role` char(1) NOT NULL DEFAULT 'M',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `collab` (`ticket_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_collaborator`
--

LOCK TABLES `ost_ticket_collaborator` WRITE;
/*!40000 ALTER TABLE `ost_ticket_collaborator` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_collaborator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_email_info`
--

DROP TABLE IF EXISTS `ost_ticket_email_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_email_info` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `thread_id` int(11) unsigned NOT NULL,
  `email_mid` varchar(255) NOT NULL,
  `headers` text,
  PRIMARY KEY (`id`),
  KEY `email_mid` (`email_mid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_email_info`
--

LOCK TABLES `ost_ticket_email_info` WRITE;
/*!40000 ALTER TABLE `ost_ticket_email_info` DISABLE KEYS */;
INSERT INTO `ost_ticket_email_info` VALUES (1,1,'<N90neQqqyWDDHfpUJqdOSBGX@8b57cd4b88>',NULL);
/*!40000 ALTER TABLE `ost_ticket_email_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_event`
--

DROP TABLE IF EXISTS `ost_ticket_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_event` (
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL,
  `team_id` int(11) unsigned NOT NULL,
  `dept_id` int(11) unsigned NOT NULL,
  `topic_id` int(11) unsigned NOT NULL,
  `state` enum('created','closed','reopened','assigned','transferred','overdue') NOT NULL,
  `staff` varchar(255) NOT NULL DEFAULT 'SYSTEM',
  `annulled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `timestamp` datetime NOT NULL,
  KEY `ticket_state` (`ticket_id`,`state`,`timestamp`),
  KEY `ticket_stats` (`timestamp`,`state`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_event`
--

LOCK TABLES `ost_ticket_event` WRITE;
/*!40000 ALTER TABLE `ost_ticket_event` DISABLE KEYS */;
INSERT INTO `ost_ticket_event` VALUES (1,0,0,1,1,'created','SYSTEM',0,'2014-10-02 15:49:52');
/*!40000 ALTER TABLE `ost_ticket_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_lock`
--

DROP TABLE IF EXISTS `ost_ticket_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_lock` (
  `lock_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(10) unsigned NOT NULL DEFAULT '0',
  `expire` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  PRIMARY KEY (`lock_id`),
  UNIQUE KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_lock`
--

LOCK TABLES `ost_ticket_lock` WRITE;
/*!40000 ALTER TABLE `ost_ticket_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_ticket_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_priority`
--

DROP TABLE IF EXISTS `ost_ticket_priority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_priority` (
  `priority_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `priority` varchar(60) NOT NULL DEFAULT '',
  `priority_desc` varchar(30) NOT NULL DEFAULT '',
  `priority_color` varchar(7) NOT NULL DEFAULT '',
  `priority_urgency` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispublic` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`priority_id`),
  UNIQUE KEY `priority` (`priority`),
  KEY `priority_urgency` (`priority_urgency`),
  KEY `ispublic` (`ispublic`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_priority`
--

LOCK TABLES `ost_ticket_priority` WRITE;
/*!40000 ALTER TABLE `ost_ticket_priority` DISABLE KEYS */;
INSERT INTO `ost_ticket_priority` VALUES (1,'low','Low','#DDFFDD',4,1),(2,'normal','Normal','#FFFFF0',3,1),(3,'high','High','#FEE7E7',2,1),(4,'emergency','Emergency','#FEE7E7',1,1);
/*!40000 ALTER TABLE `ost_ticket_priority` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_ticket_thread`
--

DROP TABLE IF EXISTS `ost_ticket_thread`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_ticket_thread` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0',
  `ticket_id` int(11) unsigned NOT NULL DEFAULT '0',
  `staff_id` int(11) unsigned NOT NULL DEFAULT '0',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0',
  `thread_type` enum('M','R','N') NOT NULL,
  `poster` varchar(128) NOT NULL DEFAULT '',
  `source` varchar(32) NOT NULL DEFAULT '',
  `title` varchar(255) DEFAULT NULL,
  `body` text NOT NULL,
  `format` varchar(16) NOT NULL DEFAULT 'html',
  `ip_address` varchar(64) NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  KEY `staff_id` (`staff_id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_ticket_thread`
--

LOCK TABLES `ost_ticket_thread` WRITE;
/*!40000 ALTER TABLE `ost_ticket_thread` DISABLE KEYS */;
INSERT INTO `ost_ticket_thread` VALUES (1,0,1,0,1,'M','osTicket Support','Web','osTicket Installed!','<p> Thank you for choosing osTicket. </p><p> Please make sure you join the <a href=\"http://osticket.com/forums\">osTicket forums</a> and our <a href=\"http://osticket.com/updates\">mailing list</a> to stay up to date on the latest news, security alerts and updates. The osTicket forums are also a great place to get assistance, guidance, tips, and help from other osTicket users. In addition to the forums, the osTicket wiki provides a useful collection of educational materials, documentation, and notes from the community. We welcome your contributions to the osTicket community. </p><p> If you are looking for a greater level of support, we provide professional services and commercial support with guaranteed response times, and access to the core development team. We can also help customize osTicket or even add new features to the system to meet your unique needs. </p><p> If the idea of managing and upgrading this osTicket installation is daunting, you can try osTicket as a hosted service at <a href=\"http://www.supportsystem.com\">http://www.supportsystem.com/</a> -- no installation required and we can import your data! With SupportSystem\'s turnkey infrastructure, you get osTicket at its best, leaving you free to focus on your customers without the burden of making sure the application is stable, maintained, and secure. </p><p> Cheers, </p><p> -<br /> osTicket Team http://osticket.com/ </p><p> <strong>PS.</strong> Don\'t just make customers happy, make happy customers! </p>','html','64.119.130.115','2014-10-02 15:49:51','0000-00-00 00:00:00');
/*!40000 ALTER TABLE `ost_ticket_thread` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_timezone`
--

DROP TABLE IF EXISTS `ost_timezone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_timezone` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `offset` float(3,1) NOT NULL DEFAULT '0.0',
  `timezone` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_timezone`
--

LOCK TABLES `ost_timezone` WRITE;
/*!40000 ALTER TABLE `ost_timezone` DISABLE KEYS */;
INSERT INTO `ost_timezone` VALUES (1,-12.0,'Eniwetok, Kwajalein'),(2,-11.0,'Midway Island, Samoa'),(3,-10.0,'Hawaii'),(4,-9.0,'Alaska'),(5,-8.0,'Pacific Time (US & Canada)'),(6,-7.0,'Mountain Time (US & Canada)'),(7,-6.0,'Central Time (US & Canada), Mexico City'),(8,-5.0,'Eastern Time (US & Canada), Bogota, Lima'),(9,-4.0,'Atlantic Time (Canada), Caracas, La Paz'),(10,-3.5,'Newfoundland'),(11,-3.0,'Brazil, Buenos Aires, Georgetown'),(12,-2.0,'Mid-Atlantic'),(13,-1.0,'Azores, Cape Verde Islands'),(14,0.0,'Western Europe Time, London, Lisbon, Casablanca'),(15,1.0,'Brussels, Copenhagen, Madrid, Paris'),(16,2.0,'Kaliningrad, South Africa'),(17,3.0,'Baghdad, Riyadh, Moscow, St. Petersburg'),(18,3.5,'Tehran'),(19,4.0,'Abu Dhabi, Muscat, Baku, Tbilisi'),(20,4.5,'Kabul'),(21,5.0,'Ekaterinburg, Islamabad, Karachi, Tashkent'),(22,5.5,'Bombay, Calcutta, Madras, New Delhi'),(23,6.0,'Almaty, Dhaka, Colombo'),(24,7.0,'Bangkok, Hanoi, Jakarta'),(25,8.0,'Beijing, Perth, Singapore, Hong Kong'),(26,9.0,'Tokyo, Seoul, Osaka, Sapporo, Yakutsk'),(27,9.5,'Adelaide, Darwin'),(28,10.0,'Eastern Australia, Guam, Vladivostok'),(29,11.0,'Magadan, Solomon Islands, New Caledonia'),(30,12.0,'Auckland, Wellington, Fiji, Kamchatka');
/*!40000 ALTER TABLE `ost_timezone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_user`
--

DROP TABLE IF EXISTS `ost_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `org_id` int(10) unsigned NOT NULL,
  `default_email_id` int(10) NOT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `org_id` (`org_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_user`
--

LOCK TABLES `ost_user` WRITE;
/*!40000 ALTER TABLE `ost_user` DISABLE KEYS */;
INSERT INTO `ost_user` VALUES (1,1,1,0,'osTicket Support','2014-10-02 15:49:51','2014-10-02 15:49:52');
/*!40000 ALTER TABLE `ost_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_user_account`
--

DROP TABLE IF EXISTS `ost_user_account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_user_account` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `status` int(11) unsigned NOT NULL DEFAULT '0',
  `timezone_id` int(11) NOT NULL DEFAULT '0',
  `dst` tinyint(1) NOT NULL DEFAULT '1',
  `lang` varchar(16) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  `passwd` varchar(128) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `backend` varchar(32) DEFAULT NULL,
  `registered` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_user_account`
--

LOCK TABLES `ost_user_account` WRITE;
/*!40000 ALTER TABLE `ost_user_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `ost_user_account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ost_user_email`
--

DROP TABLE IF EXISTS `ost_user_email`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ost_user_email` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `address` varchar(128) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `address` (`address`),
  KEY `user_email_lookup` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ost_user_email`
--

LOCK TABLES `ost_user_email` WRITE;
/*!40000 ALTER TABLE `ost_user_email` DISABLE KEYS */;
INSERT INTO `ost_user_email` VALUES (1,1,'support@osticket.com');
/*!40000 ALTER TABLE `ost_user_email` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-02 15:51:46
