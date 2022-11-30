DROP DATABASE air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic;

CREATE TABLE airline (
    id SERIAL PRIMARY KEY,
    airline_name TEXT NOT NULL
);

CREATE TABLE departure (
    id SERIAL PRIMARY KEY,
    from_city TEXT NOT NULL,
    from_country TEXT NOT NULL
);

CREATE TABLE arrival (
    id SERIAL PRIMARY KEY,
    to_city TEXT NOT NULL, 
    to_country TEXT NOT NULL
);

CREATE TABLE ticket (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL, 
    last_name TEXT NOT NULL,
    seat TEXT NOT NULL,
    departure_id INTEGER REFERENCES departure,
    arrival_id INTEGER REFERENCES arrival
);

INSERT INTO airline(airline_name)
VALUES ('JET BLUE'), ('Spirit'), ('American Airlines');

INSERT INTO departure (from_city, from_country)
VALUES ('San Francisco', 'USA'), ('Oakland', 'USA'), ('London', 'England');

INSERT INTO arrival (to_city, to_country)
VALUES ('Los Angelos', 'USA'), ('Las Vegas', 'USA'), ('Pisa', 'Italy');

INSERT INTO ticket (first_name, last_name, seat, departure_id, arrival_id)
VALUES ('Perriesha', 'Byrd', '33A', 3, 3),
('Clifford', 'Byrd', '33A', 1, 3), ('Perrie', 'Harrison', '33A', 2, 3);
