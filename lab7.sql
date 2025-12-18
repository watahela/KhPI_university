DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `category_id` int(10) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `published_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) unsigned NOT NULL,
  `author_name` varchar(100) DEFAULT 'Guest',
  `comment_text` text NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ratings`;
CREATE TABLE `ratings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `news_id` int(10) unsigned NOT NULL,
  `ip_address` varchar(45) NOT NULL,
  `rating_value` tinyint(1) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`news_id`) REFERENCES `news` (`id`) ON DELETE CASCADE,
  UNIQUE KEY `unique_rating_per_ip` (`news_id`, `ip_address`),
  CHECK (`rating_value` >= 1 AND `rating_value` <= 5)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- test data

INSERT INTO `categories` (`name`) VALUES ('politics'), ('sports'), ('tech');

INSERT INTO `news` (`category_id`, `title`, `content`) 
VALUES (3, 'AI is going to consume our minds', 'very intresting blog about AI');

INSERT INTO `comments` (`news_id`, `author_name`, `comment_text`) 
VALUES (1, 'Olezha1337', 'topchik'), (1, 'AlinaIMNOTABOT', 'wow noway scary');

INSERT INTO `ratings` (`news_id`, `ip_address`, `rating_value`) VALUES (1, '192.168.0.1', 5);
INSERT INTO `ratings` (`news_id`, `ip_address`, `rating_value`) VALUES (1, '10.0.0.2', 4);

-- end
