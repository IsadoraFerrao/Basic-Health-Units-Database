/* CRIAÇÃO DA BASE DE DADOS UBS - UNIDADE BÁSICA DE SAÚDE */
CREATE DATABASE "UBS"
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'English, United States'
       LC_CTYPE = 'English, United States'
       CONNECTION LIMIT = -1;


/*COMANDOS DDL - Data Definition Language*/

/* CRIAÇÃO DA TABELA ESTADO*/
DROP TABLE IF EXISTS Estado CASCADE;
CREATE TABLE Estado (
 cod_estado serial,
 nome_estado  varchar(100),
PRIMARY KEY ( cod_estado )); 


/* CRIAÇAO DA TABELA CIDADE */
DROP TABLE IF EXISTS Cidade CASCADE;
CREATE TABLE  Cidade (
 cod_cidade int,
 nome_cidade varchar(100),
 latitude  varchar(180),
 longitude varchar(180),
 cod_estado  int NOT NULL,
PRIMARY KEY ( cod_cidade ),
CONSTRAINT  Cidade_ibfk_1  FOREIGN KEY ( cod_estado ) REFERENCES  estado (cod_estado ));

/* CRIAÇÃO DA TABELA BAIRRO*/
DROP TABLE IF EXISTS Bairro CASCADE;
CREATE TABLE Bairro (
 cod_bairro serial,
 nome_bairro varchar(100) NOT NULL,
PRIMARY KEY ( cod_bairro ));

/* CRIAÇAO DA TABELA ESTABELECIMENTO*/
DROP TABLE IF EXISTS Estabelecimento CASCADE;
CREATE TABLE  Estabelecimento (
 cod_cnes int,
 nome_estabelecimento varchar(100),
 endereco  varchar(100),
 telefone varchar(50),
 desc_estrut_defIdoso varchar(100),
 desc_equipamento varchar(100),
 desc_estrut_estabelecimento varchar(100),
 desc_medicamentos varchar(100), 
 cod_cidade  int NOT NULL,
 cod_bairro  int NOT NULL,
 PRIMARY KEY ( cod_cnes ),
CONSTRAINT  Estabelecimento_ibfk_1  FOREIGN KEY ( cod_cidade ) REFERENCES Cidade (cod_cidade ),
CONSTRAINT  Estabelecimento_ibfk_2  FOREIGN KEY ( cod_bairro ) REFERENCES Bairro (cod_bairro ));


/*REMOÇÃO DE TABELA*/

/* 1- Remoção da tabela Estabelecimento*/
drop table Estabelecimento;

/* 2- Remoção da tabela Cidade */
drop table Cidade;

/* 3- Remoção da tabela Estado */
drop table Estado;
		
/* 4- Remoção da tabela Bairro */
drop table Bairro;


/*ALTERAÇÃO DE TABELA*/

/* 1- Alteração na tabela Estabelecimento*/
alter table Estabelecimento drop nome_estabelecimento; /*Excluir*/
alter table Estabelecimento drop endereco; /*Excluir*/
alter table Estabelecimento drop telefone; /*Excluir*/
alter table Estabelecimento drop desc_estrut_defIdoso; /*Excluir*/
alter table Estabelecimento drop desc_equipamento; /*Excluir*/
alter table Estabelecimento drop desc_estrut_estabelecimento; /*Excluir*/
alter table Estabelecimento drop desc_medicamentos; /*Excluir*/

alter table Estabelecimento add nome_estabelecimento varchar(100); /*Adicionar*/
alter table Estabelecimento add endereco varchar(100); /*Adicionar*/
alter table Estabelecimento add telefone varchar(50); /*Adicionar*/
alter table Estabelecimento add desc_estrut_defIdoso varchar(100); /*Adicionar*/
alter table Estabelecimento add desc_equipamento varchar(100); /*Adicionar*/ 
alter table Estabelecimento add desc_estrut_estabelecimento varchar(100); /*Adicionar*/ 
alter table Estabelecimento add desc_medicamentos varchar(100); /*Adicionar*/


/* 2- Alteração na tabela Cidade com ADICIONAR E REMOVER */
alter table Cidade drop nome_cidade; /*Excluir*/
alter table Cidade drop latitude; /*Excluir*/
alter table Cidade drop longitude; /*Excluir*/

alter table Cidade add nome_cidade varchar(100); /*Adicionar*/
alter table Cidade add latitude varchar(180); /*Adicionar*/
alter table Cidade add longitude varchar(180); /*Adicionar*/


/* 3- Alteração da tabela Estado */
alter table Estado drop nome_estado; /*Excluir*/

alter table Estado add nome_estado varchar(100); /*Adicionar*/


/* 4- Alteração da tabela Bairro */
alter table Bairro drop nome_bairro; /*Excluir*/

alter table Bairro add nome_bairro varchar(100); /*Adicionar*/

/*DML - Data Manipulation Language*/
/* INSERT */
/* 1- Insert na tabela Estado*/
INSERT INTO Estado VALUES (1,'Rio Grande do Sul');
INSERT INTO Estado VALUES (2,'Santa Catarina');
INSERT INTO Estado VALUES (3,'São Paulo');
INSERT INTO Estado VALUES (4,'Rio de Janeiro');
INSERT INTO Estado VALUES (5,'Minas Gerais');

INSERT INTO estado(cod_estado, nome_estado) VALUES (6, 'Pernambuco');
INSERT INTO estado(cod_estado, nome_estado) VALUES (7, 'Bahia');
INSERT INTO estado(cod_estado, nome_estado) VALUES (8, 'Distrito Federal');
INSERT INTO estado(cod_estado, nome_estado) VALUES (9, 'Maranhão');
INSERT INTO estado(cod_estado, nome_estado) VALUES (10, 'Amapá');


/* 2- Insert na tabela Cidade */
INSERT INTO Cidade VALUES (1, 'Alegrete', '180', '180', 1);
INSERT INTO Cidade VALUES (2, 'Chapecó', '180', '180', 2); /*#Força_Chapecoenses*/
INSERT INTO Cidade VALUES (3, 'Santo André', '180', '180', 3);
INSERT INTO Cidade VALUES (4, 'Rio Das Ostras', '180', '180', 4);
INSERT INTO Cidade VALUES (5, 'Mariana', '180', '180', 5);

INSERT INTO Cidade(cod_cidade, nome_cidade, latitude, longitude, cod_estado) VALUES (6, 'Olinda', '180', '180', 6);
INSERT INTO Cidade(cod_cidade, nome_cidade, latitude, longitude, cod_estado) VALUES (7, 'Alagoinhas', '180', '180', 7);
INSERT INTO Cidade(cod_cidade, nome_cidade, latitude, longitude, cod_estado) VALUES (8, 'Águas Claras', '180', '180', 8);
INSERT INTO Cidade(cod_cidade, nome_cidade, latitude, longitude, cod_estado) VALUES (9, 'Colinas', '180', '180', 9);
INSERT INTO Cidade(cod_cidade, nome_cidade, latitude, longitude, cod_estado) VALUES (10, 'Cutias', '180', '180', 10);

/* 3- Insert na tabela Bairro */
INSERT INTO Bairro VALUES (1,'Vila Julia');
INSERT INTO Bairro VALUES (2,'Promorar');
INSERT INTO Bairro VALUES (3,'Nova Brasilia');
INSERT INTO Bairro VALUES (4,'Ibirapuita');
INSERT INTO Bairro VALUES (5,'Saint Pastous');

INSERT INTO bairro(cod_bairro, nome_bairro) VALUES (6, 'Honorio Lemes');
INSERT INTO bairro(cod_bairro, nome_bairro) VALUES (7, 'Cavera');
INSERT INTO bairro(cod_bairro, nome_bairro) VALUES (8, 'Vila Nova');
INSERT INTO bairro(cod_bairro, nome_bairro) VALUES (9, 'Joao XXIII');
INSERT INTO bairro(cod_bairro, nome_bairro) VALUES (10, 'Centro');

/* 4- Insert na tabela Estabelecimento */
INSERT INTO Estabelecimento VALUES (1, 'Santa Casa', 'Praça Gazeta n° 78', 34228709, 'Desempenho acima da média', 'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho acima da média', 1, 1);
INSERT INTO Estabelecimento VALUES (2, 'Santa Helena', 'General Sampaio n° 80',  34261509, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho acima da média', 2, 2);
INSERT INTO Estabelecimento VALUES (3, 'Postinho ', 'Andradas n° 100',  34221515, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho acima da média', 'Desempenho acima da média', 'Desempenho acima da média', 3, 3);
INSERT INTO Estabelecimento VALUES (4, 'Posto da saúde', 'Ibirapuitã n° 70',  34231520, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho mediano ou  um pouco abaixo', 'Desempenho mediano ou  um pouco abaixo', 'Desempenho mediano ou  um pouco abaixo', 4, 4);
INSERT INTO Estabelecimento VALUES (5, 'Santa Casa de Caridade', 'José Bonifácio zona leste n° 80',  34220090, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho acima da média', 5, 5);

INSERT INTO Estabelecimento(cod_cnes, nome_estabelecimento, endereco, telefone, desc_estrut_defIdoso, desc_equipamento, desc_estrut_estabelecimento, desc_medicamentos, cod_cidade, cod_bairro) VALUES (6, 'Santa Aparecida', 'General Lisboa n° 570',  34225560, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho acima da média', 6, 6);
INSERT INTO Estabelecimento(cod_cnes, nome_estabelecimento, endereco, telefone, desc_estrut_defIdoso, desc_equipamento, desc_estrut_estabelecimento, desc_medicamentos, cod_cidade, cod_bairro) VALUES (7, 'Santa Madagascar', 'Promorar n° 43',  34214045, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho acima da média', 7, 7);
INSERT INTO Estabelecimento(cod_cnes, nome_estabelecimento, endereco, telefone, desc_estrut_defIdoso, desc_equipamento, desc_estrut_estabelecimento, desc_medicamentos, cod_cidade, cod_bairro) VALUES (8, 'Banco de vida', 'José Bonifácio n° 80',  34211040, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho mediano ou  um pouco abaixo', 'Desempenho mediano ou  um pouco abaixo', 'Desempenho mediano ou  um pouco abaixo', 8, 8);
INSERT INTO Estabelecimento(cod_cnes, nome_estabelecimento, endereco, telefone, desc_estrut_defIdoso, desc_equipamento, desc_estrut_estabelecimento, desc_medicamentos, cod_cidade, cod_bairro) VALUES (9, 'Posto da saúde', 'José Bonifácio dos Andradas n° 90',  34234540, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho mediano ou  um pouco abaixo', 'Desempenho mediano ou  um pouco abaixo', 'Desempenho mediano ou  um pouco abaixo', 9, 9);
INSERT INTO Estabelecimento(cod_cnes, nome_estabelecimento, endereco, telefone, desc_estrut_defIdoso, desc_equipamento, desc_estrut_estabelecimento, desc_medicamentos, cod_cidade, cod_bairro) VALUES (10, 'Banco de corações', 'Andradas do litoral n° 240',  34218589, 'Desempenho mediano ou  um pouco abaixo da média',  'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho mediano ou  um pouco abaixo da média', 'Desempenho acima da média', 10, 10);


/*DELETE*/

/* 1- Delete na tabela Estabelecimento*/
delete from estabelecimento where cod_cnes=1;
delete from estabelecimento where cod_cnes=2;
delete from estabelecimento where cod_cnes=3;
delete from estabelecimento where cod_cnes=4;
delete from estabelecimento where cod_cnes=5;
delete from estabelecimento where cod_cnes=6;
delete from estabelecimento where cod_cnes=7;
delete from estabelecimento where cod_cnes=8;
delete from estabelecimento where cod_cnes=9;
delete from estabelecimento where cod_cnes=10;


/* 2- Delete na tabela Cidade*/
delete from cidade where cod_cidade=1;
delete from cidade where cod_cidade=2;
delete from cidade where cod_cidade=3;
delete from cidade where cod_cidade=4;
delete from cidade where cod_cidade=5;
delete from cidade where cod_cidade=6;
delete from cidade where cod_cidade=7;
delete from cidade where cod_cidade=8;
delete from cidade where cod_cidade=9;
delete from cidade where cod_cidade=10;


/* 3- Delete na tabela Estado*/
delete from estado where cod_estado=1;
delete from estado where cod_estado=2;
delete from estado where cod_estado=3;
delete from estado where cod_estado=4;
delete from estado where cod_estado=5;
delete from estado where cod_estado=6;
delete from estado where cod_estado=7;
delete from estado where cod_estado=8;
delete from estado where cod_estado=9;
delete from estado where cod_estado=10;

/* 4- Delete na tabela Bairro*/
delete from bairro where cod_bairro=1;
delete from bairro where cod_bairro=2;
delete from bairro where cod_bairro=3;
delete from bairro where cod_bairro=4;
delete from bairro where cod_bairro=5;
delete from bairro where cod_bairro=6;
delete from bairro where cod_bairro=7;
delete from bairro where cod_bairro=8;
delete from bairro where cod_bairro=9;
delete from bairro where cod_bairro=10;

/*UPDATE*/
/*1- Atualização na Tabela Estado*/
update estabelecimento set telefone=40028922 where cod_cnes=2;


/*SELECT*/
/*1 - Seleção da tabela Estado*/
Select * from estado;

/*2 - Seleção da tabela Cidade*/
Select * from cidade;

/*3 - Seleção da tabela Estabelecimento*/
Select * from estabelecimento;

/*4 - Seleção da tabela Bairro*/
Select * from bairro;

/*SELECT - DISTINCT*/
/*1 - Seleção da tabela Estado*/
Select distinct cod_estado, nome_estado from estado;

/*2 - Seleção da tabela Cidade*/
Select distinct cod_estado, nome_cidade from cidade;
Select distinct cod_cidade, nome_cidade from cidade;

/*3 - Seleção da tabela Estabelecimento*/
Select distinct cod_cidade, nome_estabelecimento from estabelecimento;
Select distinct cod_cnes, nome_estabelecimento from estabelecimento;
Select distinct cod_bairro, nome_estabelecimento from estabelecimento;

/*1 - Seleção da tabela Bairro*/
Select distinct cod_bairro, nome_bairro from bairro;


/* SELECT COM EXPRESSÃO ARITMÉTICA */

/*1- Expressão aritmética na tabela Cidade
select nome_cidade, latitude*2 from cidade;
*/

/*SELECT com AND e OR*/
/* 1 - Select and, or da tabela estabelecimento*/
Select nome_estabelecimento from estabelecimento where cod_cnes=1 AND cod_cidade=1; /* AND */
Select nome_estabelecimento from estabelecimento where cod_cnes=2 or cod_cidade=3; /* OR */


/* 2 - Select and, or da tabela cidade*/
Select nome_cidade, latitude from cidade where cod_estado=1 AND latitude='180'; /* AND */
Select nome_cidade, longitude from cidade where longitude='180' or cod_cidade=30; /* OR */


/* 3 - Select and, or da tabela estado*/
Select nome_estado from estado where cod_estado=1 AND nome_estado='Rio Grande do Sul'; /* AND */
Select nome_estado from estado where cod_estado=50 or nome_estado='Distrito Federal'; /* OR */

/* 4 - Select and, or da tabela Bairro*/
Select nome_bairro from bairro where cod_bairro=2 AND nome_bairro='Promorar'; /* AND */
Select nome_bairro from bairro where cod_bairro=50 or nome_bairro='Vila Julia'; /* OR */


/*SELECT COM BETWEEN*/
/* 1 - Select com between da tabela estabelecimento*/
Select telefone from estabelecimento where cod_cnes between 5 and 8;


/* 2 - Select com between da tabela cidade*/
Select nome_cidade, latitude from cidade where cod_estado between 1 AND 6; 


/* 3 - Select com between da tabela estado*/
Select cod_estado, nome_estado from estado where cod_estado between 4 AND 7;

/* 3 - Select com between da tabela Bairro*/
Select cod_bairro, nome_bairro from bairro where cod_bairro between 8 AND 10;

/*SELECT COM LIKE*/

/* 1 - Select com like na tabela estabelecimento*/
Select * from estabelecimento where endereco like '%José%';

/* 2 - Select com like na tabela cidade*/
Select * from cidade where nome_cidade like '%Cha%'; /* #Força_chape*/

/* 3 - Select com like na tabela estado*/
Select * from estado where nome_estado like '%Janeiro%';

/* 4 - Select com like na tabela bairro*/
Select * from bairro where nome_bairro like '%Ibi%';


/* SELECT COM ORDENAÇÃO DE TUPLAS - ORDER BY  - DESC E ASC*/

/* 1 - Select com ordenação de tuplas na tabela estabelecimento*/
Select * from estabelecimento order by nome_estabelecimento; /* order by */
Select * from estabelecimento order by nome_estabelecimento asc; /* order by ASC */
Select * from estabelecimento order by nome_estabelecimento desc; /* order by DESC */

/* 2 - Select com ordenação de tuplas na tabela cidade*/
Select * from cidade order by nome_cidade; /* order by */
Select * from cidade order by nome_cidade asc; /* order by ASC */
Select * from cidade order by nome_cidade desc; /* order by DESC */

/* 3 - Select com ordenação de tuplas na tabela estado*/
Select * from estado order by nome_estado; /* order by */
Select * from estado order by nome_estado asc; /* order by ASC */
Select * from estado order by nome_estado desc; /* order by DESC */

/* 4 - Select com ordenação de tuplas na tabela bairro*/
Select * from bairro order by nome_bairro; /* order by */
Select * from bairro order by nome_bairro asc; /* order by ASC */
Select * from bairro order by nome_bairro desc; /* order by DESC */


/* SELECT PARA VALORES NULOS */
/* 1 - Select IS NULL e IS NOT NULL da tabela Estabelecimento*/
Select nome_estabelecimento from estabelecimento where cod_cnes is null; 
Select nome_estabelecimento from estabelecimento where cod_cnes is not null; 

/* 2 - Select IS NULL e IS NOT NULL da tebala Cidade*/
Select nome_cidade from cidade where cod_cidade is null; 
Select nome_cidade from cidade where cod_cidade is not null; 

/* 3 - Select IS NULL e IS NOT NULL da tabela Estado*/
Select nome_estado from estado where cod_estado is null; 
Select nome_estado from estado where cod_estado is not null; 

/* 3 - Select IS NULL da tabela Bairro*/
Select nome_bairro from bairro where cod_bairro is null; 
Select nome_bairro from bairro where cod_bairro is not null; 

 
/* FUNÇÕES DE AGREGAÇÃO */
/* 1 - Função de agregação da tabela Estabelecimento*/

Select avg (cod_cnes) from estabelecimento; /* AVG : valor médio */
Select min (cod_cnes) from estabelecimento; /* MIN : valor mínimo */
Select max (cod_cnes) from estabelecimento; /* MAX : valor máximo */
Select sum (cod_cnes) from estabelecimento; /* SUM : soma dos valores */
Select count(*) cod_cnes from estabelecimento; /* COUNT : número de valores */

/* 2 -Função de agregação da tebala Cidade*/
Select avg (cod_cidade) from cidade; /* AVG : valor médio */
Select min (cod_cidade) from cidade; /* MIN : valor mínimo */
Select max (cod_cidade) from cidade; /* MAX : valor máximo */
Select sum (cod_cidade) from cidade; /* SUM : soma dos valores */
Select count(*) cod_cidade from cidade; /* COUNT : número de valores */


/* 3 - Função de agregação da tabela Estado*/
Select avg (cod_estado) from estado; /* AVG : valor médio */
Select min (cod_estado) from estado; /* MIN : valor mínimo */
Select max (cod_estado) from estado; /* MAX : valor máximo */
Select sum (cod_estado) from estado; /* SUM : soma dos valores */
Select count(*) cod_estado from estado; /* COUNT : número de valores */

/* 4 - Função de agregação da tabela Bairro*/
Select avg (cod_bairro) from bairro; /* AVG : valor médio */
Select min (cod_bairro) from bairro; /* MIN : valor mínimo */
Select max (cod_bairro) from bairro; /* MAX : valor máximo */
Select sum (cod_bairro) from bairro; /* SUM : soma dos valores */
Select count(*) cod_bairro from bairro; /* COUNT : número de valores */


/*GROUP BY*/
/* 1 - Select com GROUP BY da tabela Estabelecimento*/
Select nome_estabelecimento, sum(cod_cnes) from estabelecimento GROUP BY cod_cnes; 

/* 2 - Select com GROUP BY da tebala Cidade*/
Select nome_cidade, sum(cod_cidade) from cidade GROUP BY cod_cidade; 

/* 3 - Select com GROUP BY da tabela Estado*/
Select nome_estado, sum(cod_estado) from estado GROUP BY cod_estado; 

/* 4 - Select com GROUP BY da tabela Bairro*/
Select nome_bairro, sum(cod_bairro) from bairro GROUP BY cod_bairro; 


/*INNER JOIN */
/* 1 - Select com INNER JOIN da tabela Estabelecimento*/
Select * from cidade INNER JOIN estabelecimento ON estabelecimento.cod_cidade = cidade.cod_cidade; 

/* 2 - Select com INNER JOIN da tebala Cidade*/
Select * from cidade INNER JOIN estado ON cidade.cod_estado = estado.cod_estado; 

/* 3 - Select com INNER JOIN  da tabela Estado*/
Select * from estado INNER JOIN cidade ON estado.cod_estado = cidade.cod_estado; 


/* LEFT OUTER JOIN */
/* 1 - Select com LEFT OUTER JOIN da tabela Estabelecimento*/
Select * from estabelecimento LEFT JOIN cidade ON cidade.cod_cidade = estabelecimento.cod_cidade; 

/* 2 - Select com LEFT OUTER JOIN da tebala Cidade*/
Select * from cidade LEFT JOIN estabelecimento ON cidade.cod_cidade = estabelecimento.cod_cidade; 

/* 3 - Select com GROUP BY da tabela Estado*/
Select * from estado LEFT JOIN cidade ON cidade.cod_estado = estado.cod_estado; 



/* RIGHT OUTER JOIN */
/* 1 - Select com RIGHT OUTER JOIN da tabela Estabelecimento*/
Select * from estabelecimento RIGHT JOIN cidade ON cidade.cod_cidade = estabelecimento.cod_cidade; 

/* 2 - Select com RIGHT OUTER JOIN da tebala Cidade*/
Select * from cidade RIGHT JOIN estabelecimento ON cidade.cod_cidade = estabelecimento.cod_cidade; 

/* 3 - Select com RIGHT OUTER JOIN da tabela Estado*/
Select * from estado RIGHT JOIN cidade ON cidade.cod_estado = estado.cod_estado; 


/* FULL OUTER JOIN */
/* 1 - Select com FULL OUTER JOIN da tabela Estabelecimento*/
Select * from estabelecimento FULL JOIN cidade ON cidade.cod_cidade = estabelecimento.cod_cidade; 

/* 2 - Select com FULL OUTER JOIN da tebala Cidade*/
Select * from cidade FULL JOIN estabelecimento ON cidade.cod_cidade = estabelecimento.cod_cidade; 

/* 3 - Select com FULL OUTER JOIN da tabela Estado*/
Select * from estado FULL JOIN cidade ON cidade.cod_estado = estado.cod_estado; 



/*OPERAÇÕES DE CONJUNTO - Union, Intersect */  

/* 1 - Select com GROUP BY da tabela Estabelecimento*/

Select nome_estabelecimento from estabelecimento union select nome_cidade from cidade;
Select nome_estabelecimento from estabelecimento intersect select nome_cidade from cidade;


/* 2 - Select com GROUP BY da tebala Cidade*/

Select nome_cidade from cidade union select nome_estado from estado;
Select nome_cidade from cidade intersect select nome_estado from estado;


/* 3 - Select com GROUP BY da tabela Estado*/

Select nome_estado from estado union select nome_cidade from cidade;
Select nome_estado from estado intersect select nome_cidade from cidade;

/* 4 - Select com GROUP BY da tabela Bairro*/

Select nome_bairro from bairro union select nome_estabelecimento from estabelecimento;
Select nome_estado from estado intersect select nome_bairro from bairro;








