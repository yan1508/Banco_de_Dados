CREATE DATABASE IF NOT EXISTS db_loja COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_loja;

CREATE TABLE IF NOT EXISTS tb_produto(
	id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    preco FLOAT(4,2) NOT NULL
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_cliente (
	id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
)AUTO_INCREMENT = 1;

-- TABELAS COM CHAVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_pedido (
	id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    dt_pedido DATE NOT NULL,
    id_cliente INT,
    
    CONSTRAINT fk_cliente_id_cliente FOREIGN KEY (id_cliente) REFERENCES tb_cliente(id_cliente) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_produto_pedido (
	id_produto_pedido  INT PRIMARY KEY AUTO_INCREMENT,
    id_produto INT,
    id_pedido INT,
    
    CONSTRAINT fk_produto_id_produto FOREIGN KEY (id_produto) REFERENCES tb_produto(id_produto) ON DELETE CASCADE,
    CONSTRAINT fk_pedido_id_pedido FOREIGN KEY (id_pedido) REFERENCES tb_pedido(id_pedido) ON DELETE CASCADE
)AUTO_INCREMENT = 1;