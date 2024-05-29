show tables;

create table account (
  idx  int not null auto_increment,		/* 계좌 고유 일련번호 */
  mid  varchar(30) not null,					/* 계좌가지고 있는 고객아이디 */
  accountNumber char(14) not null,		/* 계좌 번호 */
  flagSw char(1)   not null default 'I', /* I:입금,  C:출금, E:계좌출금, G:계좌입금 */
  money	 int			 not null default 0, 	/* 계좌 입/출금액 */
  content varchar(50) not null default '통장개설',	/* 계좌 입/출금 내역(적요) */
  accDate datetime	default now(),		/* 입출금 날짜 */
  primary key(idx),
  foreign key (mid) references member(mid)
);

desc account;
drop table account;
delete from account;

insert into account values (default, 'admin','240-523-123456',default,10000000,default,default);
insert into account values (default, 'hkd1234','991-231-789456',default,5000000,default,default);

select * from account;

select sum(money) as balance from account where mid='atom1234' and flagSw = 'I';
select sum(money) as balance from account where mid='admin' and flagSw = 'C';
select sum(money) as balance from account where mid='admin' and flagSw = 'C' or flagSw = 'G';

create table accountFavorite (
  idx  int not null auto_increment,		/* 계좌 고유 일련번호 */
  myId  varchar(30) not null,					/* 자신아이디 */
  youId varchar(30) not null,					/* 계좌가지고 있는 고객아이디 */
  accountNumber char(14) not null,		/* 계좌 번호 */
  primary key(idx),
  foreign key (myId) references member(mid),
  foreign key (youId) references member(mid)
);
drop table accountFavorite;

insert into accountFavorite values (default,'admin','240-523-123456');
insert into accountFavorite values (default,'hkd1234','991-231-789456');