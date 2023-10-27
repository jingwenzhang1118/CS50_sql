-- To read sql file use command `source file.sql`
-- To restart the existing docker container use command docker container start mysql, and then reconnect to mysql server
-- Display tables: SHOW TABLES;
-- check schema of tables: DESCRIBE table_name;
-- quit sql: EXIT

CREATE TABLE `users` (
    `id` INT UNSIGNED,
    -- varchar uses bytes up to the limit to save data, car always use the specified bytes to save data.
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `schools` (
    `id` INT UNSIGNED,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `type` ENUM('Primary', 'Secondary', 'Higher Education') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    `year_found` YEAR NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `companies` (
    `id` INT UNSIGNED,
    `name` VARCHAR(64) NOT NULL UNIQUE,
    `industry` ENUM('Technology', 'Education', 'Business') NOT NULL,
    `location` VARCHAR(64) NOT NULL,
    PRIMARY KEY(`id`)
);

CREATE TABLE `conn_people` (
    `id` INT UNSIGNED,
    `user1_id` INT UNSIGNED NOT NULL,
    `user2_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user1_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`user2_id`) REFERENCES `users`(`id`)
);

CREATE TABLE `conn_schools` (
    `id` INT UNSIGNED,
    `user_id` INT UNSIGNED NOT NULL,
    `school_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    `degree` VARCHAR(16) NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);

CREATE TABLE `conn_companies` (
    `id` INT UNSIGNED,
    `user_id` INT UNSIGNED NOT NULL,
    `comp_id` INT UNSIGNED NOT NULL,
    `start_date` DATE NOT NULL,
    `end_date` DATE NOT NULL,
    PRIMARY KEY(`id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`comp_id`) REFERENCES `companies`(`id`)
);

