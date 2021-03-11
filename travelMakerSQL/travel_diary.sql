CREATE TABLE traveler_diary( 
diary_no INT AUTO_INCREMENT PRIMARY KEY, 
title VARCHAR(100) NOT NULL, 
diary VARCHAR(3000) NOT NULL, 
writer VARCHAR(20) NOT NULL, 
regdate DATE ,
marker VARCHAR(3000)
);

SELECT * FROM traveler_diary

DROP TABLE traveler_diary

ALTER TABLE traveler_diary ADD imglocs VARCHAR(3000)

ALTER TABLE traveler_diary ADD journal_no INT