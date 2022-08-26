create table empregado (id_empregado serial primary key,
						nome varchar(50)not null,
						email varchar(40)not null unique,
						cargo varchar(50),
						salario numeric);

INSERT INTO empregado (nome,email,cargo,salario) 
values ('Adriana','ciclano@teste.com', 'Programador',5000);

INSERT INTO empregado (nome,email,cargo,salario)
values ('Antonio','silva@gmail.com', 'Analista de Sistemas',6500);

create table empregado_log (id_empregado_log serial primary key,
						id_empregado int,
						nome varchar(50),
						email varchar(40),
						cargo varchar(50),
						salario numeric,
						data_modificacao timestamp,
						acao varchar(20));
						
--função

CREATE OR REPLACE FUNCTION empregado_log_fun()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO empregado_log(id_empregado, nome, salario, data_modificacao, acao)
		VALUES(new.id_empregado, new.nome,new.salario,now(), 'update');
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

--trigger

CREATE TRIGGER empregado_logs
AFTER UPDATE
ON empregado
FOR EACH ROW
EXECUTE PROCEDURE empregado_log_fun();

UPDATE empregado SET nome = 'ana luiza', salario=6800 WHERE id_empregado = 1;

SELECT * FROM empregado_log;

CREATE OR REPLACE FUNCTION empregado_log_fun_delete()
RETURNS TRIGGER AS $$
BEGIN
	INSERT INTO empregado_log(id_empregado, nome, salario, data_modificacao, acao)
		VALUES(old.id_empregado, old.nome, old.salario,now(), 'delete');
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE TRIGGER empregado_trigger_log_delete
AFTER DELETE
ON empregado
FOR EACH ROW
EXECUTE PROCEDURE empregado_log_fun_delete();

DELETE FROM empregado WHERE id_empregado = 1;

SELECT * FROM empregado_log;


