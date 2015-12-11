/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
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

    public Atracao(String idAtracao, String descricao,String classificacaoEtaria,
        String local,String evento) {
        this.idAtracao = new SimpleStringProperty(idAtracao);
        this.descricao = new SimpleStringProperty(descricao);
        this.classificacaoEtaria = new SimpleStringProperty(classificacaoEtaria);
        this.local = new SimpleStringProperty(local);
        this.evento = new SimpleStringProperty(evento);
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
}