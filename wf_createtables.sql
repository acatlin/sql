DROP TABLE IF EXISTS afc_east;
DROP TABLE IF EXISTS teams;

CREATE TABLE afc_east
(
  game_date date NOT NULL,
  home_team varchar(10) NOT NULL,
  away_team varchar(10) NOT NULL,
  home_points int NOT NULL,
  away_points int NOT NULL
);

CREATE TABLE teams
(
  team_name varchar(10) NOT NULL
);

INSERT INTO afc_east VALUES ('2019-12-21', 'Patriots', 'Bills', 24, 17);
INSERT INTO afc_east VALUES ('2019-12-29', 'Patriots', 'Dolphins', 24, 27);
INSERT INTO afc_east VALUES ('2019-10-21', 'Jets', 'Patriots', 0, 33);
INSERT INTO afc_east VALUES ('2019-09-29', 'Bills', 'Patriots', 10, 16);
INSERT INTO afc_east VALUES ('2019-09-22', 'Patriots', 'Jets', 30, 14);
INSERT INTO afc_east VALUES ('2019-09-15', 'Dolphins', 'Patriots', 0, 43);
INSERT INTO afc_east VALUES ('2019-12-08', 'Jets', 'Dolphins', 22, 21);
INSERT INTO afc_east VALUES ('2019-11-17', 'Dolphins', 'Bills', 20, 37);
INSERT INTO afc_east VALUES ('2019-11-03', 'Dolphins', 'Jets', 26, 18);
INSERT INTO afc_east VALUES ('2019-10-20', 'Bills', 'Dolphins', 31, 21);
INSERT INTO afc_east VALUES ('2019-12-29', 'Bills', 'Jets', 6, 13);
INSERT INTO afc_east VALUES ('2019-09-08', 'Jets', 'Bills', 16, 17);

INSERT INTO teams 
  SELECT DISTINCT home_team 
  FROM afc_east;

SELECT * FROM afc_east
  ORDER BY home_team, game_date;