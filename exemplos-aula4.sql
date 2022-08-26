CREATE TABLE setor(codigo_setor SERIAL PRIMARY KEY, nome varchar(20) NOT NULL UNIQUE);
CREATE TABLE empregado(matricula int PRIMARY KEY, nome VARCHAR(40) NOT NULL, email VARCHAR(30) UNIQUE, codigo_setor int, FOREIGN KEY (codigo_setor) REFERENCES setor (codigo_setor) on UPDATE CASCADE ON DELETE NO ACTION);

INSERT INTO setor(nome) VALUES ('RH');
INSERT INTO setor(nome) VALUES ('CPD');
INSERT INTO setor(nome) VALUES ('COMPRAS');

INSERT INTO empregado(matricula, nome, email, codigo_setor) VALUES(123, 'JOÃO DA SILVA', 'joao@gmail.com', 1);
INSERT INTO empregado(matricula, nome, email, codigo_setor) VALUES(1234, 'ANA DA SILVA', 'ana@gmail.com', 2);
UPDATE setor SET codigo_setor=100 WHERE codigo_setor=1;
DELETE FROM setor WHERE codigo_setor=100;

SELECT * FROM setor;
SELECT * FROM empregado;

---------

CREATE TABLE agencia(numero_banco int PRIMARY KEY, numero_agencia int NOT NULL, banco VARCHAR(40) NOT NULL);
CREATE TABLE conta(numero_conta int PRIMARY KEY, saldo NUMERIC, titular VARCHAR(40) NOT NULL, banco int, FOREIGN KEY (banco) REFERENCES agencia(banco) ON UPDATE CASCADE ON DELETE CASCADE);

INSERT INTO agencia (numero_banco, numero_agencia, banco) VALUES (4545, 123, 'ITAU');
INSERT INTO agencia (numero_banco, numero_agencia, banco) VALUES (9999, 456, 'BRADESCO');
INSERT INTO agencia (numero_banco, numero_agencia, banco) VALUES (8888, 789, 'NUBANK');

INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES(123, 5000, 'Luiza Marins', 8888);
INSERT INTO conta(numero_conta, saldo, titular, numero_banco) VALUES(1234, 500, 'João da Silva', 9999);

DELETE FROM agencia WHERE numero_banco=4545;

SELECT * FROM conta;
SELECT * FROM agencia ORDER BY banco ASC LIMIT 3;
SELECT * FROM agencia WHERE banco iLIKE '%K';
SELECT * FROM agencia WHERE banco = 'ITAU';
SELECT * FROM conta WHERE saldo > 500;
SELECT * FROM conta WHERE NOT saldo > 500;
SELECT * FROM conta WHERE saldo BETWEEN 400 AND 600;
SELECT * FROM conta WHERE saldo in (5000, 5678);

--JOIN (une duas tabelas com a chave primaria de um e a estrangeira da outra)
SELECT c.titular, c.saldo, c.numero_conta, a.banco FROM conta AS c, agencia AS a
WHERE c.numero_banco = a.numero_banco ORDER BY a.banco ASC;