#Question 1
DROP SCHEMA IF EXISTS BuildingEnergy;
CREATE SCHEMA BuildingEnergy;
USE BuildingEnergy;
DROP TABLE IF EXISTS EnergyCategories;
DROP TABLE IF EXISTS EnergyTypes;

#Question 2
CREATE TABLE EnergyCategories
(EnergyCategoryID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
EnergyCategoryName VARCHAR(50) NULL);

INSERT INTO EnergyCategories
(EnergyCategoryName)
VALUES
('Fossil'),
('Renewable');

CREATE TABLE EnergyTypes
(EnergyTypeID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
EnergyTypeName VARCHAR(50) NULL,
EnergyCategoryID INT NULL,
CONSTRAINT FOREIGN KEY (EnergyCategoryID)
REFERENCES EnergyCategories(EnergyCategoryID)
ON UPDATE CASCADE ON DELETE SET NULL);

INSERT INTO EnergyTypes
(EnergyTypeName, EnergyCategoryID)
VALUES
('Electricity', 1),
('Gas', 1),
('Steam', 1),
('Fuel Oil', 1),
('Solar', 2),
('Wind', 2);

#Question 3
SELECT EnergyCategoryName AS 'Energy Category', EnergyTypeName AS 'Energy Type'
FROM EnergyCategories
INNER JOIN EnergyTypes
ON EnergyCategories.EnergyCategoryID = EnergyTypes.EnergyCategoryID;

#Question 4
DROP TABLE IF EXISTS Buildings;
CREATE TABLE Buildings
(BuildingID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
BuildingName VARCHAR(100) NULL);

INSERT INTO Buildings
(BuildingName)
VALUES
('Empire State Building'),
('Chrysler Building'),
('Borough of Manhattan Community College');

DROP TABLE IF EXISTS Buildings_EnergyTypes;
CREATE TABLE Buildings_EnergyTypes
(Buildings_EnergyTypesID INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
BuildingID INT NULL,
EnergyTypeID INT NULL,
CONSTRAINT FOREIGN KEY (BuildingID)
REFERENCES Buildings(BuildingID)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT FOREIGN KEY (EnergyTypeID)
REFERENCES EnergyTypes(EnergyTypeID)
ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO Buildings_EnergyTypes
(BuildingID, EnergyTypeID)
VALUES
(3,5),
(3,1),
(3,3),
(2,1),
(2,3),
(1,1),
(1,2),
(1,3);

#Question 5
SELECT BuildingName AS 'Building Name', EnergyTypeName AS 'Energy Type'
FROM Buildings
LEFT JOIN Buildings_EnergyTypes ON Buildings_EnergyTypes.BuildingID = Buildings.BuildingID
LEFT JOIN EnergyTypes ON Buildings_EnergyTypes.EnergyTypeID = EnergyTypes.EnergyTypeID;

#Question 6
INSERT INTO Buildings
(BuildingName)
VALUES
('Bronx Lion House'),
('Brooklyn Childrens Museum');

INSERT INTO EnergyTypes
(EnergyTypeName, EnergyCategoryID)
VALUES
('Geothermal', 2);

INSERT INTO Buildings_EnergyTypes
(BuildingID, EnergyTypeID)
VALUES
(4,7),
(5,1),
(5,7);

#Question 7
SELECT BuildingName AS 'Building Name', EnergyTypeName AS 'Energy Type', EnergyCategoryName AS 'Energy Category'
FROM Buildings
LEFT JOIN Buildings_EnergyTypes ON Buildings_EnergyTypes.BuildingID = Buildings.BuildingID
LEFT JOIN EnergyTypes ON Buildings_EnergyTypes.EnergyTypeID = EnergyTypes.EnergyTypeID
LEFT JOIN EnergyCategories ON EnergyTypes.EnergyCategoryID = EnergyCategories.EnergyCategoryID
WHERE EnergyTypes.EnergyCategoryID=2;

#Question 8
SELECT EnergyTypeName AS 'Energy Type', COUNT(EnergyTypeName) AS 'Count'
FROM EnergyTypes
RIGHT JOIN Buildings_EnergyTypes ON Buildings_EnergyTypes.EnergyTypeID = EnergyTypes.EnergyTypeID
LEFT JOIN Buildings ON Buildings.BuildingID = Buildings_EnergyTypes.BuildingID
GROUP BY EnergyTypeName
ORDER BY COUNT(EnergyTypeName) DESC;

#Question 9A
#I added the appropriate foreign key constraints above.

#Question 9B
#See attached photo
#I originally created with Excel and it matched the example in the book but I switched to LucidChart so I could use the "one-to-many" line.
#Is there a recommended program to use for creating entity relationship diagrams?

#Question 9C
#See attached PowerPoint
#I enjoyed my first time using Balsamiq.  There were some limitations with using the free web trial though.

#Question 9D
#For a report to show the trends over time, I'm imagining 2 stacked column bar charts (1 of them would be a 100% stacked column bar chart).  
#The x-axis would be the year (or month or decade depending on the request).
#In one of the charts, the y-axis would be the number of buildings broken down by energy type.
#In the other chart, the y-axis would be the percentage of buildings broken down by energy type.
#As the user's eyes scroll to the right of the chart, trends should be visible.
#Attached you will see an example in Excel.

#In order to accomplish this, I would add another table called EnergyTypeStatus.  It would have 2 columns: EnergyTypeStatusID and EnergyTypeStatusName.  The 3 rows would be 'Current', 'No longer current', and 'Future'.
#'Future' would be unnecessary but it would be a way to indicate expected upcoming changes for forecasting purposes.
#'No longer current' would be a way to archive old Energy Type Statuses.  The database consumer would have to know to indicate 'Current' in order to get current information.
#Then, I would add 'EnergyTypeStatusID', 'EnergyTypeStartDate', and 'EnergyTypeEndDate' to the Buildings_EnergyTypes table.
#I'm not sure exactly how to properly pull date information in SQL but hopefully you can create SELECT statements that can pull this information for a point in time given the start and end times being captured.

