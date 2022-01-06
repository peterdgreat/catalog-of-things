CREATE DATABASE 'catalog';

CREATE TABLE item(
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genres(id),
  FOREIGN KEY (author_id) REFERENCES authors(id),
  FOREIGN KEY (source_id) REFERENCES sources(id),
  FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE music_album(
  on_spotify BOOLEAN
) INHERITS (item);

CREATE TABLE genre(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);
