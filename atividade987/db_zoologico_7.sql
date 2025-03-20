CREATE DATABASE IF NOT EXISTS db_zoologico COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_zoologico;

CREATE TABLE IF NOT EXISTS tb_especie (
	id_especie INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_habitat (
	id_habitat INT PRIMARY KEY AUTO_INCREMENT,
    condicao_ambiental VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_cuidador (
	id_cuidador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

-- TABELAS COM CHAVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_animal (
	id_animal INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    idade INT NOT NULL,
    id_especie INT,
    id_habitat INT,
    
    CONSTRAINT fk_especie_id_especie FOREIGN KEY (id_especie) REFERENCES tb_especie(id_especie) ON DELETE CASCADE,
    CONSTRAINT fk_habitat_id_habitat FOREIGN KEY (id_habitat) REFERENCES tb_habitat(id_habitat) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_cuidador_habitat (
	id_cuidador_habitat INT PRIMARY KEY AUTO_INCREMENT,
    id_habitat INT,
    id_cuidador INT,
    
    CONSTRAINT fk_habitat_id_habitat FOREIGN KEY (id_habitat) REFERENCES tb_habitat(id_habitat) ON DELETE CASCADE,
    CONSTRAINT fk_cuidador_id_cuidador FOREIGN KEY (id_cuidador) REFERENCES tb_cuidador(id_cuidador) ON DELETE CASCADE
)AUTO_INCREMENT = 1;
 

