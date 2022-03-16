-- talent_ddl.sql

DROP TABLE IF EXISTS talents;
DROP TABLE IF EXISTS team_members;
DROP TABLE IF EXISTS team_member_talents;

CREATE TABLE talents
(
  talent_id int,
  talent varchar(20)
);

CREATE TABLE team_members(
  team_member_id int,
  team_member varchar(20)
);

CREATE TABLE team_member_talents(
  team_member_id int,
  talent_id int
);

INSERT INTO talents
  (talent_id, talent)
VALUES
  (1, 'Project management');
  
INSERT INTO talents (talent_id, talent) VALUES (2, 'Data wrangling');
INSERT INTO talents (talent_id, talent) VALUES (3, 'Data analysis');
INSERT INTO talents (talent_id, talent) VALUES (4, 'Subject expertise');
INSERT INTO talents (talent_id, talent) VALUES (5, 'Design');
INSERT INTO talents (talent_id, talent) VALUES (6, 'Storytelling');

INSERT INTO talents
  (talent_id, talent)
VALUES
  (1, 'Project management');
  
INSERT INTO team_members (team_member_id, team_member) VALUES (1, 'Anand');
INSERT INTO team_members (team_member_id, team_member) VALUES (2, 'Cameron');
INSERT INTO team_members (team_member_id, team_member) VALUES (3, 'Emily');
INSERT INTO team_members (team_member_id, team_member) VALUES (4, 'Kevin');
INSERT INTO team_members (team_member_id, team_member) VALUES (5, 'Roberto');
INSERT INTO team_members (team_member_id, team_member) VALUES (6, 'Stephani');
INSERT INTO team_members (team_member_id, team_member) VALUES (7, 'Susan');
INSERT INTO team_members (team_member_id, team_member) VALUES (8, 'Xia_Li');

INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (1,5);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (1,6);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (2,2);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (3,1);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (4,1);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (4,2);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (5,2);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (5,3);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (5,4);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (5,5);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (6,4);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (6,5);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (7,3);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (7,4);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (8,3);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (8,4);
INSERT INTO team_member_talents (team_member_id, talent_id) VALUES (8,6);

SELECT * FROM talents;
SELECT * FROM team_members;
SELECT * FROM team_member_talents;

SELECT t.talent_id, talent, COUNT(*)
  FROM team_member_talents tmt INNER JOIN talents t 
    ON tmt.talent_id = t.talent_id
  GROUP BY t.talent_id, t.talent
  ORDER BY t.talent_id;