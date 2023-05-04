-- Write a SQL script that creates a stored
-- procedure ComputeAverageScoreForUser
DELIMITER $$
DROP PROCEDURE IF EXISTS ComputeAverageWeightedScoreForUser;
CREATE PROCEDURE ComputeAverageWeightedScoreForUser()
BEGIN
    UPDATE `users`
    SET average_score = (
        SELECT SUM(`corrections`.`score` * `projects`.`weight`)/SUM(`weight`)
        FROM `corrections`
        INNER JOIN `projects`
        ON `projects`.`id` = `corrections`.`project_id`
        WHERE `corrections`.`user_id` = `users`.`id`);
END $$
DELIMITER ;
