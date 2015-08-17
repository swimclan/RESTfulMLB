CREATE DATABASE restfulmlb;

\c restfulmlb

CREATE TABLE players (id SERIAL PRIMARY KEY, name VARCHAR(255), number integer, weight integer, age integer, throws CHAR(1), bats CHAR(1), batting_average decimal, rbi integer, home_runs integer, steals integer, on_base_percentage decimal, walks integer, position CHAR(2));
