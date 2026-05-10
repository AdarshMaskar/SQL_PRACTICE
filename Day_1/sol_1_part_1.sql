SELECT 
    team_name, 
    COUNT(1) AS no_of_matches_played, 
    SUM(win_flag) AS no_of_matches_won, 
    COUNT(1) - SUM(win_flag) AS no_of_match_loose
FROM
(
    SELECT 
        team_1 AS team_name,
        CASE 
            WHEN team_1 = winner THEN 1 
            ELSE 0 
        END AS win_flag
    FROM icc_world_cup

    UNION ALL

    SELECT 
        team_2 AS team_name,
        CASE 
            WHEN team_2 = winner THEN 1 
            ELSE 0 
        END AS win_flag
    FROM icc_world_cup
) AS t
GROUP BY team_name;