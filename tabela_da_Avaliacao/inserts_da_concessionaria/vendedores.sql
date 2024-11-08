CREATE TABLE vendedores(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	nome VARCHAR(125) NOT NULL,
	cpf VARCHAR(14) UNIQUE NOT NULL,
	telefone VARCHAR(14) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	data_contratacao DATE NOT NULL
	)

INSERT INTO vendedores(nome, cpf, telefone, email, data_contratacao) VALUES
('Pedrinho', '111.222.333-44', '(88)98888-8888', 'pedrinho@gmail.com', '15/01/2010'),
('Joaozinho', '222.333.444-55', '(99)99999-9999', 'joaozinho@bol.com.br', '01/01/2001'),
('Ricardo', '123.123.123-23', '(69)96969-6969', 'ricardao@uol.com.br', '11/11/2001')