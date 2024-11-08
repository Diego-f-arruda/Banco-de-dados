CREATE TABLE fabricante(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,  --para criar automatico os UUID se acrescenta o UUID Default com a função gen_random_uuid()
	nome VARCHAR(125) NOT NULL,
	pais_origem VARCHAR(30) NOT NULL,
	ano_fundacao INTEGER NOT NULL	
)

INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Ford','EUA', 1903);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Volkswagen', 'Alemanha', 1937);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Toyota', 'Japão', 1937);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Chevrolet', 'EUA', 1911);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Honda', 'Japão', 1948);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Fiat', 'Itália', 1899);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('BMW', 'Alemanha', 1916);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Mercedes-Benz', 'Alemanha', 1926);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Renault', 'França', 1899);
INSERT INTO fabricante(nome, pais_origem, ano_fundacao) VALUES ('Kia', 'Coreia do Sul', 1944);


SELECT * FROM fabricante