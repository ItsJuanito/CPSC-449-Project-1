PRAGMA foreign_keys=ON;
BEGIN TRANSACTION;
DROP TABLE IF EXISTS users;
CREATE TABLE users (
    username VARCHAR(20) primary key,
    password VARCHAR(100),
    email VARCHAR(40)
);

DROP TABLE IF EXISTS followerlist;
CREATE TABLE followerlist (
    username VARCHAR(20),
    follower VARCHAR(20),
    PRIMARY KEY (username, follower),
    FOREIGN KEY (username) REFERENCES users(username)
);
/*
DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    id int IDENTITY(1,1) NOT NULL primary key,
    text VARCHAR(200),
    TIMESTAMP DATE,
    author VARCHAR(20),
    FOREIGN KEY (author) REFERENCES users(username)
);

*/

INSERT INTO users(username,password,email) VALUES ('apatriche0','zenBdE','grutigliano0@uiuc.edu');
INSERT INTO users(username,password,email) VALUES ('naleso1','9BLyYSgNclK','cshildrick1@bloomberg.com');
INSERT INTO users(username,password,email) VALUES ('ghobden2','JoV7tSiK','jmaund2@guardian.co.uk');
INSERT INTO users(username,password,email) VALUES ('cprodrick3','OKkRvbX','dhann3@barnesandnoble.com');
INSERT INTO users(username,password,email) VALUES ('cferrarone4','DptrjL6UCh','afinlater4@cisco.com');

INSERT INTO followerlist(username,follower) VALUES ('apatriche0','apatriche0');
INSERT INTO followerlist(username,follower) VALUES ('naleso1','naleso1');
INSERT INTO followerlist(username,follower) VALUES ('ghobden2','ghobden2');
INSERT INTO followerlist(username,follower) VALUES ('cprodrick3','cprodrick3');
INSERT INTO followerlist(username,follower) VALUES ('cferrarone4','cferrarone4');

INSERT INTO followerlist(username,follower) VALUES ('naleso1','apatriche0');
INSERT INTO followerlist(username,follower) VALUES ('cferrarone4','cprodrick3');
INSERT INTO followerlist(username,follower) VALUES ('naleso1','ghobden2');
INSERT INTO followerlist(username,follower) VALUES ('ghobden2','cferrarone4');
INSERT INTO followerlist(username,follower) VALUES ('cferrarone4','apatriche0');


COMMIT;