#Setting up the tables
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Groups;
DROP TABLE IF EXISTS Rooms;
DROP TABLE IF EXISTS Groups_Rooms;

CREATE TABLE Groups
(GroupID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
GroupName VARCHAR(50) NOT NULL);

INSERT INTO Groups
(GroupName)
VALUES
('I.T.'),
('Sales'),
('Administration'),
('Operations');

CREATE TABLE Users
(UserID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
UserName VARCHAR(50) NOT NULL,
GroupID VARCHAR(50) NULL REFERENCES Groups(GroupID));

INSERT INTO Users
(UserName, GroupID)
VALUES
('Modesto', 1),
('Ayine', 1),
('Christopher', 2),
('Cheong woo', 2),
('Saulat', 3),
('Heidy', NULL);

CREATE TABLE Rooms
(RoomID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
RoomName VARCHAR(50) NOT NULL);

INSERT INTO Rooms
(RoomName)
VALUES
('101'),
('102'),
('Auditorium A'),
('Auditorium B');

CREATE TABLE Groups_Rooms
(Groups_RoomsID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
GroupID int NULL REFERENCES Groups(GroupID),
RoomID int NULL REFERENCES Rooms(RoomID));

INSERT INTO Groups_Rooms
(GroupID, RoomID)
VALUES
(1, 1),
(1, 2),
(2, 2),
(2, 3);

#Bullet point 1
SELECT GroupName, UserName
FROM Groups
LEFT JOIN Users
ON Groups.GroupID = Users.GroupID;

#Bullet point 2
SELECT Rooms.RoomName, Groups.GroupName
FROM Rooms
LEFT JOIN Groups_Rooms ON Groups_Rooms.RoomID = Rooms.RoomID
LEFT JOIN Groups ON Groups_Rooms.GroupID = Groups.GroupID;

#Bullet point 3
SELECT UserName, GroupName, RoomName
FROM Users
LEFT JOIN Groups
ON Users.GroupID = Groups.GroupID
LEFT JOIN Groups_Rooms
ON Groups.GroupID = Groups_Rooms.GroupID
LEFT JOIN Rooms
ON Rooms.RoomID = Groups_Rooms.RoomID
ORDER BY UserName, GroupName, RoomName;
