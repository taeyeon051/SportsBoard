-- user table -- 
drop table users;
drop table users_seq;

create table users (
	id number(10),
	userId varchar2(100),
	userName varchar2(50),
	userPwd varchar2(200)
);

CREATE SEQUENCE users_seq START WITH 1 INCREMENT BY 1 MAXVALUE 1000000 CYCLE NOCACHE;

-- user table (register) --
insert into users values(users_seq.nextval, 'admin', '관리자', '1234');
select * from users;

-- user table (login) --