-- ---------------------------- 
-- Table structure for character_friends
-- ---------------------------- 
CREATE TABLE IF NOT EXISTS `character_friends` ( 
  `char_id` INT NOT NULL default 0,
  `friend_id` INT NOT NULL DEFAULT 0,
  `relation` INT NOT NULL DEFAULT 0,
  PRIMARY KEY  (`char_id`,`friend_id`) 
);
