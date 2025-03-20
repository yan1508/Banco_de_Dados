CREATE DATABASE IF NOT EXISTS db_biblioteca_1 COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_biblioteca_1;

CREATE TABLE IF NOT EXISTS tb_autor (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_usuario (
	id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
)AUTO_INCREMENT = 1;

-- TABELAS COM CHAVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_livro (
	id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    ano_publicacao YEAR NOT NULL,
    id_autor INT,
    
    CONSTRAINT fk_autor_id_autor FOREIGN KEY (id_autor) REFERENCES tb_autor(id_autor) ON DELETE CASCADE
)AUTO_INCREMENT =1 ;

CREATE TABLE IF NOT EXISTS tb_emprestimo (
	id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    dt_emprestimo DATE NOT NULL,
    dt_evolucao DATE NOT NULL,
    id_livro INT,
    id_usuario INT,
    
    CONSTRAINT fk_livro_id_livro FOREIGN KEY (id_livro) REFERENCES tb_livro(id_livro) ON DELETE CASCADE,
    CONSTRAINT fk_usuario_id_usuario FOREIGN KEY (id_usuario) REFERENCES tb_usuario(id_usuario) ON DELETE CASCADE
)AUTO_INCREMENT = 1;