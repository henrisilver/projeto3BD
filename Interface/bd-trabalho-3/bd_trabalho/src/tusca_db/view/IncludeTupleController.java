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
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import tusca_db.model.Evento;
import tusca_db.model.Local;
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
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author root
 */
public class IncludeTupleController implements Initializable {

    @FXML
    private Label informativeLabel;
    @FXML
    private TextField textField1;
    @FXML
    private TextArea textArea2;
    @FXML
    private TextField textField3;
    @FXML
    private TextField textField4;
    @FXML
    private TextField textField5;
    @FXML
    private TableColumn<Local,String> columnIdLocal;
    @FXML
    private TableColumn<Evento,String> columnIdEvento;
    @FXML
    private TableView<Local> localFKTableView;
    @FXML
    private TableView<Evento> eventoFKTableView;

    private final ObservableList<Evento> eventos = FXCollections.observableArrayList();
    private final ObservableList<Local> locais = FXCollections.observableArrayList();

    /**
     * Initializes the controller class.
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
        setForeignKeysTables();
        inflateTable();

        localFKTableView.setRowFactory((TableView<Local> localFKTablewView) -> {
            final TableRow<Local> row = new TableRow<>();
            row.addEventFilter(MouseEvent.MOUSE_PRESSED, (MouseEvent event) -> {
                final int index = row.getIndex();
                if (index >= 0 && index < localFKTablewView.getItems().size()) {
                    localFKTableView.getSelectionModel().select(index);
                    textField4.setDisable(false);
                    textField4.setText(localFKTableView.getItems().get(index)
                            .getDenominacao());
                    event.consume();
                }
            });
            return row;
        });

        eventoFKTableView.setRowFactory((TableView<Evento> eventoFKTablewView) -> {
            final TableRow<Evento> row = new TableRow<>();
            row.addEventFilter(MouseEvent.MOUSE_PRESSED, (MouseEvent event) -> {
                final int index = row.getIndex();
                if (index >= 0 && index < eventoFKTablewView.getItems().size()) {
                    eventoFKTableView.getSelectionModel().select(index);
                    textField5.setDisable(false);
                    textField5.setText(eventoFKTableView.getItems().get(index)
                            .getIdEvento());
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

    @FXML
    public void onRegisterButtonClicked(MouseEvent event) throws IOException{
            informativeLabel.setText((String)textField1.getText()
                +textArea2.getText()+
                textField3.getText()+textField4.getText()+textField5.getText());
    }

    private void setForeignKeysTables(){
        localFKTableView.setItems(locais);
        eventoFKTableView.setItems(eventos);

        columnIdLocal.setCellValueFactory(cellData -> cellData.getValue().getDenominacaoProperty());
        columnIdEvento.setCellValueFactory(cellData -> cellData.getValue().getIdEventoProperty());
    }

    private void inflateTable() {
        /* Substituir com os dados das consultas! */
        eventos.add(new Evento("ID1","Peperoni","Tchuca","Ronald"));
        eventos.add(new Evento("ID2","Peperoni","Tchuca","Ronald"));
        eventos.add(new Evento("ID3","Peperoni","Tchuca","Ronald"));
        eventos.add(new Evento("ID4","Peperoni","Tchuca","Ronald"));

        locais.add(new Local("ID1","Peperoni","Tchuca","Ronald"));
        locais.add(new Local("ID2","Peperoni","Tchuca","Ronald"));
        locais.add(new Local("ID3","Peperoni","Tchuca","Ronald"));
        locais.add(new Local("ID4","Peperoni","Tchuca","Ronald"));
    }
}
