-- median_high_temps_by_city.sql
-- crosstab functionality is implemented differently in different RDBMSs,
--   e.g. Microsoft PIVOT
-- example is from Anthony DeBarros's Practical SQL, 2nd edition
-- https://github.com/anthonydb/practical-sql-2/

CREATE TABLE temperature_readings (
    station_name text,
    observation_date date,
    max_temp integer,
    min_temp integer,
    CONSTRAINT temp_key PRIMARY KEY (station_name, observation_date)
);

COPY temperature_readings
FROM 'C:\Data\temperature_readings.csv'
WITH (FORMAT CSV, HEADER);

SELECT * FROM temperature_readings;

/*
Write query that returns three columns: 
  first column names rows, 
  second column names columns, 
  third column is cell values
*/

SELECT
  station_name,
  date_part('month', observation_date),
  percentile_cont(.5)
     WITHIN GROUP (ORDER BY max_temp)
FROM temperature_readings
GROUP BY station_name,
           date_part('month', observation_date)
ORDER BY station_name;

/* 
wite query that returns set of category names for columns
*/

SELECT month
FROM generate_series(1,12) month;


SELECT *
FROM crosstab('SELECT
                  station_name,
                  date_part(''month'', observation_date),
                  percentile_cont(.5)
                      WITHIN GROUP (ORDER BY max_temp)
               FROM temperature_readings
               GROUP BY station_name,
                        date_part(''month'', observation_date)
               ORDER BY station_name',

              'SELECT month
               FROM generate_series(1,12) month')

AS (station text,
    jan numeric(3,0),
    feb numeric(3,0),
    mar numeric(3,0),
    apr numeric(3,0),
    may numeric(3,0),
    jun numeric(3,0),
    jul numeric(3,0),
    aug numeric(3,0),
    sep numeric(3,0),
    oct numeric(3,0),
    nov numeric(3,0),
    dec numeric(3,0)
);
