-- phpMyAdmin SQL Dump
-- version 4.0.10
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 04 2016 г., 23:55
-- Версия сервера: 5.5.35-log
-- Версия PHP: 5.3.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `myusermodxEVO`
--

-- --------------------------------------------------------

--
-- Структура таблицы `modx_active_users`
--

CREATE TABLE IF NOT EXISTS `modx_active_users` (
  `internalKey` int(9) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `lasthit` int(20) NOT NULL DEFAULT '0',
  `id` int(10) DEFAULT NULL,
  `action` varchar(10) NOT NULL DEFAULT '',
  `ip` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data about active users.';

--
-- Дамп данных таблицы `modx_active_users`
--

INSERT INTO `modx_active_users` (`internalKey`, `username`, `lasthit`, `id`, `action`, `ip`) VALUES
(1, 'Admin VLADDIS', 1459708473, NULL, '76', '127.0.0.1');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_categories`
--

CREATE TABLE IF NOT EXISTS `modx_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Categories to be used snippets,tv,chunks, etc' AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `modx_categories`
--

INSERT INTO `modx_categories` (`id`, `category`) VALUES
(1, 'Demo Content'),
(2, 'SEO'),
(3, 'Forms'),
(4, 'Templates'),
(5, 'Js'),
(6, 'Manager and Admin'),
(7, 'add'),
(8, 'Navigation'),
(9, 'Content');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_documentgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_documentgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `private_memgroup` tinyint(4) DEFAULT '0' COMMENT 'determine whether the document group is private to manager users',
  `private_webgroup` tinyint(4) DEFAULT '0' COMMENT 'determines whether the document is private to web users',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_document_groups`
--

CREATE TABLE IF NOT EXISTS `modx_document_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `document_group` int(10) NOT NULL DEFAULT '0',
  `document` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `document` (`document`),
  KEY `document_group` (`document_group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_event_log`
--

CREATE TABLE IF NOT EXISTS `modx_event_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eventid` int(11) DEFAULT '0',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1- information, 2 - warning, 3- error',
  `user` int(11) NOT NULL DEFAULT '0' COMMENT 'link to user table',
  `usertype` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 - manager, 1 - web',
  `source` varchar(50) NOT NULL DEFAULT '',
  `description` text,
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Stores event and error logs' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_keyword_xref`
--

CREATE TABLE IF NOT EXISTS `modx_keyword_xref` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `keyword_id` (`keyword_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Cross reference bewteen keywords and content';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_manager_log`
--

CREATE TABLE IF NOT EXISTS `modx_manager_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `timestamp` int(20) NOT NULL DEFAULT '0',
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `username` varchar(255) DEFAULT NULL,
  `action` int(10) NOT NULL DEFAULT '0',
  `itemid` varchar(10) DEFAULT '0',
  `itemname` varchar(255) DEFAULT NULL,
  `message` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains a record of user interaction.' AUTO_INCREMENT=560 ;

--
-- Дамп данных таблицы `modx_manager_log`
--

INSERT INTO `modx_manager_log` (`id`, `timestamp`, `internalKey`, `username`, `action`, `itemid`, `itemname`, `message`) VALUES
(1, 1459285698, 1, 'Admin VLADDIS', 58, '-', 'MODX', 'Logged in'),
(2, 1459285703, 1, 'Admin VLADDIS', 17, '-', '-', 'Editing settings'),
(3, 1459286232, 1, 'Admin VLADDIS', 30, '-', '-', 'Saving settings'),
(4, 1459287093, 1, 'Admin VLADDIS', 75, '-', '-', 'User/ role management'),
(5, 1459287106, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(6, 1459287111, 1, 'Admin VLADDIS', 19, '-', 'Новый шаблон', 'Creating a new template'),
(7, 1459287191, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(8, 1459287200, 1, 'Admin VLADDIS', 19, '-', 'Новый шаблон', 'Creating a new template'),
(9, 1459287464, 1, 'Admin VLADDIS', 20, '-', 'Главная страница', 'Saving template'),
(10, 1459287464, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(11, 1459287521, 1, 'Admin VLADDIS', 27, '1', 'Home', 'Editing resource'),
(12, 1459287538, 1, 'Admin VLADDIS', 27, '1', 'Home', 'Editing resource'),
(13, 1459287661, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(14, 1459287668, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(15, 1459287762, 1, 'Admin VLADDIS', 27, '1', 'Home', 'Editing resource'),
(16, 1459287772, 1, 'Admin VLADDIS', 27, '1', 'Home', 'Editing resource'),
(17, 1459287815, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(18, 1459287817, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(19, 1459287837, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(20, 1459287841, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(21, 1459287882, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(22, 1459287889, 1, 'Admin VLADDIS', 16, '4', 'MODxHost', 'Editing template'),
(23, 1459287912, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(24, 1459287920, 1, 'Admin VLADDIS', 16, '3', 'Home', 'Editing template'),
(25, 1459287927, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(26, 1459287930, 1, 'Admin VLADDIS', 16, '4', 'MODxHost', 'Editing template'),
(27, 1459287945, 1, 'Admin VLADDIS', 21, '4', 'MODxHost', 'Deleting template'),
(28, 1459287946, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(29, 1459287950, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(30, 1459288540, 1, 'Admin VLADDIS', 20, '5', 'Главная страница', 'Saving template'),
(31, 1459288540, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(32, 1459288548, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(33, 1459288563, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(34, 1459288941, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(35, 1459288954, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(36, 1459366308, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(37, 1459366679, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(38, 1459366682, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(39, 1459366714, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(40, 1459366747, 1, 'Admin VLADDIS', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(41, 1459366768, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(42, 1459366803, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(43, 1459367031, 1, 'Admin VLADDIS', 79, '-', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(44, 1459367031, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(45, 1459367040, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(46, 1459367180, 1, 'Admin VLADDIS', 20, '5', 'Главная страница', 'Saving template'),
(47, 1459367181, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(48, 1459367190, 1, 'Admin VLADDIS', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(49, 1459367446, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(50, 1459367456, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(51, 1459367476, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(52, 1459367494, 1, 'Admin VLADDIS', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(53, 1459367500, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(54, 1459367503, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(55, 1459367531, 1, 'Admin VLADDIS', 79, '7', 'HEAD', 'Saving Chunk (HTML Snippet)'),
(56, 1459367531, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(57, 1459367536, 1, 'Admin VLADDIS', 78, '5', 'header', 'Editing Chunk (HTML Snippet)'),
(58, 1459367550, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(59, 1459367552, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(60, 1459367569, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(61, 1459367573, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(62, 1459368022, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(63, 1459368029, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(64, 1459368131, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(65, 1459368175, 1, 'Admin VLADDIS', 79, '-', 'MAIN FOOTER', 'Saving Chunk (HTML Snippet)'),
(66, 1459368175, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(67, 1459368193, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(68, 1459368198, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(69, 1459368285, 1, 'Admin VLADDIS', 20, '5', 'Главная страница', 'Saving template'),
(70, 1459368286, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(71, 1459368291, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(72, 1459368298, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(73, 1459368300, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(74, 1459368310, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(75, 1459368313, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(76, 1459368583, 1, 'Admin VLADDIS', 20, '5', 'Главная страница', 'Saving template'),
(77, 1459368583, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(78, 1459368588, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(79, 1459368666, 1, 'Admin VLADDIS', 79, '-', 'MAIN HEADER', 'Saving Chunk (HTML Snippet)'),
(80, 1459368667, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(81, 1459368675, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(82, 1459368698, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(83, 1459368704, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(84, 1459368706, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(85, 1459368743, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(86, 1459368746, 1, 'Admin VLADDIS', 31, '-', '-', 'Using file manager'),
(87, 1459368762, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(88, 1459368768, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(89, 1459368927, 1, 'Admin VLADDIS', 20, '5', 'Главная страница', 'Saving template'),
(90, 1459368928, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(91, 1459368932, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(92, 1459369007, 1, 'Admin VLADDIS', 79, '-', 'MAIN CONTENT', 'Saving Chunk (HTML Snippet)'),
(93, 1459369007, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(94, 1459369031, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(95, 1459369044, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(96, 1459369046, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(97, 1459369129, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(98, 1459369221, 1, 'Admin VLADDIS', 17, '-', '-', 'Editing settings'),
(99, 1459369256, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(100, 1459369476, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(101, 1459369478, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(102, 1459369482, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(103, 1459369618, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(104, 1459369810, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(105, 1459369990, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(106, 1459370030, 1, 'Admin VLADDIS', 5, '-', 'О нас', 'Saving resource'),
(107, 1459370032, 1, 'Admin VLADDIS', 3, '2', 'О нас', 'Viewing data for resource'),
(108, 1459370040, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(109, 1459370066, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(110, 1459370068, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(111, 1459370104, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(112, 1459370177, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(113, 1459370251, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(114, 1459370300, 1, 'Admin VLADDIS', 5, '-', 'Контактная информация', 'Saving resource'),
(115, 1459370302, 1, 'Admin VLADDIS', 3, '3', 'Контактная информация', 'Viewing data for resource'),
(116, 1459370311, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(117, 1459370351, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(118, 1459370356, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(119, 1459370360, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(120, 1459370364, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(121, 1459370448, 1, 'Admin VLADDIS', 5, '3', 'Контактная информация', 'Saving resource'),
(122, 1459370449, 1, 'Admin VLADDIS', 3, '3', 'Контактная информация', 'Viewing data for resource'),
(123, 1459370459, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(124, 1459370554, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(125, 1459370595, 1, 'Admin VLADDIS', 5, '-', 'Услуги', 'Saving resource'),
(126, 1459370597, 1, 'Admin VLADDIS', 3, '4', 'Услуги', 'Viewing data for resource'),
(127, 1459370692, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(128, 1459370727, 1, 'Admin VLADDIS', 4, '-', 'Новый ресурс', 'Creating a resource'),
(129, 1459370771, 1, 'Admin VLADDIS', 5, '-', 'Новости ', 'Saving resource'),
(130, 1459370773, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(131, 1459370825, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(132, 1459370850, 1, 'Admin VLADDIS', 114, '-', '-', 'View event log'),
(133, 1459370855, 1, 'Admin VLADDIS', 70, '-', '-', 'Viewing site schedule'),
(134, 1459370868, 1, 'Admin VLADDIS', 31, '-', '-', 'Using file manager'),
(135, 1459370874, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(136, 1459370922, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(137, 1459370934, 1, 'Admin VLADDIS', 106, '-', '-', 'Viewing Modules'),
(138, 1459370944, 1, 'Admin VLADDIS', 75, '-', '-', 'User/ role management'),
(139, 1459370977, 1, 'Admin VLADDIS', 53, '-', '-', 'Viewing system info'),
(140, 1459371089, 1, 'Admin VLADDIS', 17, '-', '-', 'Editing settings'),
(141, 1459371153, 1, 'Admin VLADDIS', 30, '-', '-', 'Saving settings'),
(142, 1459371164, 1, 'Admin VLADDIS', 53, '-', '-', 'Viewing system info'),
(143, 1459371185, 1, 'Admin VLADDIS', 114, '-', '-', 'View event log'),
(144, 1459371187, 1, 'Admin VLADDIS', 70, '-', '-', 'Viewing site schedule'),
(145, 1459371204, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(146, 1459371207, 1, 'Admin VLADDIS', 31, '-', '-', 'Using file manager'),
(147, 1459371210, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(148, 1459451655, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(149, 1459454114, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(150, 1459454298, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(151, 1459454316, 1, 'Admin VLADDIS', 22, '11', 'Wayfinder', 'Editing Snippet'),
(152, 1459454446, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(153, 1459454454, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(154, 1459454472, 1, 'Admin VLADDIS', 5, '2', 'О нас', 'Saving resource'),
(155, 1459454474, 1, 'Admin VLADDIS', 3, '2', 'О нас', 'Viewing data for resource'),
(156, 1459454478, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(157, 1459454488, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(158, 1459454490, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(159, 1459454493, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(160, 1459454503, 1, 'Admin VLADDIS', 5, '4', 'Услуги', 'Saving resource'),
(161, 1459454504, 1, 'Admin VLADDIS', 3, '4', 'Услуги', 'Viewing data for resource'),
(162, 1459454510, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(163, 1459454523, 1, 'Admin VLADDIS', 5, '3', 'Контактная информация', 'Saving resource'),
(164, 1459454525, 1, 'Admin VLADDIS', 3, '3', 'Контактная информация', 'Viewing data for resource'),
(165, 1459454672, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(166, 1459454684, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(167, 1459454686, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(168, 1459454775, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(169, 1459454782, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(170, 1459455097, 1, 'Admin VLADDIS', 79, '9', 'MAIN HEADER', 'Saving Chunk (HTML Snippet)'),
(171, 1459455098, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(172, 1459455104, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(173, 1459455120, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(174, 1459455168, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(175, 1459455172, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(176, 1459455408, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(177, 1459455420, 1, 'Admin VLADDIS', 22, '11', 'Wayfinder', 'Editing Snippet'),
(178, 1459455435, 1, 'Admin VLADDIS', 24, '11', 'Wayfinder', 'Saving Snippet'),
(179, 1459455436, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(180, 1459455446, 1, 'Admin VLADDIS', 22, '11', 'Wayfinder', 'Editing Snippet'),
(181, 1459455551, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(182, 1459455557, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(183, 1459455559, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(184, 1459455563, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(185, 1459455624, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(186, 1459455659, 1, 'Admin VLADDIS', 79, '9', 'MAIN HEADER', 'Saving Chunk (HTML Snippet)'),
(187, 1459455659, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(188, 1459455770, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(189, 1459455786, 1, 'Admin VLADDIS', 79, '9', 'MAIN HEADER', 'Saving Chunk (HTML Snippet)'),
(190, 1459455786, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(191, 1459455855, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(192, 1459455979, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(193, 1459456548, 1, 'Admin VLADDIS', 5, '1', 'Главная страница', 'Saving resource'),
(194, 1459456549, 1, 'Admin VLADDIS', 3, '1', 'Главная страница', 'Viewing data for resource'),
(195, 1459456645, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(196, 1459456649, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(197, 1459456776, 1, 'Admin VLADDIS', 79, '9', 'MAIN HEADER', 'Saving Chunk (HTML Snippet)'),
(198, 1459456776, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(199, 1459456780, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(200, 1459456851, 1, 'Admin VLADDIS', 79, '-', 'MAIN MENU', 'Saving Chunk (HTML Snippet)'),
(201, 1459456852, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(202, 1459456931, 1, 'Admin VLADDIS', 19, '-', 'Новый шаблон', 'Creating a new template'),
(203, 1459458042, 1, 'Admin VLADDIS', 20, '-', 'Контентная страница', 'Saving template'),
(204, 1459458042, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(205, 1459458061, 1, 'Admin VLADDIS', 19, '-', 'Новый шаблон', 'Creating a new template'),
(206, 1459458171, 1, 'Admin VLADDIS', 20, '-', 'Новости', 'Saving template'),
(207, 1459458172, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(208, 1459458178, 1, 'Admin VLADDIS', 19, '-', 'Новый шаблон', 'Creating a new template'),
(209, 1459458237, 1, 'Admin VLADDIS', 20, '-', 'Новость', 'Saving template'),
(210, 1459458237, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(211, 1459458245, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(212, 1459458257, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(213, 1459458257, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(214, 1459458265, 1, 'Admin VLADDIS', 19, '-', 'Новый шаблон', 'Creating a new template'),
(215, 1459458891, 1, 'Admin VLADDIS', 20, '-', 'Контакты', 'Saving template'),
(216, 1459458892, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(217, 1459458897, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(218, 1459458944, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(219, 1459458947, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(220, 1459458971, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(221, 1459458977, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(222, 1459459739, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(223, 1459459739, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(224, 1459459744, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(225, 1459459797, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(226, 1459459797, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(227, 1459459807, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(228, 1459459817, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(229, 1459459820, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(230, 1459459833, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(231, 1459459839, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(232, 1459459852, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(233, 1459459852, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(234, 1459619732, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(235, 1459620372, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(236, 1459620387, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(237, 1459620402, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(238, 1459620406, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(239, 1459620425, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(240, 1459620430, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(241, 1459620449, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(242, 1459620456, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(243, 1459620624, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(244, 1459620624, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(245, 1459620628, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(246, 1459620645, 1, 'Admin VLADDIS', 78, '10', 'MAIN CONTENT', 'Editing Chunk (HTML Snippet)'),
(247, 1459620664, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(248, 1459620669, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(249, 1459620903, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(250, 1459620903, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(251, 1459620910, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(252, 1459620922, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(253, 1459620928, 1, 'Admin VLADDIS', 5, '3', 'Контактная информация', 'Saving resource'),
(254, 1459620930, 1, 'Admin VLADDIS', 3, '3', 'Контактная информация', 'Viewing data for resource'),
(255, 1459620994, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(256, 1459620997, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(257, 1459621104, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(258, 1459621105, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(259, 1459621110, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(260, 1459621114, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(261, 1459621122, 1, 'Admin VLADDIS', 5, '3', 'Контактная информация', 'Saving resource'),
(262, 1459621124, 1, 'Admin VLADDIS', 3, '3', 'Контактная информация', 'Viewing data for resource'),
(263, 1459621174, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(264, 1459621177, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(265, 1459621205, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(266, 1459621205, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(267, 1459621212, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(268, 1459621217, 1, 'Admin VLADDIS', 5, '3', 'Контактная информация', 'Saving resource'),
(269, 1459621219, 1, 'Admin VLADDIS', 3, '3', 'Контактная информация', 'Viewing data for resource'),
(270, 1459621245, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(271, 1459621248, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(272, 1459622067, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(273, 1459622067, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(274, 1459622073, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(275, 1459622079, 1, 'Admin VLADDIS', 5, '3', 'Контактная информация', 'Saving resource'),
(276, 1459622080, 1, 'Admin VLADDIS', 3, '3', 'Контактная информация', 'Viewing data for resource'),
(277, 1459622103, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(278, 1459622107, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(279, 1459622156, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(280, 1459622157, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(281, 1459622160, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(282, 1459622164, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(283, 1459622186, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(284, 1459622190, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(285, 1459622216, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(286, 1459622217, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(287, 1459622222, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(288, 1459622264, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(289, 1459622268, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(290, 1459622540, 1, 'Admin VLADDIS', 20, '6', 'Контентная страница', 'Saving template'),
(291, 1459622540, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(292, 1459622548, 1, 'Admin VLADDIS', 78, '9', 'MAIN HEADER', 'Editing Chunk (HTML Snippet)'),
(293, 1459622568, 1, 'Admin VLADDIS', 79, '9', 'MAIN HEADER', 'Saving Chunk (HTML Snippet)'),
(294, 1459622568, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(295, 1459622575, 1, 'Admin VLADDIS', 78, '8', 'MAIN FOOTER', 'Editing Chunk (HTML Snippet)'),
(296, 1459622602, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(297, 1459622664, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(298, 1459622672, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(299, 1459622762, 1, 'Admin VLADDIS', 20, '6', 'Контентная страница', 'Saving template'),
(300, 1459622763, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(301, 1459622767, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(302, 1459622787, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(303, 1459622797, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(304, 1459622812, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(305, 1459622818, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(306, 1459623181, 1, 'Admin VLADDIS', 20, '6', 'Контентная страница', 'Saving template'),
(307, 1459623181, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(308, 1459623185, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(309, 1459623289, 1, 'Admin VLADDIS', 20, '6', 'Контентная страница', 'Saving template'),
(310, 1459623289, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(311, 1459623295, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(312, 1459623302, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(313, 1459623316, 1, 'Admin VLADDIS', 5, '2', 'О нас', 'Saving resource'),
(314, 1459623318, 1, 'Admin VLADDIS', 3, '2', 'О нас', 'Viewing data for resource'),
(315, 1459623345, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(316, 1459623356, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(317, 1459623481, 1, 'Admin VLADDIS', 20, '6', 'Контентная страница', 'Saving template'),
(318, 1459623481, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(319, 1459623485, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(320, 1459623561, 1, 'Admin VLADDIS', 79, '-', 'header content page', 'Saving Chunk (HTML Snippet)'),
(321, 1459623561, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(322, 1459623573, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(323, 1459623594, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(324, 1459623600, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(325, 1459623721, 1, 'Admin VLADDIS', 20, '6', 'Контентная страница', 'Saving template'),
(326, 1459623721, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(327, 1459623726, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(328, 1459623811, 1, 'Admin VLADDIS', 79, '-', 'footer content page', 'Saving Chunk (HTML Snippet)'),
(329, 1459623811, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(330, 1459623816, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(331, 1459623845, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(332, 1459623853, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(333, 1459623857, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(334, 1459623866, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(335, 1459623870, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(336, 1459623873, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(337, 1459623876, 1, 'Admin VLADDIS', 27, '1', 'Главная страница', 'Editing resource'),
(338, 1459623879, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(339, 1459623889, 1, 'Admin VLADDIS', 5, '2', 'О нас', 'Saving resource'),
(340, 1459623891, 1, 'Admin VLADDIS', 3, '2', 'О нас', 'Viewing data for resource'),
(341, 1459623895, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(342, 1459623897, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(343, 1459623903, 1, 'Admin VLADDIS', 5, '3', 'Контактная информация', 'Saving resource'),
(344, 1459623905, 1, 'Admin VLADDIS', 3, '3', 'Контактная информация', 'Viewing data for resource'),
(345, 1459623910, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(346, 1459623913, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(347, 1459623924, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(348, 1459623930, 1, 'Admin VLADDIS', 5, '4', 'Услуги', 'Saving resource'),
(349, 1459623932, 1, 'Admin VLADDIS', 3, '4', 'Услуги', 'Viewing data for resource'),
(350, 1459623934, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(351, 1459623940, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(352, 1459623942, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(353, 1459623952, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(354, 1459623961, 1, 'Admin VLADDIS', 16, '7', 'Новости', 'Editing template'),
(355, 1459624022, 1, 'Admin VLADDIS', 20, '7', 'Новости', 'Saving template'),
(356, 1459624023, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(357, 1459624028, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(358, 1459624044, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(359, 1459624049, 1, 'Admin VLADDIS', 16, '7', 'Новости', 'Editing template'),
(360, 1459624363, 1, 'Admin VLADDIS', 20, '7', 'Новости', 'Saving template'),
(361, 1459624363, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(362, 1459626225, 1, 'Admin VLADDIS', 16, '7', 'Новости', 'Editing template'),
(363, 1459626363, 1, 'Admin VLADDIS', 20, '7', 'Новости', 'Saving template'),
(364, 1459626364, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(365, 1459626368, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(366, 1459626432, 1, 'Admin VLADDIS', 79, '-', 'header news', 'Saving Chunk (HTML Snippet)'),
(367, 1459626433, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(368, 1459626438, 1, 'Admin VLADDIS', 16, '7', 'Новости', 'Editing template'),
(369, 1459626589, 1, 'Admin VLADDIS', 20, '7', 'Новости', 'Saving template'),
(370, 1459626590, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(371, 1459626594, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(372, 1459626654, 1, 'Admin VLADDIS', 79, '-', 'content news', 'Saving Chunk (HTML Snippet)'),
(373, 1459626655, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(374, 1459626658, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(375, 1459626688, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(376, 1459626695, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(377, 1459626700, 1, 'Admin VLADDIS', 5, '4', 'Услуги', 'Saving resource'),
(378, 1459626702, 1, 'Admin VLADDIS', 3, '4', 'Услуги', 'Viewing data for resource'),
(379, 1459631588, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(380, 1459631594, 1, 'Admin VLADDIS', 16, '7', 'Новости', 'Editing template'),
(381, 1459631620, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(382, 1459631628, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(383, 1459631653, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(384, 1459631657, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(385, 1459631665, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(386, 1459631676, 1, 'Admin VLADDIS', 16, '9', 'Контакты', 'Editing template'),
(387, 1459631712, 1, 'Admin VLADDIS', 20, '9', 'Контакты', 'Saving template'),
(388, 1459631712, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(389, 1459631720, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(390, 1459631732, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(391, 1459631736, 1, 'Admin VLADDIS', 16, '7', 'Новости', 'Editing template'),
(392, 1459631797, 1, 'Admin VLADDIS', 20, '7', 'Новости', 'Saving template'),
(393, 1459631797, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(394, 1459631827, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(395, 1459631835, 1, 'Admin VLADDIS', 5, '4', 'Услуги', 'Saving resource'),
(396, 1459631837, 1, 'Admin VLADDIS', 3, '4', 'Услуги', 'Viewing data for resource'),
(397, 1459631839, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(398, 1459631868, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(399, 1459631871, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(400, 1459631899, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(401, 1459631900, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(402, 1459631903, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(403, 1459632410, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(404, 1459632411, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(405, 1459632415, 1, 'Admin VLADDIS', 16, '5', 'Главная страница', 'Editing template'),
(406, 1459632420, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(407, 1459632425, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(408, 1459632439, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(409, 1459632444, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(410, 1459632932, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(411, 1459632933, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(412, 1459632937, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(413, 1459633005, 1, 'Admin VLADDIS', 79, '-', 'header one news', 'Saving Chunk (HTML Snippet)'),
(414, 1459633006, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(415, 1459633127, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(416, 1459633295, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(417, 1459633295, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(418, 1459633300, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(419, 1459633440, 1, 'Admin VLADDIS', 79, '-', 'content one news', 'Saving Chunk (HTML Snippet)'),
(420, 1459633441, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(421, 1459633446, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(422, 1459633459, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(423, 1459633467, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(424, 1459633474, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(425, 1459633476, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(426, 1459633503, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(427, 1459633507, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(428, 1459633527, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(429, 1459633543, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(430, 1459633560, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(431, 1459633563, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(432, 1459633572, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(433, 1459633577, 1, 'Admin VLADDIS', 78, '17', 'content one news', 'Editing Chunk (HTML Snippet)'),
(434, 1459633713, 1, 'Admin VLADDIS', 79, '17', 'content one news', 'Saving Chunk (HTML Snippet)'),
(435, 1459633713, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(436, 1459633719, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(437, 1459633735, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(438, 1459633739, 1, 'Admin VLADDIS', 78, '17', 'content one news', 'Editing Chunk (HTML Snippet)'),
(439, 1459633970, 1, 'Admin VLADDIS', 79, '17', 'content one news', 'Saving Chunk (HTML Snippet)'),
(440, 1459633971, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(441, 1459633975, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(442, 1459633981, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(443, 1459633982, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(444, 1459634137, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(445, 1459634141, 1, 'Admin VLADDIS', 78, '17', 'content one news', 'Editing Chunk (HTML Snippet)'),
(446, 1459634186, 1, 'Admin VLADDIS', 79, '17', 'content one news', 'Saving Chunk (HTML Snippet)'),
(447, 1459634186, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(448, 1459634214, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(449, 1459634230, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(450, 1459634239, 1, 'Admin VLADDIS', 78, '17', 'content one news', 'Editing Chunk (HTML Snippet)'),
(451, 1459634496, 1, 'Admin VLADDIS', 79, '17', 'content one news', 'Saving Chunk (HTML Snippet)'),
(452, 1459634497, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(453, 1459634502, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(454, 1459634516, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(455, 1459634521, 1, 'Admin VLADDIS', 16, '7', 'Новости', 'Editing template'),
(456, 1459634530, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(457, 1459634533, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(458, 1459634550, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(459, 1459634557, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(460, 1459634562, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(461, 1459634562, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(462, 1459634565, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(463, 1459634571, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(464, 1459634573, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(465, 1459634575, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(466, 1459634609, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(467, 1459634641, 1, 'Admin VLADDIS', 78, '16', 'header one news', 'Editing Chunk (HTML Snippet)'),
(468, 1459634737, 1, 'Admin VLADDIS', 79, '16', 'header one news', 'Saving Chunk (HTML Snippet)'),
(469, 1459634737, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(470, 1459634743, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(471, 1459634759, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(472, 1459634851, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(473, 1459634916, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(474, 1459634925, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(475, 1459634942, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(476, 1459634946, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(477, 1459634950, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(478, 1459634962, 1, 'Admin VLADDIS', 78, '16', 'header one news', 'Editing Chunk (HTML Snippet)'),
(479, 1459635011, 1, 'Admin VLADDIS', 79, '16', 'header one news', 'Saving Chunk (HTML Snippet)'),
(480, 1459635012, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(481, 1459635023, 1, 'Admin VLADDIS', 77, '-', 'Новый чанк', 'Creating a new Chunk (HTML Snippet)'),
(482, 1459635208, 1, 'Admin VLADDIS', 79, '-', 'footer one news', 'Saving Chunk (HTML Snippet)'),
(483, 1459635208, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(484, 1459635213, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(485, 1459635242, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(486, 1459635242, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(487, 1459635246, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(488, 1459635251, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(489, 1459635253, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(490, 1459635273, 1, 'Admin VLADDIS', 27, '4', 'Услуги', 'Editing resource'),
(491, 1459635292, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(492, 1459635298, 1, 'Admin VLADDIS', 16, '7', 'Новости', 'Editing template'),
(493, 1459635384, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(494, 1459635387, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(495, 1459635408, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(496, 1459635418, 1, 'Admin VLADDIS', 78, '17', 'content one news', 'Editing Chunk (HTML Snippet)'),
(497, 1459635497, 1, 'Admin VLADDIS', 79, '17', 'content one news', 'Saving Chunk (HTML Snippet)'),
(498, 1459635498, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(499, 1459635501, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(500, 1459635520, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(501, 1459635527, 1, 'Admin VLADDIS', 78, '17', 'content one news', 'Editing Chunk (HTML Snippet)'),
(502, 1459635554, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(503, 1459635560, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(504, 1459635565, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(505, 1459635565, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(506, 1459635568, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(507, 1459635575, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(508, 1459635576, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(509, 1459635587, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(510, 1459635596, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(511, 1459635606, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(512, 1459635612, 1, 'Admin VLADDIS', 78, '17', 'content one news', 'Editing Chunk (HTML Snippet)'),
(513, 1459635623, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(514, 1459635640, 1, 'Admin VLADDIS', 78, '7', 'HEAD', 'Editing Chunk (HTML Snippet)'),
(515, 1459635659, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(516, 1459635663, 1, 'Admin VLADDIS', 78, '17', 'content one news', 'Editing Chunk (HTML Snippet)'),
(517, 1459635952, 1, 'Admin VLADDIS', 79, '17', 'content one news', 'Saving Chunk (HTML Snippet)'),
(518, 1459635953, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(519, 1459635957, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(520, 1459635969, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(521, 1459635971, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(522, 1459636012, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(523, 1459636024, 1, 'Admin VLADDIS', 19, '-', 'Новый шаблон', 'Creating a new template'),
(524, 1459636029, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(525, 1459636032, 1, 'Admin VLADDIS', 16, '8', 'Новость', 'Editing template'),
(526, 1459636183, 1, 'Admin VLADDIS', 20, '8', 'Новость', 'Saving template'),
(527, 1459636183, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(528, 1459636186, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(529, 1459636192, 1, 'Admin VLADDIS', 5, '5', 'Новости ', 'Saving resource'),
(530, 1459636193, 1, 'Admin VLADDIS', 3, '5', 'Новости ', 'Viewing data for resource'),
(531, 1459636214, 1, 'Admin VLADDIS', 27, '3', 'Контактная информация', 'Editing resource'),
(532, 1459636217, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(533, 1459636246, 1, 'Admin VLADDIS', 27, '5', 'Новости ', 'Editing resource'),
(534, 1459636253, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(535, 1459690182, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(536, 1459690422, 1, 'Admin VLADDIS', 16, '6', 'Контентная страница', 'Editing template'),
(537, 1459690443, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(538, 1459690451, 1, 'Admin VLADDIS', 78, '13', 'footer content page', 'Editing Chunk (HTML Snippet)'),
(539, 1459692089, 1, 'Admin VLADDIS', 79, '13', 'footer content page', 'Saving Chunk (HTML Snippet)'),
(540, 1459692092, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(541, 1459692106, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(542, 1459692129, 1, 'Admin VLADDIS', 5, '2', 'О нас', 'Saving resource'),
(543, 1459692136, 1, 'Admin VLADDIS', 3, '2', 'О нас', 'Viewing data for resource'),
(544, 1459692290, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(545, 1459692501, 1, 'Admin VLADDIS', 5, '2', 'О нас', 'Saving resource'),
(546, 1459692505, 1, 'Admin VLADDIS', 3, '2', 'О нас', 'Viewing data for resource'),
(547, 1459692582, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(548, 1459692628, 1, 'Admin VLADDIS', 5, '2', 'О нас', 'Saving resource'),
(549, 1459692632, 1, 'Admin VLADDIS', 3, '2', 'О нас', 'Viewing data for resource'),
(550, 1459692777, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(551, 1459692808, 1, 'Admin VLADDIS', 78, '13', 'footer content page', 'Editing Chunk (HTML Snippet)'),
(552, 1459692823, 1, 'Admin VLADDIS', 79, '13', 'footer content page', 'Saving Chunk (HTML Snippet)'),
(553, 1459692824, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(554, 1459692858, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(555, 1459708432, 1, 'Admin VLADDIS', 27, '2', 'О нас', 'Editing resource'),
(556, 1459708442, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management'),
(557, 1459708461, 1, 'Admin VLADDIS', 22, '2', 'Breadcrumbs', 'Editing Snippet'),
(558, 1459708472, 1, 'Admin VLADDIS', 24, '2', 'Breadcrumbs', 'Saving Snippet'),
(559, 1459708473, 1, 'Admin VLADDIS', 76, '-', '-', 'Element management');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_manager_users`
--

CREATE TABLE IF NOT EXISTS `modx_manager_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains login information for backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_manager_users`
--

INSERT INTO `modx_manager_users` (`id`, `username`, `password`) VALUES
(1, 'Admin VLADDIS', 'uncrypt>daa3784f11095a33dc4b7da8a83c295c9f531fac');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_membergroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `membergroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_membergroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_membergroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_member_groups`
--

CREATE TABLE IF NOT EXISTS `modx_member_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_group` int(10) NOT NULL DEFAULT '0',
  `member` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_member` (`user_group`,`member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_content`
--

CREATE TABLE IF NOT EXISTS `modx_site_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL DEFAULT 'document',
  `contentType` varchar(50) NOT NULL DEFAULT 'text/html',
  `pagetitle` varchar(255) NOT NULL DEFAULT '',
  `longtitle` varchar(255) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `alias` varchar(255) DEFAULT '',
  `link_attributes` varchar(255) NOT NULL DEFAULT '' COMMENT 'Link attriubtes',
  `published` int(1) NOT NULL DEFAULT '0',
  `pub_date` int(20) NOT NULL DEFAULT '0',
  `unpub_date` int(20) NOT NULL DEFAULT '0',
  `parent` int(10) NOT NULL DEFAULT '0',
  `isfolder` int(1) NOT NULL DEFAULT '0',
  `introtext` text COMMENT 'Used to provide quick summary of the document',
  `content` mediumtext,
  `richtext` tinyint(1) NOT NULL DEFAULT '1',
  `template` int(10) NOT NULL DEFAULT '0',
  `menuindex` int(10) NOT NULL DEFAULT '0',
  `searchable` int(1) NOT NULL DEFAULT '1',
  `cacheable` int(1) NOT NULL DEFAULT '1',
  `createdby` int(10) NOT NULL DEFAULT '0',
  `createdon` int(20) NOT NULL DEFAULT '0',
  `editedby` int(10) NOT NULL DEFAULT '0',
  `editedon` int(20) NOT NULL DEFAULT '0',
  `deleted` int(1) NOT NULL DEFAULT '0',
  `deletedon` int(20) NOT NULL DEFAULT '0',
  `deletedby` int(10) NOT NULL DEFAULT '0',
  `publishedon` int(20) NOT NULL DEFAULT '0' COMMENT 'Date the document was published',
  `publishedby` int(10) NOT NULL DEFAULT '0' COMMENT 'ID of user who published the document',
  `menutitle` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title',
  `donthit` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Disable page hit count',
  `haskeywords` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to keywords',
  `hasmetatags` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'has links to meta tags',
  `privateweb` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private web document',
  `privatemgr` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Private manager document',
  `content_dispo` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0-inline, 1-attachment',
  `hidemenu` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Hide document from menu',
  `alias_visible` int(2) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `parent` (`parent`),
  KEY `aliasidx` (`alias`),
  KEY `typeidx` (`type`),
  FULLTEXT KEY `content_ft_idx` (`pagetitle`,`description`,`content`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site document tree.' AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `modx_site_content`
--

INSERT INTO `modx_site_content` (`id`, `type`, `contentType`, `pagetitle`, `longtitle`, `description`, `alias`, `link_attributes`, `published`, `pub_date`, `unpub_date`, `parent`, `isfolder`, `introtext`, `content`, `richtext`, `template`, `menuindex`, `searchable`, `cacheable`, `createdby`, `createdon`, `editedby`, `editedon`, `deleted`, `deletedon`, `deletedby`, `publishedon`, `publishedby`, `menutitle`, `donthit`, `haskeywords`, `hasmetatags`, `privateweb`, `privatemgr`, `content_dispo`, `hidemenu`, `alias_visible`) VALUES
(1, 'document', 'text/html', 'Главная страница', 'Главная страница сайта INFO MODX Site', '', 'index', '', 1, 0, 0, 0, 0, '', '<p>Текст о нашем сайте...</p>', 1, 5, 0, 1, 1, 1, 1130304721, 1, 1459452947, 0, 0, 0, 1130304721, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(2, 'document', 'text/html', 'О нас', 'Подробная информация о нашей компании', 'Инфо о  сайте poly-verstka', 'about', '', 1, 0, 0, 0, 0, '', '<p>Ямогу здесь писать любую информацию для нашего сайта!!!</p>', 1, 6, 1, 1, 1, 1, 1459370030, 1, 1459689026, 0, 0, 0, 1459370030, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(3, 'document', 'text/html', 'Контактная информация', '', '', 'contact', '', 1, 0, 0, 0, 0, '', '<p>Текст...</p>', 1, 9, 2, 1, 1, 1, 1459370300, 1, 1459620302, 0, 0, 0, 1459370300, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(4, 'document', 'text/html', 'Услуги', 'Услуги нашей компании', '', 'service', '', 1, 0, 0, 0, 0, '', '<p>Текст...</p>', 1, 7, 3, 1, 1, 1, 1459370594, 1, 1459628235, 0, 0, 0, 1459370594, 1, '', 0, 0, 0, 0, 0, 0, 0, 1),
(5, 'document', 'text/html', 'Новости ', 'Новости нашего сайта', '', 'news', '', 1, 0, 0, 0, 0, '', '<p>Содержимое страницы...</p>', 1, 8, 4, 1, 1, 1, 1459370771, 1, 1459632591, 0, 0, 0, 1459370771, 1, '', 0, 0, 0, 0, 0, 0, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_content_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_content_metatags` (
  `content_id` int(11) NOT NULL DEFAULT '0',
  `metatag_id` int(11) NOT NULL DEFAULT '0',
  KEY `content_id` (`content_id`),
  KEY `metatag_id` (`metatag_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Reference table between meta tags and content';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_htmlsnippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_htmlsnippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Chunk',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site chunks.' AUTO_INCREMENT=19 ;

--
-- Дамп данных таблицы `modx_site_htmlsnippets`
--

INSERT INTO `modx_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`) VALUES
(1, 'eFeedbackForm', 'eFeedbackForm Шаблон формы обратной связи', 0, 3, 0, '<p><span style="color:#900;">[+validationmessage+]</span></p>\r\n\r\n<form  class="eform" method="post" action="[~[*id*]~]">\r\n\r\n<input type="hidden" name="formid" value="feedbackForm" />\r\n<input value="" name="special" class="special" type="text" eform="Спец:date:0"  style="display:none;" />\r\n<p>\r\n    <input type="text" name="name" id="name" class="grid_3" value=""  eform="Имя:string:1"/>\r\n    <label for="name">Ваше имя</label>\r\n</p>\r\n            \r\n<p>\r\n    <input type="text" name="email" id="email" class="grid_3" value="" eform="E-mail:email:1" />\r\n    <label for="email">Ваш E-mail</label>\r\n</p>\r\n            \r\n<p>\r\n    <input type="text" name="phone" id="subject" class="grid_3" value="" eform="Номер телефона:string:1"/>\r\n    <label for="subject">Номер телефона</label>\r\n</p>\r\n            \r\n<p>\r\n    <textarea name="comments" id="message" class="grid_6" cols="50" rows="10" eform="Текст сообщения:string:1"></textarea>\r\n</p>\r\n<p>Введите код с картинки: <br />\r\n    <input type="text" class="ver" name="vericode" /><img class="feed" src="[+verimageurl+]" alt="Введите код" />\r\n</p>            \r\n<p>\r\n    <input type="submit" name="submit" class="subeform grid_2" value="Отправить сообщение"/>\r\n </p>\r\n\r\n</form>\r\n\r\n\r\n \r\n\r\n', 0),
(2, 'eFeedbackReport', 'eFeedbackReport  шаблон отправки на почту', 0, 3, 0, '<p>Прислано человеком, с именем: [+name+] . Подробности ниже:</p>\r\n<table>\r\n<tr valign="top"><td>Имя:</td><td>[+name+]</td></tr>\r\n<tr valign="top"><td>E-mail:</td><td>[+email+]</td></tr>\r\n<tr valign="top"><td>Номер телефона:</td><td>[+phone+]</td></tr>\r\n<tr valign="top"><td>Текст сообщения:</td><td>[+comments+]</td></tr>\r\n</table>\r\n<p>Можно использовать ссылку для ответа: <a href="mailto:[+email+]?subject=RE:[+subject+]">[+email+]</a></p>\r\n\r\n', 0),
(3, 'feedback', 'форма обратной связи', 0, 3, 0, '[!eForm? &formid=`feedbackForm` &subject=`Сообщение с сайта` &tpl=`eFeedbackForm` &report=`eFeedbackReport` &gotoid=`[*id*]` &vericode=`1` !] \r\n\r\n', 0),
(4, 'footer', 'низ сайта', 0, 4, 0, '<!--  Mem : [^m^], MySQL: [^qt^], [^q^] request(s), PHP: [^p^], total: [^t^], document from [^s^]. -->', 0),
(5, 'header', 'шапка', 0, 4, 0, '<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" /> \r\n<title>[*titl*]</title>\r\n[*noIndex*]\r\n<meta name="keywords" content="[*keyw*]" />\r\n<meta name="description" content="[*desc*]" />\r\n<base href="[(site_url)]"/>\r\n', 0),
(6, 'mm_rules', 'Default ManagerManager rules.', 0, 5, 0, '// more example rules are in assets/plugins/managermanager/example_mm_rules.inc.php\r\n// example of how PHP is allowed - check that a TV named documentTags exists before creating rule\r\n\r\nmm_widget_showimagetvs(); // Показываем превью ТВ\r\n\r\nmm_renameField(''log'', ''Дочерние ресурсы отображаются в дереве'');\r\nmm_changeFieldHelp(''log'', ''Это поле используется для папок с большим числом вложенных страниц'');\r\n\r\nmm_createTab(''Для SEO'', ''seo'', '''', '''', '''', '''');\r\nmm_moveFieldsToTab(''titl,keyw,desc,seoOverride,noIndex,sitemap_changefreq,sitemap_priority,sitemap_exclude'', ''seo'', '''', '''');\r\nmm_widget_tags(''keyw'','',''); // Give blog tag editing capabilities to the ''documentTags (3)'' TV\r\n\r\n\r\n//mm_createTab(''Изображения'', ''photos'', '''', '''', '''', ''850'');\r\n//mm_moveFieldsToTab(''images,photos'', ''photos'', '''', '''');\r\n\r\n//mm_hideFields(''longtitle,description,link_attributes,menutitle,content'', '''', ''6,7'');\r\n\r\n//mm_hideTemplates(''0,5,8,9,11,12'', ''2,3'');\r\n\r\n//mm_hideTabs(''settings, access'', ''2'');\r\n\r\n//mm_widget_evogallery(1, Галерея, ''1,2,3'', 3);   // подключаем галерею \r\n//mm_galleryLink($fields, $roles, $templates, $moduleid);\r\n//mm_widget_evogallery($moduleid, $title, $roles, $templates);\r\n', 0),
(7, 'HEAD', 'тег HEAD часть основного шаблона сайта', 0, 4, 0, '<head>\r\n		<base href="[(site_url)]" />\r\n		<meta http-equiv="Content-Type" content="text/html; charset=[(modx_charset)]" />\r\n		<title>INFO MODX Site</title>\r\n		<meta name="keywords" content="" /> \r\n		<meta name="description" content="" /> \r\n		<link rel="shortcut icon" href="favicon.ico" type="image/x-icon"/>\r\n		<link href="/assets/templates/poly-verstka/css/style.css" rel="stylesheet" type="text/css" />\r\n		<link href="/assets/templates/poly-verstka/js/fancybox/jquery.fancybox-1.3.4.css" rel="stylesheet" type="text/css" />\r\n		<script type="text/javascript" src="/assets/templates/poly-verstka/js/jquery-1.7.min.js"></script>\r\n		<script src="/assets/templates/poly-verstka/js/fancybox/jquery.fancybox-1.3.4.js" type="text/javascript"></script>\r\n		<script src="/assets/templates/poly-verstka/js/jquery.nivo.slider.js" type="text/javascript"></script>\r\n		<script type="text/javascript" src="/assets/templates/poly-verstka/js/chosen/chosen.jquery.min.js"></script>\r\n		<script type="text/javascript" src="/assets/templates/poly-verstka/js/func.js"></script>\r\n	</head>', 0),
(8, 'MAIN FOOTER', 'Нижняя область нашего сайта', 0, 4, 0, '<!--подвал-->\r\n		<div class="footer">\r\n			<div class="f-top"></div>\r\n			<div class="in-footer">\r\n				<div class="bottom-menu">\r\n					<div class="f-col">\r\n						<ul class="first">\r\n							<li class="f-title"><span>Полы</span></li>\r\n							<li><a href="#">Паркетная доска</a></li>\r\n							<li><a href="#">Массивная доска</a></li>\r\n							<li><a href="#">Паркет</a></li>\r\n							<li><a href="#">Пробковые покрытия</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n						</ul>\r\n						<ul>\r\n							<li><a href="#">Строительная химия</a></li>\r\n							<li><a href="#">Комплектующие</a></li>\r\n						</ul>\r\n					</div>\r\n					<div class="f-col">\r\n						<ul class="first">\r\n							<li class="f-title"><span>Двери</span></li>\r\n							<li><a href="#">Паркетная доска</a></li>\r\n							<li><a href="#">Массивная доска</a></li>\r\n							<li><a href="#">Паркет</a></li>\r\n							<li><a href="#">Пробковые покрытия</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n						</ul>\r\n						<ul>\r\n							<li><a href="#">Строительная химия</a></li>\r\n							<li><a href="#">Комплектующие</a></li>\r\n						</ul>\r\n					</div>\r\n					<div class="f-col last">\r\n						<ul class="first">\r\n							<li class="f-title"><span>О нас</span></li>\r\n							<li><a href="#">Паркетная доска</a></li>\r\n							<li><a href="#">Массивная доска</a></li>\r\n							<li><a href="#">Паркет</a></li>\r\n							<li><a href="#">Пробковые покрытия</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n						</ul>\r\n						<ul>\r\n							<li><a href="#">Строительная химия</a></li>\r\n							<li><a href="#">Комплектующие</a></li>\r\n						</ul>\r\n						<div class="both"></div>\r\n					</div>\r\n				</div>\r\n				<div class="both"></div>\r\n			</div>\r\n			<div class="f-bottom">\r\n				<!--копирайт-->\r\n				<div class="copy">\r\n					<p>&copy; 2007-2012 poly-dveri.com</p>\r\n				</div>\r\n				<!--копирайт-->\r\n				<!--by Artjoker-->\r\n				<div class="art">\r\n					<a href="#" title="Разработка сайта">Создание сайта</a> - \r\n					<img src="/assets/templates/poly-verstka/img/art.png" alt="Разработка сайта" title="Разработка сайта">\r\n				</div>\r\n				<!--by Artjoker-->\r\n			</div>\r\n			<div class="both"></div>\r\n		</div>\r\n		<!--подвал-->', 0),
(9, 'MAIN HEADER', 'Шапка нашего сайта с логотипом и меню навигации', 0, 4, 0, '<!--форма задать вопрос-->\r\n				<div class="form-position">\r\n					<div class="form-up">\r\n						<form action="#">\r\n							<p class="h2">Задать вопрос</p>\r\n							<a href="#" class="close">Закрыть</a>\r\n							<div><label>Ваше имя<input type="text" /></label></div>\r\n							<div><label>Ваши контакты<input type="text" /></label></div>\r\n							<div>\r\n								Текст сообщения\r\n								<textarea name="" id="" cols="30" rows="10"></textarea>\r\n							</div>\r\n							<div><input class="form-btn" type="submit" value="Отправить" /></div>\r\n						</form>\r\n					</div>\r\n				</div>\r\n				<!--форма задать вопрос-->\r\n				<!--шапка-->\r\n				<div class="header">\r\n					<!--лого-->\r\n					<div class="logo">\r\n						<a href="#"><img src="/assets/templates/poly-verstka/img/logo.png" alt="" title="" /></a>\r\n					</div>\r\n					<!--лого-->\r\n					<div class="h-top">\r\n						<!--верхнее меню-->\r\n						{{MAIN MENU}}\r\n						<div class="h-t-menu">\r\n							<ul>\r\n								<li class="active"><span>О нас</span></li>\r\n								<li><a href="#">Оплата и доставка</a></li>\r\n								<li><a href="#">Новости статьи</a></li>\r\n								<li class="last"><a href="#">Сотрудничество</a></li>\r\n							</ul>\r\n							<a class="btn-gray link-up" href="#">Задать вопрос</a>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="both"></div>\r\n					<div class="h-b-menu">\r\n						<ul>\r\n							<li class="home"><span class="active"></span></li>\r\n							<li><a href="#">Каталог полов</a></li>\r\n							<li class="go-box-up"><a href="#">Каталог дверей</a>\r\n								<div class="box-up">\r\n									<div class="up-menu">\r\n										<ul class="list-menu catalog-menu2">\r\n											<li class="active"><a href="#"><span class="up-icon1"></span>ламинат</a></li>\r\n											<li><a href="#"><span class="up-icon2"></span>паркетная доска</a></li>\r\n											<li><a href="#"><span class="up-icon3"></span>массивная доска</a></li>\r\n											<li><a href="#"><span class="up-icon4"></span>пробковое покрытие</a></li>\r\n											<li><a href="#"><span class="up-icon5"></span>линолеум</a></li>\r\n											<li><a href="#"><span class="up-icon6"></span>художественный паркет</a></li>\r\n											<li><a href="#"><span class="up-icon7"></span>дворцовый паркет</a></li>\r\n											<li><a href="#"><span class="up-icon8"></span>эксклюзив</a></li>\r\n										</ul>\r\n										<div class="both"></div>\r\n										<div class="crumb-box">\r\n											<span class="B_crumbBox">\r\n												<span class="B_firstCrumb">\r\n													<a class="B_homeCrumb" href="/" >каталог полов</a>\r\n												</span>/\r\n												<a title="" href="#" class="B_crumb">haro</a> /\r\n												<span class="B_lastCrumb">\r\n													<span class="B_currentCrumb">бук прованс</span>\r\n												</span>\r\n											</span>\r\n										</div>\r\n									</div>\r\n								</div>\r\n							</li>\r\n							<li><a href="#">Сервис</a></li>\r\n							<li><a href="#">Акции</a></li>\r\n							<li><a href="#">Распродажа</a></li>\r\n							<li class="last"><a href="#">Контакты</a></li>\r\n						</ul>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="clear-box-up"></div>\r\n				</div>\r\n				<!--шапка-->', 0),
(11, 'MAIN MENU', 'Вынесенный снипет указывающий на наши страницы', 0, 4, 0, '<div class="h-txt">\r\n							[!Wayfinder? &startId=`0`!]\r\n							<div class="search"><input type="text" class="autoclear" value="Поиск" /><a href="#"></a></div>\r\n							<div class="both"></div>\r\n						</div>', 0),
(12, 'header content page', 'шапка шаблона странички О НАС', 0, 4, 0, '<!--форма задать вопрос-->\r\n				<div class="form-position">\r\n					<div class="form-up">\r\n						<form action="#">\r\n							<p class="h2">Задать вопрос</p>\r\n							<a href="#" class="close">Закрыть</a>\r\n							<div><label>Ваше имя<input type="text" /></label></div>\r\n							<div><label>Ваши контакты<input type="text" /></label></div>\r\n							<div>\r\n								Текст сообщения\r\n								<textarea name="" id="" cols="30" rows="10"></textarea>\r\n							</div>\r\n							<div><input class="form-btn" type="submit" value="Отправить" /></div>\r\n						</form>\r\n					</div>\r\n				</div>\r\n				<!--форма задать вопрос-->\r\n				<!--шапка-->\r\n				<div class="header">\r\n					<!--лого-->\r\n					<div class="logo">\r\n						<a href="#"><img src="/assets/templates/poly-verstka/img/logo.png" alt="" title="" /></a>\r\n					</div>\r\n					<!--лого-->\r\n					<div class="h-top">\r\n						<!--верхнее меню-->\r\n						<div class="h-txt">\r\n							<ul>\r\n								<li><span class="artsprt icon1"></span><span>Горячая линия 0 (800) 30 70 77</span></li>\r\n								<li><span class="artsprt icon2"></span><span>Киев: +38 (044) 425 43 63</span></li>\r\n								<li><span class="artsprt icon3"></span><span>Харьков: +38 (057) 714 20 48</span></li>\r\n							</ul>\r\n							<div class="search"><input type="text" class="autoclear" value="Поиск" /><a href="#"></a></div>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="h-t-menu">\r\n							<ul>\r\n								<li class="active"><span>О нас</span></li>\r\n								<li><a href="#">Оплата и доставка</a></li>\r\n								<li><a href="#">Новости статьи</a></li>\r\n								<li class="last"><a href="#">Сотрудничество</a></li>\r\n							</ul>\r\n							<a class="btn-gray link-up" href="#">Задать вопрос</a>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="both"></div>\r\n					<div class="h-b-menu">\r\n						<ul>\r\n							<li class="home"><span class="active"></span></li>\r\n							<li><a href="#">Каталог полов</a></li>\r\n							<li class="go-box-up"><a href="#">Каталог дверей</a>\r\n								<div class="box-up">\r\n									<div class="up-menu">\r\n										<ul class="list-menu catalog-menu2">\r\n											<li class="active"><a href="#"><span class="up-icon1"></span>ламинат</a></li>\r\n											<li><a href="#"><span class="up-icon2"></span>паркетная доска</a></li>\r\n											<li><a href="#"><span class="up-icon3"></span>массивная доска</a></li>\r\n											<li><a href="#"><span class="up-icon4"></span>пробковое покрытие</a></li>\r\n											<li><a href="#"><span class="up-icon5"></span>линолеум</a></li>\r\n											<li><a href="#"><span class="up-icon6"></span>художественный паркет</a></li>\r\n											<li><a href="#"><span class="up-icon7"></span>дворцовый паркет</a></li>\r\n											<li><a href="#"><span class="up-icon8"></span>эксклюзив</a></li>\r\n										</ul>\r\n										<div class="both"></div>\r\n										<div class="filtr-box">\r\n											<div class="select-nice s-nice-big">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="select-nice s-nice-big">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="select-nice s-nice-sm">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="select-nice s-nice-middle">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="select-nice s-nice-middle last-select">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="both"></div>\r\n											<div class="filtr-price">\r\n												Цена от <input type="text" /> до <input type="text" />\r\n											</div>\r\n											<div class="check-box-nice">\r\n												<label class="CheckBoxLabelClass">\r\n													<input type="checkbox" class="CheckBoxClass" name="input1">\r\n													Имеется в наличии на складе\r\n												</label>\r\n												<label class="CheckBoxLabelClass">\r\n													<input type="checkbox" class="CheckBoxClass" name="input2">\r\n													Акционный товар\r\n												</label>\r\n												<label class="CheckBoxLabelClass">\r\n													<input type="checkbox" class="CheckBoxClass" name="input3">\r\n													Распродажа\r\n												</label>\r\n												<label class="CheckBoxLabelClass">\r\n													<input type="checkbox" class="CheckBoxClass" name="input4">\r\n													Товар со скидкой\r\n												</label>\r\n											</div>\r\n											<input type="submit" class="btm-green" value="Найти" />\r\n											<div class="both"></div>\r\n										</div>\r\n										<div class="crumb-box">\r\n											<span class="B_crumbBox">\r\n												<span class="B_firstCrumb">\r\n													<a class="B_homeCrumb" href="/" >каталог полов</a>\r\n												</span>/\r\n												<a title="" href="#" class="B_crumb">haro</a> /\r\n												<span class="B_lastCrumb">\r\n													<span class="B_currentCrumb">бук прованс</span>\r\n												</span>\r\n											</span>\r\n										</div>\r\n									</div>\r\n								</div>\r\n							</li>\r\n							<li><a href="#">Сервис</a></li>\r\n							<li><a href="#">Акции</a></li>\r\n							<li><a href="#">Распродажа</a></li>\r\n							<li class="last"><a href="#">Контакты</a></li>\r\n						</ul>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="clear-box-up"></div>\r\n				</div>\r\n				<!--шапка-->', 0),
(10, 'MAIN CONTENT', 'Содержимое нашей главной страницы шаблона', 0, 4, 0, '<!--центральный блок-->\r\n				<div class="in-wrapper">\r\n					<div class="index-video">\r\n						<div class="video-top">\r\n							<div class="video-btm">\r\n								<div class="box-tabs4">\r\n									<ul class="video-nav">\r\n									   <li class="tab-caption first">первое видео</li>\r\n									   <li class="tab-caption">второе видео</li>\r\n									</ul>\r\n									<div class="both"></div>\r\n									\r\n									<div class="tab-content">\r\n										<img src="/assets/templates/poly-verstka/img/video-intro.png" alt="" />\r\n										<div class="both"></div>\r\n									 </div>\r\n									<div class="tab-content">\r\n										видео2\r\n										<div class="both"></div>\r\n									</div>\r\n								</div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n					<div class="bg-repeat">\r\n						<div class="bg-btm">\r\n							<div class="index-top-box">\r\n								<div class="box-tabs box-tabs1">\r\n									<ul>\r\n									   <li class="tab-caption first">полы</li>\r\n									   <li class="tab-caption">новинки</li>\r\n									</ul>\r\n									<div class="both"></div>\r\n									<div class="tab-content">\r\n										<ul>\r\n											<li><a href="#">Ламинат</a></li>\r\n											<li><a href="#">Паркетная доска</a></li>\r\n											<li><a href="#">Массивная доска</a></li>\r\n											<li><a href="#">Паркет</a></li>\r\n											<li><a href="#">Пробковые покрытия</a></li>\r\n											<li><a href="#">Линолеум</a></li>\r\n										</ul>\r\n										<ul>\r\n											<li><a href="#">Строительная химия</a></li>\r\n											<li><a href="#">Комплектующие</a></li>\r\n										</ul>\r\n										<div class="both"></div>\r\n									 </div>\r\n									<div class="tab-content">\r\n										<ul>\r\n											<li><a href="#">Дверь1</a></li>\r\n											<li><a href="#">Дверь1</a></li>\r\n											<li><a href="#">Дверь1</a></li>\r\n										</ul>\r\n										<div class="both"></div>\r\n									</div>\r\n								</div>\r\n								<div class="box-tabs box-tabs2">\r\n									<ul>\r\n									   <li class="tab-caption first">полы</li>\r\n									   <li class="tab-caption">новинки</li>\r\n									</ul>\r\n									<div class="both"></div>\r\n									<div class="tab-content">\r\n										<ul>\r\n											<li><a href="#">Двери межкомнатные</a></li>\r\n											<li><a href="#">Двери входные</a></li>\r\n											<li><a href="#">Двери шпонированные</a></li>\r\n											<li><a href="#">Двери деревянные</a></li>\r\n											<li><a href="#">Двери раздвижные</a></li>\r\n											<li><a href="#">Производство дверей</a></li>\r\n										</ul>\r\n										<ul>\r\n											<li><a href="#">Двери элитные</a></li>\r\n											<li><a href="#">Двери на заказ</a></li>\r\n											<li><a href="#">Эксклюзивные двери</a></li>\r\n											<li><a href="#">Двери из массива</a></li>\r\n											<li><a href="#">Двери раздвижные</a></li>\r\n											<li><a href="#">Двери с ковкой</a></li>\r\n										</ul>\r\n										<ul>\r\n											<li><a href="#">Фурнитура</a></li>\r\n										</ul>\r\n										<div class="both"></div>\r\n									 </div>\r\n									<div class="tab-content">\r\n										<ul>\r\n											<li><a href="#">Дверь1</a></li>\r\n											<li><a href="#">Дверь1</a></li>\r\n											<li><a href="#">Дверь1</a></li>\r\n										</ul>\r\n										<div class="both"></div>\r\n									</div>\r\n								</div>\r\n								<div class="both"></div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n					<div class="both"></div>\r\n					<div class="slider">\r\n						<span class="slider-icon"></span>\r\n						<div class="in-slider">\r\n							<img src="/assets/templates/poly-verstka/img/tmp/test6.jpg" alt="" />\r\n							<img src="/assets/templates/poly-verstka/img/tmp/slide1.jpg" alt="" />\r\n							<img src="/assets/templates/poly-verstka/img/tmp/slide2.jpg" alt="" />\r\n						</div>\r\n					</div>\r\n					<div class="new-line">\r\n						<div class="green-line">\r\n							<div class="in-green-line"><span>Новинки</span></div>\r\n						</div>\r\n						<ul>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n								<span class="price">1200 грн</span>\r\n								<img src="/assets/templates/poly-verstka/img/tmp/test1.png" alt="" /></a>\r\n								<a href="#">Название двери</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n								<span class="price">1200 грн</span>\r\n								<img src="/assets/templates/poly-verstka/img/tmp/test1.png" alt="" /></a>\r\n								<a href="#">Название двери</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n								<span class="price">1200 грн</span>\r\n								<img src="/assets/templates/poly-verstka/img/tmp/test1.png" alt="" /></a>\r\n								<a href="#">Название двери</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n								<span class="price">1200 грн</span>\r\n								<img src="/assets/templates/poly-verstka/img/tmp/test1.png" alt="" /></a>\r\n								<a href="#">Название двери</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n								<span class="price">1200 грн</span>\r\n								<img src="/assets/templates/poly-verstka/img/tmp/test1.png" alt="" /></a>\r\n								<a href="#">Название двери</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n								<span class="price">1200 грн</span>\r\n								<span class="new"></span><img src="/assets/templates/poly-verstka/img/tmp/test1.png" alt="" /></a>\r\n								<a href="#">Название двери</a>\r\n							</li>\r\n						</ul>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="both"></div>\r\n					<div class="contacts-line">\r\n						<div class="cont-box">\r\n							<div class="green-line">\r\n								<b>Киев</b>\r\n							</div>\r\n							<div class="cont-box-txt">\r\n								<ul>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n								</ul>\r\n							</div>\r\n						</div>\r\n						<div class="cont-box last">\r\n							<div class="green-line">\r\n								<b>Харьков</b>\r\n							</div>\r\n							<ul>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n							</ul>\r\n							<div class="both"></div>\r\n							<a href="#" class="go-all">Все контакты ...</a>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="seo-txt">\r\n						<p>Давно выяснено, что при оценке дизайна и композиции читаемый текст мешает сосредоточиться. Lorem Ipsum используют потому, что тот обеспечивает более или менее стандартное заполнение шаблона, а также реальное распределение букв и пробелов в абзацах, которое не получается при простой дубликации "Здесь ваш текст.. Здесь ваш текст.. Здесь ваш текст.." Многие программы электронной вёрстки и редакторы HTML используют Lorem Ipsum в качестве текста по умолчанию, так что поиск по ключевым словам "lorem ipsum" сразу показывает, как много веб-страниц всё ещё дожидаются своего настоящего рождения. За прошедшие годы текст Lorem Ipsum получил много версий. Некоторые версии появились по ошибке, некоторые - намеренно (например, юмористические варианты).</p>\r\n					</div>\r\n					<div class="logo-tabs">\r\n						<div class="box-tabs3">\r\n							<ul>\r\n							   <li class="tab-caption first"><span>Производители дверей и фурнитуры</span></li>\r\n							   <li class="tab-caption"><span>Производители напольных покрытий</span></li>\r\n							   <li class="tab-caption"><span>Производители химии и фурнитуры</span></li>\r\n							</ul>\r\n							<div class="both"></div>\r\n							<div class="tab-content">\r\n								<ul>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n								</ul>\r\n								<div class="both"></div>\r\n							 </div>\r\n							<div class="tab-content">\r\n								<ul>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n								</ul>\r\n								<div class="both"></div>\r\n							</div>\r\n							<div class="tab-content">\r\n								<ul>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n									<li><a href="#"><img src="/assets/templates/poly-verstka/img/tmp/logo1.png" alt="" /></a></li>\r\n								</ul>\r\n								<div class="both"></div>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n				<!--центральный блок-->', 0),
(13, 'footer content page', 'контент с навигационно меню нашей странички О НАС', 0, 4, 0, '<!--центральный блок-->\r\n				<div class="in-wrapper">\r\n					<div class="content-box">\r\n						<h1>[*longtitle*]</h1>\r\n						[*content*]\r\n					</div>\r\n				</div>\r\n				<!--центральный блок-->', 0),
(14, 'header news', 'шапка шаблона НОВОСТИ для странички УСЛУГИ', 0, 4, 0, '<!--форма задать вопрос-->\r\n				<div class="form-position">\r\n					<div class="form-up">\r\n						<form action="#">\r\n							<p class="h2">Задать вопрос</p>\r\n							<a href="#" class="close">Закрыть</a>\r\n							<div><label>Ваше имя<input type="text" /></label></div>\r\n							<div><label>Ваши контакты<input type="text" /></label></div>\r\n							<div>\r\n								Текст сообщения\r\n								<textarea name="" id="" cols="30" rows="10"></textarea>\r\n							</div>\r\n							<div><input class="form-btn" type="submit" value="Отправить" /></div>\r\n						</form>\r\n					</div>\r\n				</div>\r\n				<!--форма задать вопрос-->\r\n				<!--шапка-->\r\n				<div class="header">\r\n					<!--лого-->\r\n					<div class="logo">\r\n						<a href="#"><img src="/assets/templates/poly-verstka/img/logo.png" alt="" title="" /></a>\r\n					</div>\r\n					<!--лого-->\r\n					<div class="h-top">\r\n						<!--верхнее меню-->\r\n						<div class="h-txt">\r\n							<ul>\r\n								<li><span class="artsprt icon1"></span><span>Горячая линия 0 (800) 30 70 77</span></li>\r\n								<li><span class="artsprt icon2"></span><span>Киев: +38 (044) 425 43 63</span></li>\r\n								<li><span class="artsprt icon3"></span><span>Харьков: +38 (057) 714 20 48</span></li>\r\n							</ul>\r\n							<div class="search"><input type="text" class="autoclear" value="Поиск" /><a href="#"></a></div>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="h-t-menu">\r\n							<ul>\r\n								<li class="active"><span>О нас</span></li>\r\n								<li><a href="#">Оплата и доставка</a></li>\r\n								<li><a href="#">Новости статьи</a></li>\r\n								<li class="last"><a href="#">Сотрудничество</a></li>\r\n							</ul>\r\n							<a class="btn-gray link-up" href="#">Задать вопрос</a>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="both"></div>\r\n					<div class="h-b-menu">\r\n						<ul>\r\n							<li class="home"><span class="active"></span></li>\r\n							<li><a href="#">Каталог полов</a></li>\r\n							<li class="go-box-up"><a href="#">Каталог дверей</a>\r\n								<div class="box-up">\r\n									<div class="up-menu">\r\n										<ul class="list-menu catalog-menu2">\r\n											<li class="active"><a href="#"><span class="up-icon1"></span>ламинат</a></li>\r\n											<li><a href="#"><span class="up-icon2"></span>паркетная доска</a></li>\r\n											<li><a href="#"><span class="up-icon3"></span>массивная доска</a></li>\r\n											<li><a href="#"><span class="up-icon4"></span>пробковое покрытие</a></li>\r\n											<li><a href="#"><span class="up-icon5"></span>линолеум</a></li>\r\n											<li><a href="#"><span class="up-icon6"></span>художественный паркет</a></li>\r\n											<li><a href="#"><span class="up-icon7"></span>дворцовый паркет</a></li>\r\n											<li><a href="#"><span class="up-icon8"></span>эксклюзив</a></li>\r\n										</ul>\r\n										<div class="both"></div>\r\n										<div class="filtr-box">\r\n											<div class="select-nice s-nice-big">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="select-nice s-nice-big">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="select-nice s-nice-sm">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="select-nice s-nice-middle">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="select-nice s-nice-middle last-select">\r\n												<select>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n													<option>1</option>\r\n												</select>\r\n											</div>\r\n											<div class="both"></div>\r\n											<div class="filtr-price">\r\n												Цена от <input type="text" /> до <input type="text" />\r\n											</div>\r\n											<div class="check-box-nice">\r\n												<label class="CheckBoxLabelClass">\r\n													<input type="checkbox" class="CheckBoxClass" name="input1">\r\n													Имеется в наличии на складе\r\n												</label>\r\n												<label class="CheckBoxLabelClass">\r\n													<input type="checkbox" class="CheckBoxClass" name="input2">\r\n													Акционный товар\r\n												</label>\r\n												<label class="CheckBoxLabelClass">\r\n													<input type="checkbox" class="CheckBoxClass" name="input3">\r\n													Распродажа\r\n												</label>\r\n												<label class="CheckBoxLabelClass">\r\n													<input type="checkbox" class="CheckBoxClass" name="input4">\r\n													Товар со скидкой\r\n												</label>\r\n											</div>\r\n											<input type="submit" class="btm-green" value="Найти" />\r\n											<div class="both"></div>\r\n										</div>\r\n										<div class="crumb-box">\r\n											<span class="B_crumbBox">\r\n												<span class="B_firstCrumb">\r\n													<a class="B_homeCrumb" href="/" >каталог полов</a>\r\n												</span>/\r\n												<a title="" href="#" class="B_crumb">haro</a> /\r\n												<span class="B_lastCrumb">\r\n													<span class="B_currentCrumb">бук прованс</span>\r\n												</span>\r\n											</span>\r\n										</div>\r\n									</div>\r\n								</div>\r\n							</li>\r\n							<li><a href="#">Сервис</a></li>\r\n							<li><a href="#">Акции</a></li>\r\n							<li><a href="#">Распродажа</a></li>\r\n							<li class="last"><a href="#">Контакты</a></li>\r\n						</ul>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="clear-box-up"></div>\r\n				</div>\r\n				<!--шапка-->', 0),
(15, 'content news', 'контент шаблона НОВОСТИ  для странички УСЛУГИ', 0, 4, 0, '<!--центральный блок-->\r\n				<div class="in-wrapper">\r\n					<div class="catalog">\r\n						<div class="banner">\r\n							<a href="#">\r\n								<img src="/assets/templates/poly-verstka/img/tmp/banner.jpg" alt="" />\r\n							</a>\r\n						</div>\r\n						<div class="catalog-txt">\r\n							<img src="/assets/templates/poly-verstka/img/tmp/logo1.jpg" alt="" /><p>Описание фабрики описание фабрики фабрики описание фабрики фабрики описание фабрикифабрики описание фабрикифабрики описание фабрикифабрики описание фабрикифабрики описание фабрикифабрики описание фабрикифабрики описание фабрикифабрики описание фабрики</p>\r\n							<div class="both"></div>\r\n							<div class="green-line"></div>\r\n						</div>\r\n						<ul>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n									<span class="price">1200 грн</span>\r\n									<span class="sale"></span>\r\n									<img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" />\r\n								</a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n									<img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" />\r\n									<span class="new"></span>\r\n								</a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img">\r\n									<img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" />\r\n									<span class="old-price">1200 грн</span>\r\n									<span class="price">1200 грн</span>\r\n									<span class="sale2"></span>\r\n								</a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n							<li>\r\n								<a href="#" class="c-img"><img src="/assets/templates/poly-verstka/img/tmp/test1.jpg" alt="" /></a>\r\n								<a href="#">Название ламината</a>\r\n							</li>\r\n						</ul>\r\n					</div>\r\n					<div class="page">\r\n						<a class="prev" href="#"><</a>\r\n						<a href="#">1</a>\r\n						<span class="active">2</span>\r\n						<a href="#">3</a>\r\n						<a href="#">4</a>\r\n						<a href="#">5</a>\r\n						<a href="#">6</a>\r\n						<a href="#">Следующая</a>\r\n						<a class="next" href="#">></a>\r\n					</div>\r\n				</div>\r\n				<!--центральный блок-->', 0);
INSERT INTO `modx_site_htmlsnippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`) VALUES
(16, 'header one news', 'Шапка шаблона Новость для странички НОВОСТИ', 0, 4, 0, '<!--форма задать вопрос-->\r\n				<div class="form-position">\r\n					<div class="form-up">\r\n						<form action="#">\r\n							<p class="h2">Задать вопрос</p>\r\n							<a href="#" class="close">Закрыть</a>\r\n							<div><label>Ваше имя<input type="text" /></label></div>\r\n							<div><label>Ваши контакты<input type="text" /></label></div>\r\n							<div>\r\n								Текст сообщения\r\n								<textarea name="" id="" cols="30" rows="10"></textarea>\r\n							</div>\r\n							<div><input class="form-btn" type="submit" value="Отправить" /></div>\r\n						</form>\r\n					</div>\r\n				</div>\r\n				<!--форма задать вопрос-->\r\n				<!--шапка-->\r\n				<div class="header">\r\n					<!--лого-->\r\n					<div class="logo">\r\n						<a href="#"><img src="/assets/templates/poly-verstka/img/logo.png" alt="" title="" /></a>\r\n					</div>\r\n					<!--лого-->\r\n					<div class="h-top">\r\n						<!--верхнее меню-->\r\n						<div class="h-txt">\r\n							<ul>\r\n								<li><span class="artsprt icon1"></span><span>Горячая линия 0 (800) 30 70 77</span></li>\r\n								<li><span class="artsprt icon2"></span><span>Киев: +38 (044) 425 43 63</span></li>\r\n								<li><span class="artsprt icon3"></span><span>Харьков: +38 (057) 714 20 48</span></li>\r\n							</ul>\r\n							<div class="search"><input type="text" class="autoclear" value="Поиск" /><a href="#"></a></div>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="h-t-menu">\r\n							<ul>\r\n								<li class="active"><span>О нас</span></li>\r\n								<li><a href="#">Оплата и доставка</a></li>\r\n								<li><a href="#">Новости статьи</a></li>\r\n								<li class="last"><a href="#">Сотрудничество</a></li>\r\n							</ul>\r\n							<a class="btn-gray link-up" href="#">Задать вопрос</a>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="both"></div>\r\n					<div class="h-b-menu">\r\n						<ul>\r\n							<li class="home"><span class="active"></span></li>\r\n							<li><a href="#">Каталог полов</a></li>\r\n							<li class="go-box-up"><a href="#">Каталог дверей</a>\r\n								<div class="box-up">\r\n									<div class="up-menu">\r\n										<ul class="list-menu catalog-menu2">\r\n											<li class="active"><a href="#"><span class="up-icon1"></span>ламинат</a></li>\r\n											<li><a href="#"><span class="up-icon2"></span>паркетная доска</a></li>\r\n											<li><a href="#"><span class="up-icon3"></span>массивная доска</a></li>\r\n											<li><a href="#"><span class="up-icon4"></span>пробковое покрытие</a></li>\r\n											<li><a href="#"><span class="up-icon5"></span>линолеум</a></li>\r\n											<li><a href="#"><span class="up-icon6"></span>художественный паркет</a></li>\r\n											<li><a href="#"><span class="up-icon7"></span>дворцовый паркет</a></li>\r\n											<li><a href="#"><span class="up-icon8"></span>эксклюзив</a></li>\r\n										</ul>\r\n										<div class="both"></div>\r\n										<div class="crumb-box">\r\n											<span class="B_crumbBox">\r\n												<span class="B_firstCrumb">\r\n													<a class="B_homeCrumb" href="/" >каталог полов</a>\r\n												</span>/\r\n												<a title="" href="#" class="B_crumb">haro</a> /\r\n												<span class="B_lastCrumb">\r\n													<span class="B_currentCrumb">бук прованс</span>\r\n												</span>\r\n											</span>\r\n										</div>\r\n									</div>\r\n								</div>\r\n							</li>\r\n							<li><a href="#">Сервис</a></li>\r\n							<li><a href="#">Акции</a></li>\r\n							<li><a href="#">Распродажа</a></li>\r\n							<li class="last"><a href="#">Контакты</a></li>\r\n						</ul>\r\n						<div class="both"></div>\r\n					</div>\r\n					<div class="clear-box-up"></div>\r\n				</div>\r\n				<!--шапка-->', 0),
(17, 'content one news', 'контент навигации шаблона НОВОСТЬ для странички НОВОСТИ', 0, 4, 0, '<!--центральный блок-->\r\n				<div class="in-wrapper">\r\n					<div class="in-catalog">\r\n						<div class="inc-top">\r\n							<div class="inc-l-col">\r\n								<div class="sm-shadow">\r\n									<div class="inc-big-img">\r\n										<img src="/assets/templates/poly-verstka/img/tmp/test2.jpg" alt="" />\r\n										<div class="inc-img-icons">\r\n											<ul>\r\n												<li>\r\n													<span class="icons1" title="Трехполосный верхний рабочий стол состоит из трех склеенных планок"></span>\r\n												</li>\r\n												<li>\r\n													<span class="icons2" title="Трехполосный верхний рабочий стол состоит из трех склеенных планок2"></span>\r\n												</li>\r\n												<li>\r\n													<span class="icons3" title="Трехполосный верхний рабочий стол состоит из трех склеенных планок2"></span>\r\n												</li>\r\n												<li class="icons4">\r\n													<span class="icons4" title="Трехполосный верхний рабочий стол состоит из трех склеенных планок2"></span>\r\n												</li>\r\n											</ul>\r\n											<div class="both"></div>\r\n										</div>\r\n									</div>\r\n								</div>\r\n								<div class="inc-buttn">\r\n									<div class="sm-shadow">\r\n										<a href="#">Задать вопрос</a>\r\n									</div>\r\n									<div class="sm-shadow">\r\n										<a href="#">Позвонить</a>\r\n									</div>\r\n								</div>\r\n								<div class="inc-sertif">\r\n									<p class="h2">Сертификаты</p>\r\n									<ul>\r\n										<li><a rel="gallery" href="/assets/templates/poly-verstka/img/tmp/test3.jpg"><img src="img/tmp/test3.jpg" alt="" /></a></li>\r\n										<li><a rel="gallery" href="/assets/templates/poly-verstka/img/tmp/test3.jpg"><img src="img/tmp/test3.jpg" alt="" /></a></li>\r\n										<li><a rel="gallery" href="/assets/templates/poly-verstka/img/tmp/test3.jpg"><img src="img/tmp/test3.jpg" alt="" /></a></li>\r\n										<li><a rel="gallery" href="/assets/templates/poly-verstka/img/tmp/test3.jpg"><img src="img/tmp/test3.jpg" alt="" /></a></li>\r\n										<li><a rel="gallery" href="/assets/templates/poly-verstka/img/tmp/test3.jpg"><img src="img/tmp/test3.jpg" alt="" /></a></li>\r\n										<li><a rel="gallery" href="/assets/templates/poly-verstka/img/tmp/test3.jpg"><img src="img/tmp/test3.jpg" alt="" /></a></li>\r\n									</ul>\r\n								</div>\r\n							</div>\r\n							<div class="inc-r-col">\r\n								<div class="inc-big-title">\r\n									<div class="green-line"></div>\r\n									<div class="big-title">\r\n										<img class="left" src="/assets/templates/poly-verstka/img/tmp/logo2.png" alt="" />\r\n										<div class="left">\r\n											<h1>Паркетная доска Befag</h1>\r\n											<h2>Бук пропаренный рустик</h2>\r\n										</div>\r\n										<div class="both"></div>\r\n									</div>\r\n									<div class="green-line"></div>\r\n								</div>\r\n								<div class="about-product">\r\n									<div class="product-table">\r\n										<table>\r\n											<tr><td>Коллекция</td><td>Family</td></tr>\r\n											<tr><td>Дизайн</td><td>3-полосный дизайн</td></tr>\r\n											<tr><td>Порода дерева</td><td>бук пропаренный</td></tr>\r\n											<tr><td>Секция</td><td>рустик</td></tr>\r\n											<tr><td>Покрытие</td><td>лак</td></tr>\r\n											<tr><td>Вид обработки</td><td>без обработки</td></tr>\r\n											<tr><td>Размер доски, мм</td><td>4</td></tr>\r\n											<tr><td>Толщина верхнего слоя, мм</td><td>4</td></tr>\r\n											<tr><td>Соединение</td><td>замковое (PanLoc)</td></tr>\r\n											<tr><td>Количество в пачке, м.кв</td><td>2,534</td></tr>\r\n											<tr><td>Гарантия производителя</td><td>25 лет</td></tr>\r\n											<tr><td>Страна-производитель</td><td>Венгрия</td></tr>\r\n										</table>\r\n									</div>\r\n									<div class="shadow">\r\n										<div class="bg-gray">\r\n											<div class="green-box price-box">\r\n												<span class="new-price">2820.20</span>\r\n												<span class="size2">цена</span>\r\n												<span class="size3">грн/м.кв.</span>\r\n											</div>\r\n										</div>\r\n									</div>\r\n									<div class="sm-shadow">\r\n										<div class="bg-gray">\r\n											<div class="in-bg-gray">\r\n												<div class="title">Сопутствующие товары</div>\r\n												<div class="related">\r\n													<ul>\r\n														<li>\r\n															<a href="#"><span class="r1"></span></a>\r\n															<a href="#">Уход</a>\r\n														</li>\r\n														<li>\r\n															<a href="#"><span class="r2"></span></a>\r\n															<a href="#">Двери</a>\r\n														</li>\r\n														<li>\r\n															<a href="#"><span class="r3"></span></a>\r\n															<a href="#">Плинтус</a>\r\n														</li>\r\n														<li>\r\n															<a href="#"><span class="r4"></span></a>\r\n															<a href="#">Под заказ</a>\r\n														</li>\r\n													</ul>\r\n													<div class="both"></div>\r\n												</div>\r\n											</div>\r\n										</div>\r\n									</div>\r\n								</div>\r\n								\r\n								<div class="content">\r\n									<div class="green-line"></div>\r\n									<p>Паркетная доска Befag Паркетная доска Befag Паркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доска Паркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаПаркетная доска BefagПаркетная доска Befag Паркетная доска Befag Паркетная доскаBefag Паркетная доска BefagПаркетная доска BefagПаркетная доска BefagПаркетная доска Befag</p>\r\n								</div>\r\n							</div>\r\n							<div class="both"></div>\r\n						</div><!--inc-top-->\r\n						<div class="both"></div>\r\n						<div class="product-line">\r\n							<div class="pl-wrap-l">\r\n								<p class="h2">Сопутствующие товары</p>\r\n								<div class="pl-box">\r\n									<div class="in-pl-box">\r\n										<ul>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n											<li>\r\n												<a href="#">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test4.jpg" alt="" />\r\n												</a>\r\n												<a href="#">товар НАЗВАНИЕ</a>\r\n											</li>\r\n										</ul>\r\n										<div class="both"></div>\r\n									</div>\r\n								</div>\r\n							</div>\r\n							<div class="pl-wrap-r">\r\n								<p class="h2">Похожие товары</p>\r\n								<div class="pl-box">\r\n									<div class="in-pl-box">\r\n										<ul>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#"  class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n											<li>\r\n												<a href="#" class="img-shadow">\r\n													<img src="/assets/templates/poly-verstka/img/tmp/test5.jpg" alt="" />\r\n												</a>\r\n												<a href="#">Дверь1</a>\r\n											</li>\r\n										</ul>\r\n										<div class="both"></div>\r\n									</div>\r\n								</div>\r\n							</div>\r\n							<div class="both"></div>\r\n						</div>\r\n						<div class="video-box banner-shadow">\r\n							<img src="/assets/templates/poly-verstka/img/tmp/img6.jpg" alt="" />\r\n							<span class="banner-title">Видео с завода в Венгрии</span>\r\n						</div>\r\n						<div class="banner-box banner-shadow">\r\n							<img src="/assets/templates/poly-verstka/img/tmp/img7.jpg" alt="" />\r\n							<span class="banner-title">Паркетная доска Befag</span>\r\n						</div>\r\n						<div class="about-maker">\r\n							<p class="h2">Узнать о производителе</p>\r\n							<ul>\r\n								<li><a href="#">Название, ссылка на статью</a></li>\r\n								<li><a href="#">Название, ссылка на статью</a></li>\r\n								<li><a href="#">Название, ссылка на статью</a></li>\r\n								<li><a href="#">Название, ссылка на статью</a></li>\r\n								<li><a href="#">Название, ссылка на статью</a></li>\r\n								<li><a href="#">Название, ссылка на статью</a></li>\r\n								<li><a href="#">Название, ссылка на статью</a></li>\r\n							</ul>\r\n						</div>\r\n						<div class="both"></div>\r\n					</div><!--incatalog-->\r\n				</div>\r\n				<!--центральный блок-->', 0),
(18, 'footer one news', 'нижняя часть шаблона НОВОСТЬ  для странички НОВОСТИ', 0, 4, 0, '<!--подвал-->\r\n		<div class="footer">\r\n			<div class="f-top"></div>\r\n			<div class="in-footer">\r\n				<div class="bottom-menu">\r\n					<div class="f-col">\r\n						<ul class="first">\r\n							<li class="f-title"><span>Полы</span></li>\r\n							<li><a href="#">Паркетная доска</a></li>\r\n							<li><a href="#">Массивная доска</a></li>\r\n							<li><a href="#">Паркет</a></li>\r\n							<li><a href="#">Пробковые покрытия</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n						</ul>\r\n						<ul>\r\n							<li><a href="#">Строительная химия</a></li>\r\n							<li><a href="#">Комплектующие</a></li>\r\n						</ul>\r\n					</div>\r\n					<div class="f-col">\r\n						<ul class="first">\r\n							<li class="f-title"><span>Двери</span></li>\r\n							<li><a href="#">Паркетная доска</a></li>\r\n							<li><a href="#">Массивная доска</a></li>\r\n							<li><a href="#">Паркет</a></li>\r\n							<li><a href="#">Пробковые покрытия</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n						</ul>\r\n						<ul>\r\n							<li><a href="#">Строительная химия</a></li>\r\n							<li><a href="#">Комплектующие</a></li>\r\n						</ul>\r\n					</div>\r\n					<div class="f-col last">\r\n						<ul class="first">\r\n							<li class="f-title"><span>О нас</span></li>\r\n							<li><a href="#">Паркетная доска</a></li>\r\n							<li><a href="#">Массивная доска</a></li>\r\n							<li><a href="#">Паркет</a></li>\r\n							<li><a href="#">Пробковые покрытия</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n							<li><a href="#">Линолеум</a></li>\r\n						</ul>\r\n						<ul>\r\n							<li><a href="#">Строительная химия</a></li>\r\n							<li><a href="#">Комплектующие</a></li>\r\n						</ul>\r\n						<div class="both"></div>\r\n					</div>\r\n				</div>\r\n				<div class="both"></div>\r\n			</div>\r\n			<div class="f-bottom">\r\n				<!--копирайт-->\r\n				<div class="copy">\r\n					<p>&copy; 2007-2012 poly-dveri.com</p>\r\n				</div>\r\n				<!--копирайт-->\r\n				<!--by Artjoker-->\r\n				<div class="art">\r\n					<a href="#" title="Разработка сайта">Создание сайта</a> - \r\n					<img src="/assets/templates/poly-verstka/img/art.png" alt="Разработка сайта" title="Разработка сайта">\r\n				</div>\r\n				<!--by Artjoker-->\r\n			</div>\r\n			<div class="both"></div>\r\n		</div>\r\n		<!--подвал-->', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_keywords`
--

CREATE TABLE IF NOT EXISTS `modx_site_keywords` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(40) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `keyword` (`keyword`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site keyword list' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_metatags`
--

CREATE TABLE IF NOT EXISTS `modx_site_metatags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `tag` varchar(50) NOT NULL DEFAULT '' COMMENT 'tag name',
  `tagvalue` varchar(255) NOT NULL DEFAULT '',
  `http_equiv` tinyint(4) NOT NULL DEFAULT '0' COMMENT '1 - use http_equiv tag style, 0 - use name',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site meta tags' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_modules`
--

CREATE TABLE IF NOT EXISTS `modx_site_modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '0',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `wrap` tinyint(4) NOT NULL DEFAULT '0',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to module icon',
  `enable_resource` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'enables the resource file feature',
  `resourcefile` varchar(255) NOT NULL DEFAULT '' COMMENT 'a physical link to a resource file',
  `createdon` int(11) NOT NULL DEFAULT '0',
  `editedon` int(11) NOT NULL DEFAULT '0',
  `guid` varchar(32) NOT NULL DEFAULT '' COMMENT 'globally unique identifier',
  `enable_sharedparams` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text,
  `modulecode` mediumtext COMMENT 'module boot up code',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Modules' AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `modx_site_modules`
--

INSERT INTO `modx_site_modules` (`id`, `name`, `description`, `editor_type`, `disabled`, `category`, `wrap`, `locked`, `icon`, `enable_resource`, `resourcefile`, `createdon`, `editedon`, `guid`, `enable_sharedparams`, `properties`, `modulecode`) VALUES
(1, 'Doc Manager', '<strong>1.1</strong> Quickly perform bulk updates to the Documents in your site including templates, publishing details, and permissions', 0, 0, 6, 0, 0, '', 0, '', 0, 0, 'docman435243542tf542t5t', 1, '', 'include_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/docmanager.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_frontend.class.php'');\ninclude_once(MODX_BASE_PATH.''assets/modules/docmanager/classes/dm_backend.class.php'');\n\n$dm = new DocManager($modx);\n$dmf = new DocManagerFrontend($dm, $modx);\n$dmb = new DocManagerBackend($dm, $modx);\n\n$dm->ph = $dm->getLang();\n$dm->ph[''theme''] = $dm->getTheme();\n$dm->ph[''ajax.endpoint''] = MODX_SITE_URL.''assets/modules/docmanager/tv.ajax.php'';\n$dm->ph[''datepicker.offset''] = $modx->config[''datepicker_offset''];\n$dm->ph[''datetime.format''] = $modx->config[''datetime_format''];\n\nif (isset($_POST[''tabAction''])) {\n    $dmb->handlePostback();\n} else {\n    $dmf->getViews();\n    echo $dm->parseTemplate(''main.tpl'', $dm->ph);\n}'),
(2, 'Extras', '<strong>0.1.2</strong> first repository for MODX EVO', 0, 0, 6, 0, 0, '', 0, '', 0, 0, 'store435243542tf542t5t', 1, '', '//AUTHORS: Bumkaka & Dmi3yy \r\ninclude_once(''../assets/modules/store/core.php'');');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_module_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_access` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `usergroup` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module users group access permission' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_module_depobj`
--

CREATE TABLE IF NOT EXISTS `modx_site_module_depobj` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module` int(11) NOT NULL DEFAULT '0',
  `resource` int(11) NOT NULL DEFAULT '0',
  `type` int(2) NOT NULL DEFAULT '0' COMMENT '10-chunks, 20-docs, 30-plugins, 40-snips, 50-tpls, 60-tvs',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Module Dependencies' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugins`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugins` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Plugin',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `plugincode` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Disables the plugin',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site plugins.' AUTO_INCREMENT=8 ;

--
-- Дамп данных таблицы `modx_site_plugins`
--

INSERT INTO `modx_site_plugins` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `plugincode`, `locked`, `properties`, `disabled`, `moduleguid`) VALUES
(1, 'CodeMirror', '<strong>1.3</strong> JavaScript library that can be used to create a relatively pleasant editor interface based on CodeMirror 5.6', 0, 6, 0, '$_CM_BASE = ''assets/plugins/codemirror/'';\r\n\r\n$_CM_URL = $modx->config[''site_url''] . $_CM_BASE;\r\n\r\nrequire(MODX_BASE_PATH. $_CM_BASE .''codemirror.plugin.php'');\r\n\r\n', 0, '&theme=Theme;list;default,ambiance,blackboard,cobalt,eclipse,elegant,erlang-dark,lesser-dark,midnight,monokai,neat,night,rubyblue,solarized,twilight,vibrant-ink,xq-dark,xq-light; &indentUnit=Indent unit;int;4 &tabSize=The width of a tab character;int;4 &lineWrapping=lineWrapping;list;true,false;true &matchBrackets=matchBrackets;list;true,false;true &activeLine=activeLine;list;true,false;false &emmet=emmet;list;true,false;true &search=search;list;true,false;false &indentWithTabs=indentWithTabs;list;true,false;true', 0, ''),
(2, 'FileSource', '<strong>0.1</strong> Save snippet and plugins to file', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/filesource/plugin.filesource.php'';', 0, '', 0, ''),
(3, 'Forgot Manager Login', '<strong>1.1.6</strong> Resets your manager login when you forget your password via email confirmation', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/forgotmanagerlogin/plugin.forgotmanagerlogin.php'';', 0, '', 0, ''),
(4, 'ManagerManager', '<strong>0.6.2</strong> Customize the MODX Manager to offer bespoke admin functions for end users.', 0, 6, 0, '// You can put your ManagerManager rules EITHER in a chunk OR in an external file - whichever suits your development style the best\n\n// To use an external file, put your rules in /assets/plugins/managermanager/mm_rules.inc.php \n// (you can rename default.mm_rules.inc.php and use it as an example)\n// The chunk SHOULD have php opening tags at the beginning and end\n\n// If you want to put your rules in a chunk (so you can edit them through the Manager),\n// create the chunk, and enter its name in the configuration tab.\n// The chunk should NOT have php tags at the beginning or end.\n\n// See also user-friendly module for editing ManagerManager configuration file ddMMEditor (http://code.divandesign.biz/modx/ddmmeditor).\n\n// ManagerManager requires jQuery 1.9.1, which is located in /assets/plugins/managermanager/js/ folder.\n\n// You don''t need to change anything else from here onwards\n//-------------------------------------------------------\n\n// Run the main code\ninclude($modx->config[''base_path''].''assets/plugins/managermanager/mm.inc.php'');', 0, '&remove_deprecated_tv_types_pref=Remove deprecated TV types;list;yes,no;yes &config_chunk=Configuration Chunk;text;mm_rules', 0, ''),
(5, 'Quick Manager+', '<strong>1.5.6</strong> Enables QuickManager+ front end content editing support', 0, 6, 0, '// In manager\nif (isset($_SESSION[''mgrValidated''])) {\n\n    $show = TRUE;\n\n    if ($disabled  != '''') {\n        $arr = array_filter(array_map(''intval'', explode('','', $disabled)));\n        if (in_array($modx->documentIdentifier, $arr)) {\n            $show = FALSE;\n        }\n    }\n\n    if ($show) {\n        // Replace [*#tv*] with QM+ edit TV button placeholders\n        if ($tvbuttons == ''true'') {\n            $e = $modx->Event;\n            if ($e->name == ''OnParseDocument'') {\n                 $output = &$modx->documentOutput;\n                 $output = preg_replace(''~\\[\\*#(.*?)\\*\\]~'', ''<!-- ''.$tvbclass.'' $1 -->[*$1*]'', $output);\n                 $modx->documentOutput = $output;\n             }\n         }\n        // In manager\n        if (isset($_SESSION[''mgrValidated''])) {\n            include_once($modx->config[''base_path''].''assets/plugins/qm/qm.inc.php'');\n            $qm = new Qm($modx, $jqpath, $loadmanagerjq, $loadfrontendjq, $noconflictjq, $loadtb, $tbwidth, $tbheight, $hidefields, $hidetabs, $hidesections, $addbutton, $tpltype, $tplid, $custombutton, $managerbutton, $logout, $autohide, $editbuttons, $editbclass, $newbuttons, $newbclass, $tvbuttons, $tvbclass);\n        }\n    }\n}', 0, '&jqpath=Path to jQuery;text;assets/js/jquery.min.js &loadmanagerjq=Load jQuery in manager;list;true,false;false &loadfrontendjq=Load jQuery in front-end;list;true,false;true &noconflictjq=jQuery noConflict mode in front-end;list;true,false;true &loadtb=Load modal box in front-end;list;true,false;true &tbwidth=Modal box window width;text;80% &tbheight=Modal box window height;text;90% &hidefields=Hide document fields from front-end editors;text;parent &hidetabs=Hide document tabs from front-end editors;text; &hidesections=Hide document sections from front-end editors;text; &addbutton=Show add document here button;list;true,false;true &tpltype=New document template type;list;parent,id,selected;parent &tplid=New document template id;int;3 &custombutton=Custom buttons;textarea; &managerbutton=Show go to manager button;list;true,false;true &logout=Logout to;list;manager,front-end;manager &disabled=Plugin disabled on documents;text; &autohide=Autohide toolbar;list;true,false;true &editbuttons=Inline edit buttons;list;true,false;false &editbclass=Edit button CSS class;text;qm-edit &newbuttons=Inline new resource buttons;list;true,false;false &newbclass=New resource button CSS class;text;qm-new &tvbuttons=Inline template variable buttons;list;true,false;false &tvbclass=Template variable button CSS class;text;qm-tv', 1, ''),
(6, 'TinyMCE4', '<strong>4.3.2-b4</strong> Javascript WYSIWYG Editor', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/tinymce4/plugin.tinymce.php'';\n', 0, '&style_formats=Style_formats;textarea;left,justifyleft|right,justifyright', 0, ''),
(7, 'TransAlias', '<strong>1.0.4</strong> Human readible URL translation supporting multiple languages and overrides', 0, 6, 0, 'require MODX_BASE_PATH.''assets/plugins/transalias/plugin.transalias.php'';', 0, '&table_name=Trans table;list;common,russian,dutch,german,czech,utf8,utf8lowercase;russian &char_restrict=Restrict alias to;list;lowercase alphanumeric,alphanumeric,legal characters;lowercase alphanumeric &remove_periods=Remove Periods;list;Yes,No;No &word_separator=Word Separator;list;dash,underscore,none;dash &override_tv=Override TV name;string;', 0, '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_plugin_events`
--

CREATE TABLE IF NOT EXISTS `modx_site_plugin_events` (
  `pluginid` int(10) NOT NULL,
  `evtid` int(10) NOT NULL DEFAULT '0',
  `priority` int(10) NOT NULL DEFAULT '0' COMMENT 'determines plugin run order',
  PRIMARY KEY (`pluginid`,`evtid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Links to system events';

--
-- Дамп данных таблицы `modx_site_plugin_events`
--

INSERT INTO `modx_site_plugin_events` (`pluginid`, `evtid`, `priority`) VALUES
(1, 23, 0),
(1, 29, 0),
(1, 35, 0),
(1, 41, 0),
(1, 47, 0),
(1, 73, 0),
(2, 34, 0),
(2, 35, 0),
(2, 36, 0),
(2, 40, 0),
(2, 41, 0),
(2, 42, 0),
(3, 80, 0),
(3, 81, 0),
(3, 93, 0),
(4, 28, 0),
(4, 29, 0),
(4, 30, 0),
(4, 31, 0),
(4, 35, 0),
(4, 53, 0),
(4, 205, 0),
(5, 3, 0),
(5, 13, 0),
(5, 28, 0),
(5, 31, 0),
(5, 92, 0),
(6, 85, 0),
(6, 87, 0),
(6, 88, 0),
(7, 100, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_snippets`
--

CREATE TABLE IF NOT EXISTS `modx_site_snippets` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Snippet',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `cache_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Cache option',
  `snippet` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `properties` text COMMENT 'Default Properties',
  `moduleguid` varchar(32) NOT NULL DEFAULT '' COMMENT 'GUID of module from which to import shared parameters',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site snippets.' AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `modx_site_snippets`
--

INSERT INTO `modx_site_snippets` (`id`, `name`, `description`, `editor_type`, `category`, `cache_type`, `snippet`, `locked`, `properties`, `moduleguid`) VALUES
(1, 'alterTitle', '<strong>1</strong> Pagetitle если Longtitle пуст', 0, 7, 0, '\r\n//[[alterTitle? &id = `[+id+]`]] к примеру для вывода в Ditto\r\n$id = isset($id) ? (int) $id : 0;\r\nif ($id) {\r\n	$arr = $modx->getPageInfo($id,1,''pagetitle,longtitle'');\r\n} else {\r\n	$arr[''pagetitle''] = $modx->documentObject[''pagetitle''];\r\n	$arr[''longtitle''] = $modx->documentObject[''longtitle''];\r\n}\r\n$title = strlen($arr[''longtitle'']) ? $arr[''longtitle''] : $arr[''pagetitle'']; \r\nreturn $title;\r\n?>\r\n', 0, '', ''),
(2, 'Breadcrumbs', '<strong>1.0.5</strong> Configurable breadcrumb page-trail navigation', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/breadcrumbs/snippet.breadcrumbs.php'';', 0, '', ' '),
(3, 'Ditto', '<strong>2.1.1</strong> Summarizes and lists pages to create blogs, catalogs, PR archives, bio listings and more', 0, 9, 0, 'return require MODX_BASE_PATH.''assets/snippets/ditto/snippet.ditto.php'';', 0, '', ''),
(4, 'DocInfo', '<strong>1</strong> Берем любое поле из любого документа (меньше запросов по сравнению с GetField)', 0, 7, 0, 'return require MODX_BASE_PATH.''assets/snippets/docinfo/snippet.docinfo.php'';', 0, '', ''),
(5, 'DocLister', '<strong>2.1.30</strong> Snippet to display the information of the tables by the description rules. The main goal - replacing Ditto and CatalogView', 0, 9, 0, 'return require MODX_BASE_PATH.''assets/snippets/DocLister/snippet.DocLister.php'';', 0, '', ''),
(6, 'eForm', '<strong>1.4.6</strong> Robust form parser/processor with validation, multiple sending options, chunk/page support for forms and reports, and file uploads', 0, 3, 0, 'return require MODX_BASE_PATH.''assets/snippets/eform/snippet.eform.php'';', 0, '', ''),
(7, 'FirstChildRedirect', '<strong>2.0</strong> Automatically redirects to the first child of a Container Resource', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/firstchildredirect/snippet.firstchildredirect.php'';', 0, '', ''),
(8, 'if', '<strong>1.2</strong> A simple conditional snippet. Allows for eq/neq/lt/gt/etc logic within templates, resources, chunks, etc.', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/if/snippet.if.php'';', 0, '', ''),
(9, 'phpthumb', '<strong>1.2</strong> PHPThumb creates thumbnails and altered images on the fly and caches them', 0, 9, 0, 'return require MODX_BASE_PATH.''assets/snippets/phpthumb/snippet.phpthumb.php'';\r\n', 0, '', ''),
(10, 'UltimateParent', '<strong>2.0</strong> Travels up the document tree from a specified document and returns its "ultimate" non-root parent', 0, 8, 0, 'return require MODX_BASE_PATH.''assets/snippets/ultimateparent/snippet.ultimateparent.php'';', 0, '', ''),
(11, 'Wayfinder', '<strong>2.0.4</strong> Completely template-driven and highly flexible menu builder', 0, 4, 0, 'return require MODX_BASE_PATH.''assets/snippets/wayfinder/snippet.wayfinder.php'';', 0, '', ' ');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_templates` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `templatename` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT 'Template',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `icon` varchar(255) NOT NULL DEFAULT '' COMMENT 'url to icon file',
  `template_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-page,1-content',
  `content` mediumtext,
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains the site templates.' AUTO_INCREMENT=10 ;

--
-- Дамп данных таблицы `modx_site_templates`
--

INSERT INTO `modx_site_templates` (`id`, `templatename`, `description`, `editor_type`, `category`, `icon`, `template_type`, `content`, `locked`) VALUES
(3, 'Home', '', 0, 0, '', 0, '{{header}}\r\n[*content*]\r\n{{footer}}', 0),
(7, 'Новости', 'Новости сайта о поступление товара', 0, 4, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n	{{HEAD}}\r\n	<body>\r\n		<div class="overlay"></div>\r\n		<div class="wrapper">\r\n			<div class="wrap-position">\r\n				{{header news}}\r\n				{{content news}}\r\n				<div class="both"></div>\r\n			</div>\r\n			<div class="clear"></div>\r\n		</div>\r\n		{{MAIN FOOTER}}\r\n	</body>\r\n</html>', 0),
(5, 'Главная страница', 'Шаблон для главной страницы с JQuery галлерей', 0, 4, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n	{{HEAD}}\r\n	<body>\r\n		<div class="overlay"></div>\r\n		<div class="wrapper">\r\n			<div class="wrap-position">\r\n				{{MAIN HEADER}}\r\n				{{MAIN CONTENT}}\r\n				<div class="both"></div>\r\n			</div>\r\n			<div class="clear"></div>\r\n		</div>\r\n		{{MAIN FOOTER}}\r\n	</body>\r\n</html>', 0),
(6, 'Контентная страница', 'Информакционный шаблон нашего сайта', 0, 4, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n	{{HEAD}}\r\n	<body>\r\n		<div class="overlay"></div>\r\n		<div class="wrapper">\r\n			<div class="wrap-position">\r\n		 {{header content page}}\r\n		 {{footer content page}}\r\n				<div class="both"></div>\r\n			</div>\r\n			<div class="clear"></div>\r\n		</div>\r\n		{{MAIN FOOTER}}\r\n	</body>\r\n</html>', 0),
(8, 'Новость', 'Отдельная новость о товаре нашего сайта', 0, 4, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n	{{HEAD}}\r\n	<body>\r\n		<div class="overlay"></div>\r\n		<div class="wrapper">\r\n			<div class="wrap-position">\r\n				{{header one news}}\r\n				{{content one news))\r\n				<div class="both"></div>\r\n			</div>\r\n			<div class="clear"></div>\r\n		</div>\r\n\r\n		{{footer one news}}\r\n	</body>\r\n</html>', 0),
(9, 'Контакты', 'Контактная информация о нашем сайте', 0, 4, '', 0, '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">\r\n<html xmlns="http://www.w3.org/1999/xhtml">\r\n	{{HEAD}}\r\n	<body>\r\n		<div class="overlay"></div>\r\n		<div class="wrapper">\r\n			<div class="wrap-position">\r\n				<!--форма задать вопрос-->\r\n				<div class="form-position">\r\n					<div class="form-up">\r\n						<form action="#">\r\n							<p class="h2">Задать вопрос</p>\r\n							<a href="#" class="close">Закрыть</a>\r\n							<div><label>Ваше имя<input type="text" /></label></div>\r\n							<div><label>Ваши контакты<input type="text" /></label></div>\r\n							<div>\r\n								Текст сообщения\r\n								<textarea name="" id="" cols="30" rows="10"></textarea>\r\n							</div>\r\n							<div><input class="form-btn" type="submit" value="Отправить" /></div>\r\n						</form>\r\n					</div>\r\n				</div>\r\n				<!--форма задать вопрос-->\r\n			         <div class="contacts-line">\r\n						<div class="cont-box">\r\n							<div class="green-line">\r\n								<b>Киев</b>\r\n				<div class="cont-box-txt">\r\n								<ul>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n									<li>ул. Нижний Вал, 9<br />\r\n									(044) 425 43 63 <span class="map"></span></li>\r\n								</ul>\r\n							</div>\r\n						</div>\r\n						<div class="cont-box last">\r\n							<div class="green-line">\r\n								<b>Харьков</b>\r\n							</div>\r\n							<ul>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n								<li>ул. Нижний Вал, 9<br />\r\n								(044) 425 43 63 <span class="map"></span></li>\r\n							</ul>\r\n							<div class="both"></div>\r\n							<a href="#" class="go-all">Все контакты ...</a>\r\n							</div>\r\n						</div>\r\n					</div>\r\n				</div>\r\n		   </div>\r\n	\r\n							<\r\n	\r\n	\r\n	</body>\r\n</html>', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvars`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvars` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(50) NOT NULL DEFAULT '',
  `name` varchar(50) NOT NULL DEFAULT '',
  `caption` varchar(80) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `editor_type` int(11) NOT NULL DEFAULT '0' COMMENT '0-plain text,1-rich text,2-code editor',
  `category` int(11) NOT NULL DEFAULT '0' COMMENT 'category id',
  `locked` tinyint(4) NOT NULL DEFAULT '0',
  `elements` text,
  `rank` int(11) NOT NULL DEFAULT '0',
  `display` varchar(20) NOT NULL DEFAULT '' COMMENT 'Display Control',
  `display_params` text COMMENT 'Display Control Properties',
  `default_text` text,
  PRIMARY KEY (`id`),
  KEY `indx_rank` (`rank`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Site Template Variables' AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `modx_site_tmplvars`
--

INSERT INTO `modx_site_tmplvars` (`id`, `type`, `name`, `caption`, `description`, `editor_type`, `category`, `locked`, `elements`, `rank`, `display`, `display_params`, `default_text`) VALUES
(1, 'textarea', 'desc', 'Мета дескрипшин', 'Мета дескрипшин', 0, 2, 0, '', 0, '', '', '[*introtext*]'),
(2, 'text', 'keyw', 'Ключевые слова', 'Ключевые слова', 0, 2, 0, '', 0, '', '', '[*pagetitle*]'),
(3, 'checkbox', 'noIndex', 'Индексировать страницу', 'Управление URL', 0, 2, 0, 'Нет==<meta name="robots" content="noindex, nofollow">', 0, '', '', ''),
(4, 'text', 'titl', 'Мета тайтл', 'Мета тайтл', 0, 2, 0, '', 0, '', '', '[*pagetitle*] - [(site_name)]');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_access`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for template variable access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_contentvalues`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_contentvalues` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `contentid` int(10) NOT NULL DEFAULT '0' COMMENT 'Site Content Id',
  `value` text,
  PRIMARY KEY (`id`),
  KEY `idx_tmplvarid` (`tmplvarid`),
  KEY `idx_id` (`contentid`),
  FULLTEXT KEY `value_ft_idx` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Content Values Link Table' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_site_tmplvar_templates`
--

CREATE TABLE IF NOT EXISTS `modx_site_tmplvar_templates` (
  `tmplvarid` int(10) NOT NULL DEFAULT '0' COMMENT 'Template Variable id',
  `templateid` int(11) NOT NULL DEFAULT '0',
  `rank` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tmplvarid`,`templateid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Site Template Variables Templates Link Table';

--
-- Дамп данных таблицы `modx_site_tmplvar_templates`
--

INSERT INTO `modx_site_tmplvar_templates` (`tmplvarid`, `templateid`, `rank`) VALUES
(1, 3, 0),
(2, 3, 0),
(3, 3, 0),
(4, 3, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_eventnames`
--

CREATE TABLE IF NOT EXISTS `modx_system_eventnames` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `service` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'System Service number',
  `groupname` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='System Event Names.' AUTO_INCREMENT=1036 ;

--
-- Дамп данных таблицы `modx_system_eventnames`
--

INSERT INTO `modx_system_eventnames` (`id`, `name`, `service`, `groupname`) VALUES
(1, 'OnDocPublished', 5, ''),
(2, 'OnDocUnPublished', 5, ''),
(3, 'OnWebPagePrerender', 5, ''),
(4, 'OnWebLogin', 3, ''),
(5, 'OnBeforeWebLogout', 3, ''),
(6, 'OnWebLogout', 3, ''),
(7, 'OnWebSaveUser', 3, ''),
(8, 'OnWebDeleteUser', 3, ''),
(9, 'OnWebChangePassword', 3, ''),
(10, 'OnWebCreateGroup', 3, ''),
(11, 'OnManagerLogin', 2, ''),
(12, 'OnBeforeManagerLogout', 2, ''),
(13, 'OnManagerLogout', 2, ''),
(14, 'OnManagerSaveUser', 2, ''),
(15, 'OnManagerDeleteUser', 2, ''),
(16, 'OnManagerChangePassword', 2, ''),
(17, 'OnManagerCreateGroup', 2, ''),
(18, 'OnBeforeCacheUpdate', 4, ''),
(19, 'OnCacheUpdate', 4, ''),
(107, 'OnMakePageCacheKey', 4, ''),
(20, 'OnLoadWebPageCache', 4, ''),
(21, 'OnBeforeSaveWebPageCache', 4, ''),
(22, 'OnChunkFormPrerender', 1, 'Chunks'),
(23, 'OnChunkFormRender', 1, 'Chunks'),
(24, 'OnBeforeChunkFormSave', 1, 'Chunks'),
(25, 'OnChunkFormSave', 1, 'Chunks'),
(26, 'OnBeforeChunkFormDelete', 1, 'Chunks'),
(27, 'OnChunkFormDelete', 1, 'Chunks'),
(28, 'OnDocFormPrerender', 1, 'Documents'),
(29, 'OnDocFormRender', 1, 'Documents'),
(30, 'OnBeforeDocFormSave', 1, 'Documents'),
(31, 'OnDocFormSave', 1, 'Documents'),
(32, 'OnBeforeDocFormDelete', 1, 'Documents'),
(33, 'OnDocFormDelete', 1, 'Documents'),
(1033, 'OnDocFormUnDelete', 1, 'Documents'),
(1034, 'onBeforeMoveDocument', 1, 'Documents'),
(1035, 'onAfterMoveDocument', 1, 'Documents'),
(34, 'OnPluginFormPrerender', 1, 'Plugins'),
(35, 'OnPluginFormRender', 1, 'Plugins'),
(36, 'OnBeforePluginFormSave', 1, 'Plugins'),
(37, 'OnPluginFormSave', 1, 'Plugins'),
(38, 'OnBeforePluginFormDelete', 1, 'Plugins'),
(39, 'OnPluginFormDelete', 1, 'Plugins'),
(40, 'OnSnipFormPrerender', 1, 'Snippets'),
(41, 'OnSnipFormRender', 1, 'Snippets'),
(42, 'OnBeforeSnipFormSave', 1, 'Snippets'),
(43, 'OnSnipFormSave', 1, 'Snippets'),
(44, 'OnBeforeSnipFormDelete', 1, 'Snippets'),
(45, 'OnSnipFormDelete', 1, 'Snippets'),
(46, 'OnTempFormPrerender', 1, 'Templates'),
(47, 'OnTempFormRender', 1, 'Templates'),
(48, 'OnBeforeTempFormSave', 1, 'Templates'),
(49, 'OnTempFormSave', 1, 'Templates'),
(50, 'OnBeforeTempFormDelete', 1, 'Templates'),
(51, 'OnTempFormDelete', 1, 'Templates'),
(52, 'OnTVFormPrerender', 1, 'Template Variables'),
(53, 'OnTVFormRender', 1, 'Template Variables'),
(54, 'OnBeforeTVFormSave', 1, 'Template Variables'),
(55, 'OnTVFormSave', 1, 'Template Variables'),
(56, 'OnBeforeTVFormDelete', 1, 'Template Variables'),
(57, 'OnTVFormDelete', 1, 'Template Variables'),
(58, 'OnUserFormPrerender', 1, 'Users'),
(59, 'OnUserFormRender', 1, 'Users'),
(60, 'OnBeforeUserFormSave', 1, 'Users'),
(61, 'OnUserFormSave', 1, 'Users'),
(62, 'OnBeforeUserFormDelete', 1, 'Users'),
(63, 'OnUserFormDelete', 1, 'Users'),
(64, 'OnWUsrFormPrerender', 1, 'Web Users'),
(65, 'OnWUsrFormRender', 1, 'Web Users'),
(66, 'OnBeforeWUsrFormSave', 1, 'Web Users'),
(67, 'OnWUsrFormSave', 1, 'Web Users'),
(68, 'OnBeforeWUsrFormDelete', 1, 'Web Users'),
(69, 'OnWUsrFormDelete', 1, 'Web Users'),
(70, 'OnSiteRefresh', 1, ''),
(71, 'OnFileManagerUpload', 1, ''),
(72, 'OnModFormPrerender', 1, 'Modules'),
(73, 'OnModFormRender', 1, 'Modules'),
(74, 'OnBeforeModFormDelete', 1, 'Modules'),
(75, 'OnModFormDelete', 1, 'Modules'),
(76, 'OnBeforeModFormSave', 1, 'Modules'),
(77, 'OnModFormSave', 1, 'Modules'),
(78, 'OnBeforeWebLogin', 3, ''),
(79, 'OnWebAuthentication', 3, ''),
(80, 'OnBeforeManagerLogin', 2, ''),
(81, 'OnManagerAuthentication', 2, ''),
(82, 'OnSiteSettingsRender', 1, 'System Settings'),
(83, 'OnFriendlyURLSettingsRender', 1, 'System Settings'),
(84, 'OnUserSettingsRender', 1, 'System Settings'),
(85, 'OnInterfaceSettingsRender', 1, 'System Settings'),
(86, 'OnMiscSettingsRender', 1, 'System Settings'),
(87, 'OnRichTextEditorRegister', 1, 'RichText Editor'),
(88, 'OnRichTextEditorInit', 1, 'RichText Editor'),
(89, 'OnManagerPageInit', 2, ''),
(90, 'OnWebPageInit', 5, ''),
(101, 'OnLoadDocumentObject', 5, ''),
(104, 'OnBeforeLoadDocumentObject', 5, ''),
(105, 'OnAfterLoadDocumentObject', 5, ''),
(91, 'OnLoadWebDocument', 5, ''),
(92, 'OnParseDocument', 5, ''),
(106, 'OnParseProperties', 5, ''),
(93, 'OnManagerLoginFormRender', 2, ''),
(94, 'OnWebPageComplete', 5, ''),
(95, 'OnLogPageHit', 5, ''),
(96, 'OnBeforeManagerPageInit', 2, ''),
(97, 'OnBeforeEmptyTrash', 1, 'Documents'),
(98, 'OnEmptyTrash', 1, 'Documents'),
(99, 'OnManagerLoginFormPrerender', 2, ''),
(100, 'OnStripAlias', 1, 'Documents'),
(102, 'OnMakeDocUrl', 5, ''),
(103, 'OnBeforeLoadExtension', 5, ''),
(200, 'OnCreateDocGroup', 1, 'Documents'),
(201, 'OnManagerWelcomePrerender', 2, ''),
(202, 'OnManagerWelcomeHome', 2, ''),
(203, 'OnManagerWelcomeRender', 2, ''),
(204, 'OnBeforeDocDuplicate', 1, 'Documents'),
(205, 'OnDocDuplicate', 1, 'Documents'),
(206, 'OnManagerMainFrameHeaderHTMLBlock', 2, ''),
(207, 'OnManagerPreFrameLoader', 2, ''),
(208, 'OnManagerFrameLoader', 2, ''),
(209, 'OnManagerTreeInit', 2, ''),
(210, 'OnManagerTreePrerender', 2, ''),
(211, 'OnManagerTreeRender', 2, ''),
(212, 'OnManagerNodePrerender', 2, ''),
(213, 'OnManagerNodeRender', 2, ''),
(214, 'OnManagerMenuPrerender', 2, ''),
(224, 'OnDocFormTemplateRender', 1, 'Documents'),
(999, 'OnPageUnauthorized', 1, ''),
(1000, 'OnPageNotFound', 1, ''),
(1001, 'OnFileBrowserUpload', 1, 'File Browser Events');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_system_settings`
--

CREATE TABLE IF NOT EXISTS `modx_system_settings` (
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`setting_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains Content Manager settings.';

--
-- Дамп данных таблицы `modx_system_settings`
--

INSERT INTO `modx_system_settings` (`setting_name`, `setting_value`) VALUES
('manager_theme', 'D3X'),
('settings_version', '1.1RC-d7.1.6'),
('show_meta', '0'),
('server_offset_time', '-3600'),
('server_protocol', 'http'),
('manager_language', 'russian-UTF8'),
('modx_charset', 'UTF-8'),
('site_name', 'INFO MODX Site '),
('site_start', '1'),
('error_page', '1'),
('unauthorized_page', '1'),
('site_status', '1'),
('site_unavailable_message', 'The site is currently unavailable'),
('track_visitors', '0'),
('top_howmany', '10'),
('auto_template_logic', 'sibling'),
('default_template', '3'),
('old_template', '3'),
('publish_default', '1'),
('cache_default', '1'),
('search_default', '1'),
('friendly_urls', '1'),
('friendly_url_prefix', ''),
('friendly_url_suffix', '.html'),
('friendly_alias_urls', '1'),
('use_alias_path', '1'),
('use_udperms', '1'),
('udperms_allowroot', '0'),
('failed_login_attempts', '3'),
('blocked_minutes', '60'),
('use_captcha', '0'),
('captcha_words', '0,1,2,3,4,5,6,7,8,9'),
('emailsender', 'vlad.v.maslennikov@gmail.com'),
('email_method', 'mail'),
('smtp_auth', '0'),
('smtp_host', ''),
('smtp_port', '25'),
('smtp_username', ''),
('emailsubject', 'Your login details'),
('number_of_logs', '100'),
('number_of_messages', '30'),
('number_of_results', '20'),
('use_editor', '1'),
('use_browser', '1'),
('rb_base_dir', 'C:/OpenServer/domains/mymodxEVO/assets/'),
('rb_base_url', 'assets/'),
('which_editor', 'TinyMCE4'),
('fe_editor_lang', 'russian-UTF8'),
('fck_editor_toolbar', 'standard'),
('fck_editor_autolang', '0'),
('editor_css_path', ''),
('editor_css_selectors', ''),
('strip_image_paths', '1'),
('upload_images', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff'),
('upload_media', 'au,avi,mp3,mp4,mpeg,mpg,wav,wmv'),
('upload_flash', 'fla,flv,swf'),
('upload_files', 'bmp,ico,gif,jpeg,jpg,png,psd,tif,tiff,fla,flv,swf,aac,au,avi,css,cache,doc,docx,gz,gzip,htaccess,htm,html,js,mp3,mp4,mpeg,mpg,ods,odp,odt,pdf,ppt,pptx,rar,tar,tgz,txt,wav,wmv,xls,xlsx,xml,z,zip,JPG,JPEG,PNG,GIF'),
('upload_maxsize', '10485760'),
('new_file_permissions', '0644'),
('new_folder_permissions', '0755'),
('filemanager_path', 'C:/OpenServer/domains/mymodxEVO/'),
('theme_refresher', ''),
('manager_layout', '4'),
('custom_contenttype', 'application/rss+xml,application/pdf,application/vnd.ms-word,application/vnd.ms-excel,text/html,text/css,text/xml,text/javascript,text/plain,application/json'),
('auto_menuindex', '1'),
('session.cookie.lifetime', '604800'),
('mail_check_timeperiod', '600'),
('manager_direction', 'ltr'),
('tinymce_editor_theme', 'editor'),
('tinymce_custom_plugins', 'style,advimage,advlink,searchreplace,print,contextmenu,paste,fullscreen,nonbreaking,xhtmlxtras,visualchars,media'),
('tinymce_custom_buttons1', 'undo,redo,selectall,separator,pastetext,pasteword,separator,search,replace,separator,nonbreaking,hr,charmap,separator,image,link,unlink,anchor,media,separator,cleanup,removeformat,separator,fullscreen,print,code,help'),
('tinymce_custom_buttons2', 'bold,italic,underline,strikethrough,sub,sup,separator,bullist,numlist,outdent,indent,separator,justifyleft,justifycenter,justifyright,justifyfull,separator,styleselect,formatselect,separator,styleprops'),
('tree_show_protected', '0'),
('rss_url_news', 'http://feeds.feedburner.com/modx-announce'),
('rss_url_security', 'http://feeds.feedburner.com/modxsecurity'),
('validate_referer', '1'),
('datepicker_offset', '-10'),
('xhtml_urls', '0'),
('allow_duplicate_alias', '0'),
('automatic_alias', '1'),
('datetime_format', 'dd-mm-YYYY'),
('warning_visibility', '0'),
('remember_last_tab', '1'),
('enable_bindings', '1'),
('seostrict', '1'),
('cache_type', '2'),
('maxImageWidth', '1600'),
('maxImageHeight', '1200'),
('thumbWidth', '150'),
('thumbHeight', '150'),
('thumbsDir', '.thumbs'),
('jpegQuality', '90'),
('denyZipDownload', '0'),
('denyExtensionRename', '0'),
('showHiddenFiles', '0'),
('docid_incrmnt_method', '0'),
('make_folders', '0'),
('tree_page_click', '27'),
('clean_uploaded_filename', '1'),
('site_id', '56faee7589c31'),
('site_unavailable_page', ''),
('reload_site_unavailable', ''),
('siteunavailable_message_default', 'В настоящее время сайт недоступен.'),
('aliaslistingfolder', '0'),
('check_files_onlogin', 'index.php\r\n.htaccess\r\nmanager/index.php\r\nmanager/includes/config.inc.php'),
('error_reporting', '1'),
('send_errormail', '0'),
('pwd_hash_algo', 'UNCRYPT'),
('reload_captcha_words', ''),
('captcha_words_default', 'MODX,Access,Better,BitCode,Chunk,Cache,Desc,Design,Excell,Enjoy,URLs,TechView,Gerald,Griff,Humphrey,Holiday,Intel,Integration,Joystick,Join(),Oscope,Genetic,Light,Likeness,Marit,Maaike,Niche,Netherlands,Ordinance,Oscillo,Parser,Phusion,Query,Question,Regalia,Righteous,Snippet,Sentinel,Template,Thespian,Unity,Enterprise,Verily,Tattoo,Veri,Website,WideWeb,Yap,Yellow,Zebra,Zygote'),
('smtp_secure', 'none'),
('reload_emailsubject', ''),
('emailsubject_default', 'Данные для авторизации'),
('reload_signupemail_message', ''),
('signupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_signup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации в системе управления сайтом [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации в системе управления сайтом ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_websignupemail_message', ''),
('websignupemail_message', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('system_email_websignup_default', 'Здравствуйте, [+uid+]!\r\n\r\nВаши данные для авторизации на [+sname+]:\r\n\r\nИмя пользователя: [+uid+]\r\nПароль: [+pwd+]\r\n\r\nПосле успешной авторизации на [+sname+] ([+surl+]), вы сможете изменить свой пароль.\r\n\r\nС уважением, Администрация'),
('reload_system_email_webreminder_message', ''),
('webpwdreminder_message', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('system_email_webreminder_default', 'Здравствуйте, [+uid+]!\r\n\r\nЧтобы активировать ваш новый пароль, перейдите по следующей ссылке:\r\n\r\n[+surl+]\r\n\r\nПозже вы сможете использовать следующий пароль для авторизации: [+pwd+]\r\n\r\nЕсли это письмо пришло к вам по ошибке, пожалуйста, проигнорируйте его.\r\n\r\nС уважением, Администрация'),
('resource_tree_node_name', 'pagetitle'),
('rb_webuser', '0'),
('sys_files_checksum', 'a:4:{s:41:"C:/OpenServer/domains/mymodxEVO/index.php";s:32:"657db3d7274dbb84c80d4aac08a75417";s:41:"C:/OpenServer/domains/mymodxEVO/.htaccess";s:32:"aa196ef65d07f9406b55aaf000f8a0a2";s:49:"C:/OpenServer/domains/mymodxEVO/manager/index.php";s:32:"5db76a440c8e2388efe93e738025f5d6";s:63:"C:/OpenServer/domains/mymodxEVO/manager/includes/config.inc.php";s:32:"1c3edcbc051f64f369c824f81db4f033";}');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(5) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information about the backend users.' AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `modx_user_attributes`
--

INSERT INTO `modx_user_attributes` (`id`, `internalKey`, `fullname`, `role`, `email`, `phone`, `mobilephone`, `blocked`, `blockeduntil`, `blockedafter`, `logincount`, `lastlogin`, `thislogin`, `failedlogincount`, `sessionid`, `dob`, `gender`, `country`, `street`, `city`, `state`, `zip`, `fax`, `photo`, `comment`) VALUES
(1, 1, 'Admin', 1, 'vlad.v.maslennikov@gmail.com', '', '', 0, 0, 0, 1, 0, 1459285698, 0, 'gvaalhdqce6q36hq885jkvivp4', 0, 0, '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_messages`
--

CREATE TABLE IF NOT EXISTS `modx_user_messages` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL DEFAULT '',
  `subject` varchar(60) NOT NULL DEFAULT '',
  `message` text,
  `sender` int(10) NOT NULL DEFAULT '0',
  `recipient` int(10) NOT NULL DEFAULT '0',
  `private` tinyint(4) NOT NULL DEFAULT '0',
  `postdate` int(20) NOT NULL DEFAULT '0',
  `messageread` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains messages for the Content Manager messaging system.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_roles`
--

CREATE TABLE IF NOT EXISTS `modx_user_roles` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL DEFAULT '',
  `frames` int(1) NOT NULL DEFAULT '0',
  `home` int(1) NOT NULL DEFAULT '0',
  `view_document` int(1) NOT NULL DEFAULT '0',
  `new_document` int(1) NOT NULL DEFAULT '0',
  `save_document` int(1) NOT NULL DEFAULT '0',
  `publish_document` int(1) NOT NULL DEFAULT '0',
  `delete_document` int(1) NOT NULL DEFAULT '0',
  `empty_trash` int(1) NOT NULL DEFAULT '0',
  `action_ok` int(1) NOT NULL DEFAULT '0',
  `logout` int(1) NOT NULL DEFAULT '0',
  `help` int(1) NOT NULL DEFAULT '0',
  `messages` int(1) NOT NULL DEFAULT '0',
  `new_user` int(1) NOT NULL DEFAULT '0',
  `edit_user` int(1) NOT NULL DEFAULT '0',
  `logs` int(1) NOT NULL DEFAULT '0',
  `edit_parser` int(1) NOT NULL DEFAULT '0',
  `save_parser` int(1) NOT NULL DEFAULT '0',
  `edit_template` int(1) NOT NULL DEFAULT '0',
  `settings` int(1) NOT NULL DEFAULT '0',
  `credits` int(1) NOT NULL DEFAULT '0',
  `new_template` int(1) NOT NULL DEFAULT '0',
  `save_template` int(1) NOT NULL DEFAULT '0',
  `delete_template` int(1) NOT NULL DEFAULT '0',
  `edit_snippet` int(1) NOT NULL DEFAULT '0',
  `new_snippet` int(1) NOT NULL DEFAULT '0',
  `save_snippet` int(1) NOT NULL DEFAULT '0',
  `delete_snippet` int(1) NOT NULL DEFAULT '0',
  `edit_chunk` int(1) NOT NULL DEFAULT '0',
  `new_chunk` int(1) NOT NULL DEFAULT '0',
  `save_chunk` int(1) NOT NULL DEFAULT '0',
  `delete_chunk` int(1) NOT NULL DEFAULT '0',
  `empty_cache` int(1) NOT NULL DEFAULT '0',
  `edit_document` int(1) NOT NULL DEFAULT '0',
  `change_password` int(1) NOT NULL DEFAULT '0',
  `error_dialog` int(1) NOT NULL DEFAULT '0',
  `about` int(1) NOT NULL DEFAULT '0',
  `file_manager` int(1) NOT NULL DEFAULT '0',
  `save_user` int(1) NOT NULL DEFAULT '0',
  `delete_user` int(1) NOT NULL DEFAULT '0',
  `save_password` int(11) NOT NULL DEFAULT '0',
  `edit_role` int(1) NOT NULL DEFAULT '0',
  `save_role` int(1) NOT NULL DEFAULT '0',
  `delete_role` int(1) NOT NULL DEFAULT '0',
  `new_role` int(1) NOT NULL DEFAULT '0',
  `access_permissions` int(1) NOT NULL DEFAULT '0',
  `bk_manager` int(1) NOT NULL DEFAULT '0',
  `new_plugin` int(1) NOT NULL DEFAULT '0',
  `edit_plugin` int(1) NOT NULL DEFAULT '0',
  `save_plugin` int(1) NOT NULL DEFAULT '0',
  `delete_plugin` int(1) NOT NULL DEFAULT '0',
  `new_module` int(1) NOT NULL DEFAULT '0',
  `edit_module` int(1) NOT NULL DEFAULT '0',
  `save_module` int(1) NOT NULL DEFAULT '0',
  `delete_module` int(1) NOT NULL DEFAULT '0',
  `exec_module` int(1) NOT NULL DEFAULT '0',
  `view_eventlog` int(1) NOT NULL DEFAULT '0',
  `delete_eventlog` int(1) NOT NULL DEFAULT '0',
  `manage_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'manage site meta tags and keywords',
  `edit_doc_metatags` int(1) NOT NULL DEFAULT '0' COMMENT 'edit document meta tags and keywords',
  `new_web_user` int(1) NOT NULL DEFAULT '0',
  `edit_web_user` int(1) NOT NULL DEFAULT '0',
  `save_web_user` int(1) NOT NULL DEFAULT '0',
  `delete_web_user` int(1) NOT NULL DEFAULT '0',
  `web_access_permissions` int(1) NOT NULL DEFAULT '0',
  `view_unpublished` int(1) NOT NULL DEFAULT '0',
  `import_static` int(1) NOT NULL DEFAULT '0',
  `export_static` int(1) NOT NULL DEFAULT '0',
  `remove_locks` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COMMENT='Contains information describing the user roles.' AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `modx_user_roles`
--

INSERT INTO `modx_user_roles` (`id`, `name`, `description`, `frames`, `home`, `view_document`, `new_document`, `save_document`, `publish_document`, `delete_document`, `empty_trash`, `action_ok`, `logout`, `help`, `messages`, `new_user`, `edit_user`, `logs`, `edit_parser`, `save_parser`, `edit_template`, `settings`, `credits`, `new_template`, `save_template`, `delete_template`, `edit_snippet`, `new_snippet`, `save_snippet`, `delete_snippet`, `edit_chunk`, `new_chunk`, `save_chunk`, `delete_chunk`, `empty_cache`, `edit_document`, `change_password`, `error_dialog`, `about`, `file_manager`, `save_user`, `delete_user`, `save_password`, `edit_role`, `save_role`, `delete_role`, `new_role`, `access_permissions`, `bk_manager`, `new_plugin`, `edit_plugin`, `save_plugin`, `delete_plugin`, `new_module`, `edit_module`, `save_module`, `delete_module`, `exec_module`, `view_eventlog`, `delete_eventlog`, `manage_metatags`, `edit_doc_metatags`, `new_web_user`, `edit_web_user`, `save_web_user`, `delete_web_user`, `web_access_permissions`, `view_unpublished`, `import_static`, `export_static`, `remove_locks`) VALUES
(2, 'Editor', 'Limited to managing content', 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 1),
(3, 'Publisher', 'Editor with expanded permissions including manage users, update Elements and site settings', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 1, 0, 0, 1),
(1, 'Administrator', 'Site administrators have full access to all functions', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `modx_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_user_settings` (
  `user` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`user`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains backend user settings.';

-- --------------------------------------------------------

--
-- Структура таблицы `modx_webgroup_access`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_access` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `documentgroup` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_webgroup_names`
--

CREATE TABLE IF NOT EXISTS `modx_webgroup_names` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_groups`
--

CREATE TABLE IF NOT EXISTS `modx_web_groups` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `webgroup` int(10) NOT NULL DEFAULT '0',
  `webuser` int(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ix_group_user` (`webgroup`,`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains data used for web access permissions.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_users`
--

CREATE TABLE IF NOT EXISTS `modx_web_users` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `cachepwd` varchar(100) NOT NULL DEFAULT '' COMMENT 'Store new unconfirmed password',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_user_attributes`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_attributes` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `internalKey` int(10) NOT NULL DEFAULT '0',
  `fullname` varchar(100) NOT NULL DEFAULT '',
  `role` int(10) NOT NULL DEFAULT '0',
  `email` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(100) NOT NULL DEFAULT '',
  `mobilephone` varchar(100) NOT NULL DEFAULT '',
  `blocked` int(1) NOT NULL DEFAULT '0',
  `blockeduntil` int(11) NOT NULL DEFAULT '0',
  `blockedafter` int(11) NOT NULL DEFAULT '0',
  `logincount` int(11) NOT NULL DEFAULT '0',
  `lastlogin` int(11) NOT NULL DEFAULT '0',
  `thislogin` int(11) NOT NULL DEFAULT '0',
  `failedlogincount` int(10) NOT NULL DEFAULT '0',
  `sessionid` varchar(100) NOT NULL DEFAULT '',
  `dob` int(10) NOT NULL DEFAULT '0',
  `gender` int(1) NOT NULL DEFAULT '0' COMMENT '0 - unknown, 1 - Male 2 - female',
  `country` varchar(25) NOT NULL DEFAULT '',
  `street` varchar(255) NOT NULL DEFAULT '',
  `city` varchar(255) NOT NULL DEFAULT '',
  `state` varchar(25) NOT NULL DEFAULT '',
  `zip` varchar(25) NOT NULL DEFAULT '',
  `fax` varchar(100) NOT NULL DEFAULT '',
  `photo` varchar(255) NOT NULL DEFAULT '' COMMENT 'link to photo',
  `comment` text,
  PRIMARY KEY (`id`),
  KEY `userid` (`internalKey`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains information for web users.' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Структура таблицы `modx_web_user_settings`
--

CREATE TABLE IF NOT EXISTS `modx_web_user_settings` (
  `webuser` int(11) NOT NULL,
  `setting_name` varchar(50) NOT NULL DEFAULT '',
  `setting_value` text,
  PRIMARY KEY (`webuser`,`setting_name`),
  KEY `setting_name` (`setting_name`),
  KEY `webuserid` (`webuser`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Contains web user settings.';

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
