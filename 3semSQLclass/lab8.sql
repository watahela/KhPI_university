SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `metro_systems`;
CREATE TABLE `metro_systems` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(100) NOT NULL,
  `country` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `lines`;
CREATE TABLE `lines` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `system_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `color_hex` varchar(7) DEFAULT '#000000',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`system_id`) REFERENCES `metro_systems` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `stations`;
CREATE TABLE `stations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `line_id` int(10) unsigned NOT NULL,
  `name` varchar(100) NOT NULL,
  `sequence_number` int(10) unsigned NOT NULL, 
  PRIMARY KEY (`id`),
  FOREIGN KEY (`line_id`) REFERENCES `lines` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `transfers`;
CREATE TABLE `transfers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_from_id` int(10) unsigned NOT NULL,
  `station_to_id` int(10) unsigned NOT NULL,
  `type` varchar(50) DEFAULT 'walking',
  PRIMARY KEY (`id`),
  FOREIGN KEY (`station_from_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE,
  FOREIGN KEY (`station_to_id`) REFERENCES `stations` (`id`) ON DELETE CASCADE,
  UNIQUE KEY `unique_transfer` (`station_from_id`, `station_to_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

SET FOREIGN_KEY_CHECKS = 1;

-- test data
INSERT INTO `metro_systems` (`city_name`, `country`) VALUES ('Харків', 'Україна');
INSERT INTO `lines` (`system_id`, `name`, `color_hex`) VALUES (1, 'Холодногірсько-Заводська', '#FF0000');
INSERT INTO `lines` (`system_id`, `name`, `color_hex`) VALUES (1, 'Салтівська', '#0000FF');
INSERT INTO `lines` (`system_id`, `name`, `color_hex`) VALUES (1, 'Олексіївська', '#00FF00');


INSERT INTO `stations` (`line_id`, `name`, `sequence_number`) VALUES 
(1, 'Холодна гора', 1),
(1, 'Південний вокзал', 2),
(1, 'Центральний ринок', 3),
(1, 'Майдан Конституції', 4),
(1, 'Проспект Гагаріна', 5),
(1, 'Спортивна', 6);

INSERT INTO `stations` (`line_id`, `name`, `sequence_number`) VALUES 
(2, 'Історичний музей', 1),
(2, 'Університет', 2),
(2, 'Пушкінська', 3);

INSERT INTO `stations` (`line_id`, `name`, `sequence_number`) VALUES 
(3, 'Держпром', 1),
(3, 'Архітектора Бекетова', 2),
(3, 'Захисників України', 3),
(3, 'Метробудівників', 4);

-- transfers
INSERT INTO `transfers` (`station_from_id`, `station_to_id`) VALUES (4, 7), (7, 4);

INSERT INTO `transfers` (`station_from_id`, `station_to_id`) VALUES (8, 10), (10, 8);

INSERT INTO `transfers` (`station_from_id`, `station_to_id`) VALUES (6, 13), (13, 6);
