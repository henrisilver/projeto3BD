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
import javafx.fxml.FXMLLoader;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.input.MouseEvent;
import javafx.stage.Stage;

/**
 * FXML Controller class
 *
 * @author root
 */
public class AlterTupleController implements Initializable {

    /**
     * Initializes the controller class.
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
}
