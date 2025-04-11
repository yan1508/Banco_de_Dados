create database if not exists Produtos
charset utf8mb4 collate utf8mb4_general_ci;
drop database Produtos;
use Produtos;

CREATE TABLE Produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(255),
    preco_custo FLOAT(10,2),
    margem_lucro FLOAT(5,2),
    porcentagem_ifood FLOAT(5,2)
);


CREATE TABLE Entrega (
    id_entrega INT PRIMARY KEY,
    id_produto INT,
    valor_entrega FLOAT(10,2),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);


CREATE TABLE Combo (
    id_combo INT PRIMARY KEY,
    nome_combo VARCHAR(255),
    preco_combo FLOAT(10,2)
);

CREATE TABLE ProdutoCombo (
    id_combo INT,
    id_produto INT,
    PRIMARY KEY (id_combo, id_produto),
    FOREIGN KEY (id_combo) REFERENCES Combo(id_combo),
    FOREIGN KEY (id_produto) REFERENCES Produto(id_produto)
);


INSERT INTO Produto (id_produto, nome, preco_custo, margem_lucro, porcentagem_ifood) VALUES 
(1, 'Sanduíche de Frango', 10.00, 30.00, 15.00),
(2, 'Lanche de Carne', 12.00, 30.00, 20.00),
(3, 'Suco Natural', 4.00, 30.00, 10.00);


INSERT INTO Entrega (id_entrega, id_produto, valor_entrega) VALUES
(1, 1, 5.00),
(2, 2, 5.00),
(3, 3, 5.00);


INSERT INTO Combo (id_combo, nome_combo, preco_combo) VALUES
(1, 'Combo Frango + Suco', 22.00);


INSERT INTO ProdutoCombo (id_combo, id_produto) VALUES
(1, 1),
(1, 3);

SELECT 
    nome,
    preco_custo * (1 + margem_lucro/100) AS preco_venda,
    (preco_custo * (1 + margem_lucro/100)) * (porcentagem_ifood/100) AS valor_ifood
FROM Produto;

SELECT 
    nome,
    preco_custo,
    margem_lucro,
    porcentagem_ifood,
    preco_custo * (1 + margem_lucro/100) AS preco_venda,
    (preco_custo * (1 + margem_lucro/100)) * (porcentagem_ifood/100) AS valor_ifood
FROM Produto;

SELECT 
    C.nome_combo,
    C.preco_combo,
    SUM(P.preco_custo + E.valor_entrega) AS custo_combo,
    C.preco_combo - SUM(P.preco_custo + E.valor_entrega) AS lucro_combo
FROM Combo C
JOIN ProdutoCombo PC ON C.id_combo = PC.id_combo
JOIN Produto P ON PC.id_produto = P.id_produto
JOIN Entrega E ON P.id_produto = E.id_produto
GROUP BY C.nome_combo, C.preco_combo;

CREATE VIEW ProdutoCompleto AS
SELECT 
    P.id_produto,
    P.nome AS nome_produto,
    P.preco_custo,
    P.margem_lucro,
    P.porcentagem_ifood,
    (P.preco_custo * (1 + P.margem_lucro / 100)) AS preco_venda,
    (P.preco_custo * (1 + P.margem_lucro / 100)) * (P.porcentagem_ifood / 100) AS valor_ifood,
    E.valor_entrega,
    C.id_combo,
    C.nome_combo,
    C.preco_combo
FROM Produto P
LEFT JOIN Entrega E ON P.id_produto = E.id_produto
LEFT JOIN ProdutoCombo PC ON P.id_produto = PC.id_produto
LEFT JOIN Combo C ON PC.id_combo = C.id_combo;

select * from ProdutoCompleto;

