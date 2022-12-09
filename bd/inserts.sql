-- Reinsere tudo no bd
BEGIN TRANSACTION;
    DELETE FROM CAPITULO;
    DELETE FROM PESSOA;
    DELETE FROM PYLADY;
    DELETE FROM TipoPessoa;
    DELETE FROM EVENTO;
    DELETE FROM ProjetoInterno;
    DELETE FROM ProjetoColaborativo;
    DELETE FROM ParticipacaoEvento;
    DELETE FROM FrentesCapitulo;
    DELETE FROM Doacao;
    DELETE FROM RealizaEvento;
    DELETE FROM RealizaProjColaborativo;
    DELETE FROM RealizaProjInterno;
    DELETE FROM OrganizaEvento;
    DELETE FROM OrganizaProjInterno;
    DELETE FROM OrganizaProjColaborativo;
    DELETE FROM TipoAtividade;
    DELETE FROM Colaborador;
    DELETE FROM Colaboracao;
    DELETE FROM CompartilhavelEvento;
    DELETE FROM Palestra;
    DELETE FROM Curso;
    DELETE FROM Workshop;
    DELETE FROM ApresentaEvento;
    DELETE FROM MonitorCurso;
    DELETE FROM PyLadyGlobalCouncil;
    DELETE FROM Delibera;
    DELETE FROM ResultaEvento;
    DELETE FROM ResultaProjInterno;
    DELETE FROM ResultaProjColaborativo;


    SET CONSTRAINTS ALL DEFERRED;
    ALTER SEQUENCE Pessoa_id_seq RESTART WITH 1;
    ALTER SEQUENCE Capitulo_id_seq RESTART WITH 1;
    ALTER SEQUENCE Evento_id_seq RESTART WITH 1;
    ALTER SEQUENCE ProjetoInterno_id_seq RESTART WITH 1;
    ALTER SEQUENCE ProjetoColaborativo_id_seq RESTART WITH 1;
    ALTER SEQUENCE Doacao_id_seq RESTART WITH 1;
    ALTER SEQUENCE Colaborador_id_seq RESTART WITH 1;
    ALTER SEQUENCE Colaboracao_id_seq RESTART WITH 1;


    -- Populando Pessoa
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('ana@gmail.com','ana',21,'feminino','branca','branca','estudante',10000000000,'bissexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('clara@gmail.com','clara',22,'feminino','preta','preta','estudante',10000000001,'heterossexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('beatriz@gmail.com','beatriz',18,'feminino','parda','parda','estudante',10000000002,'heterossexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('gustavo@gmail.com','gustavo',24,'masculino','branco','branco','estudante',10000000003,'homossexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('carolina@gmail.com','carolina',18,'feminino','parda','parda','estudante',10000000004,'bissexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('julia@gmail.com','julia',20,'feminino','preta','preta','estudante',10000000005,'homossexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('rogerio@gmail.com','rogerio',20,'masculino','branco','branco','estudante',10000000006,'heterossexua');
    

    -- Populando Capitulo
    ALTER TABLE Capitulo DISABLE TRIGGER ALL;
    INSERT INTO Capitulo (NOME,CIDADE,ESTADO,PAIS,WEBSITE,REPRESENTANTE1,REPRESENTANTE2)
        VALUES ('São Carlos','São Carlos','São Paulo','Brasil','https://saocarlos.pyladies.com/',1,2);
    INSERT INTO Capitulo (NOME,CIDADE,ESTADO,PAIS,WEBSITE,REPRESENTANTE1,REPRESENTANTE2)
        VALUES ('São Paulo','São Paulo','São Paulo','Brasil','https://brasil.pyladies.com/',5,6);
    ALTER TABLE Capitulo ENABLE TRIGGER ALL;

    -- Populando Pylady
    INSERT INTO PyLady (PESSOA,FAIXA_SALARIAL,CAPITULO)
        VALUES (1,1000,1);
    INSERT INTO PyLady (PESSOA,FAIXA_SALARIAL,CAPITULO)
        VALUES (2,2000,1);
    INSERT INTO PyLady (PESSOA,FAIXA_SALARIAL,CAPITULO)
        VALUES (3,3000,1);
    INSERT INTO PyLady (PESSOA,FAIXA_SALARIAL,CAPITULO)
        VALUES (5,2500,2);
    INSERT INTO PyLady (PESSOA,FAIXA_SALARIAL,CAPITULO)
        VALUES (6,1900,2);

    -- Populando TipoPessoa
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (1,'pylady');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (1,'participante');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (2,'pylady');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (2,'participante');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (3,'pylady');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (3,'participante');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (4,'participante');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (5,'pylady');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (6,'pylady');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (6,'participante');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (7,'participante');

    -- Populando Evento
    INSERT INTO Evento (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO,FORMATO,CLASSIFICACAO)
        VALUES ('curso de python',TO_TIMESTAMP('2022-12-01 9:30','YYYY-MM-DD HH:MI'),'icmc','curso de python para o icmc',1,TO_TIMESTAMP('2','HH'),NULL,'curso');
    INSERT INTO Evento (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO,FORMATO,CLASSIFICACAO)
        VALUES ('workshop sql',TO_TIMESTAMP('2022-12-01 12:00','YYYY-MM-DD HH:MI'),'ufscar','workshop de sql para a ufscar',2,TO_TIMESTAMP('4','HH'),NULL,'workshop');
    INSERT INTO Evento (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO,FORMATO,CLASSIFICACAO)
        VALUES ('ciência de dados',TO_TIMESTAMP('2022-12-01 07:30','YYYY-MM-DD HH:MI'),'online','palestra de ciência de dados',5,TO_TIMESTAMP('2','HH'),NULL,'palestra');
    INSERT INTO Evento (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO,FORMATO,CLASSIFICACAO)
        VALUES ('curso de c++',TO_TIMESTAMP('2022-12-01 9:30','YYYY-MM-DD HH:MI'),'icmc','curso de c++ para o icmc',1,TO_TIMESTAMP('2','HH'),NULL,'curso');
    INSERT INTO Evento (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO,FORMATO,CLASSIFICACAO)
        VALUES ('workshop uml',TO_TIMESTAMP('2022-12-01 12:00','YYYY-MM-DD HH:MI'),'ufscar','workshop de uml para a ufscar',2,TO_TIMESTAMP('4','HH'),NULL,'workshop');
    INSERT INTO Evento (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO,FORMATO,CLASSIFICACAO)
        VALUES ('mercado de trabalho',TO_TIMESTAMP('2022-12-01 07:30','YYYY-MM-DD HH:MI'),'online','palestra sobre mercado de trablaho',5,TO_TIMESTAMP('2','HH'),NULL,'palestra');

    -- Populando ProjetoInterno
    INSERT INTO ProjetoInterno (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO,LINK_RELATORIO)
        VALUES ('bd pyladies',TO_TIMESTAMP('2022-12-05','YYYY-MM'),'online','construção do bd do pyladies',3,NULL,'http://link1.com');
    INSERT INTO ProjetoInterno (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO,LINK_RELATORIO)
        VALUES ('apresentação novos membros',TO_TIMESTAMP('2022-11-29','YYYY-MM'),'online','apresentação dos novos membros',1,NULL,'http://link2.com');

    -- Populando ProjetoColaborativo
    INSERT INTO ProjetoColaborativo (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO)
        VALUES ('curso aws',TO_TIMESTAMP('2022-12-05','YYYY-MM'),'online','curso de aws',3,NULL);
    INSERT INTO ProjetoColaborativo (TITULO,DATAHORA,LUGAR,DESCRICAO,RESPONSAVEL,DURACAO)
        VALUES ('curso azure',TO_TIMESTAMP('2022-11-29','YYYY-MM'),'online','curso de azur',3,NULL);

    -- Populando ParticipacaoEvento
    INSERT INTO ParticipacaoEvento (PESSOA,EVENTO,CERTIFICADO)
        VALUES (4,1,'participou do evento!');
    INSERT INTO ParticipacaoEvento (PESSOA,EVENTO,CERTIFICADO)
        VALUES (1,1,'participou do evento!');
    INSERT INTO ParticipacaoEvento (PESSOA,EVENTO,CERTIFICADO)
        VALUES (1,2,'participou do evento!');
    INSERT INTO ParticipacaoEvento (PESSOA,EVENTO,CERTIFICADO)
        VALUES (2,2,'participou do evento!');
    INSERT INTO ParticipacaoEvento (PESSOA,EVENTO,CERTIFICADO)
        VALUES (7,3,'participou do evento!');

    -- Populando FrentesCapitulo
    INSERT INTO FrentesCapitulo (CAPITULO,FRENTE)
        VALUES (1,'midia');
    INSERT INTO FrentesCapitulo (CAPITULO,FRENTE)
        VALUES (1,'cursos');
    INSERT INTO FrentesCapitulo (CAPITULO,FRENTE)
        VALUES (1,'palestras');
    INSERT INTO FrentesCapitulo (CAPITULO,FRENTE)
        VALUES (1,'tesouraria');
    INSERT INTO FrentesCapitulo (CAPITULO,FRENTE)
        VALUES (2,'geral');
    INSERT INTO FrentesCapitulo (CAPITULO,FRENTE)
        VALUES (2,'eventos');

    -- Populando Doacao
    INSERT INTO Doacao (CAPITULO,DATAHORA,DOADOR)
        VALUES (1,NOW(),4);
    INSERT INTO Doacao (CAPITULO,DATAHORA,DOADOR)
        VALUES (2,NOW(),NULL);

    -- Populando RealizaProjColaborativo
    INSERT INTO RealizaProjColaborativo (PROJ_COLABORATIVO,CAPITULO)
        VALUES (1,1);
    INSERT INTO RealizaProjColaborativo (PROJ_COLABORATIVO,CAPITULO)
        VALUES (2,2);

    -- Populando RealizaProjInterno
    INSERT INTO RealizaProjInterno (PROJ_INTERNO,CAPITULO)
        VALUES (1,1);
    INSERT INTO RealizaProjInterno (PROJ_INTERNO,CAPITULO)
        VALUES (2,1);

    -- Populando RealizaEvento
    INSERT INTO RealizaEvento (EVENTO,CAPITULO)
        VALUES (1,1);
    INSERT INTO RealizaEvento (EVENTO,CAPITULO)
        VALUES (2,1);
    INSERT INTO RealizaEvento (EVENTO,CAPITULO)
        VALUES (3,2);
    INSERT INTO RealizaEvento (EVENTO,CAPITULO)
        VALUES (4,1);
    INSERT INTO RealizaEvento (EVENTO,CAPITULO)
        VALUES (5,1);
    INSERT INTO RealizaEvento (EVENTO,CAPITULO)
        VALUES (6,2);

    -- Populando OrganizaEvento
    INSERT INTO OrganizaEvento (EVENTO,PYLADY)
        VALUES (1,1);
    INSERT INTO OrganizaEvento (EVENTO,PYLADY)
        VALUES (2,1);
    INSERT INTO OrganizaEvento (EVENTO,PYLADY)
        VALUES (3,5);
    INSERT INTO OrganizaEvento (EVENTO,PYLADY)
        VALUES (4,1);
    INSERT INTO OrganizaEvento (EVENTO,PYLADY)
        VALUES (5,1);
    INSERT INTO OrganizaEvento (EVENTO,PYLADY)
        VALUES (6,5);

    -- Populando OrganizaProjInterno
    INSERT INTO OrganizaProjInterno (PROJ_INTERNO,PYLADY)
        VALUES (1,3);
    INSERT INTO OrganizaProjInterno (PROJ_INTERNO,PYLADY)
        VALUES (2,1);

    -- Populando OrganizaProjColaborativo
    INSERT INTO OrganizaProjColaborativo (PROJ_COLABORATIVO,PYLADY)
        VALUES (1,3);
    INSERT INTO OrganizaProjColaborativo (PROJ_COLABORATIVO,PYLADY)
        VALUES (2,3);

    -- Populando TipoAtividade
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('curso de python',TO_TIMESTAMP('2022-12-01 9:30','YYYY-MM-DD HH:MI'),'evento');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('workshop de sql',TO_TIMESTAMP('2022-12-01 12:00','YYYY-MM-DD HH:MI'),'evento');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('ciência de dados',TO_TIMESTAMP('2022-12-01 07:30','YYYY-MM-DD HH:MI'),'evento');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('bd pyladies',TO_TIMESTAMP('2022-12-05','YYYY-MM'),'p_interno');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('apresentação novos membros',TO_TIMESTAMP('2022-11-29','YYYY-MM'),'p_interno');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('curso aws',TO_TIMESTAMP('2022-12-05','YYYY-MM'),'p_colaborativo');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('curso azure',TO_TIMESTAMP('2022-11-29','YYYY-MM'),'p_colaborativo');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('curso de c++',TO_TIMESTAMP('2022-12-01 9:30','YYYY-MM-DD HH:MI'),'evento');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('workshop de uml',TO_TIMESTAMP('2022-12-01 12:00','YYYY-MM-DD HH:MI'),'evento');
    INSERT INTO TipoAtividade (TITULO,DATAHORA,TIPO)
        VALUES ('mercado de trabalho',TO_TIMESTAMP('2022-12-01 07:30','YYYY-MM-DD HH:MI'),'evento');

    -- Populando Colaborador
    INSERT INTO Colaborador (EMAIL,NOME,CIDADE,TELEFONE,TIPO,CNPJ,OBJETIVO,UNIVERSIDADE)
        VALUES ('colaborador1@gmail.com','Colaborador 1','São Carlos',123456,'grupo_universitario',NULL,NULL,'usp');
    INSERT INTO Colaborador (EMAIL,NOME,CIDADE,TELEFONE,TIPO,CNPJ,OBJETIVO,UNIVERSIDADE)
        VALUES ('colaborador2@gmail.com','Colaborador 2','São Paulo',123457,'empresa',111111111,NULL,NULL);

    -- Populando Colaboracao
    INSERT INTO Colaboracao (DATAHORA,CAPITULO,COLABORADOR,ISPATROCINIO,ACORDO)
        VALUES (NOW(),1,1,FALSE,'Colaboração entre extra e capitulo');
    INSERT INTO Colaboracao (DATAHORA,CAPITULO,COLABORADOR,ISPATROCINIO,ACORDO)
        VALUES (NOW(),1,2,TRUE,'Patrocinio ao capitulo');

    -- Populando CompartilhavelEvento
    INSERT INTO CompartilhavelEvento (EVENTO,COMPARTILHAVEL)
        VALUES (1,'linkfacebook');
    INSERT INTO CompartilhavelEvento (EVENTO,COMPARTILHAVEL)
        VALUES (1,'linkinstagram');
    INSERT INTO CompartilhavelEvento (EVENTO,COMPARTILHAVEL)
        VALUES (2,'linkfacebook');

    -- Populando Palestra
    INSERT INTO Palestra (EVENTO,TEMA,PALESTRANTE)
        VALUES (3,'ciencia de dados','Palestrante 1');
    INSERT INTO Palestra (EVENTO,TEMA,PALESTRANTE)
        VALUES (6,'mercado de trabalho','Palestrante 2');

    -- Populando Curso
    INSERT INTO Curso (EVENTO,MINISTRANTE)
        VALUES (1,'Ministrante 1');
    INSERT INTO Curso (EVENTO,MINISTRANTE)
        VALUES (4,'Ministrante 2');

    -- Populando Workshop
    INSERT INTO Workshop (EVENTO,MATERIAIS,MINISTRANTE)
        VALUES (2,'computador','Ministrante 1');
    INSERT INTO Workshop (EVENTO,MATERIAIS,MINISTRANTE)
        VALUES (5,NULL,'Ministrante 2');

    -- Populando ApresentaEvento
    INSERT INTO ApresentaEvento (EVENTO,PYLADY,MODALIDADE)
        VALUES (1,1,'presencial');
    INSERT INTO ApresentaEvento (EVENTO,PYLADY,MODALIDADE)
        VALUES (2,2,'presencial');

    -- Populando MonitorCurso
    INSERT INTO MonitorCurso (CURSO,MONITOR)
        VALUES (1, 'Monitor 1');
    INSERT INTO MonitorCurso (CURSO,MONITOR)
        VALUES (1, 'Monitor 2');
    INSERT INTO MonitorCurso (CURSO,MONITOR)
        VALUES (4, 'Monitor 3');

    -- Populando PyLadyGlobalCouncil
    INSERT INTO PyLadyGlobalCouncil (ANO,PROJETO)
        VALUES (2020, 'Projeto de 2020');
    INSERT INTO PyLadyGlobalCouncil (ANO,PROJETO)
        VALUES (2021, 'Projeto de 2021');
    INSERT INTO PyLadyGlobalCouncil (ANO,PROJETO)
        VALUES (2022, 'Projeto de 2022');

    -- Populando Delibera
    INSERT INTO Delibera (GLOBALCOUNCIL,CAPITULO)
        VALUES (2020,2);
    INSERT INTO Delibera (GLOBALCOUNCIL,CAPITULO)
        VALUES (2022,1);

    -- Populando ResultaEvento
    INSERT INTO ResultaEvento (EVENTO,COLABORACAO)
        VALUES (1,1);
    INSERT INTO ResultaEvento (EVENTO,COLABORACAO)
        VALUES (2,1);

    -- Populando ResultaProjInterno
    INSERT INTO ResultaProjInterno (PROJ_INTERNO,COLABORACAO)
        VALUES (1,1);
    INSERT INTO ResultaProjInterno (PROJ_INTERNO,COLABORACAO)
        VALUES (2,1);

    -- Populando ResultaProjColaborativo
    INSERT INTO ResultaProjColaborativo (PROJ_COLABORATIVO,COLABORACAO)
        VALUES (1,2);
    INSERT INTO ResultaProjColaborativo (PROJ_COLABORATIVO,COLABORACAO)
        VALUES (2,2);

    -- Populando Mandato
    INSERT INTO Mandato (GLOBALCOUNCIL,PYLADY,PRESENCAS)
        VALUES (2021,1,'https://linkpresencas1.com');
    INSERT INTO Mandato (GLOBALCOUNCIL,PYLADY,PRESENCAS)
        VALUES (2022,2,'https://linkpresencas2.com');

COMMIT;