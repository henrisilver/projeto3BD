CREATE TABLE Pagamento(
      Compra,
      Acréscimos*,
      Descontos*,
      ValorEfetivo
);

CREATE TABLE CartaoPagamento(
      Compra,
      QuatroÚltimosDigitos,
      DataVencimento,
      Bandeira
);

CREATE TABLE Boleto(
      Compra,
      DataVencimento
);

CREATE TABLE Equipe(
      Nome
);

CREATE TABLE Jogo(
      Equipe1,
      Equipe2,
      Data,
      Horário,
      Placar,
      Resumo*,
      LocalRealizacao,
      Modalidade,
      Evento,
      Fase,
      Grupo
);

CREATE TABLE Evento(
      IDEvento,
      Nome,
      Descrição*,
      Logotipo*
);

CREATE TABLE Representa(
      Equipe,
      Modalidade,
      Evento,
      Universidade
);

CREATE TABLE TorneioA(
      Modalidade,
      Evento
);

CREATE TABLE Modalidade(
      Nome,
      Categoria
);

CREATE TABLE TorneioB(
      Modalidade,
      Evento
);

CREATE TABLE Disputa(
      Modalidade,
      Evento,
      Etapa,
      Data,
      Horário,
      NomeLocal
);

CREATE TABLE Compete(
      Atleta,
      Modalidade,
      Evento,
      Etapa,
      Colocação,
      Tempo,
      Classificado
);

CREATE TABLE Pessoa(
      RG,
      Nome,
      Sexo,
      DataNascimento
);

CREATE TABLE CategoriaPessoa(
      RG,
      Categoria
);

CREATE TABLE Atleta(
      RG,
      Altura,
      Peso,
      Equipe*
);

CREATE TABLE EquipeUniversidade(
      Equipe,
      NomeUniversidade
);

CREATE TABLE Universidade(
      Nome,
      Atlética,
      Cidade,
      Estado
);

CREATE TABLE Atlética(
      Nome,
      Logotipo*,
      Grito
);

CREATE TABLE ParticipaçãoUniversidade(
      Universidade,
      Evento,
      MOuro,
      MPrata,
      MBronze
);

CREATE TABLE Fase(
      Modalidade,
      Evento,
      Número
);

CREATE TABLE Grupo(
      Modalidade,
      Evento,
      Fase,
      Nome
);

CREATE TABLE Participa(
      Equipe,
      GrupoMod,
      GrupoEve,
      GrupoFas,
      GrupoNom,
      Pontuação,
      1Lugar,
      2Lugar
);