-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

  CREATE TABLE airlines
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  INSERT INTO airlines
    (name)
  VALUES
    ('United'),
    ('British Airways'),
    ('Delta');

  ------------------------------------------------------

  CREATE TABLE flights
  (
    id SERIAL PRIMARY KEY,
    airline INT NOT NULL REFERENCES airlines,
    departure TIMESTAMP NOT NULL,
    arrival TIMESTAMP NOT NULL,
    from_city TEXT NOT NULL,
    from_country TEXT NOT NULL,
    to_city TEXT NOT NULL,
    to_country TEXT NOT NULL
  );

  INSERT INTO flights
    (departure, arrival, airline, from_city, from_country, to_city, to_country)
  VALUES
    ('2018-04-08 09:00:00', '2018-04-08 12:00:00', 1, 'Washington DC', 'United States', 'Seattle', 'United States'),
    ('2018-12-19 12:45:00', '2018-12-19 16:15:00', 2, 'Tokyo', 'Japan', 'London', 'United Kingdom'),
    ('2018-01-02 07:00:00', '2018-01-02 08:03:00', 3, 'Los Angeles', 'United States', 'Las Vegas', 'United States');

  ------------------------------------------------------

  CREATE TABLE seats
  (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
  );

  INSERT INTO seats
    (name)
  VALUES
    ('33B'),
    ('8A'),
    ('12F');

------------------------------------------------------

  CREATE TABLE passengers
  (
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL
  );

  INSERT INTO passengers
    (first_name, last_name)
  VALUES
    ('Jennifer', 'Finch'),
    ('Thadeus', 'Gathercoal'),
    ('Sonja', 'Pauley');

------------------------------------------------------

  CREATE TABLE tickets
  (
    id SERIAL PRIMARY KEY,
    passenger_id INT REFERENCES passengers,
    flight_id INT REFERENCES flights,
    seat_id INT REFERENCES seats
  );

  INSERT INTO tickets
    (passenger_id, flight_id, seat_id)
  VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);