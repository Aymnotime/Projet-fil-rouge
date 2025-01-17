-- Host: localhost    Database: ecommerce

DROP TABLE IF EXISTS `Order`;

CREATE TABLE `Order` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `Order_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `User` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `Order` WRITE;

INSERT INTO `Order` VALUES (1,1),(2,2);

UNLOCK TABLES;

DROP TABLE IF EXISTS `Order_Product`;

CREATE TABLE `Order_Product` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `Order_Product_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `Order` (`order_id`),
  CONSTRAINT `Order_Product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `Product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



LOCK TABLES `Order_Product` WRITE;
INSERT INTO `Order_Product` VALUES (1,1,1),(1,2,1),(2,3,2);
UNLOCK TABLES;

DROP TABLE IF EXISTS `Product`;
CREATE TABLE `Product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `Product` WRITE;
INSERT INTO `Product` VALUES (1,'Laptop Omen',1000.50),(2,'Samsung galaxy s24',699.99),(3,'Airpods',149.75),(4,'Iphone 15 pro max',1699.99);
UNLOCK TABLES;


DROP TABLE IF EXISTS `User`;
CREATE TABLE `User` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


LOCK TABLES `User` WRITE;
INSERT INTO `User` VALUES (1,'email_du_crack@crack.com','hash_pass'),(2,'yuji@jjk.com','hash_pass2');
UNLOCK TABLES;

