create database ipl ;
use ipl;

-- IMport the data using CSV files and Rename the Tables
alter table matches_2024 rename matches;
alter table deliveries_2024 rename deliveries;

-- Q1. Matches that held on MUmbai
select * from matches
where  venue= "mumbai" ; 

-- Q2. Total Matches played by Every teams
select team1 , count(*) as matched_played
from matches
group by team1;

-- Q3. total matches win by mumbai
SELECT COUNT(*) as mumbai_wins
FROM matches
WHERE winner = 'MI' AND venue = 'mumbai';

-- Q4. Total Matches winner team 
select winner ,count( *) as wins
from matches
group by winner 
order by wins desc limit 5;

-- Q4. Total matche between MI and CSK
SELECT COUNT(*) AS total_matches
FROM matches
WHERE (team1 = 'CSK' AND team2 = 'MI') OR (team1 = 'MI' AND team2 = 'CSK');

-- Q5.Matches played between teams and Total Runs
SELECT m.match_id, m.team1, m.team2, SUM(d.total_runs) AS total_runs
FROM matches m
JOIN deliveries d ON m.match_id = d.match_id
GROUP BY m.match_id, m.team1, m.team2
ORDER BY total_runs DESC;

-- Q6.Maximum Sixes hitted by batsman
SELECT batsman, COUNT(*) AS sixes
FROM deliveries
WHERE runs_batsman = 6 
GROUP BY batsman
ORDER BY sixes DESC;

-- Q7. Total sixes in mumbai 
SELECT d.batsman, COUNT(*) AS sixes
FROM deliveries d
JOIN matches m ON d.match_id = m.match_id
WHERE d.runs_batsman = 1 AND m.venue = 'Mumbai'
GROUP BY d.batsman
ORDER BY sixes DESC;

-- Q8. Total runs in every matches
SELECT match_id, SUM(total_runs) AS match_runs
FROM deliveries
GROUP BY match_id
ORDER BY match_runs DESC;