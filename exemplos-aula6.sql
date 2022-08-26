insert into marca (nome) values('Hyunday');
insert into marca (nome) values('Ford');
insert into marca (nome) values('Renault');
insert into marca (nome) values('Nissan');
insert into marca (nome) values('Kia');
insert into marca (nome) values('Fiat');
insert into marca (nome) values('VW');

insert into modelo (descricao,preco,cod_marca) values('Gol',30000,7);
insert into modelo (descricao,preco,cod_marca) values('HB20',32000,1);
insert into modelo (descricao,preco,cod_marca) values('HB20S',36000,1);
insert into modelo (descricao,preco,cod_marca) values('Cerato',26200,5);
insert into modelo (descricao,preco,cod_marca) values('Ka',23500,2);
insert into modelo (descricao,preco,cod_marca) values('ECO SPORT',5500,2);
insert into modelo (descricao,preco,cod_marca) values('SIENA',45000,6);

select mo.descricao,mo.preco,ma.nome from modelo mo, marca ma
where mo.cod_marca = ma.cod_marca;

select round(avg(preco),2) media from modelo;

select m.descricao, m.preco from modelo m 
where preco >(select  ROUND(AVG(preco),2) Media from modelo);

--modelos que estão com preço acima

select descricao, preco from modelo
where preco > (select round(avg(preco),2) media from modelo);

--fazer agrupamento por cod_marca e exibir o carro com menor valor

select cod_marca, descricao, min (preco) from modelo group by cod_marca, descricao;

-- todos os modelos com preço acima de 25000

select cod_marca, min(preco) from modelo group by cod_marca having min(preco) > 25000;

select * from marca;
select * from modelo;

--retornar todas as marcas que nao tem modelo cadastrado

select * from marca where not exists(
select * from modelo where modelo.cod_marca = marca.cod_marca);
