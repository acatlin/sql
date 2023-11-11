-- ice_cream.sql
-- updated 11-Nov-2023
-- crosstab functionality is implemented differently in different RDBMSs,
--   e.g. Microsoft PIVOT
-- example is from Anthony DeBarros's Practical SQL, 2nd edition
-- https://github.com/anthonydb/practical-sql-2/

-- run CREATE EXTENSION once
-- CREATE EXTENSION tablefunc;

DROP TABLE IF EXISTS ice_cream_survey;

CREATE TABLE ice_cream_survey (
  response_id integer PRIMARY KEY,
  office text,
  flavor text
);

COPY ice_cream_survey
FROM 'c:\Data\ice_cream_survey.csv'
WITH (FORMAT CSV, HEADER);

SELECT * FROM ice_cream_survey;

-- your task is to write a cross tab function to generate
-- the results in wide format

SELECT office, 
	   flavor,
	   COUNT(*)
FROM ice_cream_survey
GROUP BY office, flavor
ORDER BY office;

SELECT flavor 
			   FROM ice_cream_survey
			   GROUP BY flavor
			   ORDER BY flavor;

SELECT *
FROM crosstab('SELECT office, 
			          flavor,
			          COUNT(*)
			   FROM ice_cream_survey
			   GROUP BY office, flavor
			   ORDER BY office',
			 
			  'SELECT flavor 
			   FROM ice_cream_survey
			   GROUP BY flavor
			   ORDER BY flavor')
AS (office text,
   chocolate bigint,
   strawberry bigint,
   vanilla bigint);






