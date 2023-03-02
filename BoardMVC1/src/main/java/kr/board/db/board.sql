use testdb;

create table board(
    board_no int primary key auto_increment, 
    writer varchar(20) not null, 
    reg_date DATETIME not null,
    subject varchar(100) not null,
    contents varchar(1000) not null
);


insert into board(writer,subject,contents,reg_date) values('작성자1','제목1','내용1',curdate());

insert into board(writer,subject,contents,reg_date)
values('작성자2','제목2','내용2',curdate());
insert into board(writer,subject,contents,reg_date)
values('작성자3','제목3','내용3',curdate());
insert into board(writer,subject,contents,reg_date)
values('작성자4','제목4','내용4',curdate());
insert into board(writer,subject,contents,reg_date)
values('작성자5','제목5','내용5',curdate());
insert into board(writer,subject,contents,reg_date)
values('작성자6','제목6','내용6',curdate());

select * from board;
