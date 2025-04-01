CREATE DATABASE IF NOT EXISTS dbpesquisa;

USE dbpesquisa;

CREATE TABLE IF NOT EXISTS ruidos(
    id INT PRIMARY KEY AUTO_INCREMENT,
    nivel INT,
    horario TIME
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS cruzamento(
    id INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(255),
    nome VARCHAR(255)
) AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS nivel_medio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nivel_id INT,
    horario_id TIME,
    CONSTRAINT fk_nivel_id FOREIGN KEY (nivel_id) REFERENCES ruidos(id),
    CONSTRAINT fk_horario_id FOREIGN KEY (horario_id) REFERENCES ruidos(horario)
) AUTO_INCREMENT = 1;


INSERT INTO ruidos (nivel, horario) VALUES
(85, '12:24'),
(92, '12:45'),
(95, '13:00'),
(98, '13:30'),
(101, '14:00'),
(103, '14:15'),
(107, '14:30'),
(110, '15:00'),
(114, '15:15'),
(117, '15:30'),
(120, '16:00'),
(120, '16:15'),
(122, '16:30'),
(125, '17:00'),
(127, '17:15'),
(112, '17:30');

SELECT AVG(nivel) AS media_nivel
FROM ruidos;

SELECT COUNT(nivel) AS total_registros
FROM ruidos;

SELECT SUM(nivel) AS soma_nivel
FROM ruidos;

SELECT MIN(nivel) AS menor_nivel
FROM ruidos;

SELECT MAX(nivel) AS maior_nivel
FROM ruidos;
