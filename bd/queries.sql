-- Exemplos de consultas complexas feitas ao banco

-- 1. Obter para cada pylady do capítulo de São Carlos seu nome, email e o número de eventos que ela foi responsável

SELECT P.nome, P.email, COUNT(*) FROM (Pylady A JOIN Pessoa B ON A.pessoa = B.id) P 
    JOIN Capitulo C ON C.id = P.capitulo
    JOIN Evento E ON E.responsavel = P.id
    WHERE C.cidade = 'São Carlos'
    GROUP BY P.nome,P.email;

-- Saída esperada:

-- 
--  nome  |      email      | count 
-- -------+-----------------+-------
--  ana   | ana@gmail.com   |     2
--  clara | clara@gmail.com |     2
-- 
-- 

-- 2. Obter nome do colaborador e as atividades resultantes de colaborações que não são com grupos universitários

SELECT C.nome, F.titulo FROM 
    (SELECT A.nome, A.id as id_colaborador, B.id as colaboracao_id 
        FROM Colaborador A JOIN Colaboracao B ON B.colaborador = A.id
        WHERE UPPER(A.tipo) <> 'GRUPO_UNIVERSITARIO') C
    JOIN (SELECT colaboracao, titulo FROM ResultaEvento JOIN Evento ON ResultaEvento.evento = Evento.id
    UNION ALL SELECT colaboracao, titulo FROM ResultaProjInterno JOIN ProjetoInterno ON ResultaProjInterno.PROJ_INTERNO = ProjetoInterno.id
    UNION ALL SELECT colaboracao, titulo FROM ResultaProjColaborativo JOIN ProjetoColaborativo ON ResultaProjColaborativo.PROJ_COLABORATIVO = ProjetoColaborativo.id) F
    ON C.colaboracao_id = F.colaboracao;

-- Saída esperada:

--
--     nome      |   titulo    
-----------------+-------------
-- Colaborador 2 | curso aws
-- Colaborador 2 | curso azure
-- 

-- 3. Obter número total de participantes dos eventos organizados por cada pylady, seu nome e capítulo, ordenado pelo número de participantes

SELECT COUNT(*) AS participantes, P.nome AS pylady, Capitulo.nome AS capitulo 
    FROM (ParticipacaoEvento NATURAL JOIN OrganizaEvento) E
    JOIN (Pylady JOIN Pessoa ON Pylady.pessoa = Pessoa.id) P ON E.pylady = P.id
    JOIN Capitulo ON P.capitulo = Capitulo.id
    GROUP BY P.id, P.nome, Capitulo.nome
    ORDER BY COUNT(*) DESC;

-- Saída esperada:

--
-- participantes |  pylady  |  capitulo  
-----------------+----------+------------
--             4 | ana      | São Carlos
--             1 | carolina | São Paulo
--

-- 4. Obter média de faixa salarial das pyladies de cada capítulo, ordenado pela faixa salarial

-- 5. Obter total de enventos organizados por cada capítulo e nome dos capítulos