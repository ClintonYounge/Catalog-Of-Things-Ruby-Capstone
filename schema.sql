CREATE TABLE Item (
  id SERIAL PRIMARY KEY,
  published_date DATE NOT NULL,
  archived BOOLEAN NOT NULL,
  genre_id INT,
  author_id INT,
  label_id INT,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES Author(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  items ARRAY[1000]
);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,
  items ARRAY[1000]
);

CREATE TABLE Author (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  items ARRAY[1000]
);

CREATE TABLE Game (
  id SERIAL PRIMARY KEY,
  multiplayer VARCHAR(100) NOT NULL,
  last_played_at DATE NOT NULL,
  item_id INT NOT NULL,
  FOREIGN KEY (item_id) REFERENCES Item(id)
);

CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  publisher VARCHAR(255),
  cover_state VARCHAR(255),
  published_date DATE,
  item_id INT NOT NULL,
  FOREIGN KEY (item_id) REFERENCES Item(id)
);

CREATE TABLE music_albums (
  on_spotify BOOLEAN NOT NULL,
  can_be_archived BOOLEAN NOT NULL
  item_id INT NOT NULL,
  FOREIGN KEY (item_id) REFERENCES Item(id)
);
