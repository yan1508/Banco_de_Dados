CREATE DATABASE IF NOT EXISTS db_filme COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_filme;

CREATE TABLE IF NOT EXISTS tb_diretor (
	id_diretor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nacionalidade VARCHAR(255)
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_ator (
	id_ator INT PRIMARY KEY AUTO_INCREMENT,
    nacionalidade VARCHAR(255) NOT NULL,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

-- TABELAS COM CHAVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_filme (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    ano_lancamento YEAR NOT NULL,
    id_diretor INT,
    
    CONSTRAINT fk_diretor_id_diretor FOREIGN KEY (id_diretor) REFERENCES tb_diretor(id_diretor) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_filme_ator (
	id_filme_ator INT PRIMARY KEY AUTO_INCREMENT,
    id_filme INT,
    id_ator INT,
    
    CONSTRAINT fk_filme_id_filme FOREIGN KEY (id_filme) REFERENCES tb_filme(id_filme) ON DELETE CASCADE,
    CONSTRAINT fk_ator_id_ator FOREIGN KEY (id_ator) REFERENCES tb_ator(id_ator) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

