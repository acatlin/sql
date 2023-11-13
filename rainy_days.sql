/* rainy_days.sql

1. In Your Google BigQuery sandbox, run these queries separately, and be able to explain them.
2. Are there fewer bicycle rentals on rainy days?  (And who would find this information helpful?)
3. "Package these queries up" as common table expressions, then join the two CTEs to
   answer the question, "Are there fewer bicycle rentals on rainy days?"
4. Extra: Can you ask and answer another (useful to someone) question of the two datasets?

Source: Google Big Query: The Definitive Guide, Laskhmanan and Tigani
*/ 

SELECT
  date,
  (MAX(prcp) > 5) AS rainy
FROM (
  SELECT
    wx.date AS date,
    IF (wx.element = 'PRCP', wx.value/10, NULL) AS prcp
  FROM
    `bigquery-public-data.ghcn_d.ghcnd_2016` AS wx
  WHERE
    wx.id = 'USW00094728'
)
GROUP BY
 date;


SELECT
    COUNT(starttime) as num_trips,
    EXTRACT(DATE from starttime) as trip_date
 FROM `bigquery-public-data.new_york_citibike.citibike_trips`
 GROUP BY trip_date;

