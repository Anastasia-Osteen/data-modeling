-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE artists
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  INSERT INTO artists
    (name)
  VALUES
    ('Hanson'),
    ('Queen'),
    ('Mariah Carey'),
    ('Boyz II Men');

  ------------------------------------------------------

  CREATE TABLE producers
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  INSERT INTO producers
    (name)
  VALUES
    ('Dust Brothers'),
    ('Stephen Lironi'),
    ('Roy Thomas Baker'),
    ('Walter Afanasieff');

  ------------------------------------------------------

  CREATE TABLE albums
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  INSERT INTO albums
    (name)
  VALUES
    ('Middle of Nowhere'),
    ('A Night at the Opera'),
    ('Daydream');

  ------------------------------------------------------

  CREATE TABLE songs
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    duration_in_seconds INTEGER NOT NULL,
    album_id INT REFERENCES albums,
    release_date DATE NOT NULL
  );

  INSERT INTO songs
    (name, duration_in_seconds, album_id, release_date)
  VALUES
    ('MMMBop', 238, 1, '04-15-1997'),
    ('Bohemian Rhapsody', 355, 2, '10-31-1975'),
    ('One Sweet Day', 282, 3, '11-14-1995');

  ------------------------------------------------------

  CREATE TABLE credits
  (
    id SERIAL PRIMARY KEY,
    song_id INT NOT NULL REFERENCES SONGS,
    artist_id INT REFERENCES artists,
    producer_id INT REFERENCES producers
  );

  INSERT INTO credits
    (song_id, artist_id, producer_id)
  VALUES
    -- MMMBop
    (1, 1, NULL),
    (1, NULL, 1),
    (1, NULL, 2),
    -- Bohemian Rhapsody
    (2, 2, NULL),
    (2, NULL, 3),
    -- One Sweet Day
    (3, 3, NULL),
    (3, 4, NULL),
    (3, NULL, 4);