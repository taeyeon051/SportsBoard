/* 영상 목록 테이블 */
drop table videos;

create table videos (
	v_code number(5) not null,
	v_type varchar2(50),
	v_date varchar2(20),
	title varchar2(200),
	uploader_id varchar2(100),
	image_src varchar2(200),
	video_src varchar2(200),
	video_time varchar2(7),
	teamList varchar2(500),
	playerList varchar2(500),
	views number(10) default 0,
	constraint video_pk primary key (v_code),
	constraint vtype_check check (v_type in ('baseball', 'worldbaseball', 'soccer', 'wolrdsoccer', 'golf', 'basketball', 'volleyball'))
);

select * from videos where v_code = ? order by v_code;

-- 영상 번호 가져오기 --
select max(v_code) + 1 as code from videos;

-- 영상 목록 가져오기 --
select * from videos order by v_code desc;