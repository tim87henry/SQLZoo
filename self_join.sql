SELECT COUNT(id) FROM stops

SELECT id FROM stops
WHERE name='Craiglockhart'

SELECT stops.id,stops.name
FROM stops,route
WHERE stops.id=route.stop AND route.company='LRT' AND route.num=4;


SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*)=2


SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 and b.stop=149


SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='London Road'


SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=115 and b.stop=137
GROUP BY company,num


SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'
  AND stopb.name='Tollcross'


SELECT stopb.name,a.company, b.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart'


SELECT
  a.num AS Num1, a.comp AS Comp1, a.transfer AS Transfer, b.num AS Num2, b.comp AS Comp2
FROM
  (SELECT DISTINCT a.num AS num, a.company AS comp, stopb.name AS transfer
  FROM
    route AS a
  JOIN
    route AS b ON a.company = b.company AND a.num = b.num
  JOIN
    stops AS stopa ON a.stop = stopa.id
  JOIN
    stops AS stopb ON b.stop = stopb.id
  WHERE
    stopa.name = 'Craiglockhart') AS a
  JOIN
  (SELECT DISTINCT a.num AS num, a.company AS comp, stopb.name AS transfer
  FROM
    route AS a
  JOIN
    route AS b ON a.company = b.company AND a.num = b.num
  JOIN
    stops AS stopa ON a.stop = stopa.id
  JOIN
    stops AS stopb ON b.stop = stopb.id
  WHERE
    stopa.name = 'Lochend') AS b ON a.transfer = b.transfer
ORDER BY
  Num1,Transfer, Num2;