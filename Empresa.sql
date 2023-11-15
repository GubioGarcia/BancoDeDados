/* 1. Crie uma tabela `Funcionarios` com os campos `ID` (chave primária), `Nome`, `Cargo`, `Salario` e `DataContratacao` */
CREATE TABLE funcionarios (
	funcionario_id INT PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	cargo VARCHAR(250) NOT NULL,
	salario INT NOT NULL,
	dataContratacao DATE NOT NULL
);

/* 2. Altere a tabela `Funcionarios` para adicionar uma coluna `Email`. */
ALTER TABLE funcionarios ADD email VARCHAR(255) NOT NULL

/* 3. Escreva um comando SQL para selecionar todos os `Funcionarios` que têm um `Salario` superior a 5000 e foram contratados após '2020-01-01'. */
SELECT * FROM Funcionarios WHERE Salario > 5000 AND DataContratacao > '2020-01-01';

/* 4. Atualize o `Salario` dos `Funcionarios` para 6000 se eles estiverem no cargo de 'Gerente' e o salário atual for inferior a 6000. */
UPDATE Funcionarios SET Salario = 6000 WHERE Cargo LIKE '%Gerente%' AND Salario < 6000;

/* 5. Delete registros da tabela `Funcionarios` onde o `Cargo` é 'Estagiário' e o `Salario` é menor que 1500. */
DELETE FROM Funcionarios WHERE Cargo = 'Estagiário' AND Salario < 1500;

/* 6. Supondo que exista uma segunda tabela `Departamentos` com os campos `DepartamentoID` e `NomeDepartamento`, escreva uma consulta para listar todos os funcionários juntamente com o nome do departamento em que trabalham. */
SELECT F.*, D.NomeDepartamento
FROM Funcionarios F JOIN Departamentos D ON F.DepartamentoID = D.DepartamentoID

/* 7. Selecione o salário médio e o número de funcionários por cargo na tabela `Funcionarios`. */
SELECT Cargo, AVG(Salario) AS SalarioMedio, COUNT(*) AS NumeroFuncionarios
FROM  Funcionarios GROUP BY Cargo;

/* 8. Escreva uma consulta para encontrar o nome dos funcionários que ganham mais que a média salarial de todos os funcionários. */
SELECT Nome FROM Funcionarios
WHERE Salario > (SELECT AVG(Salario) FROM Funcionarios);

/* 9. Crie uma tabela `Projetos` com os campos `ProjetoID`, `NomeProjeto`, e `GerenteID`, onde `GerenteID` é uma chave estrangeira referenciando `ID` da tabela `Funcionarios`. */
CREATE TABLE projetos (
    projeto_id INT PRIMARY KEY,
    nomeProjeto VARCHAR(255),
    gerente_id INT,
    FOREIGN KEY (gerente_id) REFERENCES funcionarios(funcionario_id)
);

/* 10. Atualize a tabela `Funcionarios`, aumentando o `Salario` em 10% para os funcionários que estão gerenciando algum projeto na tabela `Projetos`. */
UPDATE Funcionarios SET Salario = Salario * 1.10
WHERE funcionario_id IN (SELECT gerente_id FROM Projetos WHERE gerente_id IS NOT NULL);

/* 11. Crie uma `VIEW` chamada `DetalhesFuncionarios` que exiba o `Nome`, `Cargo`, `Salario` e o `NomeDepartamento` para cada funcionário. Utilize um JOIN entre `Funcionarios` e `Departamentos`. */
CREATE VIEW DetalhesFuncionarios
AS SELECT
        F.nome,
        F.cargo,
        F.salario,
        D.NomeDepartamento
    FROM Funcionarios AS F JOIN Departamentos AS D ON F.DepartamentoID = D.DepartamentoID;
