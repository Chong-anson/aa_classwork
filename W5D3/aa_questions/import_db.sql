PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

CREATE TABLE users(
  id INTEGER PRIMARY KEY,
  fname TEXT,
  lname TEXT
);

CREATE TABLE questions(
  id INTEGER PRIMARY KEY,
  title TEXT,
  body TEXT,
  author_id INTEGER NOT NULL,
  author TEXT NOT NULL, 
  FOREIGN KEY (author_id) REFERENCES users(id) 
);

CREATE TABLE question_follows(
  id INTEGER PRIMARY KEY, 
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id), 
  FOREIGN KEY (question_id) REFERENCES questions(id) 
);

CREATE TABLE replies(
  id INTEGER PRIMARY KEY,
  body TEXT, 
  question_id INTEGER NOT NULL,
  reply_follow INTEGER,
  user_id INTEGER NOT NULL, 
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (reply_follow) REFERENCES replies(id),
  FOREIGN KEY (user_id) REFERENCES users(id) 
);

CREATE TABLE question_likes(
  id INTEGER,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);



INSERT INTO 
  users (id,fname, lname)
VALUES
  (0, "Joe", "Stein"),
  (1, "Jill", "Rose"),
  (2, "Hello", "World"),
  (3, "John", "Wick"),
  (4, "Iron", "Man"),
  (5, "Billy", "Bob"),
  (6, "Captain", "America");


INSERT INTO 
  questions (id, title, body, author_id, author)
VALUES
  (0,"Why?", "whywhywhy", 1, "Joe"),
  (1,"no?", "nonono", 0, "Jill"),
  (2, "yes?", "hell world", 4, "Hello World"),
  (3, "where is my dog?", "boogeyman", 3, "John Wick"),
  (4, "so what?", "infinity", 4, "Tony Stark"),
  (5, "heyyyyy?", "where's my car?", 5, "Billy Bob"),
  (6, "where is Peggy?", "america", 6, "Capt.");

INSERT INTO
  replies (id, body, question_id, user_id, reply_follow)
VALUES 
  (0,"Why?", 2, 1, NULL),
  (1,"no?", 5, 4, NULL),
  (2, "yes?", 5, 2, 1),
  (3, "where is my dog?", 1, 3, NULL),
  (4, "so what?", 1, 4, 3),
  (5, "heyyyyy?", 2, 5, NULL),
  (6, "where is Peggy?", 1, 6, 3);

INSERT INTO
  question_follows (id, user_id, question_id)
VALUES 
  (0,2,4),
  (1,3,4),
  (2,6,3),
  (3,4,3),
  (4,3,4),
  (5,3,6),
  (6,1,5);

INSERT INTO
  question_likes (id, user_id, question_id)
VALUES 
  (0,2,4),
  (1,3,4),
  (2,6,3),
  (3,4,3),
  (4,1,4),
  (5,3,2),
  (6,1,5);