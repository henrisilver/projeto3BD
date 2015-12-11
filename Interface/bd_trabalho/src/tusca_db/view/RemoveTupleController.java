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
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
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
    private TableColumn<Atracao,String> columnIdData;
    @FXML
    private TableView<Atracao> atracaoTableView;

    private final ObservableList<Atracao> atracoes = FXCollections.observableArrayList();
    
    private int currentSelectedRow;
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
                    currentSelectedRow = index;
                    System.out.println(currentSelectedRow);
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
        FXMLLoader loader = new FXMLLoader(getClass().getResource("OptionsMenu.fxml"),
            tusca_db.Tusca_db.BUNDLE);
        Parent root = (Parent) loader.load();
        Scene scene = new Scene(root,currentStage.getScene().getWidth(),
            currentStage.getScene().getHeight());
        currentStage.setScene(scene);
    }

    private void setupTable(){
        atracaoTableView.setItems(atracoes);

        columnIdAtracao.setCellValueFactory(cellData -> cellData.getValue().
                getIdAtracaoProperty());
        columnIdDescricao.setCellValueFactory(cellData -> cellData.getValue().
                getDescricaoProperty());
        columnIdClassificacaoEtaria.setCellValueFactory(cellData -> cellData.getValue().
                getClassificacaoEtariaProperty());
        columnIdLocal.setCellValueFactory(cellData -> cellData.getValue().
                getLocalProperty());
        columnIdEvento.setCellValueFactory(cellData -> cellData.getValue().
                getEventoProperty());
        columnIdData.setCellValueFactory(cellData -> cellData.getValue().
                getDataProperty());
    }
    
    @FXML
    public void onRemoveButtonClicked(MouseEvent event) throws IOException{
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
            result = statement.executeQuery("DELETE FROM ATRACAO WHERE IDATRACAO = "+
                atracoes.get(currentSelectedRow).getIdAtracao());
            statement.close();
            connection.close();
            atracoes.remove(currentSelectedRow);
        } catch(SQLException ex) {
            Logger.getLogger(IncludeTupleController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlterTupleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    } 

    private void inflateTable(){
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
            result = statement.executeQuery("select IDATRACAO,DESCRICAO,"
                    + "CLASSIFICACAOETARIA,LOCAL,EVENTO, TO_CHAR(DATA,"
                    + "'MM/DD/YYYY') as DATA from atracao");
            while (result.next()){
                atracoes.add(new Atracao(
                    result.getString("IDATRACAO"),
                    result.getString("DESCRICAO"),
                    result.getString("CLASSIFICACAOETARIA"),
                    result.getString("LOCAL"),
                    result.getString("EVENTO"),
                    result.getString("DATA")));
            }
        
        statement.close();
        connection.close();
        } catch(SQLException ex) {
            Logger.getLogger(IncludeTupleController.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AlterTupleController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
