CREATE TABLE Pagamento(
      Compra NUMBER(10) CHECK (Compra > 0) NOT NULL,
      Acrescimos NUMBER(7,2) CHECK(Acrescimos >= 0) NOT NULL,
      Descontos NUMBER(7,2) CHECK(Descontos >= 0) NOT NULL,
      ValorEfetivo NUMBER(7,2) CHECK(Acrescimos >= 0) NOT NULL,

      CONSTRAINT PK_PAGAMENTO PRIMARY KEY (Compra),
      CONSTRAINT FK_CARTAOPAGAMENTO FOREIGN KEY (Compra)
            REFERENCES Compra(Compra),
);

CREATE TABLE CartaoPagamento(
      Compra NUMBER CHECK (Compra > 0) NOT NULL,
      QuatroUltimosDigitos VARCHAR(4) CHECK (LENGTH(QuatroUltimosDigitos) = 4),
      DataVencimento DATE,
      Bandeira VARCHAR2(30),

      CONSTRAINT PK_CARTAOPAGAMENTO PRIMARY KEY (Compra),
      CONSTRAINT FK_CARTAOPAGAMENTO FOREIGN KEY (Compra)
            REFERENCES Compra(Compra),
);

CREATE TABLE Boleto(
      Compra NUMBER (10) CHECK (Compra > 0) NOT NULL,
      DataVencimento DATE NOT NULL,

      CONSTRAINT PK_BOLETO PRIMARY KEY (Compra),
      CONSTRAINT FK_BOLETO FOREIGN KEY(Compra)
            REFERENCES Compra(Compra),
);

CREATE TABLE Equipe(
      Nome VARCHAR2 CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,

      CONSTRAINT PK_EQUIPE PRIMARY KEY (Nome)
);

CREATE TABLE Jogo(
      Equipe1 VARCHAR2 CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Equipe2 VARCHAR2 CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Data DATE NOT NULL,
      Placar CHAR(5),
      Resumo VARCHAR(2000),
      LocalRealizacao VARCHAR2(100) NOT NULL,
      Modalidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,
      Fase NUMBER(10) NOT NULL,
      Grupo VARCHAR2 (100) NOT NULL,

      CONSTRAINT PK_JOGO PRIMARY KEY(Equipe1,Equipe2,Data),
      CONSTRAINT FK_JOGO_1 FOREIGN KEY (Equipe)
            REFERENCES Equipe(Equipe),
      CONSTRAINT FK_JOGO_2 FOREIGN KEY (Equipe)
            REFERENCES Equipe(Equipe),
      CONSTRAINT FK_JOGO_3 FOREIGN KEY (Modalidade,Evento,Fase,Grupo)
            REFERENCES Grupo(Modalidade,Evento,Numero,Nome),
);

CREATE TABLE Evento(
      IDEvento NUMBER(10) NOT NULL CHECK(IDEvento > 0),
      Nome VARCHAR2(20) NOT NULL,
      Descricao VARCHAR2(2000),
      Logotipo VARCHAR2(50),
      CONSTRAINT PK_EVENTO PRIMARY KEY (IDEvento)
);

CREATE TABLE Representa(
      Equipe VARCHAR2 CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Modalidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,
      Universidade VARCHAR2(100) NOT NULL,

      CONSTRAINT PK_EVENTO PRIMARY KEY (IDEvento)
);

CREATE TABLE TorneioA(
      Modalidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,

      CONSTRAINT PK_TORNEIOB PRIMARY KEY (Modalidade,Evento),
      CONSTRAINT FK_TORNEIOB_1 FOREIGN KEY (Modalidade)
            REFERENCES Modalidade(Nome),
      CONSTRAINT FK_TORNEIOB_2 FOREIGN KEY (Evento)
            REFERENCES Universidade(Nome),
);

CREATE TABLE Modalidade(
      Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Categoria CHAR(1),

      CONSTRAINT PK_MODALIDADE PRIMARY KEY (Nome),
);

CREATE TABLE TorneioB(
      Modalidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,

      CONSTRAINT PK_TORNEIOB PRIMARY KEY (Modalidade,Evento),
      CONSTRAINT FK_TORNEIOB_1 FOREIGN KEY (Modalidade)
            REFERENCES Modalidade(Nome),
      CONSTRAINT FK_TORNEIOB_2 FOREIGN KEY (Evento)
            REFERENCES Universidade(Nome),
);

CREATE TABLE Disputa(
      Modalidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,
      Etapa NUMBER(10) NOT NULL,
      Data DATE,
      NomeLocal VARCHAR2(100) NOT NULL,

      CONSTRAINT PK_DISPUTA PRIMARY KEY (Modalidade,Evento,Etapa),
      CONSTRAINT FK_DISPUTA_1 FOREIGN KEY (Modalidade,Evento)
            REFERENCES Universidade(Nome),
      CONSTRAINT FK_DISPUTA_2 FOREIGN KEY (NomeLocal)
            REFERENCES Local(Denominacao),
);

CREATE TABLE Compete(
      Atleta CHAR(9),
      Modalidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,
      Etapa NUMBER(10) NOT NULL,
      Colocação NUMBER(10) NOT NULL,
      Tempo DATE,
      Classificado NUMBER(1) CHECK (Sexo = 1 OR Sexo = 0) NOT NULL,

      CONSTRAINT PK_COMPETE PRIMARY KEY (Equipe),
      CONSTRAINT FK_COMPETE FOREIGN KEY (Universidade)
            REFERENCES Universidade(Nome),
);

CREATE TABLE Pessoa(
      RG CHAR(9),
      Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Sexo NUMBER(1) CHECK (Sexo = 1 OR Sexo = 0) NOT NULL,
      DataNascimento DATE,

      CONSTRAINT PK_PESSOA PRIMARY KEY (RG),
);

CREATE TABLE CategoriaPessoa(
      RG CHAR(9),
      Categoria NUMBER(1) CHECK (Sexo = 1 OR Sexo = 0) NOT NULL,

      CONSTRAINT PK_CATEGORIAPESSOA PRIMARY KEY (RG,Categoria),
      CONSTRAINT FK_CATEGORIAPESSOA FOREIGN KEY (RG)
            REFERENCES Pessoa(RG),
);

CREATE TABLE Atleta(
      RG CHAR(9),
      Altura NUMBER(3) CHECK (Altura BETWEEN 0 AND 300) NOT NULL,
      Peso NUMBER(3) CHECK (Altura BETWEEN 0 AND 300) NOT NULL,
      Equipe VARCHAR2(100),

      CONSTRAINT PK_ATLETA PRIMARY KEY (RG),
      CONSTRAINT FK_ATLETA FOREIGN KEY (RG)
            REFERENCES Pessoa(RG),
);

CREATE TABLE EquipeUniversidade(
      Equipe VARCHAR2(100) NOT NULL,
      NomeUniversidade VARCHAR2(100) NOT NULL,

      CONSTRAINT PK_EQUIPEUNIVERSIDADE PRIMARY KEY (Equipe),
      CONSTRAINT FK_EQUIPEUNIVERSIDADE FOREIGN KEY (Universidade)
            REFERENCES Universidade(Nome),
);

CREATE TABLE Universidade(
      Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Atletica VARCHAR2(100) NOT NULL,
      Cidade,
      Estado CHAR(2),

      CONSTRAINT PK_UNIVERSIDADE PRIMARY KEY (Nome),
      CONSTRAINT FK_UNIVERSIDADE FOREIGN KEY (Atletica),
            REFERENCES Atletica(Nome),
);

CREATE TABLE Atletica(
      Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Logotipo BLOB,
      Grito VARCHAR2(2000) NOT NULL,

      CONSTRAINT PK_ATLETICA PRIMARY KEY (Nome),
);

CREATE TABLE ParticipaçãoUniversidade(
      Universidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,
      MOuro NUMBER(10) CHECK(Numero >= 0) NOT NULL,
      MPrata NUMBER(10) CHECK(Numero >= 0) NOT NULL,
      MBronze NUMBER(10) CHECK(Numero >= 0) NOT NULL,

      CONSTRAINT PK_PARTICIPACAOUNIVERSIDADE PRIMARY KEY (Universidade,Evento),
      CONSTRAINT FK_PARTICIPACAOUNIVERSIDADE_1 FOREIGN KEY (Universidade)
            REFERENCES Universidade(Nome),
      CONSTRAINT FK_PARTICIPACAOUNIVERSIDADE_2 FOREIGN KEY (Evento)
            REFERENCES Evento(IDEvento),
);

CREATE TABLE Fase(
      Modalidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,
      Numero NUMBER(10) CHECK(Numero >= 0) NOT NULL,

      CONSTRAINT PK_FASE PRIMARY KEY (Modalidade,Evento,Numero),
      CONSTRAINT FK_FASE FOREIGN KEY (Modalidade,Evento)
            REFERENCES TorneioA(Modalidade,Evento),
);

CREATE TABLE Grupo(
      Modalidade VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,
      Numero NUMBER(10) NOT NULL,
      Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      CONSTRAINT PK_GRUPO PRIMARY KEY (Modalidade,Evento,Fase,Nome),
      CONSTRAINT FK_GRUPO FOREIGN KEY (Modalidade,Evento,Fase)
            REFERENCES Fase(Modalidade,Evento,Numero),
);

CREATE TABLE Participa(
      Equipe VARCHAR2(100) NOT NULL,
      GrupoMod VARCHAR2(100) NOT NULL,
      GrupoEve NUMBER(10) NOT NULL,
      GrupoNum NUMBER(10) NOT NULL,
      GrupoNom VARCHAR2(100) NOT NULL,
      Pontuacao NUMBER (4) CHECK (LENGTH(Pontuacao) BETWEEN 0 AND 1000) NOT NULL,
      1Lugar VARCHAR2(100) CHECK (LENGTH(1Lugar) BETWEEN 2 AND 100) NOT NULL,
      2Lugar VARCHAR2(100) CHECK (LENGTH(2Lugar) BETWEEN 2 AND 100) NOT NULL,

      CONSTRAINT PK_PARTICIPA PRIMARY KEY (Equipe,GrupoMod,GrupoEve,GrupoNum,GrupoNum),
      CONSTRAINT FK_PARTICIPA FOREIGN KEY (GrupoMod,GrupoEve,GrupoNum,GrupoNom)
            REFERENCES Grupo(Modalidade,Evento,Numero,Nome),
);