CREATE TABLE web_boards (
	board_num NUMBER primary key,
	board_name VARCHAR2(20) NOT NULL,
	board_pass VARCHAR2(15) NOT NULL,
	board_title VARCHAR2(50) NOT NULL,
	board_content VARCHAR2(2000) NOT NULL,
	board_file VARCHAR2(50),
	board_re_ref number NOT NULL,
	board_re_lev number NOT NULL,
	board_re_seq number NOT NULL,
	board_readcount number default 0,
	board_date DATE
);

DROP TABLE web_boards purge;

SELECT * FROM web_boards;

CREATE SEQUENCE web_boards_seq INCREMENT BY 1 MINVALUE 0 START WITH 0;

DROP SEQUENCE web_boards_seq;