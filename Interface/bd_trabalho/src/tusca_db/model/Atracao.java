/* SSC640 - Databases
 * Institute of Mathematical and Computer Sciences
 * School of Engineering of Sao Carlos
 * University of Sao Paulo
 * Project 3 - Implementing a database in Oracle SQL
 * 11/12/2015
 ***************************************************************
 * Authors
 * Adriano Belfort de Sousa 			#- No. USP 7960706
 * Guilherme Caixeta de Oliveira		#- No. USP 8504368
 * Henrique de Almeida Machado da Silveira 	#- No. USP 7961089
 * Marcello de Paula Ferreira Costa 		#- No. USP 7960690
 ***************************************************************
 */
package tusca_db.model;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author root
 */
public class Atracao {
    private final StringProperty idAtracao;
    private final StringProperty descricao;
    private final StringProperty classificacaoEtaria;
    private final StringProperty local;
    private final StringProperty evento;
    private final StringProperty data;

    public Atracao(String idAtracao, String descricao,String classificacaoEtaria,
        String local,String evento,String data) {
        this.idAtracao = new SimpleStringProperty(idAtracao);
        this.descricao = new SimpleStringProperty(descricao);
        this.classificacaoEtaria = new SimpleStringProperty(classificacaoEtaria);
        this.local = new SimpleStringProperty(local);
        this.evento = new SimpleStringProperty(evento);
        this.data = new SimpleStringProperty(data);
    }

    public StringProperty getIdAtracaoProperty() {
        return idAtracao;
    }

    public StringProperty getDescricaoProperty() {
        return descricao;
    }

    public StringProperty getClassificacaoEtariaProperty() {
        return classificacaoEtaria;
    }

    public StringProperty getLocalProperty() {
        return local;
    }

    public StringProperty getEventoProperty() {
        return evento;
    }
    
    public StringProperty getDataProperty() {
        return data;
    }

    public String getIdAtracao() {
        return idAtracao.get();
    }

    public String getDescricao() {
        return descricao.get();
    }

    public String getClassificacaoEtaria() {
        return classificacaoEtaria.get();
    }

    public String getLocal() {
        return local.get();
    }

    public String getEvento() {
        return evento.get();
    }
    
    public String getData() {
        return data.get();
    }

    public void setIdAtracao(String idAtracao) {
        this.idAtracao.set(idAtracao);
    }

    public void setDescricao(String descricao) {
        this.descricao.set(descricao);
    }

    public void setClassificacaoEtaria(String classificacaoEtaria) {
        this.classificacaoEtaria.set(classificacaoEtaria);
    }

    public void setLocal(String local) {
        this.local.set(local);
    }

    public void setEvento(String evento) {
        this.evento.set(evento);
    }
    
    public void setData(String data) {
        this.data.set(data);
    }
}