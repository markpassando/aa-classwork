DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE IF EXISTS questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT NOT NULL,
  author_id INTEGER NOT NULL,

  FOREIGN KEY (author_id) REFERENCES users(id)
);

DROP TABLE IF EXISTS question_follows;

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE IF EXISTS replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  parent_id INTEGER,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

DROP TABLE IF EXISTS question_likes;

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ("Lebron", "James"),
  ("Michael", "Jackson"),
  ("John MF", "Smith");

INSERT INTO
  questions (title, body, author_id)
VALUES
  ('Where do I go?', 'I don''t know where to go', 1),
  ('Who let the dogs out?', 'Who? Who? Who?', (SELECT id FROM users WHERE fname = 'John MF')),
  ('Annie, are you okay?', 'Are you okay, are you okay, Annie?', (SELECT id FROM users WHERE fname = 'Michael'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  (1, 3),
  ((SELECT id FROM users WHERE lname = 'Jackson'), (SELECT id FROM questions WHERE title = 'Where do I go?')),
  (3, 3);

INSERT INTO
  replies (question_id, user_id, body, parent_id)
VALUES
  (2, 1, 'I did', NULL);

INSERT INTO
  question_likes (question_id, user_id)
VALUES
  (2, 2),
  (2, 1),
  (3, 1);
