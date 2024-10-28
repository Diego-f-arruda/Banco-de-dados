SELECT tablename FROM pg_tables WHERE schemaname = 'public'

CREATE TABLE obra_arte_artista (
	id SERIAL PRIMARY KEY,
	artista_id INTEGER NOT NULL,
	obra_arte_id INTEGER NOT NULL,
	FOREIGN KEY (artista_id) REFERENCES artistas(id)
)

SELECT * FROM obra_arte_artista

ALTER TABLE obra_arte_artista ADD CONSTRAINT fk_obra_arte_id FOREIGN KEY (obra_arte_id) REFERENCES obras_de_arte(id)

SELECT * FROM obras_de_arte

SELECT * FROM artistas

INSERT INTO artistas(nome, data_nascimento, nascionalidade, descricao_biografica) VALUES ('Diego', '2000-04-07', 'Brasileiro', 'Gatao das quebradas')

INSERT INTO artistas(nome, data_nascimento, nascionalidade, descricao_biografica) VALUES ('JuJu', '1999-12-01', 'Brasileiro', 'Cabelinho de Fogo')
INSERT INTO artistas(nome, data_nascimento, nascionalidade, descricao_biografica) VALUES ('Alice', '2022-01-23', 'Brasileiro', 'Facilitadora de Birras')
INSERT INTO artistas(nome, data_nascimento, nascionalidade, descricao_biografica) VALUES ('Mateus', '2007-11-20', 'Brasileiro', 'Polaco do volei')
INSERT INTO artistas(nome, data_nascimento, nascionalidade, descricao_biografica) VALUES ('Diego', '2000-04-07', 'Brasileiro', 'Gatao das quebradas')

UPDATE artistas SET nome='Mariazinha' WHERE ID = 5

UPDATE artistas SET descricao_biografica = 'Perdida na virada' WHERE ID = 5

INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (1,2)
INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (1,3)
INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (1,5)
INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (1,7)
INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (2,3)
INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (2,1)
INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (3,3)
INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (3,2)
INSERT INTO obra_arte_artista(artista_id, obra_arte_id) VALUES (3,1)

SELECT COUNT(*) total_obras_arte FROM obras_de_arte

SELECT obras_de_arte.titulo, obras_de_arte.ano_criacao, obra_arte_artista.artista_id FROM obras_de_arte JOIN obra_arte_artista ON obras_de_arte.id = obra_arte_artista.obra_arte_id
JOIN artistas ON obra_arte_artista.artista_id = artista.id


SELECT 
	obras_de_arte.titulo,
	obras_de_arte.ano_criacao,
	artistas.nome,
	artistas.nascionalidade
FROM obras_de_arte 
JOIN obra_arte_artista ON obras_de_arte.id = obra_arte_artista.obra_arte_id
JOIN artistas ON obra_arte_artista.artista_id = artistas.id

SELECT 
	o.titulo,
	o.ano_criacao,
	artistas.nome,
	artistas.nascionalidade
FROM obras_de_arte AS o --adicionando AS criasse um apelido para facilitar a digitação
JOIN obra_arte_artista AS oa ON o.id = oa.obra_arte_id
JOIN artistas ON oa.artista_id = artistas.id

SELECT 
	o.titulo AS titulo_obra_de_arte, -- o AS aqui cria um novo nome na coluna para quando estiver mostrando os relacionamentos
	o.ano_criacao AS ano_criacao_obra_de_arte,
	artistas.nome AS nome_artista,
	artistas.nascionalidade AS nacionalidade_artista
FROM obras_de_arte AS o
JOIN obra_arte_artista AS oa ON o.id = oa.obra_arte_id
JOIN artistas ON oa.artista_id = artistas.id

SELECT 
	artistas.nome AS nome_artista,
	COUNT (o.id)	--Faz a contagem de quantas obras tem por cada artista
FROM obras_de_arte AS o
JOIN obra_arte_artista AS oa ON o.id = oa.obra_arte_id
JOIN artistas ON oa.artista_id = artistas.id
GROUP BY artistas.nome

SELECT 
*
FROM obras_de_arte AS oa
JOIN obra_arte_exposicao AS oae ON oa.id = oae.obra_arte_id
JOIN exposicoes AS e ON  e.id = oae.exposicao_id

