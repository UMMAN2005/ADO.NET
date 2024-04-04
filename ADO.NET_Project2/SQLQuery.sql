CREATE DATABASE NewSchool

USE NewSchool

CREATE TABLE Groups (
	Id INT PRIMARY KEY IDENTITY,
	[No] VARCHAR(10),
	StartDate DATETIME
)

CREATE TABLE Students (
	Id INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(50),
	GroupId INT FOREIGN KEY REFERENCES Groups(Id)
)

CREATE TABLE Quizzes (
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(20),
	ExeTime DATETIME
)

CREATE TABLE StudentQuiz (
	QuizId INT FOREIGN KEY REFERENCES Quizzes(Id),
	StudentId INT FOREIGN KEY REFERENCES Students(Id),
	Point TINYINT CHECK (Point BETWEEN 0 AND 100)
	PRIMARY KEY (QuizId, StudentId)
)

-- Inserting data into the Groups table
INSERT INTO Groups ([No], StartDate)
VALUES ('Group1', '2023-01-01'),
       ('Group2', '2023-02-01'),
       ('Group3', '2023-03-01')

-- Inserting data into the Students table
INSERT INTO Students (FullName, GroupId)
VALUES ('John Doe', 1),
       ('Jane Smith', 2),
       ('Michael Johnson', 1)

-- Inserting data into the Quizzes table
INSERT INTO Quizzes ([Name], ExeTime)
VALUES ('Quiz1', '2023-04-01'),
       ('Quiz2', '2023-05-01'),
       ('Quiz3', '2023-06-01'),
	   ('Quiz4', '2024-06-01')

-- Inserting data into the StudentQuiz table
INSERT INTO StudentQuiz (QuizId, StudentId, Point)
VALUES (1, 1, 85),
       (1, 2, 90),
       (1, 3, 75),
       (2, 1, 70),
       (2, 2, 95),
       (2, 3, 80),
       (3, 1, 80),
       (3, 2, 85),
       (3, 3, 90)

SELECT *, (SELECT COUNT(Id) FROM Students AS S WHERE S.GroupId = G.Id) AS StudentCount FROM Groups AS G

SELECT MAX(Point) AS MaxPoint FROM StudentQuiz WHERE StudentId = 1

SELECT S.Id, S.FullName, S.GroupId, CEILING(AVG(Point)) AS AveragePoint FROM Students AS S
INNER JOIN StudentQuiz ON StudentId = S.Id
GROUP BY S.Id, S.FullName, S.GroupId

SELECT *, (SELECT [No] FROM Groups AS G WHERE S.GroupId = G.Id) AS GroupNo FROM Students AS S

SELECT G.Id, G.[No], G.StartDate, AVG(SQ.Point) AS GroupAvg FROM Groups AS G
INNER JOIN Students AS S ON S.GroupId = G.Id
INNER JOIN StudentQuiz AS SQ ON SQ.StudentId = S.Id
GROUP BY G.Id, G.[No], G.StartDate

SELECT * FROM Quizzes WHERE Quizzes.ExeTime > GETDATE()

SELECT Q.Id, Q.[Name], Q.ExeTime FROM Quizzes AS Q
LEFT JOIN StudentQuiz AS SQ ON SQ.QuizId = Q.Id
WHERE SQ.StudentId IS NULL

SELECT * FROM Quizzes WHERE Quizzes.ExeTime BETWEEN GETDATE() AND DATEADD(HOUR, 24, GETDATE())
