
/* Assignment – SQL One to Many Relationships

In this assignment, we’ll practice working with one-to-many relationships in SQL. Suppose you are tasked with keeping
track of a database that contain the best “how-to” videos on MySQL.
You may want to first create a new database (schema) for this assignment.

1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, the title of the
video, the length in minutes, and the URL. Populate the table with at least three related videos from YouTube or
other publicly available resources.

*/
-- DROP DATABASE videos;
CREATE DATABASE videos;

CREATE TABLE `videos`.`tbl_movie` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `Title` VARCHAR(100) NULL,
  `RunningTime` INT NULL,
  `URL` VARCHAR(1000) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC));
    
INSERT INTO videos.tbl_movie (Title, RunningTime, URL) 
VALUES 
('Bob Dylan - I Want You',6,'https://www.youtube.com/watch?v=Q_0yaRVLeJ8'),
('Kristen Stewart - Marylou (On the Road)',11,'https://www.youtube.com/watch?v=wTg74MJzBaI'),
('Bob Dylan - A Series of Dreams',6,'https://www.youtube.com/watch?v=AgqGUBP3Cx0'),
('Kristen Stewart - Clouds of Sils Maria',9,'https://www.youtube.com/watch?v=FHf9p-TRZlo'),
('Bob Dylan - Sweetheart Like You',4,'https://www.youtube.com/watch?v=PpRKstHl7Y0'),
('Kristen Stewart - Speak',4,'https://www.youtube.com/watch?v=1rD8jVR84LQ'),
('Bob Dylan - Knockin On Heavens Door',8,'https://www.youtube.com/watch?v=-jPg2M1UYgU'),
('Kristen Stewart - Bella`s Depression',4,'https://www.youtube.com/watch?v=g4gEFZ0TJ8o'),
('Bob Dylan and Norah Jones - I Shall Be Released',5,'https://www.youtube.com/watch?v=FySFa6H7w-M'),
('Kristen Stewart - I`m Sorry (Adventureland)',6,'https://www.youtube.com/watch?v=ZlGg7QIlGp8'),
('Bob Dylan and the Band - Forever Young',5,'https://www.youtube.com/watch?v=jtFEzhaNrT4');

/*
2. Create and populate Reviewers table. Create a second table that provides at least two user reviews for each of
at least two of the videos. These should be imaginary reviews that include columns for the user’s name
(“Asher”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review
(“Loved it!”). There should be a column that links back to the ID column in the table of videos.
*/

CREATE TABLE `videos`.`tbl_review` (
  `ID` INT NOT NULL AUTO_INCREMENT,
  `MovieID` INT NOT NULL,
  `ReviewedBy` VARCHAR(100) NULL,
  `Rating` INT NULL,
  `ReviewText` VARCHAR(1000) NULL,
  PRIMARY KEY (`ID`),
  UNIQUE INDEX `ID_UNIQUE` (`ID` ASC),
  INDEX `fk_MovieID_idx` (`MovieID` ASC),
  CONSTRAINT `fk_MovieID`
    FOREIGN KEY (`MovieID`)
    REFERENCES `videos`.`tbl_movie` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

INSERT INTO videos.tbl_Review (MovieID, ReviewedBy, Rating, ReviewText) 
VALUES
(4,'Zaphod',4,'The scenes are reminiscent of Dylan`s `A Series of Dreams`'),
(4,'Ford',5,'Like Dylan, Stewart is not performing, she is being'),
(2,'Zaphod',3,'Reads like a video for Dylan`s `I Want You`'),
(2,'Ford',3,'Stewart`s character is a foil for overarching desire');


-- 3. Report on Video Reviews. Write a JOIN statement that shows information from both tables

SELECT m.Title, r.Rating, r.ReviewText, m.RunningTime, m.URL FROM videos.tbl_movie m INNER JOIN videos.tbl_review r ON m.ID = r.MovieID
ORDER BY m.ID, r.ID;






