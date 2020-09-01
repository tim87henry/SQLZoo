SELECT name FROM teacher
WHERE dept IS NULL

SELECT teacher.name, dept.name
 FROM teacher INNER JOIN dept
           ON (teacher.dept=dept.id)
 
SELECT teacher.name, dept.name
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)
 
SELECT teacher.name, dept.name
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)

SELECT name,COALESCE(mobile,'07986 444 2266')
FROM teacher

SELECT teacher.name, COALESCE(dept.name,'None')
 FROM teacher LEFT JOIN dept
           ON (teacher.dept=dept.id)

SELECT COUNT(name),COUNT(mobile)
FROM teacher

SELECT dept.name,COUNT(teacher.name)
 FROM teacher RIGHT JOIN dept
           ON (teacher.dept=dept.id)
GROUP BY dept.name

SELECT name,
CASE WHEN dept IN (1,2) THEN 'Sci' ELSE 'Art' END dept
 FROM teacher


SELECT name,
CASE WHEN dept IN (1,2) THEN 'Sci'
     WHEN dept=3 then 'Art'
     ELSE 'None' END dept
 FROM teacher 