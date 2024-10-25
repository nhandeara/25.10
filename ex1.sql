create database bd_clientes1e; #DDL

create table tbl_clientes(
codigo int not null primary key auto_increment,  #DDL(cria,etc)
nome varchar(40) not null,
sexo char(1) not null);

insert into tbl_clientes(nome,sexo)#DML
values("Humberto", "M"),("michael B. Jordan", "M"), ("xuxa","F");

select*from tbl_clientes;#DML

DELIMITER $$
CREATE PROCEDURE sp_lista_clientes(IN opcao INT)
BEGIN 
IF opcao = 0 THEN
SELECT * FROM tbl_clientes WHERE sexo = 'F';
ELSEIF opcao = 1 THEN
SELECT*FROM tbl_clientes WHERE sexo= 'M';
ELSE
SELECT*FROM tbl_clientes;
end if;
END $$
DELIMITER ;

SHOW procedure status;
#LISTA SEXO FEMININO
CALL sp_lista_clientes(0);
#lista sexo masculino
CALL sp_lista_clientes(1);
#lista todos:
CALL sp_lista_clientes(2);

#EXEMPLO 2

DELIMITER $$
create procedure sp_busca_cliente_por_nome
(in nome_parcial VARCHAR(100))
BEGIN
SELECT * FROM tbl_clientes
where nome LIKE concat('%', nome_parcial, '%');
END $$
DELIMITER ;

CALL sp_busca_por_nome('x');-- retorna o 'cliente xuxa'

create table tbl_clientes2(
id int primary key auto_increment not null,
nome varchar (100),
idade int,
sexo char(1),
email varchar(100),
telefone varchar(15),
endereco varchar (255)
);

insert into tbl_clientes2(nome,idade,sexo, email, telefone, endereco)#DML
values("Carlos",19,"M","carlos@gmail", "88888-9999","sao paulo"),
("Rafael",15,"M","rafael@gmail", "8858-1235","sao paulo"),
("Juliana",39,"f","Juliana@gmail", "1236-7896","Rio de janeiro"),
("Stella",45,"f","Stella@gmail", "9090-9999","Itu"),
("Roberta",31,"f","roberta@gmail", "88888-9999","Itapetininga");

select*from tbl_clientes2;

DELIMITER $$
CREATE PROCEDURE sp_lista_clientes2(IN opcao INT)
BEGIN 
IF opcao = 0 THEN
SELECT * FROM tbl_clientes2 WHERE idade > "18";
ELSEIF opcao = 1 THEN
SELECT*FROM tbl_clientes2 WHERE idade < "18";
ELSE
SELECT*FROM tbl_clientes2;
end if;
END $$
DELIMITER ;

SHOW procedure status;
#LISTA MAIOR DE IDADE
CALL sp_lista_clientes2(0);
#lista MENORNDE IDADE
CALL sp_lista_clientes2(1);
#lista todos:
CALL sp_lista_clientes2(2);




