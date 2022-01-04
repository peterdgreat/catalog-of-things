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
    CONSTRAINT fk_source
    FOREIGN KEY(source_id) 
	REFERENCES source(id)
	ON DELETE CASCADE,
    CONSTRAINT fk_label
    FOREIGN KEY(label_id) 
	REFERENCES label(id)
	ON DELETE CASCADE
);

CREATE TABLE labele(id INT GENERATED ALWAYS AS IDENTITY, title VARCHAR(255), color VARCHAR(255), PRIMARY KEY(id));

CREATE TABLE item_book (
    id INT GENERATED ALWAYS AS IDENTITY,
    item_id INT,
    label_id INT,
    UNIQUE(id),
    CONSTRAINT fk_label
    FOREIGN KEY(label_id) 
	REFERENCES label(id)
	ON DELETE CASCADE,
    CONSTRAINT fk_item
    FOREIGN KEY(item_id) 
	REFERENCES item(id)
	ON DELETE CASCADE );