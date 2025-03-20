CREATE DATABASE IF NOT EXISTS db_parque_diversao COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_parque_diversao;

CREATE TABLE IF NOT EXISTS tb_visitante (
	id_visitante INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

-- TABELAS COM CHAVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_ingresso (
	id_ingresso INT PRIMARY KEY AUTO_INCREMENT,
    valor FLOAT(4,2) NOT NULL,
    id_visitante INT,
    
    CONSTRAINT fk_visitante_id_visitante FOREIGN KEY (id_visitante) REFERENCES tb_visitante(id_visitante) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_brinquedo (
	id_brinquedo INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    altura_minima FLOAT(4,2) NOT NULL,
    id_ingresso INT,
    
    CONSTRAINT fk_ingresso_id_ingresso FOREIGN KEY (id_ingresso) REFERENCES tb_ingresso(id_ingresso) ON DELETE CASCADE
);