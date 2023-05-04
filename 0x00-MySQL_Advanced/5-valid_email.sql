-- Write a SQL script that creates a trigger
-- that resets the attribute valid_email only
CREATE TRIGGER ren
AFTER UPDATE
ON `users`
FOR EACH ROW
@email = NEW.`email`;
