CREATE DATABASE chat;

USE chat;

-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'usernames'
-- 
-- ---

DROP TABLE IF EXISTS `usernames`;
    
CREATE TABLE usernames (
  id int NOT NULL,
  Name VARCHAR(15),
  PRIMARY KEY (id)
);

-- ---
-- Table 'Friends'
-- 
-- ---

DROP TABLE IF EXISTS `Friendships`;
    
CREATE TABLE Friendships (
  id int NOT NULL,
  user int,
  friend int,
  PRIMARY KEY (id)
);

-- ---
-- Table 'Messages'
-- 
-- ---

DROP TABLE IF EXISTS `Messages`;
    
CREATE TABLE `Messages` (
  id int NOT NULL,
  username VARCHAR(15),
  message text,
  time TIMESTAMP,
  room VARCHAR(20),
  PRIMARY KEY (id)
);

-- ---
-- Table 'Rooms'
-- 
-- ---

DROP TABLE IF EXISTS `Rooms`;
    
CREATE TABLE `Rooms` (
  id int NOT NULL,
  RoomName VARCHAR(20),
  PRIMARY KEY (id)
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE Friendships ADD FOREIGN KEY (user) REFERENCES usernames (id);
ALTER TABLE Friendships ADD FOREIGN KEY (friend) REFERENCES usernames (id);
ALTER TABLE Messages ADD FOREIGN KEY (username) REFERENCES usernames (id);
ALTER TABLE Messages ADD FOREIGN KEY (room) REFERENCES Rooms (id);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `usernames` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Friends` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Messages` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `Rooms` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `usernames` (`id`,`Name`) VALUES
-- ('','');
-- INSERT INTO `Friends` (`id`,`user`,`friend`) VALUES
-- ('','','');
-- INSERT INTO `Messages` (`id`,`username`,`Text`,`timestamp`,`roomName`) VALUES
-- ('','','','','');
-- INSERT INTO `Rooms` (`id`,`Room Name`) VALUES
-- ('','');

/* You can also create more tables, if you need them... */

/*  Execute this file from the command line by typing:
 *    mysql < schema.sql
 *  to create the database and the tables.*/
