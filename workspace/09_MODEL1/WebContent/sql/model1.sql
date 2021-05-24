DROP TABLE MEMBERS;
DROP TABLE BOARDS;

-- 회원
CREATE TABLE MEMBER (
	NO NUMBER, -- 회원번호
	ID VARCHAR2(32) NOT NULL UNIQUE, -- ID
	PW VARCHAR2(32) NOT NULL, -- PW
	NAME VARCHAR2(50), -- 이름
	EMAIL VARCHAR2(200) NOT NULL UNIQUE, -- 이메일
	REGDATE DATE -- 가입일
);

-- 게시판 테이블
CREATE TABLE BOARD (
	IDX NUMBER, -- 게시글 번호
	AUTHOR VARCHAR2(32), -- 작성자
	TITLE VARCHAR2(2000) NOT NULL, -- 제목
	CONTENT VARCHAR2(4000), -- 내용
	HIT NUMBER, -- 조회수
	POSTDATE DATE -- 작성일
);

-- 기본키
ALTER TABLE MEMBER ADD CONSTRAINT MEMBER_PK PRIMARY KEY(NO);
ALTER TABLE BOARD ADD CONSTRAINT BOARD_PK PRIMARY KEY(IDX);
-- 외래키
ALTER TABLE BOARD ADD CONSTRAINT BOARD_MEMBER_FK FOREIGN KEY(AUTHOR) REFERENCES MEMBER(ID);

-- 시퀀스
DROP SEQUENCE MEMBER_SEQ;
DROP SEQUENCE BOARD_SEQ;
CREATE SEQUENCE MEMBER_SEQ INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;
CREATE SEQUENCE BOARD_SEQ INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;