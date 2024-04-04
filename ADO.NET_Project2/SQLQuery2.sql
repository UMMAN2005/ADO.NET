CREATE DATABASE Organization

USE Organization

CREATE TABLE [Events] (
	Id INT PRIMARY KEY IDENTITY,
	[Name] VARCHAR(50),
	[Description] TEXT,
	[Address] NVARCHAR(100),
	StartDate DATE,
	StartTime TIME,
	EndTime TIME
)

CREATE TABLE Speakers (
	Id INT PRIMARY KEY IDENTITY,
	FullName VARCHAR(50),
	Position VARCHAR(100),
	Company VARCHAR(50),
	ImageUrl NVARCHAR(100)
)

CREATE TABLE EventSpeakers (
	EventId INT FOREIGN KEY REFERENCES [Events](Id),
	SpeakerId INT FOREIGN KEY REFERENCES Speakers(Id)
)