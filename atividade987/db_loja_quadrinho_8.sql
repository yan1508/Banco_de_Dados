CREATE DATABASE db_loja_quadrinho COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_loja_quadrinho;

CREATE TABLE IF NOT EXISTS tb_cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_autor (
	id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;

-- TABELAS COM CAHVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_venda (
	id_venda  INT PRIMARY KEY AUTO_INCREMENT,
    valor FLOAT(5,2) NOT NULL,
    id_cliente INT,
    
    CONSTRAINT fk_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_quadrinho (
	id_quadrinho INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    id_autor INT,
    
    CONSTRAINT fk_autor_id_autor FOREIGN KEY (id_autor) REFERENCES tb_autor(id_autor) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_valor_venda (
	id_valor_venda INT PRIMARY KEY AUTO_INCREMENT,
    id_venda INT,
    id_quadrinho INT,
    
    CONSTRAINT fk_venda_id_venda FOREIGN KEY (id_venda) REFERENCES tb_venda(id_venda) ON DELETE CASCADE,
    CONSTRAINT fk_quadrinho_id_quadrinho FOREIGN KEY (id_quadrinho) REFERENCES tb_quadrinho(id_quadrinho) ON DELETE CASCADE
)AUTO_INCREMENT = 1;