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
public class Evento {
    private final StringProperty idEvento;
    private final StringProperty nome;
    private final StringProperty descricao;
    private final StringProperty logotipo;

    public Evento(String idEvento, String nome, String descricao,
        String logotipo) {
        this.idEvento = new SimpleStringProperty(idEvento);
        this.nome = new SimpleStringProperty(nome);
        this.descricao = new SimpleStringProperty(descricao);
        this.logotipo = new SimpleStringProperty(logotipo);
    }

    public StringProperty getIdEventoProperty() {
        return idEvento;
    }

    public StringProperty getNomeProperty() {
        return nome;
    }

    public StringProperty getDescricaoProperty() {
        return descricao;
    }

    public StringProperty getLogotipoProperty() {
        return logotipo;
    }

    public String getIdEvento() {
        return idEvento.get();
    }

    public String getNome() {
        return nome.get();
    }

    public String getDescricao() {
        return descricao.get();
    }

    public String getLogotipo() {
        return logotipo.get();
    }

    public void setIdEvento(String idEvento) {
        this.idEvento.set(idEvento);
    }

    public void setNome(String nome) {
        this.nome.set(nome);
    }

    public void setDescricao(String descricao) {
        this.descricao.set(descricao);
    }

    public void setLogotipo(String logotipo) {
        this.logotipo.set(logotipo);
    }
}
