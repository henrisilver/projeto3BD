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
INSERT INTO Atracao VALUES(3,"Final do Tusca",18,"325-02038030-G. Infor Softwares",3,TO_DATE('20/12/15', 'DD/MM/RR'));

INSERT INTO CategoriaIngresso VALUES("MI","Masculino Inteira");
INSERT INTO CategoriaIngresso VALUES("MM","Masculino Meia");
INSERT INTO CategoriaIngresso VALUES("FI","Feminino Inteira");

INSERT INTO UtilizadaEm VALUES (1,"MI",60.00,2000);
INSERT INTO UtilizadaEm VALUES (1,"MM",30.00,3000);
INSERT INTO UtilizadaEm VALUES (1,"FI",40.00,9000);
INSERT INTO UtilizadaEm VALUES (2,"MI",90.00,2000);
INSERT INTO UtilizadaEm VALUES (2,"MM",45.00,3000);
INSERT INTO UtilizadaEm VALUES (2,"FI",80.00,9000);
INSERT INTO UtilizadaEm VALUES (3,"MI",40.00,2000);
INSERT INTO UtilizadaEm VALUES (3,"MM",20.00,3000);
INSERT INTO UtilizadaEm VALUES (3,"FI",35.00,9000);

INSERT INTO Pessoa VALUES("548763458","Papai Noel da Silva Salvi",0,TO_DATE('25/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES("123456789","Zinedine Zidane",0,TO_DATE('14/08/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES("987654321","Professor Xavier",0,TO_DATE('26/11/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES("456378123","Sr. Lucas Bueno Sem Ruas",0,TO_DATE('13/01/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES("987823412","João Soares de Navarro",0,TO_DATE('01/05/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES("872367182","Ferias De Uma Vez Por Todas",1,TO_DATE('08/12/15', 'DD/MM/RR'));

INSERT INTO Cliente VALUES("987654321","SENHA","professor.xavier@xmen.xxx.men");
INSERT INTO Cliente VALUES("987823412","senha","soreas_190@carrasco.edu.br");
INSERT INTO Cliente VALUES("872367182","password","emailrapido@itelefonica.com.br");
INSERT INTO Cliente VALUES("123456789","palavra-chave","superstar@emailsdafranca.fr");
INSERT INTO Cliente VALUES("548763458","palavra-passe","mailbox@polonorte.pn");

INSERT INTO Compra VALUES(1,"987654321",125.00,0,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(2,"987654321",130.00,1,TO_DATE('09/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(3,"123456789",90.00,0,TO_DATE('10/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(4,"987654321",500.00,1,TO_DATE('11/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(5,"987654321",35.00,1,TO_DATE('12/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(6,"987654321",20.00,0,TO_DATE('13/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(7,"987823412",59.90,1,TO_DATE('15/12/15', 'DD/MM/RR'));

INSERT INTO IngressoCompra VALUES(1,2);
INSERT INTO IngressoCompra VALUES(2,3);
INSERT INTO IngressoCompra VALUES(3,3);
INSERT INTO IngressoCompra VALUES(4,4);
INSERT INTO IngressoCompra VALUES(5,1);
INSERT INTO IngressoCompra VALUES(6,1);
INSERT INTO IngressoCompra VALUES(7,6);
INSERT INTO IngressoCompra VALUES(8,7);
INSERT INTO IngressoCompra VALUES(9,5);
INSERT INTO IngressoCompra VALUES(10,4);
INSERT INTO IngressoCompra VALUES(11,4);
INSERT INTO IngressoCompra VALUES(12,4);

INSERT INTO IngressoDaAtração VALUES(1,"MI",1);
INSERT INTO IngressoDaAtração VALUES(1,"MI",2);
INSERT INTO IngressoDaAtração VALUES(1,"MI",3);
INSERT INTO IngressoDaAtração VALUES(1,"MI",4);
INSERT INTO IngressoDaAtração VALUES(2,"FI",5);
INSERT INTO IngressoDaAtração VALUES(2,"FI",6);
INSERT INTO IngressoDaAtração VALUES(2,"MM",7);
INSERT INTO IngressoDaAtração VALUES(2,"MI",8);
INSERT INTO IngressoDaAtração VALUES(3,"MM",9);
INSERT INTO IngressoDaAtração VALUES(3,"FI",10);
INSERT INTO IngressoDaAtração VALUES(3,"MM",11);
INSERT INTO IngressoDaAtração VALUES(3,"MM",12);

INSERT INTO TelefoneCliente VALUES("987654321","11998877556");
INSERT INTO TelefoneCliente VALUES("987654321","11999888777");
INSERT INTO TelefoneCliente VALUES("987823412","11666677123");
INSERT INTO TelefoneCliente VALUES("872367182","11983123456");
INSERT INTO TelefoneCliente VALUES("123456789","11830800237");
INSERT INTO TelefoneCliente VALUES("548763458","11322440000");

INSERT INTO CPFRG VALUES("987654321","17036824409");
INSERT INTO CPFRG VALUES("987823412","53595607708");
INSERT INTO CPFRG VALUES("872367182","51497472709");
INSERT INTO CPFRG VALUES("123456789","10810431211");
INSERT INTO CPFRG VALUES("548763458","83415531201");

INSERT INTO Endereco VALUES(1,15,"02038030","Sobrado");
INSERT INTO Endereco VALUES(2,5000,"09015190","Casa");
INSERT INTO Endereco VALUES(3,2323,"09770420","Casa");
INSERT INTO Endereco VALUES(4,666,"02038030","APTO 1278");
INSERT INTO Endereco VALUES(5,333,"09015190","APTO 2278");

INSERT INTO EnderecoCliente VALUES("987654321",1);
INSERT INTO EnderecoCliente VALUES("987823412",2);
INSERT INTO EnderecoCliente VALUES("872367182",3);
INSERT INTO EnderecoCliente VALUES("123456789",4);
INSERT INTO EnderecoCliente VALUES("548763458",5);

INSERT INTO CompraPagamento VALUES(1,0);
INSERT INTO CompraPagamento VALUES(2,1);
INSERT INTO CompraPagamento VALUES(3,0);
INSERT INTO CompraPagamento VALUES(4,1);
INSERT INTO CompraPagamento VALUES(5,0);
INSERT INTO CompraPagamento VALUES(6,1);
INSERT INTO CompraPagamento VALUES(7,0);

INSERT INTO Pagamento VALUES(1,10.0,0.0,100.0);
INSERT INTO Pagamento VALUES(2,18.0,19.0,120.0);
INSERT INTO Pagamento VALUES(3,19.0,0.0,130.0);
INSERT INTO Pagamento VALUES(3,27.0,0.0,150.0);
INSERT INTO Pagamento VALUES(4,0.0,50.0,160.0);
INSERT INTO Pagamento VALUES(5,0.0,25.0,180.0);
INSERT INTO Pagamento VALUES(6,0.0,10.0,190.0);

INSERT INTO CartaoPagamento VALUES(1,"1234",TO_DATE('18/12/15', 'DD/MM/RR'),"MASTERCARD MAESTRO");
INSERT INTO CartaoPagamento VALUES(3,"4321",TO_DATE('19/12/15', 'DD/MM/RR'),"VISA CREDITO");
INSERT INTO CartaoPagamento VALUES(4,"5678",TO_DATE('20/12/15', 'DD/MM/RR'),"AMERICAN EXPRESS");
INSERT INTO CartaoPagamento VALUES(6,"8765",TO_DATE('21/12/15', 'DD/MM/RR'),"SAFRA CREDITO");

INSERT INTO Boleto(2,TO_DATE('22/12/15', 'DD/MM/RR'));
INSERT INTO Boleto(5,TO_DATE('23/12/15', 'DD/MM/RR'));
INSERT INTO Boleto(7,TO_DATE('25/12/15', 'DD/MM/RR'));

INSERT INTO Equipe("CAASO TEAM");
INSERT INTO Equipe("FEDERAL TEAM");

INSERT INTO Modalidade VALUES("Futebol","A");
INSERT INTO Modalidade VALUES("League of Legends","A");
INSERT INTO Modalidade VALUES("Beer Pong","B");
INSERT INTO Modalidade VALUES("Golf","B");

INSERT INTO TorneioA("Futebol",2);
INSERT INTO TorneioA("Futebol",3);
INSERT INTO TorneioA("League of Legends",1);
INSERT INTO TorneioA("League of Legends",3);

INSERT INTO Fase VALUES("Futebol",1,1);
INSERT INTO Fase VALUES("League of Legends",2,1);
INSERT INTO Fase VALUES("Futebol",3,2);
INSERT INTO Fase VALUES("League of Legends",3,2);
INSERT INTO Fase VALUES("Beer Pong",3,1);
INSERT INTO Fase VALUES("Golf",3,1);

Grupo(Modalidade, Evento, Numero, Nome)
INSERT INTO Grupo VALUES("Futebol",1,1,"Futebol Eliminatórias");
INSERT INTO Grupo VALUES("Futebol",3,2,"Futebol Final");
INSERT INTO Grupo VALUES("League of Legends",2,1,"LOL Eliminatórias");
INSERT INTO Grupo VALUES("League of Legends",3,2,"LOL Final");

Jogo(Equipe1, Equipe2, Data,Placar, Resumo*, LocalRealizacao, Modalidade,Evento,Fase,Grupo)
INSERT INTO Jogo VALUES ("CAASO TEAM","FEDERAL TEAM",TO_DATE('12/12/15','DD/MM/RR'),"01X01","Jogo acirrado","325-02038030-G. Infor Softwares","Futebol",1,1,"Futebol Eliminatórias");
INSERT INTO Jogo VALUES ("CAASO TEAM","FEDERAL TEAM",TO_DATE('12/12/15','DD/MM/RR'),"02X01","Vitoria CAASO","325-02038030-G. Infor Softwares","Futebol",1,1,"Futebol Eliminatórias");
INSERT INTO Jogo VALUES ("FEDERAL TEAM","CAASO TEAM",TO_DATE('12/12/15','DD/MM/RR'),"04X03","Vitoria FEDERAL","325-02038030-G. Infor Softwares","Futebol",1,1,"Futebol Eliminatórias");
INSERT INTO Jogo VALUES ("FEDERAL TEAM","CAASO TEAM",TO_DATE('12/12/15','DD/MM/RR'),"02X05","Vitoria CAASO","325-02038030-G. Infor Softwares","Futebol",1,1,"Futebol Eliminatórias");
INSERT INTO Jogo VALUES ("CAASO TEAM","FEDERAL TEAM",TO_DATE('20/12/15','DD/MM/RR'),"02X00","Vitoria CAASO","131-09770420-Microcamp","Futebol",3,2,"Futebol Final");
INSERT INTO Jogo VALUES ("FEDERAL TEAM","CAASO TEAM",TO_DATE('20/12/15','DD/MM/RR'),"00X02","Vitoria FEDERAL","131-09770420-Microcamp","Futebol",3,2,"Futebol Final");

INSERT INTO Jogo VALUES ("CAASO TEAM","FEDERAL TEAM",TO_DATE('13/12/15','DD/MM/RR'),"01X00","Vitoria CAASO","412-09015190-Microcamp","League of Legends",2,1,"LOL Eliminatórias");
INSERT INTO Jogo VALUES ("CAASO TEAM","FEDERAL TEAM",TO_DATE('13/12/15','DD/MM/RR'),"01X00","Vitoria CAASO","412-09015190-Microcamp","League of Legends",2,1,"LOL Eliminatórias");
INSERT INTO Jogo VALUES ("FEDERAL TEAM","CAASO TEAM",TO_DATE('13/12/15','DD/MM/RR'),"00X01","Vitoria CAASO","412-09015190-Microcamp","League of Legends",2,1,"LOL Eliminatórias");
INSERT INTO Jogo VALUES ("FEDERAL TEAM","CAASO TEAM",TO_DATE('13/12/15','DD/MM/RR'),"01X00","Vitoria FEDERAL","412-09015190-Microcamp","League of Legends",2,1,"LOL Eliminatórias");
INSERT INTO Jogo VALUES ("CAASO TEAM","FEDERAL TEAM",TO_DATE('20/12/15','DD/MM/RR'),"01X00","Vitoria CAASO","131-09770420-Microcamp","League of Legends",3,2,"LOL Final");
INSERT INTO Jogo VALUES ("FEDERAL TEAM","CAASO TEAM",TO_DATE('20/12/15','DD/MM/RR'),"00X01","Vitoria FEDERAL","131-09770420-Microcamp","League of Legends",3,2,"LOL Final");

Representa ( Equipe , Modalidade , Evento , Universidade )



TorneioB(Modalidade, Evento)

Disputa(Modalidade, Evento, Etapa, Data, NomeLocal)

Compete(Atleta, Modalidade, Evento, Etapa, Colocação, Tempo, Classificado)

CategoriaPessoa(RG, Categoria)

Atleta(RG, Altura, Peso, Equipe*)

Universidade (Nome, Atlética, Cidade, Estado)

EquipeUniversidade(Equipe, NomeUniversidade)

Universidade (Nome, Atlética, Cidade, Estado)

Atlética(Nome, Logotipo*, Grito)

ParticipaçãoUniversidade(Universidade, Evento, MOuro, MPrata, MBronze)

Participa(Equipe, GrupoMod, GrupoEve, GrupoFas, GrupoNom, Pontuação, 1ºLugar, 2ºLugar)
