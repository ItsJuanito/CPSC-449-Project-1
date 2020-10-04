PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    username VARCHAR primary key
);

INSERT INTO users(username) VALUES ('johndoe');
COMMIT;