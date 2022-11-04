DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_paginar`(IN `tabla` VARCHAR(50), IN `num_pag` INT, IN `reg_pag` INT)
BEGIN
SET @s = CONCAT( "SELECT * FROM ", tabla, " LIMIT ", (num_pag-1)*reg_pag, ", ", reg_pag );
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;

DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_contar_registros`(IN `tabla` VARCHAR(50))
BEGIN
SET @s = CONCAT( "SELECT COUNT(*) AS cantidad FROM ", tabla);
PREPARE stmt FROM @s;
EXECUTE stmt;
DEALLOCATE PREPARE stmt;
END$$
DELIMITER ;