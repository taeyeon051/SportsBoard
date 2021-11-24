/* 글 목록 테이블 */
drop table writings;

create table writings (
	w_code number(5) not null,
	w_type varchar2(50),
	w_date varchar2(20),
	title varchar2(200),
	content clob,
	teamList varchar2(500),
	playerList varchar2(500),
	constraint writings_pk primary key (w_code)
);

select w_code, w_type, title, DBMS_LOB.SUBSTR(content, DBMS_LOB.GETLENGTH(content)), teamList, playerList from writings where w_code = ? order by w_code;

-- 글 번호 가져오기 --
select max(w_code) + 1 as code from writings;
-- 글 작성 --