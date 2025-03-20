CREATE DATABASE IF NOT EXISTS db_escola_magia COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_escola_magia;

CREATE TABLE IF NOT EXISTS tb_mago (
	id_mago INT PRIMARY KEY AUTO_INCREMENT,
    nv_mago INT NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_aula (
	id_aula INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_feitico (
	id_feitico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    nv_dificuldade VARCHAR(255) UNIQUE NOT NULL
)AUTO_INCREMENT = 1;

-- TABELAS COM CHAVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_mago_aula (
	id_mago_feitico INT PRIMARY KEY AUTO_INCREMENT,
    id_mago INT,
    id_aula INT,
    
    CONSTRAINT fk_mago_id_mago FOREIGN KEY (id_mago) REFERENCES tb_mago(id_mago) ON DELETE CASCADE,
    CONSTRAINT fk_aula_id_aula FOREIGN KEY (id_aula) REFERENCES tb_aula(id_aula) ON DELETE CASCADE
)AUTO_INCREMENT = 1;