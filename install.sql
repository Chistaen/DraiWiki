-- Adminer 4.2.6-dev MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

SET NAMES utf8mb4;

CREATE TABLE `drai_agreements` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `drai_agreements` (`ID`, `body`, `locale`) VALUES
(1, 'You need to accept this.', 'en_US'),
(2, 'Het zou heel fijn zijn als je dit zou willen accepteren.', 'nl_NL');

CREATE TABLE `drai_articles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_ID` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `drai_articles` (`ID`, `title`, `language`, `group_ID`, `status`) VALUES
(1, 'Homepage', 'en_US',  1,  1),
(2, 'About',  'en_US',  2,  1),
(3, 'Welkom!',  'nl_NL',  1,  1);

CREATE TABLE `drai_config` (
  `category` tinytext NOT NULL,
  `identifier` tinytext NOT NULL,
  `value` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `drai_config` (`category`, `identifier`, `value`) VALUES
('wiki',  'WIKI_LOCALE',  'en_US'),
('wiki',  'WIKI_NAME',  'DraiWiki'),
('wiki',  'WIKI_SLOGAN',  'Revolutionary wiki software'),
('wiki',  'WIKI_SKIN',  'default'),
('wiki',  'WIKI_IMAGES',  'default'),
('wiki',  'WIKI_TEMPLATES', 'default'),
('user',  'MIN_FIRST_NAME_LENGTH',  '3'),
('user',  'MIN_LAST_NAME_LENGTH', '3'),
('user',  'MAX_FIRST_NAME_LENGTH',  '15'),
('user',  'MAX_LAST_NAME_LENGTH', '20'),
('user',  'MIN_PASSWORD_LENGTH',  '5'),
('user',  'MAX_PASSWORD_LENGTH',  '35'),
('user',  'MIN_EMAIL_LENGTH', '5'),
('user',  'MAX_EMAIL_LENGTH', '25'),
('user',  'SALT', '98h#_al04sNGd#$4u98732nasG__'),
('session', 'COOKIE_ID',  'DraiWikiDev10'),
('user',  'ENABLE_REGISTRATION',  '1');

CREATE TABLE `drai_history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `article_ID` int(11) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_edited` datetime NOT NULL,
  `edited_by` int(11) NOT NULL,
  `infobox_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `drai_history` (`ID`, `article_ID`, `body`, `date_edited`, `edited_by`, `infobox_ID`) VALUES
(1, 1,  '## 1. Introduction to DraiWiki\r\n### 1.1. What is DraiWiki?\r\nDraiWiki is an upcoming open source wiki software that is designed to be customizable, neat-looking, secure and easy to use.\r\n\r\n### 1.2. Why use DraiWiki?\r\nThere are other free wiki softwares out there, so you might be wondering, what makes DraiWiki the best choice for your website? Well, there are several reasons.\r\n\r\nFirst of all, the software is designed to be customizable. For example, a theme consists of three parts: images, CSS and templates. Basically, what you\'ll be able to do is this: you can use the image set from the default theme, while using the CSS of a 3rd party theme, while using the templates of yet another 3rd party theme. And the best thing is: it\'ll only take a few seconds to set up.\r\n\r\nIt also has built-in multi-language support, meaning you won\'t need an extension.\r\n\r\nThe admin panel is designed to be self-sufficient and isolated (i.e. it has its own files), meaning that if you break something, 90% of the time you\'ll be able to fix it from within the admin panel. That\'s not all, however. The admin panel allows you to make changes without much effort.\r\n\r\n## 2. Installation\r\n### 2.1. Server requirements\r\n* PHP 5.6+\r\n* MySQL\r\n* PDO extension\r\n* Composer\r\n\r\n### 2.2. How to install\r\n1. Install Composer\r\n2. Download the most recent code from Github\r\n3. Extract the files to your http directory\r\n4. Use Composer to install the required packages (run _composer install_ from the terminal/command prompt)\r\n5. Edit the configuration file in public/config\r\n6. Import the database tables (install.sql)\r\n7. Enjoy!', '2017-02-20 19:46:38',  1,  0),
(2, 2,  'We\'re cool.', '2017-02-21 11:48:45',  1,  0),
(3, 3,  'Dit is alleen om te testen.',  '2017-02-21 12:22:33',  1,  0);

CREATE TABLE `drai_locales` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `native` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dialect` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `homepage` text COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `drai_locales` (`ID`, `native`, `dialect`, `country`, `code`, `homepage`) VALUES
(1, 'English',  'General American', 'United States',  'en_US',  'homepage'),
(2, 'Nederlands', 'Netherlandic', 'Netherlands',  'nl_NL',  'welkom!');

CREATE TABLE `drai_log_updates` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `to_version` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL,
  `performed_by` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `drai_permission_profiles` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `label` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `drai_permission_profiles` (`ID`, `label`, `permissions`) VALUES
(1, '', ''),
(2, '', ''),
(3, '', ''),
(4, '', '');

CREATE TABLE `drai_sessions` (
  `session_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` bigint(20) NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `drai_users` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthdate` date NOT NULL,
  `registration_date` date NOT NULL,
  `locale` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL,
  `groups` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `preferences` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `edits` int(11) NOT NULL,
  `ip_address` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `activated` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE `drai_user_groups` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `permission_profile` int(11) NOT NULL,
  `name` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `dominant` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

INSERT INTO `drai_user_groups` (`ID`, `permission_profile`, `name`, `color`, `dominant`) VALUES
(1, 0,  'Root', '#000', 0),
(2, 1,  'Admin',  '#ed6a5a',  0),
(3, 2,  'Regular',  '', 0),
(4, 3,  'Banned', '#000', 1),
(5, 4,  'Guest',  '', 0);

-- 2017-02-24 13:35:23
