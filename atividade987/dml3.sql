create database if not exists Barbearia;
use Barbearia;

create table if not exists servicos(
	id int primary key auto_increment,
    nome_cliente varchar(255) not null,
    tipo_servicos varchar(255) not null,
    valor float(5,2)
)auto_increment=1;

insert into servicos (nome_cliente, tipo_servicos,valor) 
values('pedro','corte/maquina + barba','50'),
('arthur','corte/maquina + sobrancelha','45'),
('roberto','tesoura + barba','30');

select * FROM servicos;