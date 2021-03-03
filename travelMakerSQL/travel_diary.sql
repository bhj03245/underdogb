CREATE TABLE traveler_diary(
diary_no INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
author VARCHAR(20) NOT NULL,
diary VARCHAR(3000) NOT NULL,
regdate DATETIME
)

SELECT * FROM traveler_diary;

INSERT INTO traveler_diary(title, author, diary, regdate) VALUES ('정선 3일차', '아이디', '여기도내용', '2021-03-04')

DROP TABLE traveler_diary

SELECT * FROM traveler_diary ORDER BY diary_no DESC