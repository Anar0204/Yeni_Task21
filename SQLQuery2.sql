CREATE DATABASE Imdb

USE Imdb

CREATE TABLE Movies(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(30),
Point INT
)

CREATE TABLE Actors(
Id INT PRIMARY KEY IDENTITY(1,1),
[Name] NVARCHAR(30),
Point INT
)

ALTER TABLE Movies ADD ActorId INT  


ALTER TAbLE Movies ADD FOREIGN KEY (ActorId) REFERENCES Actors(Id)

CREATE TABLE Directors(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30)
)

ALTER TABLE Movies ADD DirectorId INT

ALTER TABLE Movies ADD FOREIGN KEY (DirectorId) REFERENCES Directors(Id)

CREATE TABLE Genres(
Id INT PRIMARY KEY IDENTITY,
[Name] NVARCHAR(30))

CREATE TABLE MovieGenre (
Id INT ,
MovieId INT,
GenreId INT,
PRIMARY KEY (MovieId, GenreId,Id),
FOREIGN KEY (MovieId) REFERENCES Movies(Id),
FOREIGN KEY (GenreId) REFERENCES Genres(Id)
);

DROP TABLE MovieGenre

SELECT M.[Name], M.Point,D.Name FROM Movies AS M
JOIN  Directors AS D ON D.Id =M.DirectorId
JOIN  Actors AS A ON A.Id = M.ActorId
JOIN  MovieGenre AS MG ON MG.MovieId = M.GenreId
Join  Genres AS G ON G.Id = MG.GenreId
Where M.Point >6