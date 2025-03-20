CREATE DATABASE IF NOT EXISTS db_super_heroi COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_super_heroi;

CREATE TABLE IF NOT EXISTS tb_heroi (
	id_heroi INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    poder VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_vilao (
	id_vilao INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    poder_temivel VARCHAR(255)
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_missao (
	id_missao INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_local (
	id_local INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

-- TABELAS COM CHAVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_heroi_missao (
	id_heroi_missao INT PRIMARY KEY AUTO_INCREMENT,
    id_heroi INT,
    id_missao INT,
    
    CONSTRAINT fk_heroi_id_heroi FOREIGN KEY (id_heroi) REFERENCES tb_heroi(id_heroi) ON DELETE CASCADE,
    CONSTRAINT fk_missao_id_missao FOREIGN KEY (id_missao) REFERENCES tb_missao(id_missao) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_missao_vilao (
	id_missao_vilao INT PRIMARY KEY AUTO_INCREMENT,
    id_missao INT,
    id_vilao INT,
    
    CONSTRAINT fk_missao_id_missao FOREIGN KEY (id_missao) REFERENCES tb_missao(id_missao) ON DELETE CASCADE,
    CONSTRAINT fk_vilao_id_vilao FOREIGN KEY (id_vilao) REFERENCES tb_vilao(id_vilao) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_missao_aula (
	id_missao_aula INT PRIMARY KEY AUTO_INCREMENT,
    id_missao INT,
    id_aula INT,
    
    CONSTRAINT fk_missao_id_missao FOREIGN KEY (id_missao) REFERENCES tb_missao(id_missao) ON DELETE CASCADE,
    CONSTRAINT fk_aula_id_aula FOREIGN KEY (id_aula) REFERENCES tb_aula(id_aula) ON DELETE CASCADE
);