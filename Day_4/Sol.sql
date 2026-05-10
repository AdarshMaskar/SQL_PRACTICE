select * from entries;

WITH
total_visits AS (
SELECT 
NAME,COUNT(1) AS TOTAL_VISITS, 
GROUP_CONCAT(DISTINCT RESOURCES SEPARATOR ',') AS RESOURCES_USED
FROM ENTRIES
GROUP BY NAME
), 
floor_visited AS (
SELECT name, floor, count(*) as no_of_floors_visited,
RANK() OVER (PARTITION BY name ORDER BY count(*) DESC) as rn
from entries 
group by name, floor
)

SELECT tv.NAME,fv.floor as MOST_VISITED_FLOOR, tv.TOTAL_VISITS, tv.RESOURCES_USED
FROM total_visits tv
JOIN floor_visited fv 
ON tv.NAME = fv.name
WHERE fv.rn = 1;


