CREATE TABLE teams (
    id SERIAL NOT NULL PRIMARY KEY,
    name text NOT NULL
);

CREATE TABLE players (
    id SERIAL NOT NULL PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL,
    team_id INT NOT NULL REFERENCES teams
);

CREATE TABLE referees (
    id SERIAL NOT NULL PRIMARY KEY,
    first_name text NOT NULL,
    last_name text NOT NULL
);

CREATE TABLE matches (
    id SERIAL NOT NULL PRIMARY KEY,
    date DATE NOT NULL,
    team_1_id INT REFERENCES teams,
    team_2_id INT REFERENCES teams,
    referee_id INT REFERENCES referees,
    winner_id INT REFERENCES teams
);

CREATE TABLE goals_scored (
    id SERIAL NOT NULL PRIMARY KEY,
    match_id INT REFERENCES matches,
    player_id INT REFERENCES players
);