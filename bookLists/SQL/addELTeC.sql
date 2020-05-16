CREATE TABLE `eltec_titles` (
  `eltec_id` varchar(12) NOT NULL,
  `title_id` mediumint(6) unsigned NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

LOCK TABLES `eltec_titles` WRITE;

INSERT INTO `eltec_titles` (`eltec_id`, `title_id``)
VALUES
	('ENG18551',7448),
	('ENG19200', 0);
