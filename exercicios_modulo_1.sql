-- 1  Crie o banco de dados exercicioInnerJoin

create database exercicioInnerJoin;
 use exercicioInnerJoin;
 
-- 2 Crie as tabelas conforme o diagrama do slide 

create table  Cliente (
CPF INTEGER not null primary key,
nome varchar(60),
dtNasc date);

create table Modelo(
codMod integer not null primary key,
desc_2 varchar(40));

create table Patio (
num integer not null primary key,
ender varchar(40) not null,
capacidade integer);

CREATE TABLE veiculo(
  placa VARCHAR(8) NOT NULL PRIMARY KEY,
  Modelo_codMod INT NULL,
  cliente_cpf INT NULL,
  cor VARCHAR(20) NULL,
  FOREIGN KEY (Modelo_codMod) REFERENCES modelo (codMod),
  FOREIGN KEY (cliente_cpf) REFERENCES Cliente (CPF));
  
CREATE TABLE estaciona(
cod INTEGER NOT NULL PRIMARY KEY,
Patio_num INTEGER NOT NULL,
veiculo_placa VARCHAR(8) NOT NULL,
DtEntrada VARCHAR(10) NOT NULL,
DtSaida VARCHAR(10) NOT NULL,
HsEntrada VARCHAR(10) NOT NULL,
HsSaida VARCHAR(10) NOT NULL,
FOREIGN KEY (Patio_num) REFERENCES Patio (num));

INSERT INTO Cliente VALUE (223456789, 'JOAO' , '1995-08-20');
INSERT INTO Cliente VALUE (333456789, 'PATRICK', '1995-03-25');
INSERT INTO Cliente VALUE (444456789, 'MARIA', '1984-05-27');
INSERT INTO Cliente VALUE (555556789, 'JONAS', '1981-08-01');
INSERT INTO Cliente VALUE (666666789, 'MARIANE', '2001-01-09');

INSERT INTO Modelo VALUE(1, 'CORSA');
INSERT INTO Modelo VALUE(2, 'PALIO');
INSERT INTO Modelo VALUE(3, 'GOL');

INSERT INTO Patio VALUE(1, 'RUA GOIAIS', 150);
INSERT INTO Patio VALUE(2, 'RUA AMERICO', 200);
INSERT INTO Patio VALUE(3, 'RUA DAS PALMEIRAS', 500);

INSERT INTO veiculo VALUE('JJJ-2020', 1, 333456789, 'BRANCO');
INSERT INTO veiculo VALUE('JJJ-1010', 2, 666666789, 'BRANCO');
INSERT INTO veiculo VALUE('JEG-2020', 3, 555556789, 'VERDE');
INSERT INTO veiculo VALUE('JEG-1010', 1, 444456789, 'PRATA');
INSERT INTO veiculo VALUE('JAT-2020', 2, 223456789, 'AZUL');
INSERT INTO veiculo VALUE('JAG-2020', 2, 444456789, 'VERDE');


INSERT INTO estaciona VALUE(1, 1, 'JJJ-2020', '13/09/2019', '14/10/2019', '15:00', '09:00');
INSERT INTO estaciona VALUE(2, 2, 'JJJ-1010', '20/08/2020', '20/18/2020', '13:00', '19:00');
INSERT INTO estaciona VALUE(3, 3, 'JEG-2020', '10/03/2019', '11/03/2019', '12:00', '22:00');
INSERT INTO estaciona VALUE(4, 2, 'JEG-1010', '11/07/2019', '11/07/2019', '09:00', '16:00');
INSERT INTO estaciona VALUE(5, 3, 'JJJ-2020', '05/05/2020', '05/05/2019', '10:00', '19:00');
INSERT INTO estaciona VALUE(6, 2, 'JAG-2020', '04/06/2020', '04/06/2019', '12:00', '23:00');


SELECT * FROM Cliente;
SELECT * FROM Modelo;
SELECT *  FROM Patio; 
SELECT * FROM veiculo;
SELECT * FROM estaciona;

 -- 3 Exiba a placa e o nome dos donos de todos os veículos
 
SELECT v.placa, cl.nome FROM veiculo v, cliente cl WHERE
cl.CPF = v.cliente_cpf;

--  4 Exiba o CPF e o nome do cliente que possui o veiculo de placa “JJJ-2020”

SELECT cl.CPF, cl.nome, v.placa FROM cliente cl, veiculo v
WHERE cl.CPF = v.cliente_cpf AND
v.placa = 'JJJ-2020';

-- 5 Exiba a placa e a cor do veículo que possui o código de estacionamento 1

SELECT v.placa, v.cor, es.cod FROM veiculo v, estaciona es 
WHERE v.placa = es.veiculo_placa AND
es.cod = '1';

-- 6 Exiba o endereço, a data de entrada e de saída dos estacionamentos do veículo de placa “JEG-1010”

SELECT  p.ender, es.DtEntrada, es.DtSaida FROM estaciona es, patio p, veiculo v
WHERE v.placa = es.veiculo_placa AND
p.num = es.patio_num AND
v.placa = 'JEG-1010' ;

-- 7 Exiba a quantidade de vezes os veículos de cor verde estacionaram

SELECT count(es.cod) FROM veiculo v, estaciona es 
WHERE v.placa  = es.veiculo_placa AND
v.cor = 'VERDE' ; 

-- 8 Liste todos os clientes que possuem carro de modelo 1

SELECT cl.nome FROM  cliente cl, modelo m, veiculo v
WHERE cl.CPF = v.cliente_cpf AND
v.Modelo_codMod = m.codMod AND
m.codMod = '1' ;

-- 9 Liste as placas, os horários de entrada e saída dos veículos de cor verde

SELECT v.placa , es.HsEntrada, es.HsSaida, v.cor FROM veiculo v, estaciona es 
WHERE v.placa = es.veiculo_placa AND 
v.cor = 'VERDE' ;

-- 10  - Liste todos os estacionamentos do veículo de placa “JJJ-2020”
SELECT es.* FROM veiculo v, estaciona es
WHERE v.placa = es.veiculo_placa AND
v.placa = 'JJJ-2020';

-- 11 Exiba o nome do cliente que possui o veículo cujo código do estacionamento é 2

SELECT cl.nome FROM  cliente cl, estaciona es, veiculo v  WHERE
es.veiculo_placa = v.placa AND
cl.CPF = v.cliente_cpf AND
es.cod = '2'; 

-- 12 Exiba o CPF do cliente que possui o veículo cujo código do estacionamento é 3
SELECT cl.CPF, cl.nome FROM  cliente cl, estaciona es, veiculo v  WHERE
es.veiculo_placa = v.placa AND
cl.CPF = v.cliente_cpf AND
es.cod = '3'; 

-- 13 Exiba a descrição do modelo do veículo cujo código do estacionamento é 2
SELECT m.desc_2 FROM  modelo m, estaciona es, veiculo v  WHERE
es.veiculo_placa = v.placa AND
v.modelo_codMod = m.codMod AND
es.cod = '2'; 

-- Exiba a placa, o nome dos donos e a descrição dos os modelos de todos os veículos

SELECT v.placa, cl.nome, m.desc_2  FROM  cliente cl, modelo m, veiculo v  WHERE
cl.CPF = v.cliente_cpf AND
v.modelo_codMod = m.codMod;

