-- Criar o banco de dados, se não existir
CREATE DATABASE IF NOT EXISTS dbpesquisa;
-- Selecionar o banco de dados
USE dbpesquisa;

-- Deletar o banco de dados (isso apagará todas as tabelas, então use com cuidado)
-- DROP DATABASE dbpesquisa;

-- Criar a tabela ruidos (ruídos)
CREATE TABLE IF NOT EXISTS ruidos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nivel INT,
    horario TIME
)AUTO_INCREMENT = 1;

-- Criar a tabela cruzamento
CREATE TABLE IF NOT EXISTS cruzamento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(255),
    nome VARCHAR(255)
)AUTO_INCREMENT = 1;

-- Criar a tabela nivel_medio (nível médio)
CREATE TABLE IF NOT EXISTS nivel_medio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nivel_id INT,
    horario_id TIME,
    CONSTRAINT fk_nivel_id FOREIGN KEY (nivel_id) REFERENCES ruidos(id),
    CONSTRAINT fk_horario_id FOREIGN KEY (horario_id) REFERENCES ruidos(horario)
)AUTO_INCREMENT = 1;

-- Inserir os dados na tabela ruidos
INSERT INTO ruidos (nivel, horario) VALUES
(85, '12:24:00'),
(92, '12:45:00'),
(95, '13:00:00'),
(98, '13:30:00'),
(101, '14:00:00'),
(103, '14:15:00'),
(107, '14:30:00'),
(110, '15:00:00'),
(114, '15:15:00'),
(117, '15:30:00'),
(120, '16:00:00'),
(120, '16:15:00'),
(122, '16:30:00'),
(125, '17:00:00'),
(127, '17:15:00'),
(112, '17:30:00');
