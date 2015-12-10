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
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author root
 */
public class IncludeTupleController implements Initializable {

    
    @FXML
    private Button registerButton;
    @FXML
    private Label informativeLabel;
    @FXML
    private TextField textField1;
    @FXML
    private TextField textField2;
    @FXML
    private TextField textField3;
    @FXML
    private TextField textField4;
    @FXML
    private TextField textField5;
    @FXML
    private TextField textField6;
    @FXML
    private TextField textField7;
    /**
     * Initializes the controller class.
     * @param url
     * @param rb
     */
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        // TODO
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
                +textField2.getText()+
                textField3.getText()+textField4.getText()+textField5.getText()+
                textField6.getText()+textField7.getText());
    }
}
