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

package tusca_db.view;

import java.io.IOException;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import tusca_db.model.Evento;
import tusca_db.model.Local;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ResourceBundle;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
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
    private TextField textField6;
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
        textField1.setText(Integer.toString((int)(Math.round(Math.random()*9999))));
        try {
            inflateTable();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(IncludeTupleController.class.getName()).log(Level.SEVERE, null, ex);
        }

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
        PreparedStatement statement;
        ResultSet result;
        Connection connection;
        
        String insertStatement = "INSERT INTO ATRACAO VALUES("
                +textField1.getText()+",\'"
                +textArea2.getText()+"\',"
                +textField3.getText()+",\'"
                +textField4.getText()+"\',"
                +textField5.getText()+","
                + "TO_DATE(\'"
                +textField6.getText()
                +"\',\'DD/MM/YYYY\'))";
        System.out.println(insertStatement);
        informativeLabel.setText(insertStatement);
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@grad.icmc.usp.br:15215:orcl",
                    "7960690",
                    "a");
            System.out.println(insertStatement);
            statement = connection.prepareStatement(insertStatement);
            statement.executeUpdate();
        
            statement.close();
            connection.close();
            informativeLabel.setText("Atracao Registrada!");
        } catch(SQLException | ClassNotFoundException ex) {
            Logger.getLogger(IncludeTupleController.class.getName()).log(Level.SEVERE, null, ex);
            informativeLabel.setText("Falha ao registrar atracao!");
        }
    }

    private void setForeignKeysTables(){
        localFKTableView.setItems(locais);
        eventoFKTableView.setItems(eventos);

        columnIdLocal.setCellValueFactory(cellData -> cellData.getValue().getDenominacaoProperty());
        columnIdEvento.setCellValueFactory(cellData -> cellData.getValue().getIdEventoProperty());
    }

    private void inflateTable() throws ClassNotFoundException {
        Statement statement;
        ResultSet result;
        Connection connection;
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@grad.icmc.usp.br:15215:orcl",
                    "7960690",
                    "a");
            
            statement = connection.createStatement();
            result = statement.executeQuery("select * from local");
            while (result.next()){
                locais.add(new Local(result.getString("DENOMINACAO"),
                result.getString("NUMERO"),
                result.getString("CEP"),
                result.getString("COMPLEMENTO")));
            }
        
        statement.close();
        connection.close();
        } catch(SQLException ex) {
            Logger.getLogger(IncludeTupleController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection(
                    "jdbc:oracle:thin:@grad.icmc.usp.br:15215:orcl",
                    "7960690",
                    "a");
            statement = connection.createStatement();
            result = statement.executeQuery("select * from evento");
            while (result.next()){
                eventos.add(new Evento(result.getString("IDEVENTO"),
                result.getString("NOME"),
                result.getString("DESCRICAO"),
                result.getString("LOGOTIPO")));
            }
        
            statement.close();
            connection.close();
        } catch(SQLException ex) {
            Logger.getLogger(IncludeTupleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
