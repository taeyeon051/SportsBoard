-- user table -- 
drop table users;
drop table users_seq;

create table users (
	userId varchar2(100),
	userName varchar2(50),
	userPwd varchar2(200),
	constraint userId_pk primary key (userId)
);

-- user table (register) --
insert into users values('admin', '관리자', '1234');
select * from users;

-- user table (login) --
select * from users where userId = ? and userPwd = ?