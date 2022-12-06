BEGIN TRANSACTION;
    SET CONSTRAINTS ALL DEFERRED;
    ALTER SEQUENCE Pessoa_id_seq RESTART WITH 1;
    ALTER SEQUENCE Capitulo_id_seq RESTART WITH 1;


    -- Populando Pessoa
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('ana@gmail.com','ana',21,'feminino','branca','branca','estudante',10000000000,'bissexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('clara@gmail.com','clara',22,'feminino','preta','preta','estudante',10000000001,'heterossexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('beatriz@gmail.com','beatriz',18,'feminino','parda','parda','estudante',10000000002,'heterossexual');
    INSERT INTO Pessoa (EMAIL,NOME,IDADE,GENERO,ETNIA,COR,OCUPACAO,CPF,ORIENTACAOSEXUAL)
        VALUES ('gustavo@gmail.com','gustavo',24,'masculino','branco','branco','estudante',10000000003,'homossexual');

    -- Populando Capitulo
    ALTER TABLE Capitulo DISABLE TRIGGER ALL;
    INSERT INTO Capitulo (NOME,CIDADE,ESTADO,PAIS,WEBSITE,REPRESENTANTE1,REPRESENTANTE2,N_INTEGRANTES)
        VALUES ('São Carlos','São Carlos','São Paulo','Brasil','https://saocarlos.pyladies.com/',1,2,3);
    ALTER TABLE Capitulo ENABLE TRIGGER ALL;

    -- Populando Pylady
    INSERT INTO PyLady (PESSOA,FAIXA_SALARIAL,CAPITULO)
        VALUES (1,NULL,1);
    INSERT INTO PyLady (PESSOA,FAIXA_SALARIAL,CAPITULO)
        VALUES (2,NULL,1);
    INSERT INTO PyLady (PESSOA,FAIXA_SALARIAL,CAPITULO)
        VALUES (3,NULL,1);

    -- Populando TipoPessoa
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (1,'pylady');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (2,'pylady');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (3,'pylady');
    INSERT INTO TipoPessoa (PESSOA,TIPO)
        VALUES (4,'participante');

    -- Populando Evento
    -- Populando ProjetoInterno
    -- Populando ProjetoColaborativo
    -- Populando ParticipacaoEvento
    -- Populando FrentesCapitulo
    -- Populando Doacao
    -- Populando RealizaProjColaborativo
    -- Populando RealizaProjInterno
    -- Populando RealizaEvento
    -- Populando OrganizaEvento
    -- Populando OrganizaProjInterno
    -- Populando OrganizaProjColaborativo
    -- Populando TipoAtividade
    -- Populando Colaborador
    -- Populando Colaboracao
    -- Populando CompartilhavelEvento
    -- Populando Palestra
    -- Populando Curso
    -- Populando Workshop
    -- Populando ApresentaEvento
    -- Populando MonitorCurso
    -- Populando PyLadyGlobalCouncil
    -- Populando Delibera
    -- Populando ResultaEvento
    -- Populando ResultaProjInterno
    -- Populando ResultaProjColaborativo
COMMIT;