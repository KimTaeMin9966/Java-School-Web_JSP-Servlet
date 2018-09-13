SELECT * FROM test_member;

DROP TABLE test_board purge;

CREATE TABLE test_board (
	board_num NUMBER primary key,			-- 글번호
	board_name VARCHAR2(20) NOT NULL,		-- 작성자
	board_pass VARCHAR2(15) NOT NULL,		-- 비밀번호
	board_title VARCHAR2(50) NOT NULL,		-- 글제목
	board_content VARCHAR2(2000) NOT NULL,	-- 글내용
	board_file VARCHAR2(50),				-- 첨부파일 
	board_re_ref number NOT NULL,			-- 부모글정보
	board_re_lev number NOT NULL,			-- 답글 레벨
	board_re_seq number NOT NULL,			-- 관련글 번호
	board_readcount number default 0,		-- 조회수
	board_date DATE							-- 작성일/시간
);

SELECT * FROM test_board;

CREATE SEQUENCE test_board_seq INCREMENT BY 1 MINVALUE 0 START WITH 0;

CREATE TABLE notice_board(
	notice_num NUMBER PRIMARY KEY,
	notice_category VARCHAR2(20),
	notice_author VARCHAR2(50),
	notice_title VARCHAR2(50),
	notice_content VARCHAR2(2000),
	notice_date DATE
);

CREATE SEQUENCE notice_board_seq INCREMENT BY 1 MINVALUE 0 START WITH 0;

SELECT * FROM NOTICE_BOARD;
