INSERT INTO CEP VALUES('02038030','R José Debieux','Santana','São Paulo','SP');
INSERT INTO CEP VALUES('09015190','R General Glicério','Centro','Santo André','SP');
INSERT INTO CEP VALUES('09770420','Av Imperador Pedro II','Nova Petrópolis','São Bernardo do Campo','SP');

INSERT INTO Local VALUES('325-02038030-G. Infor Softwares',325,'02038030','G. Infor Softwares');
INSERT INTO Local VALUES('412-09015190-Microcamp',412,'09015190','Microcamp');
INSERT INTO Local VALUES('131-09770420-Microcamp',131,'09770420','Microcamp');

INSERT INTO Evento(IDEvento,Nome,Descricao) VALUES(1,'Show da Sexta','Show de Rock Muito Legal. Muitos Bêbados!');
INSERT INTO Evento(IDEvento,Nome,Descricao) VALUES(2,'Show do Sábado','Pre-pa-ra para esse showzasso!');
INSERT INTO Evento(IDEvento,Nome,Descricao) VALUES(3,'Final do Tusca','Venha descobrir quem é a grande vencedora!');

INSERT INTO Atracao VALUES(1,'Show de Rock Muito Legal. Muitos Bêbados!',18,'325-02038030-G. Infor Softwares',1,TO_DATE('12/12/2015', 'DD/MM/RRRR'));
INSERT INTO Atracao VALUES(2,'Pre-pa-ra para esse showzasso!',18,'325-02038030-G. Infor Softwares',2,TO_DATE('13/12/2015', 'DD/MM/RRRR'));
INSERT INTO Atracao VALUES(3,'Final do Tusca',18,'325-02038030-G. Infor Softwares',3,TO_DATE('20/12/2015', 'DD/MM/RRRR'));

INSERT INTO CategoriaIngresso VALUES('MI','Masculino Inteira');
INSERT INTO CategoriaIngresso VALUES('MM','Masculino Meia');
INSERT INTO CategoriaIngresso VALUES('FI','Feminino Inteira');

INSERT INTO UtilizadaEm VALUES (1,'MI',60.00,2000);
INSERT INTO UtilizadaEm VALUES (1,'MM',30.00,3000);
INSERT INTO UtilizadaEm VALUES (1,'FI',40.00,9000);
INSERT INTO UtilizadaEm VALUES (2,'MI',90.00,2000);
INSERT INTO UtilizadaEm VALUES (2,'MM',45.00,3000);
INSERT INTO UtilizadaEm VALUES (2,'FI',80.00,9000);
INSERT INTO UtilizadaEm VALUES (3,'MI',40.00,2000);
INSERT INTO UtilizadaEm VALUES (3,'MM',20.00,3000);
INSERT INTO UtilizadaEm VALUES (3,'FI',35.00,9000);

INSERT INTO Pessoa VALUES('548763458','Papai Noel da Silva Salvi',0,TO_DATE('25/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('123456789','Zinedine Zidane',0,TO_DATE('14/08/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('987654321','Professor Xavier',0,TO_DATE('26/11/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('456378123','Sr. Lucas Bueno Sem Ruas',0,TO_DATE('13/01/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('987823412','João Soares de Navarro',0,TO_DATE('01/05/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367181','Pessoa com Nome 1',1,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367122','Pessoa com Nome 2',1,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367183','Pessoa com Nome 3',1,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367184','Pessoa com Nome 4',1,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367185','Pessoa com Nome 5',1,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367186','Pessoa com Nome 6',1,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367187','Pessoa com Nome 7',1,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367188','Pessoa com Nome 8',1,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Pessoa VALUES('872367189','Pessoa com Nome 9',1,TO_DATE('08/12/15', 'DD/MM/RR'));

INSERT INTO Cliente VALUES('548763458','palavra-passe','mailbox@polonorte.pn');
INSERT INTO Cliente VALUES('123456789','palavra-chave','superstar@emailsdafranca.fr');
INSERT INTO Cliente VALUES('987654321','SENHA','professor.xavier@xmen.xxx.men');
INSERT INTO Cliente VALUES('987823412','senha','soares_190@carrasco.edu.br');
INSERT INTO Cliente VALUES('456378123','password','sou_bom_com_hibernate@itelefonica.com.br');

INSERT INTO Compra VALUES(1,'987654321',125.00,0,TO_DATE('08/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(2,'987654321',130.00,1,TO_DATE('09/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(3,'123456789',90.00,0,TO_DATE('10/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(4,'987654321',500.00,1,TO_DATE('11/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(5,'987654321',35.00,1,TO_DATE('12/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(6,'987654321',20.00,0,TO_DATE('13/12/15', 'DD/MM/RR'));
INSERT INTO Compra VALUES(7,'987823412',59.90,1,TO_DATE('15/12/15', 'DD/MM/RR'));

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

INSERT INTO IngressoDaAtracao VALUES(1,'MI',1);
INSERT INTO IngressoDaAtracao VALUES(1,'MI',2);
INSERT INTO IngressoDaAtracao VALUES(1,'MI',3);
INSERT INTO IngressoDaAtracao VALUES(1,'MI',4);
INSERT INTO IngressoDaAtracao VALUES(2,'FI',5);
INSERT INTO IngressoDaAtracao VALUES(2,'FI',6);
INSERT INTO IngressoDaAtracao VALUES(2,'MM',7);
INSERT INTO IngressoDaAtracao VALUES(2,'MI',8);
INSERT INTO IngressoDaAtracao VALUES(3,'MM',9);
INSERT INTO IngressoDaAtracao VALUES(3,'FI',10);
INSERT INTO IngressoDaAtracao VALUES(3,'MM',11);
INSERT INTO IngressoDaAtracao VALUES(3,'MM',12);

INSERT INTO TelefoneCliente VALUES('548763458','11999888777');
INSERT INTO TelefoneCliente VALUES('123456789','11666677123');
INSERT INTO TelefoneCliente VALUES('987654321','11983123456');
INSERT INTO TelefoneCliente VALUES('987823412','11830800237');
INSERT INTO TelefoneCliente VALUES('456378123','11322440000');

INSERT INTO CPFRG VALUES('548763458','17036824409');
INSERT INTO CPFRG VALUES('123456789','53595607708');
INSERT INTO CPFRG VALUES('987654321','51497472709');
INSERT INTO CPFRG VALUES('987823412','10810431211');
INSERT INTO CPFRG VALUES('456378123','83415531201');

INSERT INTO Endereco VALUES(1,15,'02038030','Sobrado');
INSERT INTO Endereco VALUES(2,5000,'09015190','Casa');
INSERT INTO Endereco VALUES(3,2323,'09770420','Casa');
INSERT INTO Endereco VALUES(4,666,'02038030','APTO 1278');
INSERT INTO Endereco VALUES(5,333,'09015190','APTO 2278');

INSERT INTO EnderecoCliente VALUES('548763458',1);
INSERT INTO EnderecoCliente VALUES('123456789',2);
INSERT INTO EnderecoCliente VALUES('987654321',3);
INSERT INTO EnderecoCliente VALUES('987823412',4);
INSERT INTO EnderecoCliente VALUES('456378123',5);

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
INSERT INTO Pagamento VALUES(4,27.0,0.0,150.0);
INSERT INTO Pagamento VALUES(5,0.0,50.0,160.0);
INSERT INTO Pagamento VALUES(6,0.0,25.0,180.0);
INSERT INTO Pagamento VALUES(7,0.0,10.0,190.0);

INSERT INTO CartaoPagamento VALUES(1,'1234',TO_DATE('18/12/2015', 'DD/MM/YYYY'),'MASTERCARD MAESTRO');
INSERT INTO CartaoPagamento VALUES(3,'4321',TO_DATE('19/12/2015', 'DD/MM/YYYY'),'VISA CREDITO');
INSERT INTO CartaoPagamento VALUES(4,'5678',TO_DATE('20/12/2015', 'DD/MM/YYYY'),'AMERICAN EXPRESS');
INSERT INTO CartaoPagamento VALUES(6,'8765',TO_DATE('21/12/2015', 'DD/MM/YYYY'),'SAFRA CREDITO');

INSERT INTO Boleto VALUES(2,TO_DATE('22/12/2015','DD/MM/YYYY'));
INSERT INTO Boleto VALUES(5,TO_DATE('23/12/2015','DD/MM/YYYY'));
INSERT INTO Boleto VALUES(7,TO_DATE('25/12/2015','DD/MM/YYYY'));

INSERT INTO Equipe VALUES('CAASO TEAM');
INSERT INTO Equipe VALUES('FEDERAL TEAM');

INSERT INTO Modalidade VALUES('Futebol','A');
INSERT INTO Modalidade VALUES('League of Legends','A');
INSERT INTO Modalidade VALUES('Beer Pong','B');
INSERT INTO Modalidade VALUES('Golf','B');

INSERT INTO TorneioA VALUES('Futebol',1);
INSERT INTO TorneioA VALUES('Futebol',3);
INSERT INTO TorneioA VALUES('League of Legends',2);
INSERT INTO TorneioA VALUES('League of Legends',3);

INSERT INTO Fase VALUES('Futebol',1,1);
INSERT INTO Fase VALUES('League of Legends',2,1);
INSERT INTO Fase VALUES('Futebol',3,2);
INSERT INTO Fase VALUES('League of Legends',3,2);

INSERT INTO Grupo VALUES('Futebol',1,1,'Futebol Eliminatórias');
INSERT INTO Grupo VALUES('Futebol',3,2,'Futebol Final');
INSERT INTO Grupo VALUES('League of Legends',2,1,'LOL Eliminatórias');
INSERT INTO Grupo VALUES('League of Legends',3,2,'LOL Final');

INSERT INTO Jogo VALUES ('CAASO TEAM','FEDERAL TEAM',TO_DATE('12/12/2015 13:00','DD/MM/YYYY HH24:MI'),'01X01','Jogo acirrado','325-02038030-G. Infor Softwares','Futebol',1,1,'Futebol Eliminatórias');
INSERT INTO Jogo VALUES ('CAASO TEAM','FEDERAL TEAM',TO_DATE('12/12/2015 15:00','DD/MM/YYYY HH24:MI'),'02X01','Vitoria CAASO','325-02038030-G. Infor Softwares','Futebol',1,1,'Futebol Eliminatórias');
INSERT INTO Jogo VALUES ('FEDERAL TEAM','CAASO TEAM',TO_DATE('12/12/2015 17:00','DD/MM/YYYY HH24:MI'),'04X03','Vitoria FEDERAL','325-02038030-G. Infor Softwares','Futebol',1,1,'Futebol Eliminatórias');
INSERT INTO Jogo VALUES ('FEDERAL TEAM','CAASO TEAM',TO_DATE('12/12/2015 19:00','DD/MM/YYYY HH24:MI'),'02X05','Vitoria CAASO','325-02038030-G. Infor Softwares','Futebol',1,1,'Futebol Eliminatórias');
INSERT INTO Jogo VALUES ('CAASO TEAM','FEDERAL TEAM',TO_DATE('20/12/2015 13:00','DD/MM/YYYY HH24:MI'),'02X00','Vitoria CAASO','131-09770420-Microcamp','Futebol',3,2,'Futebol Final');
INSERT INTO Jogo VALUES ('FEDERAL TEAM','CAASO TEAM',TO_DATE('20/12/2015 13:00','DD/MM/YYYY HH24:MI'),'00X02','Vitoria FEDERAL','131-09770420-Microcamp','Futebol',3,2,'Futebol Final');

INSERT INTO Jogo VALUES ('CAASO TEAM','FEDERAL TEAM',TO_DATE('13/12/2015 13:00','DD/MM/YYYY HH24:MI'),'01X00','Vitoria CAASO','412-09015190-Microcamp','League of Legends',2,1,'LOL Eliminatórias');
INSERT INTO Jogo VALUES ('CAASO TEAM','FEDERAL TEAM',TO_DATE('13/12/2015 15:00','DD/MM/YYYY HH24:MI'),'01X00','Vitoria CAASO','412-09015190-Microcamp','League of Legends',2,1,'LOL Eliminatórias');
INSERT INTO Jogo VALUES ('FEDERAL TEAM','CAASO TEAM',TO_DATE('13/12/2015 17:00','DD/MM/YYYY HH24:MI'),'00X01','Vitoria CAASO','412-09015190-Microcamp','League of Legends',2,1,'LOL Eliminatórias');
INSERT INTO Jogo VALUES ('FEDERAL TEAM','CAASO TEAM',TO_DATE('13/12/2015 19:00','DD/MM/YYYY HH24:MI'),'01X00','Vitoria FEDERAL','412-09015190-Microcamp','League of Legends',2,1,'LOL Eliminatórias');
INSERT INTO Jogo VALUES ('CAASO TEAM','FEDERAL TEAM',TO_DATE('20/12/2015 14:00','DD/MM/YYYY HH24:MI'),'01X00','Vitoria CAASO','131-09770420-Microcamp','League of Legends',3,2,'LOL Final');
INSERT INTO Jogo VALUES ('FEDERAL TEAM','CAASO TEAM',TO_DATE('20/12/2015 14:00','DD/MM/YYYY HH24:MI'),'00X01','Vitoria FEDERAL','131-09770420-Microcamp','League of Legends',3,2,'LOL Final');

INSERT INTO Atletica(Nome,Grito) VALUES('GAPERIA','NÓS SOMOS LÁ DE SÃO CARLOS!');
INSERT INTO Atletica(Nome,Grito) VALUES('FRANGUERIA','NÃO SABEMOS CÁLCULO NEM PROGRAMAÇÃO!');

INSERT INTO Universidade VALUES('Universidade de São Paulo - Campus São Carlos','GAPERIA','São Carlos','SP');
INSERT INTO Universidade VALUES('Universidade Federal de São Carlos','FRANGUERIA','São Carlos','SP');

INSERT INTO Representa VALUES('CAASO TEAM','Futebol',1,'Universidade de São Paulo - Campus São Carlos');
INSERT INTO Representa VALUES('CAASO TEAM','Futebol',3,'Universidade de São Paulo - Campus São Carlos');
INSERT INTO Representa VALUES('CAASO TEAM','League of Legends',2,'Universidade de São Paulo - Campus São Carlos');
INSERT INTO Representa VALUES('CAASO TEAM','League of Legends',3,'Universidade de São Paulo - Campus São Carlos');
INSERT INTO Representa VALUES('FEDERAL TEAM','Futebol',1,'Universidade Federal de São Carlos');
INSERT INTO Representa VALUES('FEDERAL TEAM','Futebol',3,'Universidade Federal de São Carlos');
INSERT INTO Representa VALUES('FEDERAL TEAM','League of Legends',2,'Universidade Federal de São Carlos');
INSERT INTO Representa VALUES('FEDERAL TEAM','League of Legends',3,'Universidade Federal de São Carlos');

INSERT INTO TorneioB VALUES('Beer Pong',3);
INSERT INTO TorneioB VALUES('Golf',3);

INSERT INTO Disputa VALUES('Beer Pong',3,1,TO_DATE('20/12/2015 13:00','DD/MM/YYYY HH24:MI'),'131-09770420-Microcamp');
INSERT INTO Disputa VALUES('Golf',3,1,TO_DATE('20/12/2015 13:00','DD/MM/YYYY HH24:MI'),'131-09770420-Microcamp');

INSERT INTO Atleta VALUES('987823412',178,91,'CAASO TEAM');
INSERT INTO Atleta VALUES('872367181',182,72,'CAASO TEAM');
INSERT INTO Atleta VALUES('872367122',180,93,'CAASO TEAM');
INSERT INTO Atleta VALUES('872367183',184,74,'FEDERAL TEAM');
INSERT INTO Atleta VALUES('872367184',200,65,'FEDERAL TEAM');
INSERT INTO Atleta VALUES('872367185',175,66,'FEDERAL TEAM');
INSERT INTO Atleta VALUES('872367186',187,87,'FEDERAL TEAM');
INSERT INTO Atleta VALUES('872367187',172,98,'CAASO TEAM');
INSERT INTO Atleta VALUES('872367188',171,89,'FEDERAL TEAM');
INSERT INTO Atleta VALUES('872367189',179,90,'CAASO TEAM');
INSERT INTO Atleta VALUES('123456789',160,71,'FEDERAL TEAM');
INSERT INTO Atleta VALUES('456378123',195,82,'CAASO TEAM');

INSERT INTO Compete VALUES('987823412','Beer Pong',3,1,1,TO_DATE('20/12/15 00:35','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('872367181','Beer Pong',3,1,2,TO_DATE('20/12/15 00:34','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('872367122','Beer Pong',3,1,3,TO_DATE('20/12/15 00:29','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('872367183','Beer Pong',3,1,4,TO_DATE('20/12/15 00:27','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('872367184','Beer Pong',3,1,5,TO_DATE('20/12/15 00:20','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('872367185','Beer Pong',3,1,6,TO_DATE('20/12/15 00:15','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('872367186','Beer Pong',3,1,7,TO_DATE('20/12/15 00:14','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('872367187','Beer Pong',3,1,8,TO_DATE('20/12/15 00:09','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('872367188','Golf',3,1,4,TO_DATE('20/12/15 06:30','DD/MM/RR HH24:MI'),0);
INSERT INTO Compete VALUES('872367189','Golf',3,1,3,TO_DATE('20/12/15 06:35','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('123456789','Golf',3,1,2,TO_DATE('20/12/15 06:48','DD/MM/RR HH24:MI'),1);
INSERT INTO Compete VALUES('456378123','Golf',3,1,1,TO_DATE('20/12/15 06:44','DD/MM/RR HH24:MI'),0);

INSERT INTO CategoriaPessoa VALUES('987654321',1);
INSERT INTO CategoriaPessoa VALUES('987823412',1);
INSERT INTO CategoriaPessoa VALUES('123456789',1);
INSERT INTO CategoriaPessoa VALUES('548763458',1);
INSERT INTO CategoriaPessoa VALUES('987823412',0);
INSERT INTO CategoriaPessoa VALUES('872367181',0);
INSERT INTO CategoriaPessoa VALUES('872367122',0);
INSERT INTO CategoriaPessoa VALUES('872367183',0);
INSERT INTO CategoriaPessoa VALUES('872367184',0);
INSERT INTO CategoriaPessoa VALUES('872367185',0);
INSERT INTO CategoriaPessoa VALUES('872367186',0);
INSERT INTO CategoriaPessoa VALUES('872367187',0);
INSERT INTO CategoriaPessoa VALUES('872367188',0);
INSERT INTO CategoriaPessoa VALUES('872367189',0);
INSERT INTO CategoriaPessoa VALUES('123456789',0);
INSERT INTO CategoriaPessoa VALUES('456378123',0);

INSERT INTO EquipeUniversidade VALUES('CAASO TEAM','Universidade de São Paulo - Campus São Carlos');
INSERT INTO EquipeUniversidade VALUES('FEDERAL TEAM','Universidade Federal de São Carlos');

INSERT INTO ParticipacaoUniversidade VALUES('Universidade de São Paulo - Campus São Carlos',1,0,0,0);
INSERT INTO ParticipacaoUniversidade VALUES('Universidade de São Paulo - Campus São Carlos',2,0,0,0);
INSERT INTO ParticipacaoUniversidade VALUES('Universidade de São Paulo - Campus São Carlos',3,1,0,0);
INSERT INTO ParticipacaoUniversidade VALUES('Universidade Federal de São Carlos',1,0,0,0);
INSERT INTO ParticipacaoUniversidade VALUES('Universidade Federal de São Carlos',2,0,0,0);
INSERT INTO ParticipacaoUniversidade VALUES('Universidade Federal de São Carlos',3,0,1,0);

INSERT INTO Participa VALUES('CAASO TEAM','Futebol',1,1,'Futebol Eliminatórias',7,1);
INSERT INTO Participa VALUES('CAASO TEAM','Futebol',3,2,'Futebol Final',3,1);
INSERT INTO Participa VALUES('CAASO TEAM','League of Legends',2,1,'LOL Eliminatórias',3,1);
INSERT INTO Participa VALUES('CAASO TEAM','League of Legends',3,2,'LOL Final',1,1);
INSERT INTO Participa VALUES('FEDERAL TEAM','Futebol',1,1,'Futebol Eliminatórias',4,2);
INSERT INTO Participa VALUES('FEDERAL TEAM','Futebol',3,2,'Futebol Final',3,2);
INSERT INTO Participa VALUES('FEDERAL TEAM','League of Legends',2,1,'LOL Eliminatórias',1,2);
INSERT INTO Participa VALUES('FEDERAL TEAM','League of Legends',3,2,'LOL Final',1,2);

COMMIT;