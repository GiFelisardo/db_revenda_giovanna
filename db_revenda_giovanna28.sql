create database db_revenda_giovanna;

create table endereco(
	id serial primary key,
	pais varchar(100) not null,
	uf char(2) not null,
	cidade varchar(100) not null,
	bairro varchar(100) not null,
	rua varchar(100) not null,
	numero char(15) not null,
	complemento varchar(100) not null,
	cep char(8) not null unique,
	referencia text
);

create table fornecedor(
	id serial primary key,
	nome_fornecedor varchar(100) not null,
	cnpj char(14) not null unique,
	descricao_prod_fornecedor text not null,
	endereco_id int not null,
	foreign key (endereco_id) references endereco(id),
	valor_prod_fornecedor numeric not null
);
	
create table produtos(
	id serial primary key,
	nome varchar(50) not null, 
	descricao text not null,
	tamanho char(2) not null,
	valor_produto numeric not null,
	fornecedor_id int not null,
	foreign key (fornecedor_id) references fornecedor(id)
);
	
create table cliente(
	id serial primary key,
	nome varchar(50) not null,
	cpf char(11) not null unique,
	email varchar(100) not null unique,
	telefone char(9) not null unique,
	endereco_id int not null,
	foreign key (endereco_id) references endereco(id),
	genero varchar(50),
	idade char(3)
);
	
create table funcionario(
	id serial primary key,
	nome varchar(50) not null,
	cpf char(11) not null unique,
	email varchar(100) not null unique,
	telefone char(9) not null unique,
	endereco_id int not null,
	foreign key (endereco_id) references endereco(id),
	funcao varchar(50),
	salario numeric
);
	
create table venda(
	id serial primary key,
	cliente_id int not null,
	foreign key (cliente_id) references cliente(id),
	produtos_id int not null,
	foreign key (produtos_id) references produtos(id),
	funcionario_id int not null,
	foreign key (funcionario_id) references funcionario(id)
);

insert into endereco (pais, uf, cidade, bairro, rua, numero, complemento, cep, referencia) 
values ('Brasil','SP','São Paulo','Centro','Rua A','100','Ap 1','01001000','Próx ao metrô'),
('Brasil','RJ','Rio de Janeiro','Copacabana','Rua B','200','Casa','22041001','Próx à praia'),
('Brasil','MG','Belo Horizonte','Savassi','Rua C','300','Bloco B','30140071','Shopping próximo'),
('Brasil','RS','Porto Alegre','Moinhos','Rua D','400','Ap 2','90520001','Hospital ao lado'),
('Brasil','BA','Salvador','Barra','Rua E','500','Casa 2','40140060','Perto do farol'),
('Brasil','PR','Curitiba','Centro','Rua F','600','Ap 3','80020010','Universidade próxima'),
('Brasil','PE','Recife','Boa Viagem','Rua G','700','Bloco C','51020001','Shopping Recife'),
('Brasil','CE','Fortaleza','Aldeota','Rua H','800','Ap 5','60120010','Colégio ao lado'),
('Brasil','SC','Florianópolis','Trindade','Rua I','900','Casa','88040000','UFSC'),
('Brasil','GO','Goiânia','Setor Oeste','Rua J','1000','Ap 10','74120000','Praça próxima');

insert into fornecedor (nome_fornecedor, cnpj, descricao_prod_fornecedor, endereco_id, valor_prod_fornecedor) 
values ('Fornecedor A','12345678000101','Roupas esportivas',1,50),
('Fornecedor B','22345678000102','Calçados femininos',2,80),
('Fornecedor C','32345678000103','Acessórios de moda',3,20),
('Fornecedor D','42345678000104','Roupas masculinas',4,70),
('Fornecedor E','52345678000105','Calçados masculinos',5,90),
('Fornecedor F','62345678000106','Bolsas e mochilas',6,60),
('Fornecedor G','72345678000107','Roupas infantis',7,40),
('Fornecedor H','82345678000108','Bijuterias',8,15),
('Fornecedor I','92345678000109','Tênis esportivos',9,120),
('Fornecedor J','10345678000100','Moda praia',10,35);

insert into produtos (nome, descricao, tamanho, valor_produto, fornecedor_id) 
values ('Camiseta Nike','Camiseta esportiva','M',120,1),
('Tênis Adidas','Tênis corrida','42',350,2),
('Colar Pérola','Acessório de luxo','U',200,3),
('Calça Jeans','Modelo slim','40',180,4),
('Sapato Social','Couro legítimo','41',220,5),
('Mochila Puma','Mochila esportiva','U',150,6),
('Vestido Infantil','Colorido','6',90,7),
('Pulseira Ouro','Banho de ouro','U',250,8),
('Tênis Vans','Casual preto','39',280,9),
('Biquíni Floral','Moda praia verão','M',100,10);

insert into cliente (nome, cpf, email, telefone, endereco_id, genero, idade) 
values ('Ana Souza','11111111111','ana@email.com','999999991',1,'Feminino','25'),
('João Lima','22222222222','joao@email.com','999999992',2,'Masculino','30'),
('Maria Silva','33333333333','maria@email.com','999999993',3,'Feminino','28'),
('Pedro Santos','44444444444','pedro@email.com','999999994',4,'Masculino','35'),
('Lucas Rocha','55555555555','lucas@email.com','999999995',5,'Masculino','22'),
('Julia Reis','66666666666','julia@email.com','999999996',6,'Feminino','27'),
('Rafael Melo','77777777777','rafael@email.com','999999997',7,'Masculino','40'),
('Camila Nunes','88888888888','camila@email.com','999999998',8,'Feminino','33'),
('Felipe Araújo','99999999999','felipe@email.com','999999999',9,'Masculino','26'),
('Beatriz Gomes','10101010101','bia@email.com','999999900',10,'Feminino','24');

insert into funcionario (nome, cpf, email, telefone, endereco_id, funcao, salario) 
values ('Carlos Silva','12121212121','carlos@empresa.com','988888881',1,'Vendedor',2000),
('Fernanda Souza','13131313131','fernanda@empresa.com','988888882',2,'Caixa',1800),
('Ricardo Melo','14141414141','ricardo@empresa.com','988888883',3,'Gerente',5000),
('Patrícia Lima','15151515151','patricia@empresa.com','988888884',4,'Vendedor',2200),
('Gustavo Ramos','16161616161','gustavo@empresa.com','988888885',5,'Estoque',1600),
('Larissa Alves','17171717171','larissa@empresa.com','988888886',6,'Caixa',1900),
('Thiago Costa','18181818181','thiago@empresa.com','988888887',7,'Vendedor',2100),
('Mariana Dias','19191919191','mariana@empresa.com','988888888',8,'RH',3000),
('Eduardo Martins','20202020202','eduardo@empresa.com','988888889',9,'Gerente',5200),
('Paula Ferreira','21212121212','paula@empresa.com','988888890',10,'Vendedor',2300);

insert into endereco (pais, uf, cidade, bairro, rua, numero, complemento, cep, referencia) 
values ('Brasil','SP','Campinas','Taquaral','Rua K','1100','Ap 12','13076000','Lagoa do Taquaral'),
('Brasil','RJ','Niterói','Icaraí','Rua L','1200','Casa','24230010','Praia de Icaraí'),
('Brasil','MG','Uberlândia','Centro','Rua M','1300','Ap 15','38400010','Praça Tubal Vilela'),
('Brasil','RS','Caxias do Sul','São Pelegrino','Rua N','1400','Bloco D','95020120','Shopping San Pelegrino'),
('Brasil','BA','Feira de Santana','Centro','Rua O','1500','Casa 3','44001000','Rodoviária'),
('Brasil','PR','Londrina','Gleba Palhano','Rua P','1600','Ap 20','86047000','Catuaí Shopping'),
('Brasil','PE','Olinda','Carmo','Rua Q','1700','Bloco E','53020100','Alto da Sé'),
('Brasil','CE','Juazeiro do Norte','Centro','Rua R','1800','Ap 25','63010010','Basílica de São Francisco'),
('Brasil','SC','Joinville','América','Rua S','1900','Casa','89204120','Perto do Garten Shopping'),
('Brasil','GO','Anápolis','Jundiaí','Rua T','2000','Ap 30','75020010','Hospital Evangélico'),
('Brasil','SP','Santos','Gonzaga','Rua U','2100','Bloco F','11055001','Praia do Gonzaga'),
('Brasil','RJ','Petrópolis','Centro','Rua V','2200','Casa 5','25610010','Catedral de São Pedro'),
('Brasil','MG','Ouro Preto','Centro Histórico','Rua W','2300','Ap 40','35400000','Igreja de São Francisco'),
('Brasil','RS','Gramado','Centro','Rua X','2400','Casa 7','95670000','Rua Coberta'),
('Brasil','BA','Porto Seguro','Arraial d’Ajuda','Rua Y','2500','Bloco G','45810000','Praia do Mucugê'),
('Brasil','PR','Maringá','Zona 7','Rua Z','2600','Ap 50','87020000','UEM - Universidade Estadual de Maringá'),
('Brasil','PE','Caruaru','Centro','Rua AA','2700','Casa 8','55002010','Feira de Caruaru'),
('Brasil','CE','Sobral','Derby','Rua AB','2800','Bloco H','62011010','Universidade UVA'),
('Brasil','SC','Blumenau','Velha','Rua AC','2900','Ap 60','89040000','Parque Vila Germânica'),
('Brasil','GO','Rio Verde','Centro','Rua AD','3000','Casa 9','75901000','Praça Central');

insert into venda (cliente_id, produtos_id, funcionario_id) 
values (1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,7),
(8,8,8),
(9,9,9),
(10,10,10);


create view relatorio_vendas as
select 
    v.id as venda_id,
    c.nome as cliente,
    p.nome as produto,
    p.valor_produto as preco,
    f.nome as funcionario
from venda v
join cliente c on v.cliente_id = c.id
join produtos p on v.produtos_id = p.id
join funcionario f on v.funcionario_id = f.id;

create view produtos_e_fornecedores as
select 
    p.id as produto_id,
    p.nome as produto,
    p.descricao,
    p.tamanho,
    p.valor_produto,
    f.nome_fornecedor as fornecedor,
    f.valor_prod_fornecedor as preco_custo
from produtos p
join fornecedor f on p.fornecedor_id = f.id;

select * from relatorio_vendas;
select * from produtos_e_fornecedores;

--AULA DO DIA 28/08

-- Faça uma consulta filtrando um campo de texto utilizando like;
select * from funcionario
where nome like 'P%';

--Execute um comando explain e tire um print (anexe nesta atividade);
explain select * from funcionario
where nome like 'P%';

--Crie um index para a coluna que utilizou no filtro acima;
create index idx_nome_fun 
on funcionario(nome);

--Refaça a consulta e execute o explain novamente. Tire um novo print 
--(anexe neste atividade) e compare com o anterior. Aponte as diferenças.
explain select * from funcionario
where nome like 'P%';

--Altere uma coluna de varchar para int, avalie o retorno, inclusive se for erro;
alter table funcionario 
alter column email int; --ERRO

-- Altere uma coluna de int para varchar avalie o retorno, inclusive se for erro;
alter table funcionario 
alter column endereco_id varchar; --ERRO

--Crie um usuário com seu nome e dê todas as permissões de acesso para 
--todas as tabelas; 
create user eu with password '1234';
grant all privileges on database db_revenda_giovanna to eu;

-- Crie um usuário para seu colega apenas com permissão de select em uma das tabelas;
create user amiguinho with password '5678';
grant select on cliente to amiguinho;

--De volta no seu usuário, crie 12 consultas, sendo 3 consultas semelhantes 
--(somente com alteração do tipo de join: inner, left e right). Ou seja, são
-- 4 consultas diferentes, sendo que cada consulta terá 3 versões, uma com 
--cada tipo de join; 
select nome, endereco_id, cidade
from funcionario
inner join endereco 
on funcionario.endereco_id = endereco.id;

select nome, endereco_id, cidade
from funcionario
left join endereco 
on funcionario.endereco_id = endereco.id;

select nome, endereco_id, cidade
from funcionario
right join endereco 
on funcionario.endereco_id = endereco.id;
----------

select nome, endereco_id, bairro
from cliente
inner join endereco
on cliente.endereco_id = endereco.id

select nome, endereco_id, bairro
from cliente
left join endereco
on cliente.endereco_id = endereco.id

select nome, endereco_id, bairro
from cliente
right join endereco
on cliente.endereco_id = endereco.id
----------

select nome_fornecedor, endereco_id, cidade
from fornecedor
inner join endereco
on fornecedor.endereco_id = endereco.id;

select nome_fornecedor, endereco_id, cidade
from fornecedor
left join endereco
on fornecedor.endereco_id = endereco.id;

select nome_fornecedor, endereco_id, cidade
from fornecedor
right join endereco
on fornecedor.endereco_id = endereco.id;
-----------

select nome_fornecedor, valor_prod_fornecedor, valor_produto, fornecedor_id
from fornecedor
inner join produtos
on fornecedor.id = produtos.fornecedor_id;

select nome_fornecedor, valor_prod_fornecedor, valor_produto, fornecedor_id
from fornecedor
left join produtos
on fornecedor.id = produtos.fornecedor_id;

select nome_fornecedor, valor_prod_fornecedor, valor_produto, fornecedor_id
from fornecedor
right join produtos
on fornecedor.id = produtos.fornecedor_id;

--Atualize vários registros com colunas NULL;
alter table funcionario 
alter column nome drop not null;

alter table endereco 
alter column cidade drop not null;

alter table endereco 
alter column bairro drop not null;

alter table cliente 
alter column nome drop not null;

alter table fornecedor 
alter column valor_prod_fornecedor drop not null;

--Execute as consultas com Join novamente, avalie os resultados.
select nome, endereco_id, cidade
from funcionario
inner join endereco 
on funcionario.endereco_id = endereco.id;

select nome, endereco_id, cidade
from funcionario
left join endereco 
on funcionario.endereco_id = endereco.id;

select nome, endereco_id, cidade
from funcionario
right join endereco 
on funcionario.endereco_id = endereco.id;
----------

select nome, endereco_id, bairro
from cliente
inner join endereco
on cliente.endereco_id = endereco.id

select nome, endereco_id, bairro
from cliente
left join endereco
on cliente.endereco_id = endereco.id

select nome, endereco_id, bairro
from cliente
right join endereco
on cliente.endereco_id = endereco.id
----------

select nome_fornecedor, endereco_id, cidade
from fornecedor
inner join endereco
on fornecedor.endereco_id = endereco.id;

select nome_fornecedor, endereco_id, cidade
from fornecedor
left join endereco
on fornecedor.endereco_id = endereco.id;

select nome_fornecedor, endereco_id, cidade
from fornecedor
right join endereco
on fornecedor.endereco_id = endereco.id;
-----------

select nome_fornecedor, valor_prod_fornecedor, valor_produto, fornecedor_id
from fornecedor
inner join produtos
on fornecedor.id = produtos.fornecedor_id;

select nome_fornecedor, valor_prod_fornecedor, valor_produto, fornecedor_id
from fornecedor
left join produtos
on fornecedor.id = produtos.fornecedor_id;

select nome_fornecedor, valor_prod_fornecedor, valor_produto, fornecedor_id
from fornecedor
right join produtos
on fornecedor.id = produtos.fornecedor_id;