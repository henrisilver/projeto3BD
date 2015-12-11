/* SSC___ - Databases
 * Institute of Mathematical and Computer Sciences
 * School of Engineering of Sao Carlos
 * University of Sao Paulo
 * Project 3 - _______________
 * 11/12/2015
 ***************************************************************
 * Authors
 * Adriano Belfort de Sousa 			#- No. USP 7
 * Guilherme Caixeta de Oliveira		#- No. USP 7
 * Henrique de Almeida Machado da Silveira 	#- No. USP 7961089
 * Marcello de Paula Ferreira Costa 		#- No. USP 7960690
 ***************************************************************
 */

package tusca_db.view;

import java.io.IOException;
import java.net.URL;
import java.util.ResourceBundle;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;
import tusca_db.model.Atracao;

/**
 * FXML Controller class
 *
 * @author root
 */
public class RemoveTupleController implements Initializable {

    @FXML
    private TableColumn<Atracao,String> columnIdAtracao;
    @FXML
    private TableColumn<Atracao,String> columnIdDescricao;
    @FXML
    private TableColumn<Atracao,String> columnIdClassificacaoEtaria;
    @FXML
    private TableColumn<Atracao,String> columnIdLocal;
    @FXML
    private TableColumn<Atracao,String> columnIdEvento;
    @FXML
    private TableView<Atracao> atracaoTableView;

    private final ObservableList<Atracao> atracoes = FXCollections.observableArrayList();
    /**
     * Initializes the controller class.
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        setupTable();
        inflateTable();

        atracaoTableView.setRowFactory((TableView<Atracao> atracaoTablewView) -> {
            final TableRow<Atracao> row = new TableRow<>();
            row.addEventFilter(MouseEvent.MOUSE_PRESSED, (MouseEvent event) -> {
                final int index = row.getIndex();
                if (index >= 0 && index < atracaoTablewView.getItems().size()) {
                    atracaoTableView.getSelectionModel().select(index);
                    atracoes.remove(index);
                    event.consume();
                }
            });
            return row;
        });
    }

    @FXML
    public void onBackButtonClicked(MouseEvent event) throws IOException {
        Scene currentScene = ((Node) event.getSource()).getScene();
        Stage currentStage = (Stage) currentScene.getWindow();
        FXMLLoader loader = new FXMLLoader(getClass().getResource("OptionsMenu.fxml"),tusca_db.Tusca_db.BUNDLE);
        Parent root = (Parent) loader.load();
        Scene scene = new Scene(root,currentStage.getScene().getWidth(),currentStage.getScene().getHeight());
        currentStage.setScene(scene);
    }

    private void setupTable(){
        atracaoTableView.setItems(atracoes);

        columnIdAtracao.setCellValueFactory(cellData -> cellData.getValue().getIdAtracaoProperty());
        columnIdDescricao.setCellValueFactory(cellData -> cellData.getValue().getDescricaoProperty());
        columnIdClassificacaoEtaria.setCellValueFactory(cellData -> cellData.getValue().getClassificacaoEtariaProperty());
        columnIdLocal.setCellValueFactory(cellData -> cellData.getValue().getLocalProperty());
        columnIdEvento.setCellValueFactory(cellData -> cellData.getValue().getEventoProperty());
    }

    private void inflateTable(){
    }
}
