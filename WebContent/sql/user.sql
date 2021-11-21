/* 유저 정보 테이블 */ 
drop table users;

create table users (
	userId varchar2(100) not null,
	userName varchar2(50),
	userPwd varchar2(200),
	constraint users_pk primary key (userId)
);

-- register --
insert into users values('admin', '관리자', '1234');
select * from users;

-- login --
select * from users where userId = ? and userPwd = ?