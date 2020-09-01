SELECT matchid,player FROM goal 
  WHERE teamid='GER'

SELECT id,stadium,team1,team2
  FROM game WHERE id=1012

SELECT player,teamid, stadium,mdate
  FROM game JOIN goal ON (game.id=goal.matchid) WHERE teamid='GER'

SELECT team1,team2, player
  FROM game JOIN goal ON (game.id=goal.matchid) WHERE player LIKE 'Mario%'

SELECT player, teamid, coach,gtime
  FROM goal JOIN eteam ON (teamid=id)
 WHERE gtime<=10

SELECT mdate,teamname FROM game JOIN eteam ON (team1=eteam.id)
 WHERE coach='Fernando Santos'

SELECT player from goal JOIN game ON (matchid=id) 
WHERE stadium='National Stadium, Warsaw'

SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (teamid!='GER' and (team1='GER' OR team2='GER')) 

SELECT teamname, COUNT(teamname)
  FROM eteam JOIN goal ON id=teamid
GROUP BY teamname
 
SELECT stadium, COUNT(stadium)
  FROM game JOIN goal ON id=matchid
  GROUP BY stadium
 
SELECT matchid,mdate, COUNT(mdate)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY goal.matchid,game.mdate
 
SELECT matchid,mdate, COUNT(mdate)
  FROM game JOIN goal ON matchid = id 
 WHERE teamid='GER'
GROUP BY goal.matchid,game.mdate
 
SELECT mdate,
  team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) as score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) as score2
  FROM game LEFT JOIN goal ON matchid = id 
  GROUP BY game.mdate,game.team1,game.team2
  ORDER BY mdate,matchid,team1,team2

SELECT id, title
 FROM movie
 WHERE yr=1962

SELECT yr FROM movie
WHERE title='Citizen Kane'

SELECT id,title,yr FROM movie
WHERE title LIKE '%Star Trek%'
ORDER BY yr

SELECT id FROM actor
WHERE name='Glenn Close'

SELECT id FROM movie
WHERE title='Casablanca'

SELECT name FROM casting JOIN actor ON (actorid=id)
WHERE movieid=11768

SELECT name FROM casting JOIN actor ON (actorid=id) JOIN movie ON (movieid=movie.id)
WHERE title='Alien'

SELECT title FROM casting JOIN actor ON (actorid=id) JOIN movie ON (movieid=movie.id)
WHERE name='Harrison Ford'

SELECT title FROM casting JOIN actor ON (actorid=id) JOIN movie ON (movieid=movie.id)
WHERE name='Harrison Ford' and ord<>1

SELECT title,name FROM casting JOIN actor ON (actorid=id) JOIN movie ON (movieid=movie.id)
WHERE yr=1962 and ord=1

movie -> id 	title 	yr 	director 	budget 	gross
actor -> id 	name
casting-> movieid 	actorid 	ord

SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

SELECT title,name FROM movie JOIN casting ON (movieid=movie.id) JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Julie Andrews'))
AND ord=1

SELECT name FROM actor JOIN casting ON (actorid=actor.id)
WHERE ord=1 
GROUP BY name
HAVING COUNT(NAME)>=15

SELECT title,COUNT(actorid) FROM movie JOIN casting ON (movieid=movie.id) 
WHERE yr=1978
GROUP BY title
ORDER BY COUNT(actorid) DESC,title

SELECT name FROM movie JOIN casting ON (movieid=movie.id) JOIN actor ON (actorid=actor.id)
WHERE movie.id IN (SELECT movieid FROM casting
WHERE actorid IN (
  SELECT id FROM actor
  WHERE name='Art Garfunkel')) AND name<>'Art Garfunkel'
