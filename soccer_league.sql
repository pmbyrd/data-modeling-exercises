DROP DATABASE soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league;

CREATE TABLE team (
    id SERIAL PRIMARY KEY,
    team_name TEXT NOT NULL
);

CREATE TABLE player (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL, 
    team_name_id INTEGER REFERENCES team ON DELETE CASCADE
);

CREATE TABLE refree (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
);

CREATE TABLE match_date (
    id SERIAL PRIMARY KEY,
    m_date TEXT NOT NULL
);

CREATE TABLE match (
    id SERIAL PRIMARY KEY,
    team1 TEXT NOT NUll,
    team2 TEXT NOT NULL,
    team_id INTEGER REFERENCES team ON DELETE CASCADE,
    match_date_id INTEGER REFERENCES match_date ON DELETE CASCADE
);

CREATE TABLE game (
    id SERIAL PRIMARY KEY,
    goals TEXT,
    player_id INTEGER REFERENCES player ON DELETE CASCADE
);

INSERT INTO team (team_name)
VALUES ('Sharks'), ('Bears'), ('Wolves'), ('Jets');


