/* user table */ 
drop table users;

create table users (
	userId varchar2(100) not null,
	userName varchar2(50),
	userPwd varchar2(200),
	constraint users_pk primary key (userId)
);

-- user table (register) --
insert into users values('admin', '관리자', '1234');
select * from users;

-- user table (login) --
select * from users where userId = ? and userPwd = ?


/* team table */
drop table sports;
drop table teams;

create table sports (
	s_code number(2) not null,
	ko_sports_name varchar2(20),
	en_sports_name varchar2(20),
	constraint sports_pk primary key (s_code)
);

create table teams (
	s_code number(2) not null,
	team varchar2(50)
);

-- sports insert --
insert into sports values (1, '야구', 'baseball');
insert into sports values (2, '해외야구', 'worldbaseball');
insert into sports values (3, '축구', 'soccer');
insert into sports values (4, '해외축구', 'worldsoccer');
insert into sports values (5, '골프', 'golf');
insert into sports values (6, '농구', 'basketball');
insert into sports values (7, '배구', 'volleyball');

select * from sports;
select * from teams;





