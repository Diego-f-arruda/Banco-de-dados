CREATE TABLE manutencao(
	id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
	data_servico TIMESTAMP NOT NULL,
	descricao_servico VARCHAR(255) NOT NULL,
	custo DECIMAL NOT NULL, 
	veiculos_id UUID NOT NULL,
	FOREIGN KEY (veiculos_id) REFERENCES veiculos(id) ON DELETE CASCADE
)

INSERT INTO manutencao (data_servico, descricao_servico, custo, veiculos_id) VALUES
('15/07/2023', 'Troca da rebinboca da parafuseta', '5000', '0daa5305-8aed-4bea-9bec-2a4cb1c3e05f'),
('22/11/2022', 'Aplicado po de grafite no motor', '1500', 'ad5a048d-7098-4530-966f-cf82746a8347'),
('30/12/2023', 'Trocado parabrisa', '3500', 'b2f2dabe-bfc4-4c08-a9ef-4811659725bc'),
('07/04/2020', 'Troca do pneu furado', '1900', 'cb1aa2a1-da48-413b-ab39-244c4fa76bf1'),
('25/12/2023', 'Trocado bloco do motor', '15000', 'febd9970-4937-4d7f-8739-f8deb877b919')