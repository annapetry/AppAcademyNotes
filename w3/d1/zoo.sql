SELECT 
  population 
FROM 
  world
WHERE 
  name = 'Germany'
  
SELECT 
  name, gdp/population
FROM 
  world
WHERE 
  area > 5000000
  
SELECT 
  name, continent
FROM 
  world
WHERE 
  area < 2000
  AND 
    gdp > 5000000000
    
SELECT 
  name, population 
FROM 
  world
WHERE 
  name 
  IN 
    ('Finland', 'Norway', 'Sweden', 'Denmark')
    
SELECT 
  name 
FROM 
  world
WHERE 
  name 
LIKE 
  'G%'
  
SELECT 
  name, area/1000 
FROM 
  world
WHERE 
  area BETWEEN 200000 AND 250000
  
SELECT 
  name 
FROM 
  world
WHERE 
  population > 200000000
  
SELECT
  name, gdp/population
FROM
  world
WHERE
  population > 200000000
  
  
  
SELECT
  name, population/1000000
FROM
  world
WHERE
  continent = 'South America'
  
  
  
SELECT
  name, population
FROM
  world
WHERE
  name
  IN
  ('France', 'Germany', 'Italy')
  
SELECT
  name
FROM
  world
WHERE
  name
  LIKE
  '%United%'
  

SELECT 
  yr, subject, winner
FROM 
  nobel
WHERE 
  yr = 1950
  
SELECT
  winner
FROM
  nobel
WHERE
  yr = 1962
  AND
  subject = 'Literature'

  
SELECT
  yr, subject
FROM
  nobel
WHERE
  winner = 'Albert Einstein'
  
SELECT
  winner
FROM
  nobel
WHERE
  yr >= 2000
  AND
  subject = 'Peace'
  
  
SELECT
  *
FROM
  nobel
WHERE
  subject = "Literature"
  AND
  yr BETWEEN 1980 AND 1989
  
SELECT
  *
FROM
  nobel
WHERE
winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jed Bartlet', 'Jimmy Carter')

SELECT
  winner
FROM
  nobel
WHERE
  winner
  LIKE "John%"
  
SELECT
  p.yr
FROM
  (SELECT
    yr 
  FROM
    nobel
  WHERE
    subject = 'Physics') AS p
WHERE
p.yr NOT in (SELECT
    yr
  FROM
    nobel
  WHERE
    subject = 'Chemistry')
    GROUP BY
    p.yr
    ORDER BY
    p.yr DESC
    
    
SELECT
  name
FROM
  world
WHERE
  population > 
  (SELECT
    population
  FROM
    world
  WHERE
    name = 'Russia')
    
    
SELECT
  name
FROM
  world
WHERE
  gdp/population >
  (SELECT
    gdp/population
  FROM
    world
  WHERE
    name = "United Kingdom")
  AND
    continent = 'Europe'
    
SELECT
  name, continent
FROM
  world
WHERE
  continent = 
    (SELECT
      continent
    FROM
      world
    WHERE
      name = "Belize")
  OR
  continent = 
    (SELECT
      continent
    FROM
      world
    WHERE
      name = "Belgium")

SELECT
  name, population
FROM
  world
WHERE
  population BETWEEN
  (SELECT 
    population
  FROM
    world
  WHERE
    name = "Canada")
  AND
  (SELECT 
    population
  FROM
    world
  WHERE
    name = "Poland")
    
SELECT
  name
FROM
  world
WHERE
  gdp > ALL
  (SELECT 
    gdp 
  FROM
    world
  WHERE
    continent = 'Europe'
    AND
    gdp IS NOT NULL)
    
    
SELECT 
  continent, name, area
FROM 
  world x
WHERE 
  area >= ALL
    (SELECT 
      area 
    FROM 
      world y
    WHERE 
      y.continent = x.continent
     AND 
       area > 0)
       

       -- Aggregate Functions
    
SELECT DISTINCT
  continent
FROM
  world
    
    
SELECT SUM(gdp)
FROM
  world
WHERE
  continent = "Africa"
    
SELECT Count(name)
FROM 
  world
WHERE
  area > 1000000
  
SELECT SUM(population)
FROM
  world
WHERE
  name IN ('France','Germany','Spain')
  
SELECT 
  continent, COUNT(name)
FROM
  world
GROUP BY continent

SELECT
  continent, COUNT(name)
FROM
  world
WHERE
  population > 10000000
GROUP BY 
  continent
  
SELECT
  continent
FROM
  world x
GROUP BY
  continent
HAVING
  100000000 < SUM(population)

  -------------------join tutorial
  
SELECT
  matchid, player
FROM 
  goal
WHERE
  teamid = 'GER'  
  
SELECT
  id, stadium, team1, team2
FROM
  game
WHERE
  id = 1012
  
SELECT
  player, teamid, mdate
FROM
  goal
JOIN
  game
ON 
  id = matchid
WHERE
  teamid = 'GER'
  
SELECT
  team1, team2, player
FROM
  goal
JOIN
  game
ON 
  id = matchid
WHERE
  player LIKE 'Mario%'
  
SELECT
  player, teamid, coach, gtime
FROM
  goal
JOIN
  eteam
ON
  teamid = id
WHERE
  gtime <= 10

SELECT
  mdate, teamname
FROM
  game
JOIN
  eteam
ON
  team1 = eteam.id
WHERE
  coach = "Fernando Santos"
  
  
SELECT
  player
FROM
  game
JOIN
  goal
ON
  id = matchid
WHERE
  stadium = 'National Stadium, Warsaw'
  
SELECT DISTINCT
  player
FROM 
  game 
JOIN 
  goal 
ON 
  matchid = id 
WHERE 
  (team1 = 'GER' OR team2 = "GER")
  AND teamid != "GER"


SELECT
  teamname, count(teamid)
FROM
  goal
JOIN
  eteam
ON
  teamid = id
GROUP BY
  teamname
  
SELECT
  stadium, count(matchid) goal_count
FROM
  game
JOIN
  goal
ON
  id = matchid
GROUP BY
  stadium
  
  
SELECT
  matchid, mdate, count(teamid) goal_count
FROM
  game
JOIN 
  goal
ON
  matchid = id
WHERE
  team1 = 'POL' OR team2 = 'POL'
GROUP BY
  matchid
  
SELECT
  matchid, mdate, COUNT(teamid)
FROM
  game
JOIN
  goal
ON
  matchid = id
WHERE 
  teamid = 'GER'
GROUP BY 
  matchid  
  
SELECT 
  mdate, team1, 
  SUM(CASE WHEN teamid=team1 
    THEN 1 
    ELSE 0 
    END) score1,
  team2,
  SUM(CASE WHEN teamid=team2
    THEN 1
    ELSE 0
    END) score2
FROM 
  game 
LEFT OUTER JOIN 
  goal 
ON 
  matchid = id
GROUP BY
  id
ORDER BY
  mdate, matchid, team1, team2


  -------------------more joining
  
SELECT
  yr
FROM
  movie
WHERE
  title = 'Citizen Kane'
  
SELECT
  id, title, yr
FROM
  movie
WHERE
title 
  LIKE '%Star Trek%'
ORDER BY
  yr

SELECT
  title
FROM
  movie
WHERE
id IN (11768, 11955, 21191)
    
SELECT
  id
FROM
  actor
WHERE
  name = "Glenn Close"
  
SELECT 
  id
FROM
  movie
WHERE
  title = "Casablanca"
  
SELECT
  name
FROM
  actor
JOIN
  casting
ON
  id = actorid
WHERE
  movieid = 11768
    
SELECT 
  name
FROM
  movie
JOIN
  casting
ON
  movie.id = movieid
JOIN
  actor
ON
  actor.id = actorid
WHERE
  movie.title = "Alien"    
    
    
SELECT
  title
FROM
  movie
JOIN
  casting
ON
  movie.id = movieid
JOIN
  actor
ON
  actor.id = actorid
WHERE
  actor.name = 'Harrison Ford'
    
    
SELECT
  title
FROM
  movie
JOIN
  casting
ON
  movie.id = movieid
JOIN
  actor
ON
  actor.id = actorid
WHERE
  actor.name = 'Harrison Ford'
  AND
  ord != 1
  
SELECT
  title, name
FROM
  movie
JOIN
  casting
ON
  movie.id = movieid
JOIN 
  actor
ON
  actor.id = actorid
WHERE
  yr = 1962
  AND 
  ord = 1

SELECT 
  yr,COUNT(title) 
FROM
  movie
JOIN 
  casting
ON 
  movie.id = movieid
JOIN 
  actor
ON 
  actorid = actor.id
WHERE 
  name = 'John Travolta'
GROUP BY 
  yr
HAVING 
  COUNT(title) > 2
  
  
  
  
SELECT
  title, name
FROM
  movie
JOIN
  casting
ON
  movie.id = movieid
JOIN
  actor
ON
  actor.id = actorid
WHERE
ord = 1 AND
movieid IN (
  SELECT 
    movieid 
  FROM 
    casting
  WHERE 
    actorid 
    IN (
      SELECT 
        id 
      FROM 
        actor
      WHERE 
        name='Julie Andrews') 
)

SELECT
  name
FROM 
  movie
JOIN
  casting
ON
  movie.id = movieid
JOIN
  actor
ON  
  actor.id = actorid
WHERE
  ord = 1
GROUP BY
  name
HAVING
  count(title) >= 30
  
SELECT
  title, COUNT(actorid) AS cast_size
FROM
  movie
JOIN
  casting
ON
  movie.id = movieid
JOIN
  actor
ON
  actor.id = actorid
WHERE
  yr = 1978
GROUP BY
  title
ORDER BY
  cast_size DESC
  
  
SELECT DISTINCT
  name
FROM
  casting
JOIN
  actor
ON
  actor.id = actorid
WHERE
  name != 'Art Garfunkel'
  AND
  movieid IN (
    SELECT 
      movieid 
    FROM 
      casting
    WHERE 
      actorid 
      IN (
        SELECT 
          id 
        FROM 
          actor
        WHERE 
          name = 'Art Garfunkel'))
          
--------- Using NULL -----


SELECT
  name
FROM
  teacher
WHERE
  dept IS NULL


SELECT
  teacher.name, dept.name
FROM
  teacher
LEFT OUTER JOIN
  dept
ON
  teacher.dept = dept.id
  
SELECT
  teacher.name, dept.name
FROM
  teacher
RIGHT OUTER JOIN
  dept
ON
  teacher.dept = dept.id
  
SELECT
  name, COALESCE(mobile, '07986 444 2266') mobile
FROM 
  teacher

SELECT
  teacher.name, COALESCE(dept.name, "None") dept
FROM
  teacher
LEFT OUTER JOIN
  dept
ON
  teacher.dept = dept.id
  
SELECT
  COUNT(name), COUNT(mobile)
FROM
  teacher

SELECT
  dept.name, COUNT(teacher.name) teachers
FROM
  teacher
RIGHT OUTER JOIN
  dept
ON
  teacher.dept = dept.id
GROUP BY
  dept.name

SELECT
  name, (CASE 
  WHEN dept = 1 OR dept = 2
  THEN 'Sci'
  ELSE "Art"
  END) dept
FROM
  teacher
  

SELECT
  name, (CASE 
  WHEN dept = 1 OR dept = 2
  THEN 'Sci'
  WHEN dept = 3
  THEN "Art"
  ELSE "None"
  END) dept
FROM
  teacher
  
  
  ------------------------SELF JOIN
  
SELECT
  COUNT(id)
FROM
  stops
  
SELECT
  id
FROM
  stops
WHERE
  name = 'Craiglockhart'
  
  
SELECT
  id, name
FROM
  stops
JOIN
  route
ON
  id = stop
WHERE
  num = 4
  AND
  company = 'LRT'

SELECT 
  company, num, COUNT(*)
FROM 
  route 
WHERE 
  stop = 149 OR stop = 53
GROUP BY 
  company, num
HAVING 
  count(*) > 1

SELECT 
  a.company, a.num, a.stop, b.stop
FROM 
  route a 
JOIN 
  route b 
ON
  (a.company=b.company AND a.num=b.num)
JOIN
  stops
ON
  id = b.stop
WHERE 
  a.stop = 53
  AND
  name = 'London Road'


SELECT 
  a.company, a.num, stopa.name, stopb.name
FROM 
  route a 
JOIN 
  route b 
ON
  (a.company = b.company AND a.num = b.num)
JOIN 
  stops stopa 
ON 
  (a.stop=stopa.id)
JOIN 
  stops stopb 
ON 
  (b.stop=stopb.id)
WHERE 
  stopa.name = 'Craiglockhart'
  AND
  stopb.name = 'London Road'



SELECT DISTINCT
  b.company, b.num
FROM
  route a
JOIN
  route b
ON
  (a.company = b.company AND a.num = b.num)
WHERE
  (a.stop = 115 AND b.stop = 137)



















    

  