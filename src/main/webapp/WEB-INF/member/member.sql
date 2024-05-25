show tables;

create table member (
  idx       		int not null auto_increment primary key,	/* 회원 고유번호 */
  mid       		varchar(30) not null,											/* 회원 아이디(중복불허) */
  pwd       		varchar(100) not null,										/* 회원 비밀번호(SHA256 암호화 처리) */
  name					varchar(20) not null,											/* 회원 성명 */
  gender    		char(2)	not null default '남자',						/* 회원 성별 */
  birth  				datetime default now(),										/* 회원 생일 */
  tel						varchar(15),															/* 전화번호 : 010-1234-5678 */
  address   		varchar(100),															/* 주소(다음 API 활용) */
  email					varchar(60) not null,		  								/* 이메일(아이디/비밀번호 분실시에 사용)-형식체크필수 */
  job						varchar(20),															/* 직업 */
  alarm         varchar(3) not null default '허용',					/* 알람 허용 여부 */
  userDel   		char(2)  default 'NO',										/* 회원 탈퇴신청여부(NO:현재 활동중, OK:탈퇴신청중) */
  level     		int default 1,														/* 회원등급(0:관리자, 1:준회원, 2:정회원, 3:우수회원, (4:운영자)) , 99:탈퇴신청회원 */
  startDate 		datetime default now(),										/* 최초 가입일 */
  lastDate  		datetime default now(),										/* 마지막 접속일 */
  accountnumber char(15) not null,												/* 계좌번호 (생년월일 6자리 + 난수 6자리) */
  unique(mid),
  unique(accountnumber)
);
drop table member;
desc member;

insert into member values (default,'admin','1234','관리자','남자',default,'010-1234-5678','050/서울시/그린아파트/100동/101호','admin@naver.com','공무원',default,default,0,default,default,'240-523-123456');
insert into member values (default,'hkd1234','1234','홍길동','남자',default,'010-9876-5432','050/청주시/그린아파트/200동/303호','hkd1234@naver.com','교사',default,default,0,default,default,'991-231-789456');

select * from member;
