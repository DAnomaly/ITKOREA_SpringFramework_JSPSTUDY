DROP TABLE BOARD;

CREATE TABLE BOARD
(
	NO NUMBER PRIMARY KEY, 
	AUTHOR VARCHAR2(32),  
	TITLE VARCHAR2(1000) NOT NULL, 
	CONTENT VARCHAR2(4000), 
	IP VARCHAR2(20),
	HIT NUMBER,  
	POSTDATE DATE, 
	LASTMODIFIED DATE, 
	STATE NUMBER, 
	GROUPNO NUMBER, 
	GROUPORD NUMBER,
	DEPTH NUMBER  
);

DROP SEQUENCE BOARD_SEQ;

CREATE SEQUENCE BOARD_SEQ INCREMENT BY 1 START WITH 1 NOCYCLE NOCACHE;