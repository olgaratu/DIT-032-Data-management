--SQL3.1 Construct a query to display the following result, which lists the appointment in the month of April only with names of the students and lecturers.

SELECT a.aptid, a.aptdate, s.studentid, s.name, l.lecturerid, l.name
FROM (student AS s
         INNER JOIN appointment AS a ON s.studentid = a.studentid
         INNER JOIN lecturer AS l ON a.lecturerid = l.lecturerid)
WHERE a.aptdate BETWEEN '2014-04-01 ' and '2014-04-30'
ORDER BY a.aptdate;

--SQL3.2 Construct a query to display the LecturerID, Lecturer Name, Postion_ID, AptID and StudentID for Lecturers with PositionID= ‘DS52’sorting the data by Lecturer Name and AptID as shown in the following result.

SELECT l.lecturerid, name, positionid, aptid, studentid
FROM (lecturer l
         JOIN appointment a ON l.lecturerid = a.lecturerid)
WHERE positionid = 'DS52'
ORDER BY l.name, a.aptdate;

--SQL3.3 Construct  a query  to display  the  name,  birthplace  and  gender of  all  students  that  have appointment with lecturer named Ahmad (assuming that Ahmad’s LecturerID is LC35).

SELECT name, birthplace, gender
FROM (student s
         JOIN appointment a ON s.studentid = a.studentid)
WHERE lecturerid = 'LC35';

--SQL3.4.Assuming that Ahmad’s LecturerID is not known, construct a query to display the name, birth place and gender of all students that have appointment with lecturer named Ahmad.
-- Hints: Use the Query of the SQL4.3.

SELECT s.name, s.birthplace, s.gender
FROM (student s
         JOIN appointment a ON s.studentid = a.studentid
         JOIN lecturer l ON a.lecturerid = l.lecturerid)
WHERE l.name = 'Ahmad';