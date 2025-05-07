USE disaster_management;

ALTER TABLE users
ADD COLUMN user_type ENUM('admin', 'volunteer', 'donor') NOT NULL AFTER email;