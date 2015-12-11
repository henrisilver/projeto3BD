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
public class Local {
    private final StringProperty denominacao;
    private final StringProperty numero;
    private final StringProperty cep;
    private final StringProperty complemento;

    public Local(String denominacao, String numero, String cep,
        String complemento) {
        this.denominacao = new SimpleStringProperty(denominacao);
        this.numero = new SimpleStringProperty(numero);
        this.cep = new SimpleStringProperty(cep);
        this.complemento = new SimpleStringProperty(complemento);
    }

    public Local(String denominacao, String numero, String cep) {
        this.denominacao = new SimpleStringProperty(denominacao);
        this.numero = new SimpleStringProperty(numero);
        this.cep = new SimpleStringProperty(cep);
        this.complemento = new SimpleStringProperty("null");
    }

    public StringProperty getDenominacaoProperty() {
        return denominacao;
    }

    public StringProperty getNumeroProperty() {
        return numero;
    }

    public StringProperty getCepProperty() {
        return cep;
    }

    public StringProperty getComplementoProperty() {
        return complemento;
    }

    public String getDenominacao() {
        return denominacao.get();
    }

    public String getNumero() {
        return numero.get();
    }

    public String getCep() {
        return cep.get();
    }

    public String getComplemento() {
        return complemento.get();
    }

    public void setDenominacao(String denominacao) {
        this.denominacao.set(denominacao);
    }

    public void setNumero(String numero) {
        this.numero.set(numero);
    }

    public void setCep(String cep) {
        this.cep.set(cep);
    }

    public void setComplemento(String complemento) {
        this.complemento.set(complemento);
    }
}