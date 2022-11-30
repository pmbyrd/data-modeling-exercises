DROP DATABASE craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE region (
    id SERIAL PRIMARY KEY,
    city TEXT NOT NULL
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL
);


CREATE TABLE post (
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    post_text TEXT NOT NULL,
    post_location TEXT NOT NULL,
    users_id INTEGER REFERENCES users ON DELETE CASCADE,
    region_id INTEGER REFERENCES region ON DELETE CASCADE
);

CREATE TABLE category (
    id SERIAL PRIMARY KEY,
    category_name TEXT NOT NULL,
    post_id INTEGER REFERENCES post ON DELETE CASCADE
);

INSERT INTO region (city)
VALUES ('San Francisco'), ('Atlanta'), ('Seattle');

INSERT INTO users (username)
VALUES ('pmbyrd'), ('l_simpson'), ('lisa_s');

INSERT INTO post (title, post_text, post_location, users_id, region_id)
VALUES ('chair', 'used chair for $10', 'San Bruno', 1, 1),
('table', 'Vintage Table for $120', 'Daly City', 2, 1);

INSERT INTO category (category_name, post_id)
VALUES ('furniture', 1), ('furniture', 2);

