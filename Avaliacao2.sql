-- QUESTÃO 6

CREATE TABLE turma (
    id_turma INTEGER PRIMARY KEY,
    codigo_turma VARCHAR(10),
    nome_turma VARCHAR(100)
);

CREATE TABLE aluno (
    id_aluno INTEGER PRIMARY KEY,
    nome_aluno VARCHAR(200),
    aluno_alocado BOOLEAN,
    id_turma INTEGER REFERENCES turma(id_turma)
);

-- 	QUESTÃO 7

-- A)

INSERT INTO turma(id_turma,codigo_turma,nome_turma) VALUES (100, 'ADA2023001', 'SantanderCoders2023');
INSERT INTO turma(id_turma,codigo_turma,nome_turma) VALUES (200, 'ADA2023002', 'DiversidadeTech');

SELECT * FROM turma;

-- B)

INSERT INTO aluno(id_aluno,nome_aluno,aluno_alocado,id_turma) VALUES (85801, 'Joelson da Silva Ferreira', NULL, 100);
INSERT INTO aluno(id_aluno,nome_aluno,aluno_alocado,id_turma) VALUES (35402, 'Joana de Souza', NULL, 200);

-- C)

INSERT INTO aluno(id_aluno,nome_aluno,aluno_alocado,id_turma) VALUES (85803, 'Maria dos Santos', NULL, NULL);
INSERT INTO aluno(id_aluno,nome_aluno,aluno_alocado,id_turma) VALUES (35405, 'Fernando Andrade Correia', NULL, NULL);

SELECT * FROM aluno;

-- D)

UPDATE aluno
SET aluno_alocado = CASE
    WHEN id_turma IS NOT NULL THEN TRUE
    ELSE FALSE
END;


