/*DROP TABLE MATRICULA;
DROP TABLE TURMA;
DROP TABLE DISCIPLINA;
DROP TABLE PROFESSOR;
DROP TABLE ALUNO;*/

CREATE TYPE pessoa AS OBJECT 
( nome     VARCHAR2(32),
      idade   NUMBER(3)
) ;

CREATE TABLE Local (
       Denominacao VARCHAR2(100) NOT NULL CHECK (LENGTH(Denominacao) >= 2), 
       Numero NUMBER(6) CHECK(Numero >= 0) NOT NULL,
       CEP VARCHAR2(8) NOT NULL,
       Complemento VARCHAR2(20),

       CONSTRAINT PK_Local PRIMARY KEY (Denominacao),
       CONSTRAINT FK_Local FOREIGN KEY (CEP) 
                       REFERENCES   CEP(CEP) 
            ON DELETE CASCADE
);

CREATE TABLE CEP (
       CEP VARCHAR2(8) NOT NULL CHECK (TO_NUMBER(stringVar) >= 0 AND LENGTH(stringVar) = 8),
       Rua VARCHAR2(140) NOT NULL CHECK (LENGTH(Rua) >= 3),
       Bairro VARCHAR2(50) CHECK (LENGTH(Bairro) >= 2),
       Cidade VARCHAR2(100) NOT NULL CHECK (LENGTH(Cidade) >= 3),
       Estado VARCHAR2(2) NOT NULL CHECK (LENGTH(Estado) = 2 AND Estado = UPPER(Estado)),
       
       CONSTRAINT PK_CEP PRIMARY KEY (CEP)
);

CREATE TABLE Atracao (
	IDAtracao NUMBER(10) NOT NULL CHECK(IDAtracao > 0), 
	Descricao VARCHAR2(2000), 
	ClassificacaoEtaria NUMBER(2) CHECK (ClassificacaoEtaria >=0 AND ClassificacaoEtaria <=18),
	Local VARCHAR2(100) NOT NULL,
      Evento NUMBER(10) NOT NULL,
      Data DATE,
	
      CONSTRAINT PK_Atracao PRIMARY KEY (IDAtracao),
      CONSTRAINT FK_AtracaoLocal FOREIGN KEY (Local) 
                       REFERENCES   Local(Denominacao) 
            ON DELETE CASCADE, 
      CONSTRAINT FK_AtracaoEvento FOREIGN KEY (Evento) 
                       REFERENCES   Evento(IDEvento) 
            ON DELETE CASCADE
);

CREATE TABLE UtilizadaEm (
      Atracao NUMBER(10) NOT NULL, 
      Categoria VARCHAR2(2) NOT NULL, 
      Preco NUMBER(7,2) NOT NULL CHECK(Preco >= 0), 
      QuantidadeDisponível NUMBER(6) CHECK(Numero >= 0) NOT NULL,

      CONSTRAINT PK_UtilizadaEm PRIMARY KEY (Atracao, Categoria),
      CONSTRAINT FK_UtilizadaEmAt FOREIGN KEY (Atracao) 
                       REFERENCES   Atracao(IDAtracao) 
            ON DELETE CASCADE,
      CONSTRAINT FK_UtilizadaEmCa FOREIGN KEY (Categoria) 
                       REFERENCES   CategoriaIngresso(TipoIngresso) 
            ON DELETE CASCADE
);

CREATE TABLE CategoriaIngresso (
      TipoIngresso VARCHAR2(2) NOT NULL CHECK (LENGTH(TipoIngresso) = 2),
      Descrição VARCHAR2(2000),

      CONSTRAINT PK_CategoriaIngresso PRIMARY KEY (TipoIngresso)
);

CREATE TABLE IngressoDaAtração (
      Atracao NUMBER(10) NOT NULL, 
      Categoria VARCHAR2(2) NOT NULL, 
      IDIngresso NUMBER(10) NOT NULL CHECK(IDIngresso > 0)

      CONSTRAINT PK_IngressoDaAtr PRIMARY KEY (Atracao, Categoria, IDIngresso),
      CONSTRAINT FK_IngressoAtr FOREIGN KEY (Atracao) 
                       REFERENCES   UtilizadaEm(Atracao)
            ON DELETE CASCADE,
      CONSTRAINT FK_IngressoCat FOREIGN KEY (Categoria) 
                       REFERENCES   UtilizadaEm(Categoria) 
            ON DELETE CASCADE
);

CREATE TABLE IngressoCompra (
      IDIngresso NUMBER(10) NOT NULL, 
      Compra NUMBER(10),

      CONSTRAINT PK_IngressoCompra PRIMARY KEY (IDIngresso),
      CONSTRAINT FK_IngressoCompraID FOREIGN KEY (IDIngresso) 
                       REFERENCES  IngressoDaAtração(IDIngresso)
            ON DELETE CASCADE,
      CONSTRAINT FK_IngressoCompraCom FOREIGN KEY (Compra) 
                       REFERENCES  Compra(IDCompra)
            ON DELETE CASCADE
);

CREATE TABLE TelefoneCliente (
      RG VARCHAR2(9) NOT NULL, 
      Telefone VARCHAR2(11) NOT NULL CHECK(LENGHT(Telfone) = 11),

      CONSTRAINT PK_TelefoneCliente PRIMARY KEY (RG, Telefone),
      CONSTRAINT FK_TelefoneCliente FOREIGN KEY (RG) 
                       REFERENCES  Cliente(RG)
            ON DELETE CASCADE
);

CREATE TABLE Cliente (
      RG VARCHAR2(9) NOT NULL,
      Senha CHAR(32) NOT NULL, 
      Email VARCHAR(61) NOT NULL,

      CONSTRAINT PK_Cliente PRIMARY KEY (RG),
      CONSTRAINT FK_Cliente FOREIGN KEY (RG) 
                       REFERENCES  Pessoa(RG)
            ON DELETE CASCADE
);

CREATE TABLE CPFRG (
      RG VARCHAR2(9) NOT NULL, 
      CPF VARCHAR2(11) NOT NULL CHECK(LENGTH(CPF) = 11)

      CONSTRAINT PK_CPFRG PRIMARY KEY (RG),
      CONSTRAINT FK_CPFRG FOREIGN KEY (RG) 
                       REFERENCES  Cliente(RG)
            ON DELETE CASCADE
);

CREATE TABLE EndereçoCliente (
      RG CHAR(9) NOT NULL, 
      Endereco NUMBER(10) NOT NULL,

      CONSTRAINT PK_EnderecoCliente PRIMARY KEY (RG, Endereco),
      CONSTRAINT FK_EnderecoClienteRG FOREIGN KEY (RG) 
                       REFERENCES  Cliente(RG)
            ON DELETE CASCADE,
      CONSTRAINT FK_EnderecoClienteEnd FOREIGN KEY (Endereco) 
                       REFERENCES  Endereco(IDEndereco)
            ON DELETE CASCADE
);

CREATE TABLE Endereco ( 
      IDEndereco NUMBER(10) NOT NULL CHECK(IDEndereco > 0),  
      Número NUMBER(6) CHECK(Numero >= 0) NOT NULL,
      CEP CHAR(8) NOT NULL, 
      Complemento*
);

CREATE TABLE Compra (
      IDCompra NUMBER(10) NOT NULL CHECK(IDCompra > 0), 
      Cliente, 
      ValorTotal, 
      ÉConsolidada
);

CREATE TABLE DataCompra (
      IDCompra, 
      Dia, 
      Mês, 
      Ano, 
      Hora
);

CREATE TABLE CompraPagamento (
      Compra, 
      Tipo
);


CREATE TABLE TURMA (
       	SIGLA CHAR(6) NOT NULL,
       	NUMERO NUMBER NOT NULL,
       	NALUNOS NUMBER NOT NULL     
       	CHECK(NAlunos <= 70),
       	PRIMARY KEY (SIGLA, NUMERO),
       	FOREIGN KEY (SIGLA) REFERENCES DISCIPLINA(SIGLA) 
       		ON DELETE CASCADE
);

CREATE TABLE MATRICULA (
	SIGLA CHAR(6) NOT NULL,
	NUMERO NUMBER NOT NULL,
	ALUNO NUMBER NOT NULL,
	ANO NUMBER(4) NOT NULL,
	NOTA FLOAT,
	PRIMARY KEY (SIGLA, NUMERO, ALUNO, ANO),
	FOREIGN KEY (SIGLA, NUMERO) 
            	REFERENCES TURMA(SIGLA, NUMERO) 
		ON DELETE CASCADE, 
	FOREIGN KEY (ALUNO) REFERENCES ALUNO(NUSP) 
		ON DELETE CASCADE
);

ALTER TABLE ALUNO ADD CIDADEORIGEM VARCHAR2(30) DEFAULT 'Sao Carlos';
ALTER TABLE MATRICULA ADD FREQUENCIA NUMBER(3,0) CHECK(FREQUENCIA BETWEEN 0 AND 100);

INSERT INTO Aluno VALUES('Ana', 1, 20, '06-JUL-1990', 'Jau');
INSERT INTO Aluno VALUES('Andre', 2, 19, '06-SEP-1991', 'Lins');
INSERT INTO Aluno VALUES('Adriana', 3, 18, '03-AUG-1992', 'Limeira');
INSERT INTO Aluno VALUES('Albertina', 4, 18, '02-SEP-1992', 'Descalvado');
INSERT INTO ALUNO (NUSP, NOME, IDADE, DATANASC, CIDADEORIGEM) VALUES ('30', 'Petrus', '30', TO_DATE('05/02/80', 'DD/MM/RR'), 'Marilia');
INSERT INTO ALUNO (NUSP, NOME, IDADE, DATANASC, CIDADEORIGEM) VALUES ('40', 'Marcos', '35', TO_DATE('03/07/85', 'DD/MM/RR'), 'Vitoria');

/*Exemplo do uso de DEFAULT*/
INSERT INTO Aluno(NUSP, Nome, Idade, DataNasc) VALUES(5, 'Adilson', 20, '06-JUL-1990');

INSERT INTO Professor VALUES(10, 'Paulo', 32, 'DOUTOR');
INSERT INTO Professor VALUES(20, 'Pedro', 26, 'ASSOCIADO');
INSERT INTO Professor VALUES(30, 'Petrus', 40, 'TITULAR');
INSERT INTO Professor VALUES(40, 'Marcos', 35, 'ASSOCIADO');

INSERT INTO Disciplina VALUES('SCC540', 'BDInfo', 4, 10, 'Fundamentos de Bases de Dados');
INSERT INTO Disciplina VALUES('SCC241', 'LabBD', 4, 20, 'Oracle guide');
INSERT INTO Disciplina VALUES('SMA300', 'Calculo', 6, 30, 'Introducao ao Calculo');
INSERT INTO Disciplina VALUES('SMA400', 'Algebra', 4, 30, 'Introducao a Agebra');

INSERT INTO Turma VALUES('SCC540',1,2);
INSERT INTO Turma VALUES('SCC241',1,2);
INSERT INTO Turma VALUES('SCC540',2,2);
INSERT INTO Turma VALUES('SCC241',2,2);
INSERT INTO Turma VALUES('SMA300',1,2);
INSERT INTO Turma VALUES('SMA400',1,2);
INSERT INTO Turma VALUES('SMA300',2,1);
INSERT INTO Turma VALUES('SMA400',2,0);

INSERT INTO Matricula VALUES('SCC540', 1, 1, 2009, 4.5, 59);
INSERT INTO Matricula VALUES('SCC540', 1, 2, 2009, 4.6, 50);
INSERT INTO Matricula VALUES('SCC540', 1, 3, 2009, 4.0, 60);

INSERT INTO Matricula VALUES('SCC540', 1, 1, 2010, 5.5, 65);
INSERT INTO Matricula VALUES('SCC540', 1, 2, 2010, 7.6, 80);
INSERT INTO Matricula VALUES('SCC540', 1, 3, 2010, 4.2, 65);

INSERT INTO Matricula VALUES('SCC241', 1, 1, 2009, 4.5, 59);
INSERT INTO Matricula VALUES('SCC241', 1, 2, 2009, 6.5, 40);
INSERT INTO Matricula VALUES('SCC241', 1, 3, 2009, 4.5, 59);

INSERT INTO Matricula VALUES('SCC241', 1, 1, 2010, 9.0, 30);
INSERT INTO Matricula VALUES('SCC241', 1, 3, 2010, 4.5, 59);

INSERT INTO Matricula VALUES('SMA300', 1, 2, 2009, 3.0, 59);
INSERT INTO Matricula VALUES('SMA300', 1, 3, 2010, 5.1, 50);
INSERT INTO Matricula VALUES('SMA300', 2, 4, 2010, 5.8, 100);
INSERT INTO Matricula VALUES('SMA300', 2, 5, 2010, 9.1, 50);

COMMIT;