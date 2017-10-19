# Respect the DATETIME format YYYY-MM-DD HH24:MI:SS
# Always use two digits, except for the year which is 4 digits

SET @MIN = '2013-12-20 00:00:00'; # this is the START date
SET @MAX = '2013-12-24 00:00:00'; # this is the END date of the range
SET @TABLE_NAME = 'teste'; # name of the table that will be udpated
SET @COL_NAME = 'campo'; # name of the column that will receive the aleatory datetime

#####################################################################################
# DO NOT CHANGE ANYTHING BELOW HERE - unless you know what you are doing
#####################################################################################

SET @s = CONCAT('UPDATE ',@TABLE_NAME,' SET ',@COL_NAME,' = TIMESTAMPADD(SECOND, FLOOR(RAND() * TIMESTAMPDIFF(SECOND, \'',@MIN,'\',\'',@MAX,'\')),\'',@MIN,'\')');

PREPARE stmt1 FROM @s; 
EXECUTE stmt1; 
DEALLOCATE PREPARE stmt1; 

# Testing part - hardcoded tablename
SELECT * FROM teste;
