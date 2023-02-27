create table member(
    num int primary key auto_increment, 
    id varchar(20) not null, 
    pass varchar(20) not null,
    name varchar(20) not null,
    reg_num varchar(13) not null,
    email varchar(30) not null,
    phone varchar(30) not null,    
);