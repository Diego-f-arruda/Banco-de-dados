CREATE TYPE TIPO_OBRA AS ENUM ('Pintura', 'Escultura');

CREATE TABLE obras_de_arte(
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	descricao VARCHAR(200) NOT NULL,
	ano_criacao INTEGER NOT NULL, 
	tipo_de_obra TIPO_OBRA NOT NULL
);

SELECT * FROM obras_de_arte;

CREATE TABLE artistas(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	data_nascimento DATE NOT NULL,
	nascionalidade VARCHAR(60) NOT NULL,
	descricao_biografica VARCHAR(200) 
);

SELECT * FROM artistas;

CREATE TABLE exposicoes(
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	data_inicio DATE NOT NULL,
	data_termino DATE NOT NULL,
	local VARCHAR(150) NOT NULL
);

SELECT * FROM exposicoes;

CREATE TABLE visitantes(
	id SERIAL PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE
);

SELECT * FROM visitantes;

CREATE TABLE visita(
	id SERIAL PRIMARY KEY,
	data_visita DATE NOT NULL,
	exposicao_id INTEGER NOT NULL,
	visitante_id INTEGER NOT NULL,
	FOREIGN KEY (exposicao_id) REFERENCES exposicoes(id)ON DELETE CASCADE,
	FOREIGN KEY (visitante_id) REFERENCES visitantes(id)ON DELETE CASCADE
);

SELECT * FROM visitantes

INSERT INTO visitantes (nome, email) VALUES ('Diego', 'kachorrao182@gmail.com')
INSERT INTO visitantes (nome, email) VALUES ('Juliana', 'juliana@gmail.com')
INSERT INTO visitantes (nome, email) VALUES ('Alice', 'gatinha@gmail.com')
INSERT INTO visitantes (nome, email) VALUES ('Joaozinho', 'joaozinho@gmail.com')
INSERT INTO visitantes (nome, email) VALUES ('Mariazinha', 'Mariazinha@gmail.com')
INSERT INTO visitantes (nome, email) VALUES ('Pedrinho', 'Pedrinho@gmail.com')

SELECT * FROM exposicoes

INSERT INTO exposicoes (titulo, data_inicio, data_termino, local) VALUES ('Exposicao 01', '2024-10-10', '2024-10-10', 'ADEC')
INSERT INTO exposicoes (titulo, data_inicio, data_termino, local) VALUES ('Exposicao 02', '2024-09-10', '2024-09-10', 'AACC')
INSERT INTO exposicoes (titulo, data_inicio, data_termino, local) VALUES ('Exposicao 03', '2024-12-01', '2024-12-01', 'GRSA')
INSERT INTO exposicoes (titulo, data_inicio, data_termino, local) VALUES ('Exposicao 04', '2024-05-08', '2024-05-08', 'Associação')
INSERT INTO exposicoes (titulo, data_inicio, data_termino, local) VALUES ('Exposicao 05', '2024-07-10', '2024-07-10', 'Restaurante')


