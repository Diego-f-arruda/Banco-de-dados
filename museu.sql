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

SELECT * FROM visita

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

CREATE TABLE obra_arte_exposicao(
	id SERIAL PRIMARY KEY,
	obra_arte_id INTEGER NOT NULL,
	exposicao_id INTEGER NOT NULL
)

SELECT * FROM obra_arte_exposicao

ALTER TABLE obra_arte_exposicao ADD CONSTRAINT fk_obra_arte_id_key FOREIGN KEY (obra_arte_id) REFERENCES obras_de_arte (id) ON DELETE CASCADE

ALTER TABLE obra_arte_exposicao ADD CONSTRAINT fk_exposicao_id_key FOREIGN KEY (exposicao_id) REFERENCES exposicoes (id) ON DELETE CASCADE

INSERT INTO obras_de_arte (titulo, descricao, ano_criacao, tipo_de_obra) VALUES('Vangog', 'blablablab', 2024, 'Pintura')
INSERT INTO obras_de_arte (titulo, descricao, ano_criacao, tipo_de_obra) VALUES('few	VEWF', ' FWE	 R4FQGE', 2024, 'Pintura')
INSERT INTO obras_de_arte (titulo, descricao, ano_criacao, tipo_de_obra) VALUES('F W	 R2VRWE', 'BTVWQCR3	', 2024, 'Pintura')
INSERT INTO obras_de_arte (titulo, descricao, ano_criacao, tipo_de_obra) VALUES('vf4fcewr', 'tb4v3qc3w', 2024, 'Escultura')
INSERT INTO obras_de_arte (titulo, descricao, ano_criacao, tipo_de_obra) VALUES('jheVREWHJ', 'rv3cwdwxs', 2024, 'Pintura')
INSERT INTO obras_de_arte (titulo, descricao, ano_criacao, tipo_de_obra) VALUES('g4efdsa43tre', 'ce2xjuryjh', 2024, 'Escultura')
INSERT INTO obras_de_arte (titulo, descricao, ano_criacao, tipo_de_obra) VALUES('kjkytehreq', 't	ewttefdsat4tqwefw', 2024, 'Pintura')
INSERT INTO obras_de_arte (titulo, descricao, ano_criacao, tipo_de_obra) VALUES('uçliutkuyh', 'jytejegre', 2024, 'Escultura')

INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(1, 1);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(2, 1);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(3, 1);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(4, 1);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(5, 1);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(6, 1);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(1, 2);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(2, 2);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(3, 2);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(4, 2);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(5, 2);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(6, 2);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(1, 3);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(1, 4);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(1, 5);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(1, 6);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(1, 7);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(2, 3);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(3, 3);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(5, 3);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(6, 3);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(7, 3);
INSERT INTO obra_arte_exposicao(obra_arte_id, exposicao_id) VALUES(1, 4);
