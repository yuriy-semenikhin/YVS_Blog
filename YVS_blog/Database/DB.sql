-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.28-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for yvs_blog
CREATE DATABASE IF NOT EXISTS `yvs_blog` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `yvs_blog`;


-- Dumping structure for procedure yvs_blog.procedure_add_blog_entry
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_add_blog_entry`(IN `$entry_name` varchar(250), IN `$entry_text` text, IN `$user_id` int, IN `$subject_id` INT, OUT `result` varchar(50))
begin

insert into yvs_blog_entry values (NULL, $entry_name, $entry_text, now(), $user_id);

select last_insert_id() into result;

insert into yvs_blog_entry_subject values ($subject_id, result);

END//
DELIMITER ;


-- Dumping structure for procedure yvs_blog.procedure_add_blog_entry_tags
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_add_blog_entry_tags`(IN $tag_id int, IN $entry_id int, OUT out_id int)
BEGIN

insert into yvs_blog_entry_tags values ($entry_id, $tag_id); 

END//
DELIMITER ;


-- Dumping structure for procedure yvs_blog.procedure_add_blog_tag
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_add_blog_tag`(IN `$tag_text` varchar(50), OUT `out_id` VARCHAR(50))
BEGIN

IF ($tag_text not like '#%')
	THEN
	set $tag_text = concat('#', $tag_text);
	set out_id = $tag_text;
	
END IF; 

set $tag_text = rtrim ($tag_text);
set $tag_text = replace ($tag_text, ' ', '_');

IF exists (select tag_id from yvs_blog_tags where tag_text = $tag_text)
	THEN
	select tag_id from yvs_blog_tags where tag_text = $tag_text into out_id;
	
ELSE
	insert into yvs_blog_tags(tag_text) values($tag_text);
	select last_insert_id() into out_id;

END IF;
	

END//
DELIMITER ;


-- Dumping structure for procedure yvs_blog.procedure_add_user
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_add_user`(IN `$user_email` varchar(250), IN `$user_password` varchar(250), OUT `result` varchar(50))
begin

if exists(select * from yvs_user where username = $user_email)
	THEN set result = 'exists';
	
ELSE
	insert into yvs_user values(NULL, $user_email, md5($user_password), md5(concat($user_email, $user_password, now(),'feel_free_to_try_other_strings')));
	set result = 'done';

END IF;

END//
DELIMITER ;


-- Dumping structure for procedure yvs_blog.procedure_delete_blog_entry
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_delete_blog_entry`(IN `$entry_id` int, OUT `result` varchar(50))
begin

delete from yvs_blog_entry where entry_id = $entry_id;
delete from yvs_blog_entry_tags where entry_id = $entry_id;
delete from yvs_blog_entry_subject where entry_id = $entry_id;

END//
DELIMITER ;


-- Dumping structure for procedure yvs_blog.procedure_login_user
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `procedure_login_user`(IN `$user_email` varchar(250), IN `$user_password` varchar(250), OUT `result` varchar(50))
begin

if exists(select * from yvs_user where username = $user_email and password = md5($user_password))
	THEN set result = 'exists';
	
ELSE
	
	set result = 'absent';

END IF;

END//
DELIMITER ;


-- Dumping structure for table yvs_blog.yvs_blog_entry
CREATE TABLE IF NOT EXISTS `yvs_blog_entry` (
  `entry_id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_name` varchar(250) DEFAULT NULL,
  `entry_text` text,
  `entry_update_date` date DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yvs_blog.yvs_blog_entry: ~0 rows (approximately)
DELETE FROM `yvs_blog_entry`;
/*!40000 ALTER TABLE `yvs_blog_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `yvs_blog_entry` ENABLE KEYS */;


-- Dumping structure for table yvs_blog.yvs_blog_entry_subject
CREATE TABLE IF NOT EXISTS `yvs_blog_entry_subject` (
  `subject_id` int(11) NOT NULL DEFAULT '0',
  `entry_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`,`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yvs_blog.yvs_blog_entry_subject: ~0 rows (approximately)
DELETE FROM `yvs_blog_entry_subject`;
/*!40000 ALTER TABLE `yvs_blog_entry_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `yvs_blog_entry_subject` ENABLE KEYS */;


-- Dumping structure for table yvs_blog.yvs_blog_entry_tags
CREATE TABLE IF NOT EXISTS `yvs_blog_entry_tags` (
  `entry_id` int(11) NOT NULL DEFAULT '0',
  `tag_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`entry_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yvs_blog.yvs_blog_entry_tags: ~0 rows (approximately)
DELETE FROM `yvs_blog_entry_tags`;
/*!40000 ALTER TABLE `yvs_blog_entry_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `yvs_blog_entry_tags` ENABLE KEYS */;


-- Dumping structure for table yvs_blog.yvs_blog_rating
CREATE TABLE IF NOT EXISTS `yvs_blog_rating` (
  `rating_id` int(11) NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `rating_date` date DEFAULT NULL,
  `rating_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`rating_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yvs_blog.yvs_blog_rating: ~0 rows (approximately)
DELETE FROM `yvs_blog_rating`;
/*!40000 ALTER TABLE `yvs_blog_rating` DISABLE KEYS */;
/*!40000 ALTER TABLE `yvs_blog_rating` ENABLE KEYS */;


-- Dumping structure for table yvs_blog.yvs_blog_subject
CREATE TABLE IF NOT EXISTS `yvs_blog_subject` (
  `subject_id` int(11) NOT NULL AUTO_INCREMENT,
  `subject_name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yvs_blog.yvs_blog_subject: ~0 rows (approximately)
DELETE FROM `yvs_blog_subject`;
/*!40000 ALTER TABLE `yvs_blog_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `yvs_blog_subject` ENABLE KEYS */;


-- Dumping structure for table yvs_blog.yvs_blog_tags
CREATE TABLE IF NOT EXISTS `yvs_blog_tags` (
  `tag_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag_text` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table yvs_blog.yvs_blog_tags: ~2 rows (approximately)
DELETE FROM `yvs_blog_tags`;
/*!40000 ALTER TABLE `yvs_blog_tags` DISABLE KEYS */;
INSERT INTO `yvs_blog_tags` (`tag_id`, `tag_text`) VALUES
	(1, '#test'),
	(2, '#test_test');
/*!40000 ALTER TABLE `yvs_blog_tags` ENABLE KEYS */;


-- Dumping structure for table yvs_blog.yvs_user
CREATE TABLE IF NOT EXISTS `yvs_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) DEFAULT '',
  `password` varchar(250) DEFAULT NULL,
  `unique_user_id` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table yvs_blog.yvs_user: ~0 rows (approximately)
DELETE FROM `yvs_user`;
/*!40000 ALTER TABLE `yvs_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `yvs_user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
