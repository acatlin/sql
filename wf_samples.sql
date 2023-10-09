-- wf_samples.sql

SELECT round(avg(home_points),1) AS home_avg
  FROM afc_east
  ORDER BY home_avg DESC;
  
  -- subquery in from clause
SELECT *,
  (SELECT round(avg(home_points),1) AS home_avg FROM afc_east),
  home_points - (SELECT round(avg(home_points),1) FROM afc_east) AS home_differential
FROM afc_east
  ORDER BY home_team, game_date;
  
 -- window function
SELECT *,
  ROUND(AVG(home_points) OVER(),1) AS home_avg,
  ROUND(home_points - AVG(home_points) OVER(),1) AS home_differential
FROM afc_east
  ORDER BY home_team, game_date;
  
  -- window function
SELECT *,
  ROUND(AVG(home_points) OVER(PARTITION BY home_team),1) AS home_avg,
  ROUND(home_points - AVG(home_points) OVER(PARTITION BY home_team),1) AS home_differential
FROM afc_east
  ORDER BY home_team, game_date;
  
  -- rank window function
SELECT *,
  RANK() OVER(ORDER BY home_points DESC) AS home_rank
FROM afc_east
  ORDER BY home_team, game_date;
  
  -- rank window function with partition
SELECT *,
  RANK() OVER(PARTITION BY home_team ORDER BY home_points DESC) AS home_rank
FROM afc_east
  ORDER BY home_team, game_date;
  
  -- home points to date by team window function
SELECT *,
  SUM(home_points) OVER(PARTITION BY home_team 
       ORDER BY game_date 
       ROWS BETWEEN UNBOUNDED PRECEDING 
       AND CURRENT ROW) AS cum_home_points
FROM afc_east
  ORDER BY home_team, game_date;
  
-- NTILE() BREAKS DATASET UP INTO PIECES.  HOW MIGHT THIS BE USEFUL?
SELECT *,
  NTILE(3) OVER(ORDER BY home_points DESC) 
       AS third
FROM afc_east
  ORDER BY home_team, game_date;