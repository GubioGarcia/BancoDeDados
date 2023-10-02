/*	PUCGO - PONTIFICIA UNIVERSIDADE CATOLICA DE GOIAS
	CMP111(A04) - PROJETO DE BANCO DE DADOS
	GUBIO GARCIA DOS SANTOS - 20201003300510

	EXERCICIOS SQL */

/*- CRIACAO DAS TABELAS*/
	CREATE TABLE agencia (
		id INT PRIMARY KEY AUTO_INCREMENT,
		nome varchar(250),
		numero int UNIQUE key,
		cidade varchar(250)
	);
		
	CREATE TABLE funcionarios (
		id INT PRIMARY KEY AUTO_INCREMENT,
		nome varchar(250),
		cpf varchar(20),
		matricula int UNIQUE KEY NOT NULL,
		cidade varchar(250),
		agencia_id int,
		FOREIGN KEY (agencia_id) REFERENCES agencia(id)
	);

	CREATE TABLE negocios (
		id INT PRIMARY KEY AUTO_INCREMENT,
		tipo varchar(250),
		data_inicio date,
		data_termino date,
		agencia_id int,
		FOREIGN KEY (agencia_id) REFERENCES agencia(id)
	);

	CREATE TABLE emprestimo (
		id INT PRIMARY KEY AUTO_INCREMENT,
		numero int UNIQUE KEY,
		data_emprestimo date,
		valor DOUBLE
	);

	CREATE TABLE cliente (
		id INT PRIMARY KEY AUTO_INCREMENT,
		nome varchar(250),
		cpf varchar(20),
		data_nascimento date,
		cidade varchar(250),
		agencia_id int,
		emprestimo_id int,
		FOREIGN KEY (agencia_id) REFERENCES agencia(id),
		FOREIGN KEY (emprestimo_id) REFERENCES emprestimo(id)
	);


	CREATE TABLE conta (
		id INT PRIMARY KEY AUTO_INCREMENT,
		numero int UNIQUE key,
		saldo double,
		tipo ENUM('CORRENTE', 'POUPANCA', 'CONJUNTA', 'SALARIO') NOT NULL,
		agencia_id int NOT NULL,
		cliente_id int NOT NULL,
		FOREIGN KEY (agencia_id) REFERENCES agencia(id),
		FOREIGN KEY (cliente_id) REFERENCES cliente(id)
	);


/*- INCLUSAO DE 5 CLIENTES*/
	INSERT INTO agencia (nome, numero, cidade) VALUES 
		("Santander BR", 170, "Goiânia"),
		("Santander GO", 172, "Goiânia"),
		("Santander AP", 168, "Aparecida de Goiânia"),
		("Santander AN", 169, "Anápolis"),
		("Santander CC", 171, "Rio Verde");
		
	INSERT INTO emprestimo (numero, data_emprestimo, valor) VALUES 
		(21092301, '2023-09-21', 10000),
		(21092302, '2023-09-21', 5600.73),
		(21092303, '2023-09-21', 1000),
		(21092304, '2023-09-21', 50000.23),
		(21092305, '2023-09-21', 0.50);
		
	INSERT INTO cliente (nome, data_nascimento, cpf, cidade, agencia_id, emprestimo_id) VALUES 
		("Babaca Kalaghan", '1991-07-07', "123.123.123-09", "Goiânia", NULL,NULL );
		
	INSERT INTO cliente (nome, data_nascimento, cpf, cidade, agencia_id, emprestimo_id) VALUES 
		("Amanda Kalaghan", '1991-07-07', "123.123.123-09", "Goiânia", 6,5 ),
		("Nelson Tiago Colaço de Gomes", '1986-08-01', "394.822.624-50", "Goiânia", 5, NULL ),
		("Karin Aguiar", '1991-09-01', "264.261.215-50", "Goiânia", 6,NULL ),
		("Caio Jardel Carmona Fonseca", '1987-02-18', "829.484.978-25", "Aparecida de Goiânia", 7,1 ),
		("Helena Kelly Azevedo de Batista", '1994-04-30', "793.082.480-21", "Aparecida de Goiânia", 8,2 ),
		("David Casanova Padilha", '1995-12-12', "873.204.634-07", "Goiânia", 6,3 ),
		("Pablo Eliel de Aguiar", '1978-01-01', "935.882.912-53", "Aparecida de Goiânia", 7,NULL ),
		("Jerônimo Túlio Bonilha", '2000-06-17', "020.102.520-55", "Aparecida de Goiânia", 7,NULL ),
		("Demilson Rogério Cruz Rosatto", '2002-08-23', "306.296.645-95", "Goiânia", 5,NULL ),
		("Hugo Lúcio Bonilha Flores", '2001-07-15', "423.674.432-54", "Aparecida de Goiânia", 7,NULL );

	INSERT INTO cliente (nome, data_nascimento, cpf, cidade, agencia_id, emprestimo_id) VALUES 
		("Paulínia Suellen Maldonado Maia", '1991-07-07', "123.123.123-09", "Aparecida de Goiânia", 6,NULL ),
		("Estêvão Cleberson Carrara Filho", '1986-08-01', "394.822.624-50", "Aparecida de Goiânia", 5, NULL ),
		("Avelino Hélio Correia de Martines", '1991-09-01', "264.261.215-50", "Aparecida de Goiânia", 6,NULL ),
		("Alma Silvana Ferreira de Mendonça", '1987-02-18', "829.484.978-25", "Goiânia", 7,NULL );
		
	INSERT INTO conta (numero, saldo, tipo, agencia_id, cliente_id) VALUES 
		(1, 1000000, 'CORRENTE', 6, 1),
		(2, 2.5, 'POUPANCA', 5, 2),
		(3, 7.50, 'CORRENTE', 6, 3),
		(4, 2000, 'POUPANCA', 7, 4),
		(5, 1500, 'CORRENTE', 8, 5),
		(6, 1000.9, 'POUPANCA', 6, 6),
		(7, -150, 'CORRENTE', 7, 7),
		(8, 3, 'POUPANCA', 7, 8),
		(9, -4.56, 'CORRENTE', 5, 9),
		(10, 7.45, 'CORRENTE', 7, 10),
		(11, 23000, 'POUPANCA', 7, 10);

	INSERT INTO funcionarios (nome, cpf, matricula, cidade, agencia_id) VALUES 
		("Amanda Hughs","123.123.123-09", 1,"Goiânia", 6 ),
		("Nelson Tiago Colaço de Gomes", "394.822.624-50", 2,"Goiânia", 6 ),
		("Karin Aguiar", "264.261.215-50",3, "Goiânia", 7 ),
		("Caio Jardel Carmona Fonseca", "829.484.978-25", 4,"Aparecida de Goiânia", 8 ),
		("Helena Kelly Azevedo de Batista", "793.082.480-21",5, "Aparecida de Goiânia", 9 );
	
/*- Buscar o nome dos clientes que têm uma conta no banco, as cidades onde eles vivem e a cidade das agências onde eles têm suas contas (utilize o inner join)*/
	SELECT DISTINCT c.nome, c.cidade AS 'Cidade Cliente', a.cidade AS 'Cidade Conta' FROM
		cliente c INNER JOIN agencia a ON c.agencia_id = a.id 
		INNER JOIN conta ct ON ct.agencia_id = a.id;
		
/*- Buscar o nome dos clientes que têm conta na cidade onde moram*/
	SELECT c.nome FROM cliente c INNER JOIN conta co ON c.cliente_id = co.cliente_id
	WHERE c.cidade = co.cidade;

/*- Buscar o nome dos clientes que tem conta em Aparecida de Goiânia e moram em Goiânia*/
	SELECT c.nome FROM cliente c INNER JOIN conta co ON c.cliente_id = co.cliente_id
	WHERE c.cidade = 'Goiânia' AND co.cidade = 'Aparecida de Goiânia';

/*- Buscar os três primeiros nomes dos clientes que tem conta em Aparecida*/
	SELECT c.nome FROM cliente c INNER JOIN conta co ON c.cliente_id = co.cliente_id
	WHERE co.cidade = 'Aparecida de Goiânia' LIMIT 3;

/*- Buscar o nome dos funcionários, o nome da agência e o nome dos clientes*/
	SELECT f.nome AS nome_funcionario, a.nome AS nome_agencia, c.nome AS nome_cliente FROM funcionarios f
	INNER JOIN agencia a ON f.agencia_id = a.id LEFT JOIN cliente c ON f.cpf = c.cpf;
	
/*- Crie uma visão para buscar o nome dos funcionários, o nome da agência e o nome dos clientes, onde todas as pessoas sejam de Goiânia*/
	CREATE VIEW viewGyn AS SELECT f.nome AS nome_funcionario, a.nome AS nome_agencia, c.nome AS nome_cliente FROM funcionarios f
	INNER JOIN agencia a ON f.agencia_id = a.id LEFT JOIN cliente c ON f.cpf = c.cpf
	WHERE f.cidade = 'Goiânia' AND a.cidade = 'Goiânia' AND (c.cidade = 'Goiânia' OR c.cidade IS NULL);
	