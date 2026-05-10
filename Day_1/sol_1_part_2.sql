select * from icc_world_cup;

with cte as (
select team_1 as team, winner from icc_world_cup
union all
select team_2 as team, winner from icc_world_cup
)

select team, 
count(*) as no_of_matches_played,
count(case when team = winner then 1 end ) as no_of_matches_win,
count(case when team != winner then 1 end ) as no_of_matches_lost
from cte
group by team
order by no_of_matches_win desc;