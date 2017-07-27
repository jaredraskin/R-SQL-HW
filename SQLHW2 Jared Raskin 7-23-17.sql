DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS Reviewers;

CREATE TABLE Videos
(UniqueID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
VideoTitle VARCHAR(50) NOT NULL,
VideoLength INT NULL,
URL VARCHAR(200) NULL);

INSERT INTO Videos
(VideoTitle, VideoLength, URL)
VALUES
('CreateMySQLDatabase', 1034, 'https://www.youtube.com/watch?v=K6w0bZjl_Lw'),
('IntroToMySQLWorkbench', 704, 'https://www.youtube.com/watch?v=RSHevYMwCVw'),
('MySQLTutorial', 2469, 'https://www.youtube.com/watch?v=yPu6qV5byu4'),
('MySQLBeginner', 620, 'https://www.youtube.com/watch?v=nN4Kjdverzs');

CREATE TABLE Reviewers
(Username VARCHAR(30) NOT NULL,
Rating INT NULL,
Review VARCHAR(50) NOT NULL,
VideoID INT NOT NULL REFERENCES Videos,
PRIMARY KEY (Username,VideoID));

INSERT INTO Reviewers
(Username, Rating, Review, VideoID)
VALUES
('EdHead', 5, 'Great', 1),
('MoreLikeBedHead', 1, 'Boring', 1),
('DeruloDerules', 5, 'TheBest', 3),
('JDFan', 5, 'Super', 3),
('CaliforniaKid', 5, 'Fantastic', 2),
('EastCoaster', 3, 'Ehh', 2);

SELECT *
FROM Videos
INNER JOIN Reviewers
ON Videos.UniqueID = Reviewers.VideoID