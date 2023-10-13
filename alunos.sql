/* 1. Crie uma tabela chamada "Alunos" com campos para ID, Nome e Idade. */
    CREATE TABLE alunos (
        aluno_id INT PRIMARY KEY,
        curso_id INT,
        nome VARCHAR(100) NOT NULL,
        idade INT NOT NULL,
        FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
    );

/* 2. Insira cinco registros na tabela "Alunos". */
    INSERT INTO alunos (aluno_id, curso_id, nome, idade) VALUES
        (202310001, 2023005 , "Ana de Armas", 23),
        (202310002, 2023003 , "Paula T", 22),
        (202310003, 2023004 , "Jose Cuervo", 19),
        (202310004, 2023004 , "Renato Portaluppi", 55),
        (202310005, 2023004 , "Tite", 57),
        (202310006, 2023003 , "Patricia Abravanel", 42),
        (202310007, 2023003 , "Fausto Silva", 75),
        (202310008, 2023003 , "Silvio Santos", 87);


/* 3. Crie uma tabela chamada "Cursos" com campos para ID do curso e Nome do curso. */
    CREATE TABLE cursos (
        curso_id INT PRIMARY KEY,
        nome VARCHAR(100) NOT NULL
    );

/* 4. Insira cinco registros na tabela "Cursos". */
    INSERT INTO cursos (curso_id, nome) VALUES
        (2023001, "Engenharia de voo"),
        (2023002, "Seguranca em quedas"),
        (2023003, "Entretenimento"),
        (2023004, "Profissionais Futebol"),
        (2023005, "Cinema");

/* 5. Escreva uma consulta SQL para listar todos os cursos que não têm alunos matriculados. */
    SELECT cursos.nome AS Cursos FROM cursos WHERE cursos.curso_id NOT IN (SELECT curso_id FROM alunos);

/* 6. Escreva uma consulta SQL para encontrar o aluno mais jovem. */
    SELECT * FROM alunos ORDER BY idade ASC;

/* 7. Converta a estrutura das tabelas "Alunos" e "Cursos" para um diagrama MER, incluindo os relacionamentos entre as entidades. */

/* 8. Escreva uma consulta SQL para excluir todos os alunos matriculados em um curso específico (por exemplo, pelo nome do curso). */
    /* DELETE usado a partir da matricula do curso*/
    DELETE FROM alunos WHERE curso_id = 2023005;

/* 9. Crie uma tabela chamada "Matriculas" com campos para ID da matrícula, ID do aluno e ID do curso. */
    CREATE TABLE matriculas (
        matricula_id INT PRIMARY KEY,
        aluno_id INT,
        curso_id INT,
        FOREIGN KEY (aluno_id) REFERENCES alunos(aluno_id),
        FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
    );

/* 10. Escreva uma consulta SQL para listar todos os alunos que estão matriculados em mais de um curso. */
    SELECT a.aluno_id, a.nome FROM alunos a WHERE (SELECT COUNT(DISTINCT curso_id) FROM alunos WHERE aluno_id = a.aluno_id) > 1;

/* 11. Crie e popule (com 5 registros) as tabelas abaixo:
Tabela "Estudantes" com campos para ID, Nome e Idade.
Tabela "Disciplinas" com campos para ID da disciplina e Nome da disciplina.
Tabela "Matriculas" com campos para ID da matrícula, ID do estudante e ID da disciplina. */
    CREATE TABLE estudantes (
        estudante_id INT PRIMARY KEY,
        nome VARCHAR(50) NOT NULL,
        idade INT NOT NULL
    );

    CREATE TABLE disciplinas (
        disciplina_id INT PRIMARY KEY,
        nome VARCHAR(50) NOT NULL
    );

    CREATE TABLE matriculas (
        matricula_id INT PRIMARY KEY,
        estudante_id INT,
        disciplina_id INT,
        FOREIGN KEY (estudante_id) REFERENCES estudantes(estudante_id),
        FOREIGN KEY (disciplina_id) REFERENCES disciplinas(disciplina_id)
    );

    INSERT INTO estudantes (estudante_id, nome, idade) VALUES
        (202310001, "Ana de Armas", 23),
        (202310002, "Paula T", 22),
        (202310003, "Jose Cuervo", 19),
        (202310004, "Renato Portaluppi", 55),
        (202310005, "Tite", 57),
        (202310006, "Patricia Abravanel", 42),
        (202310007, "Fausto Silva", 75),
        (202310008, "Silvio Santos", 87);

    INSERT INTO disciplinas (disciplina_id, nome) VALUES
        (2023001, "Engenharia de voo"),
        (2023002, "Seguranca em quedas"),
        (2023003, "Entretenimento"),
        (2023004, "Profissionais Futebol"),
        (2023005, "Cinema"),
        (2023006, "Computacao");

    INSERT INTO matriculas (matricula_id, estudante_id, disciplina_id) VALUES
        (20231, 202310001, 2023003),
        (20232, 202310001, 2023005),
        (20233, 202310002, 2023001),
        (20234, 202310003, 2023002),
        (20235, 202310004, 2023004),
        (20236, 202310005, 2023004),
        (20237, 202310006, 2023003),
        (20238, 202310007, 2023003),
        (20239, 202310008, 2023003);

/* 12. Escreva uma consulta SQL para listar todas as disciplinas que não têm estudantes matriculados. */
    SELECT disciplinas.nome AS Disciplina FROM disciplinas WHERE disciplinas.disciplina_id NOT IN (SELECT disciplina_id FROM matriculas);

/* 13. Escreva uma consulta SQL para encontrar o estudante mais jovem. */
    SELECT * FROM estudantes ORDER BY idade LIMIT 1;

/* 14. Converta a estrutura das tabelas "Matriculas", "Estudantes" e "Disciplinas" para um diagrama MER, incluindo os relacionamentos entre as entidades. */

/* 15. Escreva uma consulta SQL para excluir todas as matrículas de um estudante específico (por exemplo, pelo nome do estudante). */
    /* DELETE usado a partir da matricula do estudante*/
    DELETE FROM matriculas WHERE estudante_id = 202310005;

/* 16. Escreva uma consulta SQL para listar todos os estudantes que estão matriculados em mais de uma disciplina. */
    SELECT e.estudante_id, e.nome, COUNT(m.disciplina_id) AS Disciplina_ID FROM estudantes e JOIN matriculas m ON e.estudante_id = m.estudante_id GROUP BY e.estudante_id, e.nome HAVING Disciplina_ID > 1;

/* 17. Escreva uma consulta SQL para listar todos os estudantes que estão matriculados na disciplina "Projeto de Banco de Dados" e que as matriculas sejam de 2020. */
    SELECT e.estudante_id, e.nome FROM estiudantes e JOIN matriculas m ON 

/* 18. Escreva uma consulta SQL para listar o total de estudantes que estão matriculados em cada disciplina, mostrando o nome da disciplina. */
    SELECT s.estudante_id, s.nome FROM estudantes s JOIN matriculas m ON s.estudante_id = m.estudante_id JOIN disciplinas d ON m.disciplina_id = d.disciplina_id WHERE d.nome = 'Projeto de Banco de Dados' AND m.matricula_id LIKE '2020%';

/* 19. Escreva uma consulta SQL para listar o estudante mais velho que está matriculado por disciplina. */
    SELECT d.nome AS Disciplina, s.nome AS Estudante, s.idade AS Idade FROM disciplinas d JOIN matriculas m ON d.disciplina_id = m.disciplina_id
    JOIN estudantes s ON m.estudante_id = s.estudante_id WHERE (s.idade, d.disciplina_id) IN (
        SELECT MAX(estudantes.idade), matriculas.disciplina_id FROM matriculas
        JOIN estudantes ON matriculas.estudante_id = estudantes.estudante_id GROUP BY matriculas.disciplina_id);

/* 20. Sabendo que toda disciplina está em um curso e que todo estudante é um aluno, mostre o novo MER da criação de todas as tabelas mencionadas. */