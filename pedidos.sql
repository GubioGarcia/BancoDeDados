/* Dada estas duas tabelas: */
	CREATE TABLE clientes (
		cliente_id INT PRIMARY KEY,
		nome VARCHAR(100) NOT NULL,
		email VARCHAR(100) UNIQUE NOT NULL
	);

	CREATE TABLE pedidos (
		pedido_id INT PRIMARY KEY,
		cliente_id INT,
		valor DECIMAL(10, 2) NOT NULL,
		data DATE NOT NULL,
		FOREIGN KEY (cliente_id) REFERENCES clientes(cliente_id)
	);

/* 1. Insira valores nas duas tabelas */
	INSERT INTO clientes (cliente_id, nome, email) VALUES
		(1, "Neymar Junior", "njr@email.com"),
		(2, "Professor Fernando", "profernando@gmail.com"),
		(3, "Vilma Scoob", "vilma@gmail.com"),
		(4, "Michelangelo", "tartaruganinja@email.com"),
		(5, "Rafael", "rafael@email.com"),
		(6, "Donatello", "donatello@gmail.com"),
		(7, "Scoob Doo", "doo@gmail.com"),
		(8, "Pedro Aranha", "aranhap@email.com");
		
	INSERT INTO pedidos (pedido_id, cliente_id, valor, data) VALUES
		(20231, 2, 250.42, "2023-01-15"),
		(20232, 2, 472.00, "2023-01-16"),
		(20233, 1, 748.55, "2023-01-23"),
		(20234, 3, 865.10, "2023-01-27"),
		(20235, 4, 1235.65, "2023-02-10");

	INSERT INTO pedidos (pedido_id, cliente_id, valor, data) VALUES
		(20236, 2, 99.99, "2023-02-15"),
		(20237, 2, 72.00, "2023-03-16"),
		(20238, 1, 78.55, "2023-05-23"),
		(20239, 3, 65.10, "2023-04-27"),
		(202310, 4, 235.65, "2023-07-10");

/* 2. Liste todos os clientes presentes na tabela `clientes`. */
	SELECT * FROM clientes;

/* 3. Liste os 5 primeiros clientes da tabela `clientes`. */
	SELECT * FROM clientes LIMIT 5;

/* 4. Liste todos os pedidos que possuem valor superior a 100. */
	SELECT * FROM pedidos WHERE valor > 100.00;

/* 5. Liste todos os pedidos junto com o nome do cliente que fez o pedido. */
	SELECT c.nome as NOME_CLIENTE, p.pedido_id as ID_pedido FROM clientes c INNER JOIN pedidos p on p.cliente_id = c.cliente_id;

/* 6. Conte o número de pedidos feitos por cada cliente. */
	SELECT cliente_id, COUNT(*) FROM pedidos GROUP BY cliente_id;

/* 6.5 Conte o número de pedidos feitos por cada cliente (mostre o nome do cliente)*/
	SELECT clientes.nome, COUNT(pedidos.cliente_id) FROM pedidos INNER JOIN clientes ON pedidos.cliente_id = clientes.cliente_id GROUP BY pedidos.cliente_id;
	SELECT clientes.nome AS Cliente, COUNT(pedidos.cliente_id) AS Quantidade_Pedidos FROM pedidos INNER JOIN clientes ON pedidos.cliente_id = clientes.cliente_id GROUP BY pedidos.cliente_id; /*renomeação da coluna com comando AS*/

/* 7. Liste os clientes que fizeram mais de 3 pedidos. */
	SELECT clientes.nome, COUNT(pedidos.cliente_id) AS num_pedidos FROM pedidos LEFT JOIN clientes ON pedidos.cliente_id = clientes.cliente_id GROUP BY clientes.nome HAVING num_pedidos>3;

/* 8. Liste todos os pedidos ordenados pelo valor do pedido. */
	SELECT * FROM pedidos ORDER BY valor DESC;

/* 9. Calcule o valor médio dos pedidos. */
	SELECT AVG(valor) AS media_valor FROM pedidos;

/* 10. Liste todos os clientes únicos que fizeram pedidos. */
	SELECT DISTINCT clientes.nome FROM clientes JOIN pedidos ON clientes.cliente_id = pedidos.cliente_id;