CREATE TABLE cliente(codigo_cliente SERIAL PRIMARY KEY,
                     nome VARCHAR(40),
                     telefone CHAR(11),
                     email VARCHAR(50));
					 
INSERT INTO cliente (nome,telefone,email) VALUES ('MARIA','2422359090','MARIA@GMAIL.COM');

SELECT nome, telefone FROM cliente;