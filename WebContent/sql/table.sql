/* 스포츠 종목, 팀 목록 테이블 */
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

-- select sql --
select * from sports;
select * from teams;

select s.s_code, s.ko_sports_name, t.team
from sports s, teams t
where s.s_code = t.s_code;

-- sports insert --
insert into sports values (1, '야구', 'baseball');
insert into sports values (2, '해외야구', 'worldbaseball');
insert into sports values (3, '축구', 'soccer');
insert into sports values (4, '해외축구', 'worldsoccer');
insert into sports values (5, '골프', 'golf');
insert into sports values (6, '농구', 'basketball');
insert into sports values (7, '배구', 'volleyball');

-- teams insert --
insert into teams values (1, 'KIA 타이거즈');
insert into teams values (1, 'kt wiz');
insert into teams values (1, 'LG 트윈스');
insert into teams values (1, 'NC 다이노스');
insert into teams values (1, 'SSG 랜더스');
insert into teams values (1, '두산 베어스');
insert into teams values (1, '롯데 자이언츠');
insert into teams values (1, '삼성 라이온즈');
insert into teams values (1, '키움 히어로즈');
insert into teams values (1, '한화 이글스');

insert into teams values (2, 'LA 다저스');
insert into teams values (2, '샌디에이고 파드리스');
insert into teams values (2, '샌프란시스코 자이언츠');
insert into teams values (2, '애리조나 다이아몬드백스');
insert into teams values (2, '콜로라도 로키스');
insert into teams values (2, '뉴욕 메츠');
insert into teams values (2, '마이애미 말린스');
insert into teams values (2, '애틀랜타 브레이브스');
insert into teams values (2, '워싱턴 내셔널스');
insert into teams values (2, '필라델피아 필리스');
insert into teams values (2, '밀워키 브루어스');
insert into teams values (2, '세인트루이스 카디널스');
insert into teams values (2, '시카고 컵스');
insert into teams values (2, '신시내티 레즈');
insert into teams values (2, '피츠버그 파이어리츠');
insert into teams values (2, 'LA 에인절스');
insert into teams values (2, '시애틀 매리너스');
insert into teams values (2, '오클랜드 어슬레틱스');
insert into teams values (2, '텍사스 레인저스');
insert into teams values (2, '휴스턴 애스트로스');
insert into teams values (2, '뉴욕 양키스');
insert into teams values (2, '보스턴 레드삭스');
insert into teams values (2, '볼티모어 오리올스');
insert into teams values (2, '탬파베이 레이스');
insert into teams values (2, '토론토 블루제이스');
insert into teams values (2, '디트로이트 타이거즈');
insert into teams values (2, '미네소타 트윈스');
insert into teams values (2, '시카고 화이트삭스');
insert into teams values (2, '캔자스시티 로열스');
insert into teams values (2, '클리블랜드 인디언스');

insert into teams values (3, 'FC서울');
insert into teams values (3, '강원FC');
insert into teams values (3, '광주FC');
insert into teams values (3, '대구FC');
insert into teams values (3, '성남FC');
insert into teams values (3, '수원FC');
insert into teams values (3, '수원 삼성');
insert into teams values (3, '울산 현대');
insert into teams values (3, '인천 Utd');
insert into teams values (3, '전북 현대');
insert into teams values (3, '제주 Utd');
insert into teams values (3, '포항 스틸러스');

insert into teams values (4, '노리치 시티 FC');
insert into teams values (4, '뉴캐슬 유나이티드 FC');
insert into teams values (4, '레스터 시티 FC');
insert into teams values (4, '리버풀 FC');
insert into teams values (4, '리즈 유나이티드 FC');
insert into teams values (4, '맨체스터 시티 FC');
insert into teams values (4, '맨체스터 유나이티드 FC');
insert into teams values (4, '번리 FC');
insert into teams values (4, '브라이튼 앤 호브 알비온 FC');
insert into teams values (4, '브렌트포드 FC');
insert into teams values (4, '사우샘프턴 FC');
insert into teams values (4, '아스널 FC');
insert into teams values (4, '애스턴 빌라 FC');
insert into teams values (4, '에버턴 FC');
insert into teams values (4, '왓포드 FC');
insert into teams values (4, '울버햄튼 원더러스 FC');
insert into teams values (4, '웨스트햄 유나이티드 FC');
insert into teams values (4, '첼시 FC');
insert into teams values (4, '크리스탈 팰리스 FC');
insert into teams values (4, '토트넘 핫스퍼 FC');