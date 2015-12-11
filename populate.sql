INSERT INTO CEP VALUES("02038030","R José Debieux","Santana","São Paulo","SP");
INSERT INTO CEP VALUES("09015190","R General Glicério","Centro","Santo André","SP");
INSERT INTO CEP VALUES("09770420","Av Imperador Pedro II","Nova Petrópolis","São Bernardo do Campo","SP");

INSERT INTO Local VALUES("325-02038030-G. Infor Softwares",325,"02038030","G. Infor Softwares");
INSERT INTO Local VALUES("412-09015190-Microcamp",412,"09015190","Microcamp");
INSERT INTO Local VALUES("131-09770420-Microcamp",131,"09770420","Microcamp");

INSERT INTO Evento(IDEvento,Nome,Descricao) VALUES(1,"Show da Sexta","Show de Rock Muito Legal. Muitos Bêbados!");
INSERT INTO Evento(IDEvento,Nome,Descricao) VALUES(2,"Show do Sábado","Pre-pa-ra para esse showzasso!");
INSERT INTO Evento(IDEvento,Nome,Descricao) VALUES(3,"Final do Tusca","Venha descobrir quem é a grande vencedora!");

INSERT INTO Atracao VALUES(1,"Show de Rock Muito Legal. Muitos Bêbados!",18,"325-02038030-G. Infor Softwares",1,TO_DATE('12/12/15', 'DD/MM/RR'));
INSERT INTO Atracao VALUES(2,"Pre-pa-ra para esse showzasso!",18,"325-02038030-G. Infor Softwares",2,TO_DATE('13/12/15', 'DD/MM/RR'));
INSERT INTO Atracao VALUES(3,"Final do Tusca",18,"325-02038030-G. Infor Softwares",3,TO_DATE('13/12/15', 'DD/MM/RR'));

INSERT INTO UtilizadaEm VALUES ();
INSERT INTO UtilizadaEm VALUES ();
INSERT INTO UtilizadaEm VALUES ();

UtilizadaEm(Atração, Categoria, Preço, QuantidadeDisponível)

CategoriaIngresso(TipoIngresso, Descrição*)

IngressoDaAtração(Atração, Categoria, IDIngresso)

IngressoCompra(IDIngresso, Compra*)

TelefoneCliente(RG, Telefone)

CPFRG(RG, CPF)

EndereçoCliente(RG, Endereco)

TelefoneCliente(RG, Telefone)

Endereco(IDEndereco, Número, CEP, Complemento*)

Compra(IDCompra, Cliente, ValorTotal, ÉConsolidada,Data)

CompraPagamento(Compra, Tipo)

Pagamento(Compra, Acréscimos*, Descontos*, ValorEfetivo)

CartaoPagamento(Compra, QuatroÚltimosDigitos, DataVencimento, Bandeira)

Boleto(Compra, DataVencimento)

Equipe(Nome,Universidade)

Jogo(Equipe1, Equipe2, Data, Horário, Placar, Resumo*, LocalRealizacao, Modalidade,Evento,Fase,Grupo)

Representa ( Equipe , Modalidade , Evento , Universidade )

TorneioA(Modalidade, Evento)

Modalidade(Nome, Categoria)

TorneioB(Modalidade, Evento)

Disputa(Modalidade, Evento, Etapa, Data, NomeLocal)

Compete(Atleta, Modalidade, Evento, Etapa, Colocação, Tempo, Classificado)

Pessoa(RG, Nome, Sexo, DataNascimento)

CategoriaPessoa(RG, Categoria)

Atleta(RG, Altura, Peso, Equipe*)

Universidade (Nome, Atlética, Cidade, Estado)

EquipeUniversidade(Equipe, NomeUniversidade)

Universidade (Nome, Atlética, Cidade, Estado)

Atlética(Nome, Logotipo*, Grito)

ParticipaçãoUniversidade(Universidade, Evento, MOuro, MPrata, MBronze)

Fase (Modalidade,  Evento, Número)

Grupo(Modalidade, Evento, Numero, Nome)

Participa(Equipe, GrupoMod, GrupoEve, GrupoFas, GrupoNom, Pontuação, 1ºLugar, 2ºLugar)