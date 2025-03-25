create database barbearia; 

use barbearia; 

create table cliente(
	id int primary key auto_increment,
    nome varchar(60) not null,
    valor float(4,2) not null,
    whatsapp char(13) not null,
    email varchar(60)
)auto_increment=1;
show tables;
describe cliente;
insert into cliente(nome,whatsapp,email) values("João","61997876532","joao@gmail.com","20,50");