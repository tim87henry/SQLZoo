SELECT name, DAY(whn),
 confirmed, deaths, recovered
 FROM covid
WHERE name = 'Spain'
AND MONTH(whn) = 3
ORDER BY whn

SELECT name, DAY(whn), confirmed,
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3
ORDER BY whn

SELECT name, DAY(whn), confirmed-
   LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND MONTH(whn) = 3
ORDER BY whn


SELECT name, DATE_FORMAT(whn,'%Y-%m-%d'), confirmed-
LAG(confirmed, 1) OVER (PARTITION BY name ORDER BY whn)
 FROM covid
WHERE name = 'Italy'
AND WEEKDAY(whn) = 0
ORDER BY whn

SELECT tw.name, DATE_FORMAT(tw.whn,'%Y-%m-%d'), 
 tw.confirmed-lw.confirmed
 FROM covid tw LEFT JOIN covid lw ON 
  DATE_ADD(lw.whn, INTERVAL 1 WEEK) = tw.whn
   AND tw.name=lw.name
WHERE tw.name = 'Italy' AND WEEKDAY(tw.whn)=0
ORDER BY tw.whn

SELECT 
   name,
   confirmed,
   RANK() OVER (ORDER BY confirmed DESC) rc,
   deaths,
   RANK() OVER (ORDER BY deaths DESC) rc
  FROM covid
WHERE whn = '2020-04-20'
ORDER BY confirmed DESC


SELECT 
   world.name,
   ROUND(100000*confirmed/population,0),
   RANK() OVER (ORDER BY confirmed/population ) rank
  FROM covid JOIN world ON covid.name=world.name
WHERE whn = '2020-04-20' AND population > 10000000
ORDER BY population DESC

