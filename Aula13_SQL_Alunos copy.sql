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
       Denominacao VARCHAR2(30) NOT NULL, 
       Numero NUMBER(6) CHECK(Numero >= 0) NOT NULL,
       CEP VARCHAR2(8) NOT NULL,
       Complemento NUMBER(5) CHECK(Complemento >= 0),
       CONSTRAINT PK_DENOMINACAO PRIMARY KEY (Denominacao),
       CONSTRAINT FK_DENOMINACAO FOREIGN KEY (CEP) 
                       REFERENCES   CEP(CEP) 
            ON DELETE CASCADE, 
);

CREATE TABLE CEP (
       CEP VARCHAR2(8) CHECK (TO_NUMBER(stringVar) >= 0 AND LENGTH(stringVar) = 8),
       Rua VARCHAR2(30) NOT NULL,
       Bairro VARCHAR2(20),
       Cidade VARCHAR2(30) NOT NULL,
       Estado VARCHAR2(20) NOT NULL,
       CONSTRAINT PK_CEP PRIMARY KEY (CEP)
);

CREATE TABLE Atracao (
	IDAtracao NUMBER NOT NULL PRIMARY KEY, 
	Descricao VARCHAR2(30) NOT NULL UNIQUE, 
	ClassificacaoEtaria NUMBER(3),
	Local CHAR(10) NOT NULL,
      Evento,
	CHECK (TITULACAO IN ('DOUTOR', 'ASSOCIADO', 'TITULAR'))
);

CREATE TABLE DataAtracao (
	IDAtracao CHAR(6) NOT NULL,
	Dia VARCHAR2(30) NOT NULL,
      Mês,
      Ano,
      Hora*,
);

CREATE TABLE UtilizadaEm (
      Atração, 
      Categoria, 
      Preço, 
      QuantidadeDisponível
);

CREATE TABLE CategoriaIngresso (
      TipoIngresso,
      Descrição*
);

CREATE TABLE IngressoDaAtração (
      Atração, 
      Categoria, 
      IDIngresso
);

CREATE TABLE IngressoCompra (
      IDIngresso, 
      Compra*
);

CREATE TABLE TelefoneCliente (
      RG, 
      Telefone
);

CREATE TABLE Cliente (
      CPF, 
      Senha, 
      Email
);

CREATE TABLE CPFRG (
      RG, 
      CPF
);

CREATE TABLE EndereçoCliente (
      RG, 
      Endereco
);

CREATE TABLE Endereco ( 
      IDEndereco, 
      Número, 
      CEP, 
      Complemento*
);

CREATE TABLE Compra (
      IDCompra, 
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

UtilizadaEm(
      Atração, 
      Categoria, 
      Preço, 
      QuantidadeDisponível)


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