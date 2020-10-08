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

DROP TABLE IF EXISTS posts;
CREATE TABLE posts (
    id INTEGER PRIMARY KEY,
    text VARCHAR(250),
    timestamp DATE,
    author VARCHAR(20),
    FOREIGN KEY (author) REFERENCES users(username)
);



INSERT INTO users(username,password,email) VALUES ('apatriche0','zenBdE','grutigliano0@uiuc.edu');
INSERT INTO users(username,password,email) VALUES ('naleso1','9BLyYSgNclK','cshildrick1@bloomberg.com');
INSERT INTO users(username,password,email) VALUES ('ghobden2','JoV7tSiK','jmaund2@guardian.co.uk');
INSERT INTO users(username,password,email) VALUES ('cprodrick3','OKkRvbX','dhann3@barnesandnoble.com');
INSERT INTO users(username,password,email) VALUES ('cferrarone4','DptrjL6UCh','afinlater4@cisco.com');


INSERT INTO followerlist(username,follower) VALUES ('apatriche0','naleso1');
INSERT INTO followerlist(username,follower) VALUES ('apatriche0','ghobden2');
INSERT INTO followerlist(username,follower) VALUES ('apatriche0','cprodrick3');
INSERT INTO followerlist(username,follower) VALUES ('apatriche0','cferrarone4');
INSERT INTO followerlist(username,follower) VALUES ('naleso1','apatriche0');
INSERT INTO followerlist(username,follower) VALUES ('cferrarone4','cprodrick3');
INSERT INTO followerlist(username,follower) VALUES ('naleso1','ghobden2');
INSERT INTO followerlist(username,follower) VALUES ('ghobden2','cferrarone4');
INSERT INTO followerlist(username,follower) VALUES ('cferrarone4','apatriche0');
INSERT INTO followerlist(username,follower) VALUES ('cprodrick3','apatriche0');
INSERT INTO followerlist(username,follower) VALUES ('cprodrick3','naleso1');
INSERT INTO followerlist(username,follower) VALUES ('cprodrick3','ghobden2');

INSERT INTO posts(text,timestamp,author) VALUES ('Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.','2019-11-25 00:14:00','ghobden2');
INSERT INTO posts(text,timestamp,author) VALUES ('Phasellus in felis. Donec semper sapien a libero. Nam dui.','2020-02-02 07:26:49','naleso1');
INSERT INTO posts(text,timestamp,author) VALUES ('Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.','2020-04-13 07:33:36','apatriche0');
INSERT INTO posts(text,timestamp,author) VALUES ('Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.','2019-10-12 10:56:32','ghobden2');
INSERT INTO posts(text,timestamp,author) VALUES ('Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.','2019-10-24 04:45:58','cprodrick3');
INSERT INTO posts(text,timestamp,author) VALUES ('Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.','2019-12-27 00:30:58','apatriche0');
INSERT INTO posts(text,timestamp,author) VALUES ('Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.','2020-03-31 00:37:34','naleso1');
INSERT INTO posts(text,timestamp,author) VALUES ('Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.','2019-10-17 11:04:55','cferrarone4');
INSERT INTO posts(text,timestamp,author) VALUES ('Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.','2020-03-09 08:17:11','cferrarone4');
INSERT INTO posts(text,timestamp,author) VALUES ('Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.','2020-02-11 12:01:01','cferrarone4');
INSERT INTO posts(text,timestamp,author) VALUES ('Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.','2020-05-15 10:56:55','naleso1');
INSERT INTO posts(text,timestamp,author) VALUES ('Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.','2020-02-12 04:43:26','cprodrick3');
INSERT INTO posts(text,timestamp,author) VALUES ('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.','2020-05-04 08:51:33','apatriche0');
INSERT INTO posts(text,timestamp,author) VALUES ('Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.','2020-08-19 14:51:30','ghobden2');
INSERT INTO posts(text,timestamp,author) VALUES ('Phasellus in felis. Donec semper sapien a libero. Nam dui.','2020-02-10 12:52:40','cprodrick3');
INSERT INTO posts(text,timestamp,author) VALUES ('Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.','2020-07-14 02:03:30','apatriche0');
INSERT INTO posts(text,timestamp,author) VALUES ('Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.','2020-05-10 01:45:20','apatriche0');
INSERT INTO posts(text,timestamp,author) VALUES ('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.','2019-10-28 09:19:27','ghobden2');
INSERT INTO posts(text,timestamp,author) VALUES ('In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.','2020-09-12 13:12:31','ghobden2');
INSERT INTO posts(text,timestamp,author) VALUES ('Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.','2020-02-11 00:10:00','naleso1');
INSERT INTO posts(text,timestamp,author) VALUES ('Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.','2020-06-06 04:37:27','naleso1');
INSERT INTO posts(text,timestamp,author) VALUES ('Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.','2020-09-16 03:04:14','cprodrick3');
INSERT INTO posts(text,timestamp,author) VALUES ('Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.','2019-10-30 07:52:18','apatriche0');
INSERT INTO posts(text,timestamp,author) VALUES ('Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.','2020-07-07 14:26:34','cferrarone4');
INSERT INTO posts(text,timestamp,author) VALUES ('Sed ante. Vivamus tortor. Duis mattis egestas metus.','2020-09-22 18:39:00','ghobden2');
INSERT INTO posts(text,timestamp,author) VALUES ('In congue. Etiam justo. Etiam pretium iaculis justo.','2020-06-28 11:23:02','naleso1');
INSERT INTO posts(text,timestamp,author) VALUES ('Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio. Curabitur convallis.','2020-06-16 01:20:23','cprodrick3');
INSERT INTO posts(text,timestamp,author) VALUES ('Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.','2019-11-26 19:47:16','ghobden2');
INSERT INTO posts(text,timestamp,author) VALUES ('Sed ante. Vivamus tortor. Duis mattis egestas metus.','2019-10-20 00:56:36','ghobden2');
INSERT INTO posts(text,timestamp,author) VALUES ('Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.','2020-03-01 08:24:18','naleso1');



COMMIT;