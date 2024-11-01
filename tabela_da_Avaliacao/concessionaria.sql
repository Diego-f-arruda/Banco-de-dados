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

