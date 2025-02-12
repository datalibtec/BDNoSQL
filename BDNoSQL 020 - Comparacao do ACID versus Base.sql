/*
Arquivo.....: BDNoSQL 020 - Comparacao do ACID versus Base
Data........: 11/02/2025
Autor.......: Datalib Tecnologia e Treinamento em Dados (Saito)
Copyright...: Utlização somente para fins educacionais e didaticos com autorização do autor.
Referencias.: 
Comentario..: Teste de bloqueio do SQL Server (ACID)
		  
*/


drop database if exists bancos
go

create database bancos
go

use bancos
go

create table extrato_bb (
	id		int not null,
	[data]  date not null,
	nrconta	varchar(10),
	valor	money,
	constraint pk_extrato_bb primary key(id) 
)
go

create table extrato_itau (
	id		int not null,
	[data]  date not null,
	nrconta	varchar(10),
	valor	money,
	constraint pk_extrato_itau primary key(id) 
)
go

--insercao de dados no bb

--transação atomica
begin tran
insert into extrato_bb(id, [data], nrconta, valor) values
					  (1,'20250211','10', 1000.00);
insert into extrato_bb(id, [data], nrconta, valor) values
					  (2,'20250211','20', 10000.00);
commit

select * from extrato_bb

--transação atomica
begin tran
insert into extrato_itau(id, [data], nrconta, valor) values
					  (1000,'20250211','111', 3000.00);
insert into extrato_itau(id, [data], nrconta, valor) values
					  (1001,'20250211','222', 50000.00);
commit

select * from extrato_itau


--Session 1
begin tran
insert into extrato_itau(id, [data], nrconta, valor) values
					  (1010,'20250211','111', -1000.00);


--Session 2 (abrir outra aba New Query)
insert into extrato_bb(id, [data], nrconta, valor) values
					  (3,'20250211','10', 1000.00);

--seleção de dados do bb
select * from extrato_bb

--forçando uma leitura suja
select * from extrato_bb with(nolock)



--Voltar na Session 1
rollback

--executar novamente a transacoes
--efetivar a transação na Session 1
commit


--para apagar o banco de dados "bancos" criado
use master

drop database if exists bancos
go
















