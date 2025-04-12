-- Criação do banco de dados para o cenário de Oficina Mecânica

CREATE DATABASE IF NOT EXISTS OficinaMecanica;
USE OficinaMecanica;

-- CLIENTE
CREATE TABLE Cliente (
    CPF CHAR(11) PRIMARY KEY,
    Nome VARCHAR(100),
    Endereco VARCHAR(150),
    Telefone VARCHAR(15)
);

-- VEÍCULO
CREATE TABLE Veiculo (
    Placa CHAR(7) PRIMARY KEY,
    Modelo VARCHAR(50),
    Marca VARCHAR(50),
    Ano INT,
    Cliente_CPF CHAR(11),
    CONSTRAINT fk_CPF_Cliente FOREIGN KEY (Cliente_CPF) REFERENCES Cliente(CPF)
);

-- EQUIPE
CREATE TABLE Equipe (
    ID INT PRIMARY KEY AUTO_INCREMENT,
    NomeEquipe VARCHAR(50)
);

-- MECÂNICO
CREATE TABLE Mecanico (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100),
    Endereco VARCHAR(150),
    Especialidade VARCHAR(100),
    Equipe_ID INT,
    CONSTRAINT fk_Equipe_Mec FOREIGN KEY (Equipe_ID) REFERENCES Equipe(ID)
);

-- ORDEM DE SERVIÇO
CREATE TABLE OrdemServico (
    Numero INT PRIMARY KEY AUTO_INCREMENT,
    DataEmissao DATE,
    ValorTotal DECIMAL(10,2),
    Status VARCHAR(30),
    DataConclusao DATE,
    Veiculo_Placa CHAR(7),
    Equipe_ID INT,
    CONSTRAINT fk_Placa_Veic FOREIGN KEY (Veiculo_Placa) REFERENCES Veiculo(Placa),
    CONSTRAINT fk_Equipe_Servico FOREIGN KEY (Equipe_ID) REFERENCES Equipe(ID)
);

-- SERVIÇO
CREATE TABLE Servico (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(150),
    ValorReferencia DECIMAL(10,2)
);

-- PEÇA
CREATE TABLE Peca (
    Codigo INT PRIMARY KEY AUTO_INCREMENT,
    Descricao VARCHAR(100),
    ValorUnitario DECIMAL(10,2)
);

-- SERVIÇO_OS
CREATE TABLE Servico_OS (
    Ordem_Numero INT,
    Servico_Codigo INT,
    Quantidade INT DEFAULT 1,
    ValorCalculado DECIMAL(10,2),
	PRIMARY KEY (Ordem_Numero, Servico_Codigo),
    CONSTRAINT fk_Numero_OS FOREIGN KEY (Ordem_Numero) REFERENCES OrdemServico(Numero),
    CONSTRAINT fk_Codigo_OS FOREIGN KEY (Servico_Codigo) REFERENCES Servico(Codigo)
);

-- PECA_OS
CREATE TABLE Peca_OS (
    Ordem_Numero INT,
    Peca_Codigo INT,
    Quantidade INT,
    ValorTotal DECIMAL(10,2),
    PRIMARY KEY (Ordem_Numero, Peca_Codigo),
    CONSTRAINT fk_NumeroOs_Peca FOREIGN KEY (Ordem_Numero) REFERENCES OrdemServico(Numero),
    CONSTRAINT fk_Codigo_PecaOS FOREIGN KEY (Peca_Codigo) REFERENCES Peca(Codigo)
);

-- ====================
-- INSERÇÃO DE DADOS --
-- ====================

INSERT INTO Cliente (CPF, Nome, Endereco, Telefone)
VALUES ('12345678901', 'Anna Oliveira', 'São Sebastião, 19', '(61) 98765-4321'),
		('98765432100', 'Bruno Souza', 'Asa Sul, 211', '(61) 99999-1111'),
		('45678912300', 'Carla Mendes', 'Gama, Quadra 34', '(61) 98888-2222'),
		('32165498700', 'Daniela Lima', 'Ceilândia, QNO 9', '(61) 97777-3333'),
		('65498732100', 'Eduardo Silva', 'Guará, QE 20', '(61) 96666-4444');

INSERT INTO Veiculo (Placa, Modelo, Marca, Ano, Cliente_CPF)
VALUES ('ABC1234', 'Honda Fit', 'Honda', 2023, '12345678901'),
		('DEF5678', 'Corolla', 'Toyota', 2021, '98765432100'),
		('GHI9012', 'Civic', 'Honda', 2020, '45678912300'),
		('JKL3456', 'Gol', 'Volkswagen', 2019, '32165498700'),
		('MNO7890', 'Onix', 'Chevrolet', 2022, '65498732100');

INSERT INTO Equipe (NomeEquipe)
VALUES ('Equipe 1'),
		('Equipe 2');


INSERT INTO Mecanico (Nome, Endereco, Especialidade, Equipe_ID)
VALUES ('Carlos Oliveira', 'Samambaia, 10', 'Mecanico', 1),
       ('Fernando Costa', 'Taguatinga, 20', 'Mecanico', 1),
       ('Renan Filho', 'Paranoa, 30', 'Eletricista', 1),
       ('João Cleber', 'Ceilândia, 40', 'Mecanico', 2),
       ('Fausto Silva', 'Planaltina, 50', 'Eletricista', 2); 
       

INSERT INTO Servico (Descricao, ValorReferencia)
VALUES ('Troca de óleo', 50.00),
       ('Alinhamento de direção', 100.00);       

INSERT INTO Peca (Descricao, ValorUnitario)
VALUES ('Filtro de óleo', 20.00),
       ('Bateria', 150.00);

INSERT INTO OrdemServico (DataEmissao, ValorTotal, Status, DataConclusao, Veiculo_Placa, Equipe_ID)
VALUES ('2025-04-12', 200.00, 'Em andamento', '2025-04-15', 'ABC1234', 1),
		('2025-04-10', 170.00, 'Finalizado', '2025-04-12', 'DEF5678', 1),
		('2025-04-11', 120.00, 'Em andamento', '2025-04-14', 'GHI9012', 1),
		('2025-04-09', 90.00, 'Finalizado', '2025-04-10', 'JKL3456', 1),
		('2025-04-08', 210.00, 'Em andamento', '2025-04-13', 'MNO7890', 1);

INSERT INTO Servico_OS (Ordem_Numero, Servico_Codigo, Quantidade, ValorCalculado)
VALUES (1, 1, 1, 50.00),
       (1, 2, 1, 100.00),
       (2, 1, 1, 50.00),
	   (2, 2, 1, 100.00),
	   (3, 1, 1, 50.00),
	   (4, 2, 1, 100.00),
	   (5, 1, 1, 50.00);

INSERT INTO Peca_OS (Ordem_Numero, Peca_Codigo, Quantidade, ValorTotal)
VALUES (1, 1, 1, 20.00),
       (1, 2, 1, 150.00),
       (2, 1, 1, 20.00),
	   (2, 2, 1, 150.00),
	   (3, 1, 1, 20.00),
	   (4, 2, 1, 150.00),
	   (5, 1, 1, 20.00);      
       
       
-- ---------------------------
-- CONSULTAS SQL (QUERIES) ---
-- ---------------------------
       
-- 1. Quem são os clientes cadastrados e seus contatos?

SELECT Nome, CPF, Telefone
FROM Cliente;

-- 2. Quais veículos estão registrados para um cliente específico?

SELECT Modelo, Marca, Ano
FROM Veiculo
WHERE Cliente_CPF = '12345678901';

-- 3. Qual foi o tempo estimado para a conclusão de cada ordem de serviço?

SELECT Numero, DATEDIFF(DataConclusao, DataEmissao) AS DiasDuracao
FROM OrdemServico;

-- 4. Quais são os serviços cadastrados e seus valores, do mais caro ao mais barato?

SELECT Descricao, ValorReferencia
FROM Servico
ORDER BY ValorReferencia DESC;

-- 5. Quais equipes têm mais de 1 mecânico?

SELECT Equipe_ID, COUNT(*) AS TotalMecanicos
FROM Mecanico
GROUP BY Equipe_ID
HAVING COUNT(*) > 1;

-- 6. Quais ordens de serviço estão em andamento e os serviços prestados nelas?

SELECT 
    os.Numero AS Ordem,
    c.Nome AS Cliente,
    v.Modelo AS Veiculo,
    e.NomeEquipe AS Equipe,
    s.Descricao AS Servico,
    so.ValorCalculado AS ValorServico
FROM OrdemServico os
JOIN Veiculo v ON os.Veiculo_Placa = v.Placa
JOIN Cliente c ON v.Cliente_CPF = c.CPF
JOIN Equipe e ON os.Equipe_ID = e.ID
JOIN Servico_OS so ON os.Numero = so.Ordem_Numero
JOIN Servico s ON so.Servico_Codigo = s.Codigo
WHERE os.Status = 'Em andamento';

-- 7. Qual é o total gasto com peças por ordem de serviço, onde o gasto foi maior que R$100?

SELECT 
    po.Ordem_Numero,
    SUM(po.ValorTotal) AS TotalGastoPecas
FROM Peca_OS po
GROUP BY po.Ordem_Numero
HAVING SUM(po.ValorTotal) > 100
ORDER BY TotalGastoPecas DESC;

-- 8. Quais são os serviços que têm valor de referência superior a R$80, ordenados do mais caro para o mais barato?

SELECT Codigo, Descricao, ValorReferencia
FROM Servico
WHERE ValorReferencia > 80
ORDER BY ValorReferencia DESC;

-- 9. Qual é o número total de ordens de serviço por status (em andamento, finalizado etc.)?

SELECT Status, COUNT(*) AS TotalOS
FROM OrdemServico
GROUP BY Status;

-- 10. Quais peças foram utilizadas em uma determinada ordem de serviço e qual o custo total por peça?

SELECT p.Descricao, po.Quantidade, p.ValorUnitario, po.ValorTotal
FROM Peca_OS po
JOIN Peca p ON po.Peca_Codigo = p.Codigo
WHERE po.Ordem_Numero = 1;
