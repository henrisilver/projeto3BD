/* SSC640 - Databases
 * Institute of Mathematical and Computer Sciences
 * School of Engineering of Sao Carlos
 * University of Sao Paulo
 * Project 3 - Implementing a database in Oracle SQL
 * 11/12/2015
 ***************************************************************
 * Authors
 * Adriano Belfort de Sousa             #- No. USP 7960706
 * Guilherme Caixeta de Oliveira        #- No. USP 8504368
 * Henrique de Almeida Machado da Silveira  #- No. USP 7961089
 * Marcello de Paula Ferreira Costa         #- No. USP 7960690
 ***************************************************************
 */
package tusca_db.model;

import javafx.beans.property.SimpleStringProperty;
import javafx.beans.property.StringProperty;

/**
 *
 * @author root
 */
public class Relatorio {
    private final StringProperty atleta;
    private final StringProperty numEventos;

    public Atracao(String atleta, String numEventos) {
        this.atleta = new SimpleStringProperty(atleta);
        this.numEventos = new SimpleStringProperty(numEventos);
    }

    public StringProperty getAtletaProperty() {
        return atleta;
    }

    public StringProperty getNumEventosProperty() {
        return numEventos;
    }

    public String getAtleta() {
        return atleta.get();
    }

    public String getDescricao() {
        return numEventos.get();
    }

    public String getAtleta(String numEventos) {
        return atleta.set(atleta);
    }

    public String getDescricao(String numEventos) {
        return numEventos.set(numEventos);
    }
}