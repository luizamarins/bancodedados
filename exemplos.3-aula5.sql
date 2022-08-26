INSERT INTO producao.categoria (descricao) VALUES('Roupas');					
INSERT INTO producao.categoria (descricao) VALUES('Eletrônicos');
INSERT INTO producao.produto (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Creme de Leite Fresco','Itambé',2.8,25,null);
INSERT INTO producao.produto (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Arroz Arbóreo','Princesa',6.5,44,null);
INSERT INTO producao.produto (nome, descricao, preco, quantidade_estoque,codigo_categoria) VALUES('Colírio','EMS',22.5,30,null);

--JOIN

SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria AS c, producao.produto AS p
WHERE p.codigo_categoria = c.codigo_categoria;

--outro jeito:

SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria c INNER JOIN producao.produto p
on c.codigo_categoria = p.codigo_categoria;

------ vai listar toda a categoria independente do que esta registrado ou nao nela
SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria c LEFT JOIN producao.produto p
on c.codigo_categoria = p.codigo_categoria;

---- vai listar produtos sem categoria registrada, left invertido
SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria c RIGHT JOIN producao.produto p
on c.codigo_categoria = p.codigo_categoria;

---- mostra tudo
SELECT p.nome, p.descricao, p.preco, c.descricao FROM producao.categoria c FULL JOIN producao.produto p
on c.codigo_categoria = p.codigo_categoria;

CREATE VIEW producao.view_listar_produtos AS SELECT * FROM producao.produto;
SELECT * FROM producao.view_listar_produtos;

CREATE VIEW producao.view_full_join AS SELECT p.nome,p.preco,c.descricao FROM producao.categoria c FULL JOIN producao.produto p
on c.codigo_categoria = p.codigo_categoria;

SELECT * FROM producao.view_full_join;

CREATE VIEW producao.view_full_join2 AS SELECT p.nome,p.descricao as desc_produto,p.preco,c.descricao as desc_categoria FROM producao.categoria c FULL JOIN producao.produto p
on c.codigo_categoria = p.codigo_categoria;



