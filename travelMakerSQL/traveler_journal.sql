CREATE TABLE traveler_journal(
journal_no INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR(100) NOT NULL,
start_dt DATE NOT NULL,
end_dt DATE NOT NULL,
marker VARCHAR(100) NOT NULL,
author VARCHAR(20) NOT NULL,
thumbs INT DEFAULT 0,
view_cnt INT DEFAULT 0
)

SELECT * FROM traveler_journal

INSERT INTO traveler_journal(title, start_dt, end_dt, marker, author, thumbs, view_cnt) VALUES ('강원도 정선 여행', '2021-03-01', '2021-03-05','강원도 정선군 정선읍', '아이디',311,0)

DELETE FROM traveler_journal WHERE journal_no<4