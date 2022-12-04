-- Criação das tableas
-- OBJ: colocar constrains de fk no final com alter table

CREATE TABLE Pessoa (
    ID SERIAL PRIMARY KEY,
    EMAIL VARCHAR ( 50 ) UNIQUE NOT NULL,
    NOME VARCHAR ( 50 ) NOT NULL,
    IDADE INTEGER,
    GENERO VARCHAR ( 50 ),
    ETNIA VARCHAR ( 50 ),
    COR VARCHAR ( 50 ),
    OCUPACAO VARCHAR ( 50 ),
    CPF NUMERIC UNIQUE NOT NULL,
    ORIENTACAOSEXUAL VARCHAR ( 50 )
);

CREATE TABLE TipoPessoa (
    PESSOA INTEGER NOT NULL,
    TIPO CHAR ( 12 ) NOT NULL, -- Paricipante ou PyLady
    CONSTRAINT PK_TIPOPESSOA 
        PRIMARY KEY (PESSOA, TIPO),
    CONSTRAINT CK_TIPOPESSOA
        CHECK (UPPER(TIPO) IN ('PYLADY', 'PARTICIPANTE'))
);

CREATE TABLE ParticipacaoEvento (
    PESSOA INTEGER NOT NULL,
    EVENTO INTEGER NOT NULL,
    CERTIFICADO VARCHAR ( 50 ),
    CONSTRAINT PK_PARTICIPACAOEVENTO 
        PRIMARY KEY (PESSOA, EVENTO)
);

CREATE TABLE FrentesCapitulo (
    CAPITULO INTEGER NOT NULL,
    FRENTE VARCHAR ( 50 ) NOT NULL,
    CONSTRAINT PK_FRENTESCAPITULO 
        PRIMARY KEY (CAPITULO, FRENTE)
);

CREATE TABLE Doacao (
    ID SERIAL PRIMARY KEY,
    CAPITULO INTEGER NOT NULL,
    DATAHORA TIMESTAMP NOT NULL,
    DOADOR INTEGER -- Sem not null para possibiliar doações anônimas
);

CREATE TABLE PyLady (
    PESSOA INTEGER NOT NULL PRIMARY KEY,
    FAIXA_SALARIAL NUMERIC,
    CAPITULO INTEGER NOT NULL
);

CREATE TABLE Capitulo (
    ID SERIAL PRIMARY KEY,
    NOME VARCHAR ( 50 ) NOT NULL,
    CIDADE VARCHAR ( 50 ) NOT NULL,
    ESTADO VARCHAR ( 50 ) NOT NULL,
    PAIS VARCHAR ( 50 ) NOT NULL,
    WEBSITE VARCHAR ( 50 ),
    REPRESENTANTE1 INTEGER NOT NULL,
    REPRESENTANTE2 INTEGER NOT NULL,
    N_INTEGRANTES INTEGER,
    CONSTRAINT SK_CAPITULO
        UNIQUE (REPRESENTANTE1, REPRESENTANTE2)
);

CREATE TABLE RealizaProjColaborativo (
    PROJ_COLABORATIVO INTEGER NOT NULL,
    CAPITULO INTEGER NOT NULL,
    CONSTRAINT PK_REALIZAPROJCOLABORATIVO
        PRIMARY KEY (PROJ_COLABORATIVO, CAPITULO)
);

CREATE TABLE RealizaProjInterno (
    PROJ_INTERNO INTEGER NOT NULL,
    CAPITULO INTEGER NOT NULL,
    CONSTRAINT PK_REALIZAPROJINTERNO
        PRIMARY KEY (PROJ_INTERNO, CAPITULO)
);

CREATE TABLE RealizaEvento (
    EVENTO INTEGER NOT NULL,
    CAPITULO INTEGER NOT NULL,
    CONSTRAINT PK_REALIZAEVENTO
        PRIMARY KEY (EVENTO, CAPITULO)
);

CREATE TABLE OrganizaEvento (
    EVENTO INTEGER NOT NULL,
    PYLADY INTEGER NOT NULL,
    CONSTRAINT PK_ORGANIZAEVENTO
        PRIMARY KEY (EVENTO, PYLADY)
);

CREATE TABLE OrganizaProjInterno (
    PROJ_INTERNO INTEGER NOT NULL,
    PYLADY INTEGER NOT NULL,
    CONSTRAINT PK_ORGANIZAPROJINTERNO
        PRIMARY KEY (PROJ_INTERNO, PYLADY)
);

CREATE TABLE OrganizaProjColaborativo (
    PROJ_COLABORATIVO INTEGER NOT NULL,
    PYLADY INTEGER NOT NULL,
    CONSTRAINT PK_ORGANIZAPROJCOLABORATIVO
        PRIMARY KEY (PROJ_COLABORATIVO, PYLADY)
);

CREATE TABLE Evento (
    ID SERIAL PRIMARY KEY,
    TITULO VARCHAR ( 50 ) NOT NULL,
    DATAHORA TIMESTAMP NOT NULL,
    LUGAR VARCHAR ( 50 ),
    DESCRICAO VARCHAR ( 50 ),
    RESPONSAVEL INTEGER,
    DURACAO TIMESTAMP,
    FORMATO VARCHAR ( 50 ),
    CLASSIFICACAO CHAR ( 8 ),
    CONSTRAINT SK_EVENTO
        UNIQUE (TITULO, DATAHORA),
    CONSTRAINT CK_EVENTO
        CHECK (UPPER(CLASSIFICACAO) IN ('PALESTRA', 'CURSO', 'WORKSHOP'))
);

CREATE TABLE ProjetoInterno (
    ID SERIAL PRIMARY KEY,
    TITULO VARCHAR ( 50 ) NOT NULL,
    DATAHORA TIMESTAMP NOT NULL,
    LUGAR VARCHAR ( 50 ),
    DESCRICAO VARCHAR ( 50 ),
    RESPONSAVEL INTEGER,
    DURACAO TIMESTAMP,
    LINK_RELATORIO VARCHAR ( 50 ),
    CONSTRAINT SK_PROJETOINTERNO
        UNIQUE (TITULO, DATAHORA)
);

CREATE TABLE ProjetoColaborativo (
    ID SERIAL PRIMARY KEY,
    TITULO VARCHAR ( 50 ) NOT NULL,
    DATAHORA TIMESTAMP NOT NULL,
    LUGAR VARCHAR ( 50 ),
    DESCRICAO VARCHAR ( 50 ),
    RESPONSAVEL INTEGER,
    DURACAO TIMESTAMP,
    CONSTRAINT SK_PROJETOCOLABORATIVO
        UNIQUE (TITULO, DATAHORA)
);

CREATE TABLE TipoAtividade (
    TITULO VARCHAR ( 50 ) NOT NULL,
    DATAHORA TIMESTAMP NOT NULL,
    TIPO CHAR ( 14 ) NOT NULL,
    CONSTRAINT PK_TIPOATIVIDADE
        PRIMARY KEY (TITULO, DATAHORA, TIPO),
    CONSTRAINT CK_TIPOATIVIDADE
        CHECK (UPPER(TIPO) IN ('EVENTO', 'P_INTERNO', 'P_COLABORATIVO'))
); -- Não faz uso de chave estrangeira, deve ser mantida consistente na aplicação

CREATE TABLE Colaborador (
    ID SERIAL PRIMARY KEY,
    EMAIL VARCHAR ( 50 ) UNIQUE NOT NULL,
    NOME VARCHAR ( 50 ) NOT NULL,
    CIDADE VARCHAR ( 50 ),
    TELEFONE NUMERIC,
    TIPO CHAR ( 19 ),
    CNPJ VARCHAR ( 50 ) DEFAULT NULL,
    OBJETIVO VARCHAR ( 50 ) DEFAULT NULL,
    UNIVERSIDADE VARCHAR ( 50 ) DEFAULT NULL,
    CONSTRAINT CK_COLABORADOR
        CHECK (UPPER(TIPO) IN ('GRUPO_UNIVERSITARIO', 'EMPRESA', 'ONG'))
);

CREATE TABLE Colaboracao (
    ID SERIAL PRIMARY KEY,
    DATAHORA TIMESTAMP NOT NULL,
    CAPITULO INTEGER NOT NULL,
    COLABORADOR INTEGER NOT NULL,
    ISPATROCINIO BOOLEAN NOT NULL,
    ACORDO VARCHAR ( 50 ),
    CONSTRAINT SK_COLABORACAO
        UNIQUE (DATAHORA, CAPITULO, COLABORADOR)
);

CREATE TABLE CompartilhavelEvento (
    EVENTO INTEGER NOT NULL,
    COMPARTILHAVEL VARCHAR ( 50 ) NOT NULL,
    CONSTRAINT PK_COMPARTILHAVELEVENTO
        PRIMARY KEY (EVENTO, COMPARTILHAVEL)
);

CREATE TABLE Palestra (
    EVENTO INTEGER PRIMARY KEY,
    TEMA VARCHAR ( 50 ),
    PALESTRANTE VARCHAR ( 50 )
);

CREATE TABLE Curso (
    EVENTO INTEGER PRIMARY KEY,
    MINISTRANTE VARCHAR ( 50 )
);

CREATE TABLE Workshop (
    EVENTO INTEGER PRIMARY KEY,
    MATERIAIS VARCHAR ( 50 ),
    MINISTRANTE VARCHAR ( 50 )
);

CREATE TABLE ApresentaEvento (
    EVENTO INTEGER NOT NULL,
    PYLADY INTEGER NOT NULL,
    MODALIDADE VARCHAR ( 50 ),
    CONSTRAINT PK_APRESENTAEVENTO
        PRIMARY KEY (EVENTO, PYLADY)
);

CREATE TABLE MonitorCurso (
    CURSO INTEGER NOT NULL,
    MONITOR VARCHAR ( 50 ) NOT NULL,
    CONSTRAINT PK_MONITORCURSO
        PRIMARY KEY (CURSO, MONITOR)
);

CREATE TABLE PyLadyGlobalCouncil (
    ANO NUMERIC PRIMARY KEY,
    PROJETO VARCHAR ( 50 )
);

--CREATE TABLE Mandato ();

CREATE TABLE Delibera (
    GLOBALCOUNCIL NUMERIC NOT NULL,
    CAPITULO INTEGER NOT NULL,
    CONSTRAINT PK_DELIBERA
        PRIMARY KEY (GLOBALCOUNCIL, CAPITULO)
);

CREATE TABLE ResultaEvento (
    EVENTO INTEGER NOT NULL,
    COLABORACAO INTEGER NOT NULL,
    CONSTRAINT PK_RESULTAEVENTO
        PRIMARY KEY (EVENTO, COLABORACAO)
);

CREATE TABLE ResultaProjInterno (
    PROJ_INTERNO INTEGER NOT NULL,
    COLABORACAO INTEGER NOT NULL,
    CONSTRAINT PK_RESULTAPROJINTERNO
        PRIMARY KEY (PROJ_INTERNO, COLABORACAO)
);

CREATE TABLE ResultaProjColaborativo (
    PROJ_COLABORATIVO INTEGER NOT NULL,
    COLABORACAO INTEGER NOT NULL,
    CONSTRAINT PK_RESULTAPROJCOLABORATIVO
        PRIMARY KEY (PROJ_COLABORATIVO, COLABORACAO)
);

-- Alter tables

ALTER TABLE TipoPessoa ADD CONSTRAINT FK_TIPOPESSOA 
    FOREIGN KEY (PESSOA)
    REFERENCES Pessoa (ID)
    ON DELETE CASCADE;

ALTER TABLE ParticipacaoEvento ADD CONSTRAINT FK1_PARTICIPACAOEVENTO
    FOREIGN KEY (PESSOA)
    REFERENCES Pessoa (ID)
    ON DELETE CASCADE;

ALTER TABLE ParticipacaoEvento ADD CONSTRAINT FK2_PARTICIPACAOEVENTO
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE FrentesCapitulo ADD CONSTRAINT FK_FRENTESCAPITULO
    FOREIGN KEY (CAPITULO)
    REFERENCES Capitulo (ID)
    ON DELETE CASCADE;

ALTER TABLE Doacao ADD CONSTRAINT FK1_DOACAO
    FOREIGN KEY (CAPITULO)
    REFERENCES Capitulo (ID)
    ON DELETE CASCADE;

ALTER TABLE Doacao ADD CONSTRAINT FK2_DOACAO
    FOREIGN KEY (DOADOR)
    REFERENCES Pessoa (ID)
    ON DELETE SET NULL;

ALTER TABLE PyLady ADD CONSTRAINT FK1_PYLADY
    FOREIGN KEY (CAPITULO)
    REFERENCES Capitulo (ID)
    ON DELETE CASCADE;
    
ALTER TABLE PyLady ADD CONSTRAINT FK2_PYLADY
    FOREIGN KEY (PESSOA)
    REFERENCES Pessoa (ID)
    ON DELETE SET NULL;

ALTER TABLE Capitulo ADD CONSTRAINT FK1_CAPITULO 
    FOREIGN KEY (REPRESENTANTE1)
    REFERENCES PyLady (PESSOA)
    ON DELETE CASCADE;

ALTER TABLE Capitulo ADD CONSTRAINT FK2_CAPITULO 
    FOREIGN KEY (REPRESENTANTE2)
    REFERENCES PyLady (PESSOA)
    ON DELETE CASCADE;

ALTER TABLE RealizaProjColaborativo ADD CONSTRAINT FK_REALIZAPROJCOLABORATIVO
    FOREIGN KEY (PROJ_COLABORATIVO)
    REFERENCES ProjetoColaborativo (ID)
    ON DELETE CASCADE;

ALTER TABLE RealizaProjInterno ADD CONSTRAINT FK_REALIZAPROJINTERNO
    FOREIGN KEY (PROJ_INTERNO)
    REFERENCES ProjetoInterno (ID)
    ON DELETE CASCADE;

ALTER TABLE RealizaEvento ADD CONSTRAINT FK_REALIZAEVENTO
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE OrganizaEvento ADD CONSTRAINT FK1_ORGANIZAEVENTO
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE OrganizaEvento ADD CONSTRAINT FK2_ORGANIZAEVENTO
    FOREIGN KEY (PYLADY)
    REFERENCES PyLady (PESSOA)
    ON DELETE CASCADE;

ALTER TABLE OrganizaProjInterno ADD CONSTRAINT FK1_ORGANIZAPROJINTERNO
    FOREIGN KEY (PROJ_INTERNO)
    REFERENCES ProjetoInterno (ID)
    ON DELETE CASCADE;

ALTER TABLE OrganizaProjInterno ADD CONSTRAINT FK2_ORGANIZAPROJINTERNO
    FOREIGN KEY (PYLADY)
    REFERENCES PyLady (PESSOA)
    ON DELETE CASCADE;

ALTER TABLE OrganizaProjColaborativo ADD CONSTRAINT FK1_ORGANIZAPROJCOLABORATIVO
    FOREIGN KEY (PROJ_COLABORATIVO)
    REFERENCES ProjetoColaborativo (ID)
    ON DELETE CASCADE;
        
ALTER TABLE OrganizaProjColaborativo ADD CONSTRAINT FK2_ORGANIZAPROJCOLABORATIVO
    FOREIGN KEY (PYLADY)
    REFERENCES PyLady (PESSOA)
    ON DELETE CASCADE;

ALTER TABLE Evento ADD CONSTRAINT FK_EVENTO
    FOREIGN KEY (RESPONSAVEL)
    REFERENCES PyLady (PESSOA)
    ON DELETE SET NULL;

ALTER TABLE ProjetoInterno ADD CONSTRAINT FK_PROJETOINTERNO
    FOREIGN KEY (RESPONSAVEL)
    REFERENCES PyLady (PESSOA)
    ON DELETE SET NULL;

ALTER TABLE ProjetoColaborativo ADD CONSTRAINT FK_PROJETOCOLABORATIVO
    FOREIGN KEY (RESPONSAVEL)
    REFERENCES PyLady (PESSOA)
    ON DELETE SET NULL;

ALTER TABLE Colaboracao ADD CONSTRAINT FK1_COLABORACAO 
    FOREIGN KEY (CAPITULO)
    REFERENCES Capitulo (ID)
    ON DELETE CASCADE;

ALTER TABLE Colaboracao ADD CONSTRAINT FK2_COLABORACAO
    FOREIGN KEY (COLABORADOR)
    REFERENCES Colaborador (ID)
    ON DELETE CASCADE;

ALTER TABLE CompartilhavelEvento ADD CONSTRAINT FK_COMPARTILHAVELEVENTO
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE Palestra ADD CONSTRAINT FK_PALESTRA
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE Curso ADD CONSTRAINT FK_CURSO
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE Workshop ADD CONSTRAINT FK_WORKSHOP
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE ApresentaEvento ADD CONSTRAINT FK1_APRESENTAEVENTO
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE ApresentaEvento ADD CONSTRAINT FK2_APRESENTAEVENTO
    FOREIGN KEY (PYLADY)
    REFERENCES PyLady (PESSOA)
    ON DELETE CASCADE;

ALTER TABLE MonitorCurso ADD CONSTRAINT FK_MONITORCURSO
    FOREIGN KEY (CURSO)
    REFERENCES Curso (EVENTO)
    ON DELETE CASCADE;

ALTER TABLE Delibera ADD CONSTRAINT FK1_DELIBERA
    FOREIGN KEY (GLOBALCOUNCIL)
    REFERENCES PyLadyGlobalCouncil (ANO)
    ON DELETE CASCADE;

ALTER TABLE Delibera ADD CONSTRAINT FK2_DELIBERA
    FOREIGN KEY (CAPITULO)
    REFERENCES Capitulo (ID)
    ON DELETE CASCADE;

ALTER TABLE ResultaEvento ADD CONSTRAINT FK1_RESULTAEVENTO
    FOREIGN KEY (EVENTO)
    REFERENCES Evento (ID)
    ON DELETE CASCADE;

ALTER TABLE ResultaEvento ADD CONSTRAINT FK2_RESULTAEVENTO
    FOREIGN KEY (COLABORACAO)
    REFERENCES Colaboracao (ID)
    ON DELETE CASCADE;

ALTER TABLE ResultaProjInterno ADD CONSTRAINT FK1_RESULTAPROJINTERNO
    FOREIGN KEY (PROJ_INTERNO)
    REFERENCES ProjetoInterno (ID)
    ON DELETE CASCADE;

ALTER TABLE ResultaProjInterno ADD CONSTRAINT FK2_RESULTAPROJINTERNO
    FOREIGN KEY (COLABORACAO)
    REFERENCES Colaboracao (ID)
    ON DELETE CASCADE;

ALTER TABLE ResultaProjColaborativo ADD CONSTRAINT FK1_RESULTAPROJCOLABORATIVO
    FOREIGN KEY (PROJ_COLABORATIVO)
    REFERENCES ProjetoColaborativo (ID)
    ON DELETE CASCADE;

ALTER TABLE ResultaProjColaborativo ADD CONSTRAINT FK2_RESULTAPROJCOLABORATIVO
    FOREIGN KEY (COLABORACAO)
    REFERENCES Colaboracao (ID)
    ON DELETE CASCADE;