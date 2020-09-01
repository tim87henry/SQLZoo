SELECT lastName, party, votes
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY votes DESC


SELECT party, votes,
       RANK() OVER (ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000024' AND yr = 2017
ORDER BY party


SELECT yr,party, votes,
      RANK() OVER (PARTITION BY yr ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency = 'S14000021'
ORDER BY party,yr


SELECT constituency,party, votes,
RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn,constituency,votes DESC


SELECT constituency,party FROM
(SELECT constituency,party, votes,
RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency BETWEEN 'S14000021' AND 'S14000026'
   AND yr  = 2017
ORDER BY posn,constituency,votes DESC) list
WHERE list.posn=1


SELECT party,COUNT(party) FROM
(SELECT constituency,party, votes,
RANK() OVER (PARTITION BY constituency ORDER BY votes DESC) as posn
  FROM ge
 WHERE constituency LIKE 'S%'
   AND yr  = 2017
ORDER BY posn,constituency,votes DESC) list
WHERE list.posn=1
GROUP BY party

