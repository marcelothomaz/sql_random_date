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

# Copyright (c) 2018 Marcelo M. Thomaz

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
