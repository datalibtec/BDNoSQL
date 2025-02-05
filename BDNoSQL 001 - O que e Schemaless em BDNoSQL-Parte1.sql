/*
Arquivo.....: BDNoSQL 001 - O que e Schemaless em BDNoSQL-Parte1
Data........: 03/02/2025
Autor.......: Datalib Tecnologia e Treinamento em Dados (Saito)
Copyright...: Utlização somente para fins educacionais e didaticos com autorização do autor.
Referencias.: 
Comentario..: Parte 1
			  Teste de inserção de dados no SQL Server (Schema Rígido)

			  Parte 2
			  Teste de inserção de dados no mongoDB (Schemaless)
*/

drop database if exists Corp
go

create database Corp
go

use Corp
go

/*
Parte 1
*/

--Irá falhar a inserção
insert into cliente (cod_cli, nome_cli, cidade, uf)
			 values (1, 'ANTONIO DA SILVA', 'JUNDIAI','SP'),
				    (2, 'MARIA DE SOUZA', 'BELO HORIZONTE','MG'),
				    (3, 'ANA CAROLINA', 'BUZIOS','RJ')
go

--criando as regras para inserção dos dados
create table cliente (
	cod_cli	 int not null,
	data_cad date not null default getdate(),
	nome_cli varchar(30),
	cidade	 varchar(25),
	uf		 char(02)
	constraint pk_cliente primary key(cod_cli)
)
go

--depois de ter uma estrutura certa, os dados podem ser inseridos:
insert into cliente (cod_cli, nome_cli, cidade, uf)
			 values (1, 'ANTONIO DA SILVA', 'JUNDIAI','SP'),
				    (2, 'MARIA DE SOUZA', 'BELO HORIZONTE','MG'),
				    (3, 'ANA CAROLINA', 'BUZIOS','RJ')
go

--Verificando dados inseridos
select * from cliente 
go


--para apagar o banco de dados Corp criado
use master

drop database if exists Corp
go



