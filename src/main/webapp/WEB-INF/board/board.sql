show tables;

create table board (
  idx  int not null auto_increment,		/* 게시글의 고유번호 */
  mid  varchar(20) not null,					/* 게시글 올린이 아이디 */
  title varchar(100)   not null,			/* 게시글 제목 */
  content text not null,							/* 글 내용 */
  readNum int default 0,							/* 글 조회수 */
  openSw	char(2)  default 'OK',			/* 게시글 공개여부(OK:공개, NO:비공개) */
  wDate		datetime default now(),			/* 글쓴 날짜 */
  primary key(idx),										/* 기본키 : 고유번호 */
  foreign key(mid) references member(mid)
);
drop table board;
desc board;

insert into board values (default,'admin','공지사항','보이스피싱 사기에 조심하시기 바랍니다.',default,default,default);
insert into board values (default,'admin','이벤트','오는 6월 출석 이벤트를 시작합니다.',default,default,default);
insert into board values (default,'admin','오늘의 새 상품','GH Bank에서 출시한 새로운 대출상품을 소개합니다.',default,default,default);
insert into board values (default,'hkd1234','문의드립니다.','은행 대출 이자 관련 문의입니다.',default,'NO',default);

select * from board;


create table boardReply (
  idx       int not null auto_increment,	/* 댓글 고유번호 */
  boardIdx  int not null,						/* 원본글(부모글)의 고유번호-외래키로 지정 */
  mid				varchar(20) not null,		/* 댓글 올린이의 아이디 */
  wDate			datetime	default now(),/* 댓글 올린 날짜/시간 */
  content		text not null,					/* 댓글 내용 */
  primary key(idx),
  foreign key(boardIdx) references board(idx)
  on update cascade
  on delete restrict
);
drop table boardReply;
desc boardReply;

insert into boardReply values (default,1,'hkd1234',default,'좋은 정보 감사합니다.');
insert into boardReply values (default,6,'hkd1234',default,'핫도그 나도 먹고싶다.');

select * from boardReply;

