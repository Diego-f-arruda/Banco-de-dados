CREATE EXTENSION IF NOT EXISTS "pgcrypto"; --com esse comando habilita a criaação de UUID automaticamente

CREATE TABLE fabricante(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,  --para criar automatico os UUID se acrescenta o UUID Default com a função gen_random_uuid()
	nome VARCHAR(125) NOT NULL,
	pais_origem VARCHAR(30) NOT NULL,
	ano_fundacao INTEGER NOT NULL	
)

CREATE TABLE veiculos(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	numero_chassi VARCHAR(50) UNIQUE NOT NULL,
	modelo VARCHAR(30) NOT NULL,
	ano_fabricacao INTEGER NOT NULL,
	COR VARCHAR(20) NOT NULL,
	quilometragem INTEGER NOT NULL,
	preco_venda DECIMAL NOT NULL,
	fabricante_id UUID NOT NULL,
	FOREIGN KEY (fabricante_id) REFERENCES fabricante(id) ON DELETE CASCADE
)

CREATE TABLE manutencao(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	data_servico TIMESTAMP NOT NULL,
	descricao_servico VARCHAR(255) NOT NULL,
	custo DECIMAL NOT NULL, 
	veiculos_id UUID NOT NULL,
	FOREIGN KEY (veiculos_id) REFERENCES veiculos(id) ON DELETE CASCADE
)

CREATE TABLE vendedores(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	nome VARCHAR(125) NOT NULL,
	cpf VARCHAR(14) UNIQUE NOT NULL,
	telefone VARCHAR(14) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	data_contratacao DATE NOT NULL
	)

CREATE TABLE clientes(
		id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
		nome VARCHAR(125) NOT NULL,
		cpf VARCHAR(14) UNIQUE NOT NULL,
		telefone VARCHAR(14) NOT NULL,
		email VARCHAR(100) UNIQUE NOT NULL,
		endereco VARCHAR(100) NOT NULL
	)


CREATE TYPE metodo_pagamento AS ENUM ('PIX', 'CRÉDITO', 'DÉBITO', 'DINHEIRO', 'FINANCIAMENTO')

CREATE TABLE vendas(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	data_venda DATE NOT NULL, 
	valor_total DECIMAL NOT NULL,
	metodo_pagamento VARCHAR(50) NOT NULL,
	vendedores_id UUID NOT NULL,
	clientes_id UUID NOT NULL,
	veiculos_id UUID NOT NULL,
	FOREIGN KEY (vendedores_id) REFERENCES vendedores(id) ON DELETE CASCADE,
	FOREIGN KEY (clientes_id) REFERENCES clientes(id) ON DELETE CASCADE,
	FOREIGN KEY (veiculos_id) REFERENCES veiculos(id) ON DELETE CASCADE
)

--Se a tabela ja tiver dados nao é interessante dar drop table, para forcar a alteração usar o comando abaixo
ALTER TABLE vendas ALTER COLUMN metodo_pagamento SET DATA TYPE metodo_pagamento USING metodo_pagamento::metodo_pagamento

-----------------------------------TIPOS DE FILTROS----------------------------------------

SELECT * FROM veiculos

SELECT MAX (preco_venda) from veiculos
SELECT MAX (preco_venda) AS MAIOR_PRECO FROM veiculos
SELECT MIN (preco_venda) FROM veiculos 
SELECT MIN (preco_venda) AS MENOR_PRECO FROM veiculos
SELECT MAX (preco_venda) MIN (preco_venda) FROM veiculos
SELECT MAX (preco_venda) AS MAIOR_PRECO, MIN (preco_venda) AS MENOR_PRECO FROM veiculos
SELECT * from veiculos WHERE  (preco_venda) = 50000
SELECT AVG (preco_venda)  FROM veiculos --AVG FAZ A MEDIA EM CAMPOS NUMERICOS
select round(avg(quilometragem), 2) from veiculos --round busca pega o valor do paramentro passado(no caso o avg) 
--e no segundo parametro tem que informar quantas casas decimais
select sum(preco_venda) from veiculos --sum faz a somatoria dos valors numericos da coluna
select sum (preco_venda) from veiculos where modelo = 'EcoSport'

SELECT SUM (preco_venda) from veiculos where ano_fabricacao < 2020

--betwheen serve como um "entre", apos se passa o primeiro valor ("and", "e")  o segundo valor
SELECT sum (valor_total) from vendas where data_venda between '2020-01-01' and '2024-11-2'

--ordenando por  "asc" para crescente e "desc" para decrescente
select * from vendas order by valor_total desc

--utilizando o group by devesse informar o count eo parametro para assim funcionar 
select metodo_pagamento, count(id) from vendas group by metodo_pagamento

select metodo_pagamento, count(id) AS qtd from vendas group by metodo_pagamento order by qtd desc

select * from clientes where nome like 'Ped%'