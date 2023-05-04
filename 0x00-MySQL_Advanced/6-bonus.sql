-- Write a SQL script that creates a stored
-- procedure AddBonus that adds a new 
DELIMITER $$
CREATE PROCEDURE AddBonus (IN user_id  INTEGER, IN project_name VARCHAR(255), IN score INTEGER)
BEGIN
    INSERT IGNORE INTO `projects`(`name`)
    VALUES (`project_name`);
    INSERT INTO `corrections` (`user_id`, `project_id`, `score`)
    VALUES (`user_id`,
        (SELECT `id` FROM `projects`
        WHERE `name` = `project_name`),
        `score`
        );
END $$
DELIMITER ;
