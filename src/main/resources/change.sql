ALTER TABLE `account`
MODIFY COLUMN `income`  decimal(11,2) NOT NULL DEFAULT 0 AFTER `account_book_id`,
MODIFY COLUMN `outcome`  decimal(11,2) NOT NULL DEFAULT 0 AFTER `income`,
MODIFY COLUMN `balance`  decimal(11,2) NOT NULL DEFAULT 0 AFTER `outcome`;


ALTER TABLE `account_book`
MODIFY COLUMN `income`  decimal(11,2) NOT NULL DEFAULT 0.00 AFTER `create_user`,
MODIFY COLUMN `outcome`  decimal(11,2) NOT NULL DEFAULT 0.00 AFTER `income`,
MODIFY COLUMN `balance`  decimal(11,2) NOT NULL DEFAULT 0.00 AFTER `outcome`;



