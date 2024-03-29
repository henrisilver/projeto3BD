CREATE TABLE CEP(
    CEP CHAR(8) NOT NULL CHECK (TO_NUMBER(CEP) >= 0),
    Rua VARCHAR2(140) NOT NULL CHECK (LENGTH(Rua) >= 3),
    Bairro VARCHAR2(50) CHECK (LENGTH(Bairro) >= 2),
    Cidade VARCHAR2(100) NOT NULL CHECK (LENGTH(Cidade) >= 3),
    Estado CHAR(2) NOT NULL CHECK (Estado = UPPER(Estado)),

    CONSTRAINT PK_CEP PRIMARY KEY (CEP)
);

CREATE TABLE Local(
    Denominacao VARCHAR2(100) NOT NULL CHECK (LENGTH(Denominacao) >= 2),
    Numero NUMBER(10) CHECK(Numero >= 0) NOT NULL,
    CEP CHAR(8) NOT NULL,
    Complemento VARCHAR2(20),

    CONSTRAINT PK_LOCAL PRIMARY KEY (Denominacao),
    CONSTRAINT FK_LOCAL_CE FOREIGN KEY (CEP)
        REFERENCES CEP(CEP)
        ON DELETE CASCADE
);

CREATE TABLE Evento(
    IDEvento NUMBER(10) NOT NULL CHECK(IDEvento > 0),
    Nome VARCHAR2(20) NOT NULL,
    Descricao VARCHAR2(2000),
    Logotipo BLOB,

    CONSTRAINT PK_EVENTO PRIMARY KEY (IDEvento)
);

CREATE TABLE Atracao(
    IDAtracao NUMBER(10) NOT NULL CHECK(IDAtracao > 0),
    Descricao VARCHAR2(2000),
    ClassificacaoEtaria NUMBER(2) CHECK (ClassificacaoEtaria >=0 AND ClassificacaoEtaria <=18),
    Local VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,
    Data DATE,

    CONSTRAINT PK_ATRACAO PRIMARY KEY (IDAtracao),
    CONSTRAINT FK_ATRACAO_LO FOREIGN KEY (Local)
        REFERENCES Local(Denominacao)
        ON DELETE CASCADE,
    CONSTRAINT FK_ATRACAO_EV FOREIGN KEY (Evento)
        REFERENCES   Evento(IDEvento)
        ON DELETE CASCADE
);

CREATE TABLE CategoriaIngresso(
    TipoIngresso CHAR(2) NOT NULL,
    Descrição VARCHAR2(2000),

    CONSTRAINT PK_CATEGORIAINGRESSO PRIMARY KEY (TipoIngresso)
);

CREATE TABLE UtilizadaEm(
    Atracao NUMBER(10) NOT NULL,
    Categoria CHAR(2) NOT NULL,
    Preco NUMBER(7,2) NOT NULL CHECK(Preco >= 0),
    QuantidadeDisponivel NUMBER(10) CHECK(QuantidadeDisponivel >= 0) NOT NULL,

    CONSTRAINT PK_UTILIZADAEM PRIMARY KEY (Atracao,Categoria),
    CONSTRAINT FK_UTILIZADAEM_AT FOREIGN KEY (Atracao)
        REFERENCES Atracao(IDAtracao)
        ON DELETE CASCADE,
    CONSTRAINT FK_UTILIZADAEM_CA FOREIGN KEY (Categoria)
        REFERENCES CategoriaIngresso(TipoIngresso)
        ON DELETE CASCADE
);

CREATE TABLE Pessoa(
      RG CHAR(9),
      Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Sexo NUMBER(1) CHECK (Sexo = 1 OR Sexo = 0) NOT NULL,
      DataNascimento DATE,

      CONSTRAINT PK_PESSOA PRIMARY KEY (RG)
);

CREATE TABLE Cliente(
    RG CHAR(9) NOT NULL,
    Senha CHAR(32) NOT NULL,
    Email VARCHAR(61) NOT NULL,

    CONSTRAINT PK_CLIENTE PRIMARY KEY (RG),
    CONSTRAINT FK_CLIENTE_RG FOREIGN KEY (RG)
        REFERENCES  Pessoa(RG)
        ON DELETE CASCADE
);

CREATE TABLE Compra(
    IDCompra NUMBER(10) NOT NULL CHECK(IDCompra > 0),
    Cliente CHAR(9) NOT NULL,
    ValorTotal NUMBER(7,2) NOT NULL CHECK(ValorTotal >= 0),
    EConsolidada NUMBER(1) NOT NULL CHECK(EConsolidada = 1 or EConsolidada = 0),
    Data DATE,

    CONSTRAINT PK_COMPRA PRIMARY KEY (IDCompra),
    CONSTRAINT FK_COMPRA_CL FOREIGN KEY (Cliente)
        REFERENCES Cliente(RG)
        ON DELETE CASCADE
);

CREATE TABLE IngressoCompra(
    IDIngresso NUMBER(10) NOT NULL,
    Compra NUMBER(10),

    CONSTRAINT PK_INGRESSOCOMPRA PRIMARY KEY (IDIngresso),
    CONSTRAINT FK_INGRESSOCOMPRA_CO FOREIGN KEY (Compra)
        REFERENCES Compra(IDCompra)
        ON DELETE CASCADE
);

CREATE TABLE IngressoDaAtracao(
    Atracao NUMBER(10) NOT NULL,
    Categoria CHAR(2) NOT NULL,
    IDIngresso NUMBER(10) NOT NULL CHECK(IDIngresso > 0),

    CONSTRAINT PK_INGRESSODAATRACAO PRIMARY KEY (Atracao, Categoria, IDIngresso),
    CONSTRAINT FK_INGRESSODAATRACAO_AT_CA FOREIGN KEY (Atracao,Categoria)
        REFERENCES UtilizadaEm(Atracao,Categoria)
        ON DELETE CASCADE,
    CONSTRAINT FK_INGRESSODAATRACAO_ID FOREIGN KEY (IDIngresso)
        REFERENCES IngressoCompra(IDIngresso)
        ON DELETE CASCADE
);

CREATE TABLE TelefoneCliente(
    RG CHAR(9) NOT NULL,
    Telefone CHAR(11) NOT NULL,

    CONSTRAINT PK_TELEFONECLIENTE PRIMARY KEY (RG, Telefone),
    CONSTRAINT FK_TELEFONECLIENTE_RG FOREIGN KEY (RG)
        REFERENCES  Cliente(RG)
        ON DELETE CASCADE
);

CREATE TABLE CPFRG(
    RG CHAR(9) NOT NULL,
    CPF CHAR(11) NOT NULL,

    CONSTRAINT PK_CPFRG PRIMARY KEY (RG),
    CONSTRAINT FK_CPFRG_RG FOREIGN KEY (RG)
        REFERENCES  Cliente(RG)
        ON DELETE CASCADE
);

CREATE TABLE Endereco(
      IDEndereco NUMBER(10) NOT NULL CHECK(IDEndereco > 0),
      NUmero NUMBER(10) CHECK(Numero >= 0) NOT NULL,
      CEP CHAR(8) NOT NULL,
      Complemento VARCHAR2(20),

      CONSTRAINT PL_ENDERECO PRIMARY KEY (IDEndereco)
);

CREATE TABLE EndereçoCliente(
    RG CHAR(9) NOT NULL,
    Endereco NUMBER(10) NOT NULL,

    CONSTRAINT PK_ENDERECOCLIENTE PRIMARY KEY (RG, Endereco),
    CONSTRAINT FK_ENDERECOCLIENTE_RG FOREIGN KEY (RG)
        REFERENCES  Cliente(RG)
        ON DELETE CASCADE,
    CONSTRAINT FK_ENDERECOCLIENTE_EN FOREIGN KEY (Endereco)
        REFERENCES  Endereco(IDEndereco)
        ON DELETE CASCADE
);

# Realmente precisamos dessa relacao?!
# Eu a removi do MRelacional... Coloquei a Data em Compra
#CREATE TABLE DataCompra (
#      IDCompra NUMBER(10) CHECK (IDCompra > 0) NOT NULL,
#      Data DATE,
#
#      CONSTRAINT PK_DATACOMPRA PRIMARY KEY (IDCompra)
#);

CREATE TABLE CompraPagamento(
    Compra NUMBER(10) NOT NULL,
    Tipo NUMBER(1) CHECK (Tipo = 0 OR Tipo = 1) NOT NULL,

    CONSTRAINT PK_COMPRAPAGAMENTO PRIMARY KEY (Compra),
    CONSTRAINT FK_COMPRAPAGAMENTO_CO FOREIGN KEY (Compra)
        REFERENCES Compra(IDCompra)
        ON DELETE CASCADE
);

# Compra deveria referenciar "Compra" ou
# "CompraPagamento" como no modelo?
CREATE TABLE Pagamento(
    Compra NUMBER(10) NOT NULL,
    Acrescimos NUMBER(7,2) CHECK(Acrescimos >= 0) NOT NULL,
    Descontos NUMBER(7,2) CHECK(Descontos >= 0) NOT NULL,
    ValorEfetivo NUMBER(7,2) CHECK(ValorEfetivo >= 0) NOT NULL,

    CONSTRAINT PK_PAGAMENTO PRIMARY KEY (Compra),
    CONSTRAINT FK_PAGAMENTO_CO FOREIGN KEY (Compra)
        REFERENCES CompraPagamento(Compra)
        ON DELETE CASCADE
);

CREATE TABLE CartaoPagamento(
    Compra NUMBER(10) NOT NULL,
    QuatroUltimosDigitos CHAR(4) NOT NULL,
    DataVencimento DATE NOT NULL,
    Bandeira VARCHAR2(30) NOT NULL,

    CONSTRAINT PK_CARTAOPAGAMENTO PRIMARY KEY (Compra),
    CONSTRAINT FK_CARTAOPAGAMENTO_CO FOREIGN KEY (Compra)
        REFERENCES CompraPagamento(Compra)
        ON DELETE CASCADE
);

CREATE TABLE Boleto(
    Compra NUMBER(10) NOT NULL,
    DataVencimento DATE NOT NULL,

    CONSTRAINT PK_BOLETO PRIMARY KEY (Compra),
    CONSTRAINT FK_BOLETO_CO FOREIGN KEY(Compra)
        REFERENCES CompraPagamento(Compra)
        ON DELETE CASCADE
);

CREATE TABLE Equipe(
      Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,

      CONSTRAINT PK_EQUIPE PRIMARY KEY (Nome)
);

CREATE TABLE Modalidade(
      Nome VARCHAR2(100) NOT NULL CHECK (LENGTH(Nome) BETWEEN 2 AND 100),
      Categoria CHAR(1) NOT NULL,

      CONSTRAINT PK_MODALIDADE PRIMARY KEY (Nome)
);

CREATE TABLE TorneioA(
    Modalidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,

    CONSTRAINT PK_TORNEIOA PRIMARY KEY (Modalidade,Evento),
    CONSTRAINT FK_TORNEIOA_MO FOREIGN KEY (Modalidade)
        REFERENCES Modalidade(Nome)
        ON DELETE CASCADE,
    CONSTRAINT FK_TORNEIOA_EV FOREIGN KEY (Evento)
        REFERENCES Evento(IDEvento)
        ON DELETE CASCADE
);

CREATE TABLE Fase(
    Modalidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,
    Numero NUMBER(1) CHECK(Numero >= 0) NOT NULL,

    CONSTRAINT PK_FASE PRIMARY KEY (Modalidade,Evento,Numero),
    CONSTRAINT FK_FASE_MO_EV FOREIGN KEY (Modalidade,Evento)
        REFERENCES TorneioA(Modalidade,Evento)
        ON DELETE CASCADE
);

CREATE TABLE Grupo(
    Modalidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,
    Numero NUMBER(1) NOT NULL,
    Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
    CONSTRAINT PK_GRUPO PRIMARY KEY (Modalidade,Evento,Numero,Nome),
    CONSTRAINT FK_GRUPO_MO_EV_NU FOREIGN KEY (Modalidade,Evento,Numero)
        REFERENCES Fase(Modalidade,Evento,Numero)
        ON DELETE CASCADE
);

CREATE TABLE Jogo(
    Equipe1 VARCHAR2(100) NOT NULL,
    Equipe2 VARCHAR2(100) NOT NULL,
    Data DATE NOT NULL,
    Placar CHAR(5),
    Resumo VARCHAR2(2000),
    LocalRealizacao VARCHAR2(100) NOT NULL,
    Modalidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,
    Fase NUMBER(10) NOT NULL,
    Grupo VARCHAR2 (100) NOT NULL,

    CONSTRAINT PK_JOGO PRIMARY KEY(Equipe1,Equipe2,Data),
    CONSTRAINT FK_JOGO_EQ1 FOREIGN KEY (Equipe1)
        REFERENCES Equipe(Nome)
        ON DELETE CASCADE,
    CONSTRAINT FK_JOGO_EQ2 FOREIGN KEY (Equipe2)
        REFERENCES Equipe(Nome)
        ON DELETE CASCADE,
    CONSTRAINT FK_JOGO_MO_EV_FA_GR FOREIGN KEY (Modalidade,Evento,Fase,Grupo)
        REFERENCES Grupo(Modalidade,Evento,Numero,Nome)
        ON DELETE CASCADE,
    CONSTRAINT FK_JOGO_LO FOREIGN KEY (LocalRealizacao)
        REFERENCES Local(Denominacao)
        ON DELETE CASCADE
);

CREATE TABLE Atletica(
      Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
      Logotipo BLOB,
      Grito VARCHAR2(2000) NOT NULL,

      CONSTRAINT PK_ATLETICA PRIMARY KEY (Nome)
);

CREATE TABLE Universidade(
    Nome VARCHAR2(100) CHECK (LENGTH(Nome) BETWEEN 2 AND 100) NOT NULL,
    Atletica VARCHAR2(100) NOT NULL,
    Cidade VARCHAR2(100) NOT NULL CHECK (LENGTH(Cidade) > 2),
    Estado CHAR(2),

    CONSTRAINT PK_UNIVERSIDADE PRIMARY KEY (Nome),
    CONSTRAINT FK_UNIVERSIDADE_AT FOREIGN KEY (Atletica)
        REFERENCES Atletica(Nome)
        ON DELETE CASCADE
);

CREATE TABLE Representa(
    Equipe VARCHAR2 (100) NOT NULL,
    Modalidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,
    Universidade VARCHAR2(100) NOT NULL,

    CONSTRAINT PK_REPRESENTA PRIMARY KEY (Equipe,Modalidade,Evento),
    CONSTRAINT FK_REPRESENTA_MO_EV FOREIGN KEY (Modalidade,Evento)
        REFERENCES TorneioA(Modalidade,Evento)
        ON DELETE CASCADE,
    CONSTRAINT FK_REPRESENTA_UN FOREIGN KEY (Universidade)
        REFERENCES Universidade(Nome)
        ON DELETE CASCADE,
    CONSTRAINT SK_REPRESENTA UNIQUE(Modalidade,Evento,Universidade)
);

CREATE TABLE TorneioB(
    Modalidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,

    CONSTRAINT PK_TORNEIOB PRIMARY KEY (Modalidade,Evento),
    CONSTRAINT FK_TORNEIOB_MO FOREIGN KEY (Modalidade)
        REFERENCES Modalidade(Nome)
        ON DELETE CASCADE,
    CONSTRAINT FK_TORNEIOB_EV FOREIGN KEY (Evento)
        REFERENCES Evento(IDEvento)
        ON DELETE CASCADE
);

CREATE TABLE Disputa(
    Modalidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,
    Etapa NUMBER(10) NOT NULL CHECK (Etapa > 0),
    Data DATE NOT NULL,
    NomeLocal VARCHAR2(100) NOT NULL,

    CONSTRAINT PK_DISPUTA PRIMARY KEY (Modalidade,Evento,Etapa),
    CONSTRAINT FK_DISPUTA_MO_EV FOREIGN KEY (Modalidade,Evento)
        REFERENCES TorneioB(Modalidade,Evento)
        ON DELETE CASCADE,
    CONSTRAINT FK_DISPUTA_NO FOREIGN KEY (NomeLocal)
        REFERENCES Local(Denominacao)
        ON DELETE CASCADE
);

CREATE TABLE Atleta(
    RG CHAR(9) NOT NULL,
    Altura NUMBER(3) CHECK (Altura BETWEEN 0 AND 300) NOT NULL,
    Peso NUMBER(3) CHECK (Peso BETWEEN 0 AND 300) NOT NULL,
    Equipe VARCHAR2(100),

    CONSTRAINT PK_ATLETA PRIMARY KEY (RG),
    CONSTRAINT FK_ATLETA_RG FOREIGN KEY (RG)
        REFERENCES Pessoa(RG)
        ON DELETE CASCADE,
    CONSTRAINT FK_ATLETA_EQ FOREIGN KEY (Equipe)
        REFERENCES Equipe(Nome)
        ON DELETE SET NULL
);

CREATE TABLE Compete(
    Atleta CHAR(9) NOT NULL,
    Modalidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,
    Etapa NUMBER(10) NOT NULL,
    Colocacao NUMBER(10) NOT NULL,
    Tempo DATE NOT NULL,
    Classificado NUMBER(1) CHECK (Classificado = 1 OR Classificado = 0) NOT NULL,

    CONSTRAINT PK_COMPETE PRIMARY KEY (Atleta,Modalidade,Evento,Etapa),
    CONSTRAINT FK_COMPETE_MO_EV_ET FOREIGN KEY (Modalidade,Evento,Etapa)
        REFERENCES Disputa(Modalidade,Evento,Etapa)
        ON DELETE CASCADE,
    CONSTRAINT FK_COMPETE_AT FOREIGN KEY (Atleta)
        REFERENCES Atleta(RG)
        ON DELETE CASCADE
);

CREATE TABLE CategoriaPessoa(
    RG CHAR(9) NOT NULL,
    Categoria NUMBER(1) CHECK (Categoria = 1 OR Categoria = 0) NOT NULL,

    CONSTRAINT PK_CATEGORIAPESSOA PRIMARY KEY (RG,Categoria),
    CONSTRAINT FK_CATEGORIAPESSOA_RG FOREIGN KEY (RG)
        REFERENCES Pessoa(RG)
        ON DELETE CASCADE
);

# Seria suficiente jogar esse "Nome"  na relação "Equipe"?
# Me parece tão desnecessário ter essas duas relações separadas...
# Uma só de IDs e a outra com os mesmos IDs e um "Nome" junto...
# O que me diz?
CREATE TABLE EquipeUniversidade(
    Equipe VARCHAR2(100) NOT NULL,
    Universidade VARCHAR2(100) NOT NULL,

    CONSTRAINT PK_EQUIPEUNIVERSIDADE PRIMARY KEY (Equipe),
    CONSTRAINT FK_EQUIPEUNIVERSIDADE_UN FOREIGN KEY (Universidade)
        REFERENCES Universidade(Nome)
        ON DELETE CASCADE,
    CONSTRAINT FK_EQUIPEUNIVERSIDADE_EQ FOREIGN KEY (Equipe)
        REFERENCES Equipe(Nome)
        ON DELETE CASCADE
);

CREATE TABLE ParticipacaoUniversidade(
    Universidade VARCHAR2(100) NOT NULL,
    Evento NUMBER(10) NOT NULL,
    MOuro NUMBER(3) CHECK(MOuro >= 0) NOT NULL,
    MPrata NUMBER(3) CHECK(MPrata >= 0) NOT NULL,
    MBronze NUMBER(3) CHECK(MBronze >= 0) NOT NULL,

    CONSTRAINT PK_PARTICIPACAOUNIVERSIDADE PRIMARY KEY (Universidade,Evento),
    CONSTRAINT FK_PARTICIPACAOUNIVERSIDADE_UN FOREIGN KEY (Universidade)
        REFERENCES Universidade(Nome)
        ON DELETE CASCADE,
    CONSTRAINT FK_PARTICIPACAOUNIVERSIDADE_EV FOREIGN KEY (Evento)
        REFERENCES Evento(IDEvento)
        ON DELETE CASCADE
);

CREATE TABLE Participa(
    Equipe VARCHAR2(100) NOT NULL,
    GrupoMod VARCHAR2(100) NOT NULL,
    GrupoEve NUMBER(10) NOT NULL,
    GrupoNum NUMBER(10) NOT NULL,
    GrupoNom VARCHAR2(100) NOT NULL,
    Pontuacao NUMBER (4) CHECK (LENGTH(Pontuacao) BETWEEN 0 AND 1000) NOT NULL,
    Lugar1 VARCHAR2(100) CHECK (LENGTH(Lugar1) BETWEEN 2 AND 100) NOT NULL,
    Lugar2 VARCHAR2(100) CHECK (LENGTH(Lugar2) BETWEEN 2 AND 100) NOT NULL,

    CONSTRAINT PK_PARTICIPA PRIMARY KEY (Equipe,GrupoMod,GrupoEve,GrupoNum,GrupoNom),
    CONSTRAINT FK_PARTICIPA_GRUPO FOREIGN KEY (GrupoMod,GrupoEve,GrupoNum,GrupoNom)
        REFERENCES Grupo(Modalidade,Evento,Numero,Nome)
        ON DELETE CASCADE,
    CONSTRAINT FK_PARTICIPA_EQ FOREIGN KEY (Equipe)
        REFERENCES Equipe(Nome)
        ON DELETE CASCADE
);