CREATE DATABASE 'catalog';

CREATE TABLE music_album(
  on_spotify BOOLEAN
) INHERITS (item);

CREATE TABLE genre(
  id SERIAL PRIMARY KEY,
  name VARCHAR
);

CREATE TABLE item(
  id SERIAL PRIMARY KEY,
  genre_id INT,
  author_id INT,
  source_id INT,
  label_id INT,
  publish_date DATE,
  archived BOOLEAN,
  FOREIGN KEY (genre_id) REFERENCES genre(id),
  FOREIGN KEY (author_id) REFERENCES author(id),
  FOREIGN KEY (label_id) REFERENCES label(id)
);

CREATE TABLE book(
    id INT GENERATED ALWAYS AS IDENTITY,
    genre_id INT,
    author_id INT,
    source_id INT,
    label_id INT,
    publish_date DATE,
    archived BOOLEAN,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    PRIMARY KEY(id),
    CONSTRAINT fk_genre
    FOREIGN KEY(genre_id) 
	REFERENCES genre(id)
	ON DELETE CASCADE,
    CONSTRAINT fk_author
    FOREIGN KEY(author_id) 
	REFERENCES author(id)
	ON DELETE CASCADE,
    CONSTRAINT fk_label
    FOREIGN KEY(label_id) 
	REFERENCES label(id)
	ON DELETE CASCADE
);

CREATE TABLE label(id INT GENERATED ALWAYS AS IDENTITY, title VARCHAR(255), color VARCHAR(255), PRIMARY KEY(id));

CREATE TABLE label_book (
    id INT GENERATED ALWAYS AS IDENTITY,
    book_id INT,
    label_id INT,
    UNIQUE(id),
    CONSTRAINT fk_label
    FOREIGN KEY(label_id) 
	REFERENCES label(id)
	ON DELETE CASCADE,
    CONSTRAINT fk_book
    FOREIGN KEY(book_id) 
	REFERENCES book(id)
	ON DELETE CASCADE );


create TABLE game(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    multiplayer BOOLEAN,
    last_played_at DATE,
    publish_date DATE,
    archived BOOLEAN,
    genre_id INTEGER,
    FOREIGN KEY(genre_id) REFERENCES genre(id),
    author_id INTEGER,
    FOREIGN KEY(author_id) REFERENCES author(id)
);

create TABLE author(
    id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
    first_name VARCHAR(255),
    last_name VARCHAR(255)
);

create TABLE author_game(
    author_id INTEGER,
    game_id INTEGER,
    FOREIGN KEY(author_id) REFERENCES author(id),
    FOREIGN KEY(game_id) REFERENCES game(id)
);