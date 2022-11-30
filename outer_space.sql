DROP DATABASE outer_space;

CREATE DATABASE outer_space;

\c outer_space;

CREATE TABLE orbits_around (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE moons (
    id SERIAL PRIMARY KEY,
    moon_name TEXT [] NOT NULL
);

CREATE TABLE planet_name (
    id SERIAL PRIMARY KEY,
    planet_name TEXT NOT NULL,
    orbital_period_in_years FLOAT NOT NULL,
    moons_id INTEGER REFERENCES moons ON DELETE CASCADE
);

CREATE TABLE galaxy (
    id SERIAL PRIMARY KEY,
    galaxy_name TEXT NOT NULL,
    planet_name_id INTEGER REFERENCES planet_name ON DELETE CASCADE
);

--   ('Earth', 1.00, 'The Sun', 'Milky Way', '{"The Moon"}'),
INSERT INTO orbits_around(name)
VALUES ('The Sun');

INSERT INTO moons (moon_name)
VALUES ('{"The moon"}');

INSERT INTO planet_name (planet_name, orbital_period_in_years, moons_id)
VALUES ('Earth', 1.00, 1);

INSERT INTO galaxy (galaxy_name, planet_name_id)
VALUES ('The Milky Way', 1);
