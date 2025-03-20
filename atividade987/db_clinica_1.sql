CREATE DATABASE db_clinica COLLATE utf8mb4_general_ci CHARSET utf8mb4;

USE db_clinica

CREATE TABLE IF NOT EXISTS tb_especialidade(
	id_especialidade INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(255) NOT NULL
)AUTO_INCREMENT = 1;


CREATE TABLE IF NOT EXISTS tb_paciente (
	id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    dt_consulta DATE NOT NULL
)AUTO_INCREMENT = 1;

-- TABELA COM CHAVES ESTRANGEIRAS

CREATE TABLE IF NOT EXISTS tb_medico (
	id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    especialidade VARCHAR(255) UNIQUE NOT NULL,
    id_especialidade INT,
    
    CONSTRAINT fk_especialidade_id_especialidade FOREIGN KEY (id_especialidade) REFERENCES tb_especialidade(id_especialidade) ON DELETE CASCADE
)AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS tb_consulta (
	id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    dt_consulta DATE NOT NULL,
    id_medico INT,
    id_paciente INT,
    
    CONSTRAINT fk_medico_id_medico FOREIGN KEY(id_medico) REFERENCES tb_medico(id_medico) ON DELETE CASCADE, 
    CONSTRAINT fk_paciente_id_paciente FOREIGN KEY (id_paciente) REFERENCES tb_paciente(id_paciente) ON DELETE CASCADE
)AUTO_INCREMENT = 1;
