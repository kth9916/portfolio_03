create table user1(
 userID varchar2(50) not null,
 userPassword varchar2(50) not null,
 userName varchar2(50) not null,
 userGender varchar2(50) not null,
 userEmail varchar2(50) not null
 );
 
  create table product4(
 productId NUMBER not null,
 pname varchar2(2000) not null,
 unitPrice varchar2(50) not null,
 description varchar2(4000) not null,
 manufacturer varchar2(50) not null,
 category varchar2(50) not null,
 ofile1 varchar2(200) not null,
 ofile2 varchar2(200),
 ofile3 varchar2(200),
 ofile4 varchar2(200),
 ofile5 varchar2(200),
 quantity varchar2(50) default 10,
 realpath1 varchar2(200),
 realpath2 varchar2(200),
 realpath3 varchar2(200),
 realpath4 varchar2(200),
 realpath5 varchar2(200)
 );
 

create sequence productId
 increment by 1
 start with 1
 
 create sequence productNum
 increment by 1
 start with 1

create table cart(
    name varchar2(200),
    price int,
    qnt int, 
    sumPrice int,
    userId varchar2(200));



create table order1(
    userid varchar2(20),
    address varchar2(50),
    orderdate date default sysdate,
    arrive varchar2(20),
    ojname varchar2(100),
    ojprice int,
    ojqnt int,
    totalprice int,
    sumprice int
);


create table bbs(
    bbsId int,
    bbsTitle varchar2(200),
    userId varchar2(200),
    bbsDate date default current_timestamp,
    bbsContent varchar2(2000),
    bbsAvailable int
    );   