CREATE TABLE IF NOT EXISTS `table_name` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255),
  PRIMARY KEY `pk_id`(`id`)
) ENGINE = InnoDB;

explain SELECT
  *
FROM `sales_promotion`
WHERE `unique_key` = '20180101/1';

alter TABLE sales_promotion add UNIQUE uniq_id_unique_key(unique_key,id);

alter TABLE sales_promotion drop KEY uniq_id_unique_key;