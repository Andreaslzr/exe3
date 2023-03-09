create database emails;
use emails;

create table users(
userId bigint not null auto_increment,
userName varchar(100) not null,
userEmail varchar(100) not null,
primary key(userId)
);

create table email(
emId bigint not null auto_increment,
subject varchar(100),
body text,
shippingDate date not null,
status varchar(20) not null,
senderIdFK bigint not null,
addresseeIdFK bigint not null,
primary key(emId),
foreign key(senderIdFK) references users(userId),
foreign key(addresseeIdFK) references users(userId)
);

create table anex(
anexId bigint not null auto_increment,
fieName varchar(100),
fileSize bigint,
fileLink varchar(100),
emIdFK bigint not null,
primary key(anexId),
foreign key(emIdFK) references email(emId)
);

insert into users(userName,userEmail) values
('Alice moraes','alicemr@email.com'),('Carlos Silca','carlos.silva@email.com'),
('Aparecido jose','aparecidoj@email.com'),('Maria Eduarda','mariaed@email.com');

insert into email(shippingDate,status,senderIdFK,addresseeIdFK) values
('2023-03-07','enviado',1,2),('2023-03-09','enviado',2,1),
('2023-02-25','enviado',4,3),('2023-03-02','rascunho',3,2);

insert into anex(emIdFK) values
(2),(4),(1),(3);

select * from email where shippingDate < curdate();