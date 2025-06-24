SELECT COUNT(*) AS TotalStudents FROM Students;

SELECT COUNT(*) AS TotalEnrollments FROM Enrollments;

SELECT CourseID, AVG(Rating) AS AvgRating
FROM Enrollments
GROUP BY CourseID;

SELECT InstructorID, COUNT(*) AS CourseCount
FROM Courses
GROUP BY InstructorID;

SELECT CategoryID, COUNT(*) AS CourseCount
FROM Courses
GROUP BY CategoryID;

SELECT CourseID, COUNT(*) AS EnrolledStudents
FROM Enrollments
GROUP BY CourseID;

SELECT CategoryID, AVG(Price) AS AvgPrice
FROM Courses
GROUP BY CategoryID;

SELECT MAX(Price) AS MaxCoursePrice FROM Courses;

SELECT CourseID,
       MIN(Rating) AS MinRating,
       MAX(Rating) AS MaxRating,
       AVG(Rating) AS AvgRating
FROM Enrollments
GROUP BY CourseID;

SELECT COUNT(*) AS FiveStarRatings
FROM Enrollments
WHERE Rating = 5;

-- INTERMEDIATE LEVEL 

SELECT CourseID, AVG(CompletionPercent) AS AvgCompletion
FROM Enrollments
GROUP BY CourseID;

SELECT StudentID, COUNT(*) AS CoursesEnrolled
FROM Enrollments
GROUP BY StudentID
HAVING COUNT(*) > 1;

SELECT c.CourseID, c.Title, COUNT(e.EnrollmentID) AS Enrollments,
       c.Price * COUNT(e.EnrollmentID) AS Revenue
FROM Courses c
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY c.CourseID, c.Title, c.Price;

SELECT i.FullName, COUNT(DISTINCT e.StudentID) AS UniqueStudents
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName;

SELECT CategoryID, AVG(CourseEnrollments) AS AvgEnrollments
FROM (
    SELECT Courses.CategoryID, Courses.CourseID, COUNT(e.EnrollmentID) AS CourseEnrollments
    FROM Courses
    LEFT JOIN Enrollments e ON Courses.CourseID = e.CourseID
    GROUP BY Courses.CategoryID, Courses.CourseID
) AS CategoryStats
GROUP BY CategoryID;

SELECT i.FullName, AVG(e.Rating) AS AvgInstructorRating
FROM Instructors i
JOIN Courses c ON i.InstructorID = c.InstructorID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY i.FullName;

SELECT TOP 3 Courses.CourseID, Courses.Title, COUNT(Enrollments.EnrollmentID) AS EnrollmentCount
FROM Courses
JOIN Enrollments ON Courses.CourseID = Enrollments.CourseID
GROUP BY Courses.CourseID, Courses.Title
ORDER BY EnrollmentCount DESC;

SELECT Enrollments.CourseID,
       AVG(CompletionPercent * 1.0) AS AvgCompletionPercent,
       AVG(CompletionPercent * 1.0) AS AvgCompletionDays
FROM Enrollments
WHERE CompletionPercent = 100
GROUP BY Enrollments.CourseID;

SELECT Enrollments.CourseID,
       COUNT(CASE WHEN CompletionPercent = 100 THEN 1 END) * 100.0 / COUNT(*) AS CompletionRate
FROM Enrollments
GROUP BY Enrollments.CourseID;

SELECT YEAR(PublishDate) AS YearPublished, COUNT(*) AS CourseCount
FROM Courses
GROUP BY YEAR(PublishDate);
