CREATE TABLE produtos (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	preco DECIMAL(10, 2) NOT NULL
);

CREATE TABLE categorias (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL   
);

CREATE TABLE produtos_categorias (
	produto_id INTEGER REFERENCES produtos(id),
	categoria_id INTEGER REFERENCES categorias(id),
	PRIMARY KEY (produto_id, categoria_id)
);

-- POPULANDO CATEGORIAS
INSERT INTO categorias(nome) VALUES ('Eletrodomestico');
INSERT INTO categorias(nome) VALUES ('Eletroportatil');
INSERT INTO categorias(nome) VALUES ('Cama mesa e banho');
INSERT INTO categorias(nome) VALUES ('Esporte');
INSERT INTO categorias(nome) VALUES ('Escritorio');
INSERT INTO categorias(nome) VALUES ('Lazer');
INSERT INTO categorias(nome) VALUES ('Moda');
INSERT INTO categorias(nome) VALUES ('Beleza');

-- POPULANDO PRODUTOS

INSERT INTO produtos(nome,preco) VALUES ('Geladeira Consul', 2000);
INSERT INTO produtos(nome,preco) VALUES ('Batedeira Arno', 250);
INSERT INTO produtos(nome,preco) VALUES ('Caneta Bic', 5);
INSERT INTO produtos(nome,preco) VALUES ('Tenis Olimpico', 150);
INSERT INTO produtos(nome,preco) VALUES ('Toalha de banho', 80);

-- POPULANDO PRODUTOS_CATEGORIAS
INSERT INTO produtos_categorias(produto_id,categoria_id) VALUES (1, 1);
INSERT INTO produtos_categorias(produto_id,categoria_id) VALUES (2, 2);
INSERT INTO produtos_categorias(produto_id,categoria_id) VALUES (3, 5);
INSERT INTO produtos_categorias(produto_id,categoria_id) VALUES (4, 4);
INSERT INTO produtos_categorias(produto_id,categoria_id) VALUES (5, 3);


-- REALIZANDO CONSULTAS SIMPLES
SELECT * FROM produtos;
SELECT * FROM categorias;
SELECT * FROM produtos_categorias;

-- QUESTÃO 3

SELECT 
    p.nome AS "Produto", 
    p.preco AS "Valor"
FROM 
    produtos p
WHERE 
    p.preco > 100
ORDER BY 
    p.preco, 
    p.nome;

-- QUESTÃO 4

SELECT 
    id, 
    preco
FROM 
    produtos
WHERE 
    preco > (SELECT AVG(preco) FROM produtos);
	
-- QUESTÃO 5

SELECT 
    c.nome AS "Categoria",
    AVG(p.preco) AS "Preço Médio"
FROM 
    categorias c
JOIN 
    produtos_categorias pc ON c.id = pc.categoria_id
JOIN 
    produtos p ON pc.produto_id = p.id
GROUP BY 
    c.nome
ORDER BY 
    c.nome;

