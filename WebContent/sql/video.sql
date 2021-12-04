/* 영상 목록 테이블 */
drop table videos;

create table videos (
	v_code number(5) not null,
	v_type varchar2(50),
	v_date varchar2(20),
	title varchar2(200),
	uploader_id varchar2(100),
	uploader_name varchar2(50),
	vedio_src varchar2(200),
	teamList varchar2(500),
	playerList varchar2(500),
	views number(10) default 0,
	constraint video_pk primary key (v_code),
	constraint type_check check (v_type in ('baseball', 'worldbaseball', 'soccer', 'wolrdsoccer', 'golf', 'basketball', 'volleyball'))
);