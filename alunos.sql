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
    SELECT cursos.nome AS Cursos, COUNT(alunos.curso_id) AS Quantidade_Alunos FROM alunos INNER JOIN cursos ON cursos.curso_id = alunos.curso_id GROUP BY alunos.curso_id HAVING Quantidade_Alunos=0;
    SELECT cursos.nome AS Cursos, alunos.nome as alunos FROM alunos right JOIN cursos ON cursos.curso_id = alunos.curso_id; /* continuar */

/* 6. Escreva uma consulta SQL para encontrar o aluno mais jovem. */
    SELECT * FROM alunos ORDER BY idade ASC;

/* 7. Converta a estrutura das tabelas "Alunos" e "Cursos" para um diagrama MER, incluindo os relacionamentos entre as entidades. */

/* 8. Escreva uma consulta SQL para excluir todos os alunos matriculados em um curso específico (por exemplo, pelo nome do curso). */

/* 9. Crie uma tabela chamada "Matriculas" com campos para ID da matrícula, ID do aluno e ID do curso. */
    CREATE TABLE matriculas (
        matricula_id INT PRIMARY KEY,
        aluno_id INT,
        curso_id INT,
        FOREIGN KEY (aluno_id) REFERENCES alunos(aluno_id),
        FOREIGN KEY (curso_id) REFERENCES cursos(curso_id)
    );

/* 10. Escreva uma consulta SQL para listar todos os alunos que estão matriculados em mais de um curso. */

/* 11. Crie e popule (com 5 registros) as tabelas abaixo:
Tabela "Estudantes" com campos para ID, Nome e Idade.
Tabela "Disciplinas" com campos para ID da disciplina e Nome da disciplina.
Tabela "Matriculas" com campos para ID da matrícula, ID do estudante e ID da disciplina. */

/* 12. Escreva uma consulta SQL para listar todas as disciplinas que não têm estudantes matriculados. */

/* 13. Escreva uma consulta SQL para encontrar o estudante mais jovem. */

/* 14. Converta a estrutura das tabelas "Matriculas", "Estudantes" e "Disciplinas" para um diagrama MER, incluindo os relacionamentos entre as entidades. */

/* 15. Escreva uma consulta SQL para excluir todas as matrículas de um estudante específico (por exemplo, pelo nome do estudante). */

/* 16. Escreva uma consulta SQL para listar todos os estudantes que estão matriculados em mais de uma disciplina. */

/* 17. Escreva uma consulta SQL para listar todos os estudantes que estão matriculados na disciplina "Projeto de Banco de Dados" e que as matriculas sejam de 2020. */

/* 18. Escreva uma consulta SQL para listar o total de estudantes que estão matriculados em cada disciplina, mostrando o nome da disciplina. */

/* 19.  Escreva uma consulta SQL listar o estudante mais velho que está matriculado por disciplina disciplina. */

/* 20. Sabendo que toda didciplina está em um curso e que todo estudante é um aluno, mostre o novo MER da criação de todas as tabelas mencionadas. */