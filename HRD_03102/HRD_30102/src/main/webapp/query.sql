select member.custno, member.custname, decode(member.grade,'A', 'VIP', 'B', '직원', 'C', '일반'), sum(money.price) price
from MEMBER_TBL_02 member, MONEY_TBL_02 money
where member.custno = money.custno
group by member.custno, member.custname, member.grade
order by sum(money.price) desc;


create table member_tbl_02(
custno number(6),
custname varchar2(20),
phone varchar2(13),
address varchar2(4),
joindate date,
grade char(1),
city char(2),
constraint custno_pk primary key(custno)
);
drop table member_tbl_02;

insert into member_tbl_02 values(100001,'김행복','010-1111-2222','SK','20151202','A','01');
insert into member_tbl_02 values(100002,'이축복','010-1111-3333','SK','20151206','B','01');
insert into member_tbl_02 values(100003,'장믿음','010-1111-4444','LG','20151001','B','30');
insert into member_tbl_02 values(100004,'최사랑','010-1111-5555','KT','20151113','A','30');
insert into member_tbl_02 values(100005,'진평화','010-1111-6666','SK','20151225','B','60');
insert into member_tbl_02 values(100006,'차공단','010-1111-7777','LG','20151211','C','60');



create table money_tbl_02(
custno number(6),
salenol number(8),
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate date,
constraint custno_salenol_pk primary key(custno,salenol)
);
drop table money_tbl_02;

insert into money_tbl_02 values(100001, 20160001, 500, 5, 2500, 'A001', '20160101');
insert into money_tbl_02 values(100001, 20160002, 1000, 4, 4000, 'A002', '20160101');
insert into money_tbl_02 values(100001, 20160003, 500, 3, 1500, 'A008', '20160101');
insert into money_tbl_02 values(100002, 20160004, 2000, 1, 2000, 'A004', '20160102');
insert into money_tbl_02 values(100002, 20160005, 500, 1, 500, 'A001', '20160103');
insert into money_tbl_02 values(100003, 20160006, 1500, 2, 3000, 'A003', '20160103');
insert into money_tbl_02 values(100004, 20160007, 500, 2, 1000, 'A001', '20160104');
insert into money_tbl_02 values(100004, 20160008, 300, 1, 300, 'A005', '20160104');
insert into money_tbl_02 values(100004, 20160009, 600, 1, 600, 'A006', '20160104');
insert into money_tbl_02 values(100004, 20160010, 3000, 1, 3000, 'A007', '20160106');

select custno, custname, phone, address, joindate, 
decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원') grade,
decode(city, '01', '서울', '10', '인천', '20', '성남', '30', '대전', '40', '광주', '60', '부산') city
from member_tbl_02 order by custno;

select max(custno)+1 nextCustNo from member_tbl_02;








