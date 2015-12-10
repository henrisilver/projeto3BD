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

package tusca_db;

import java.util.Locale;
import java.util.ResourceBundle;
import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Scene;
import javafx.scene.layout.AnchorPane;
import javafx.stage.Stage;

/**
 *
 * @author root
 */
public class Tusca_db extends Application {
    public static ResourceBundle BUNDLE = ResourceBundle.getBundle("tusca_db.bundle", Locale.forLanguageTag("pt"));;
    private Stage primaryStage;
    
    @Override
    public void start(Stage stage) throws Exception {
        this.primaryStage = stage;
        this.primaryStage.setTitle("Tusca Simulator");
        this.primaryStage.setOnCloseRequest(e -> {
            e.consume();
            closeProgram();
        });
        this.primaryStage.setMinHeight(600);
        this.primaryStage.setMinWidth(800);
        this.primaryStage.setMaxHeight(600);
        this.primaryStage.setMaxWidth(800);
        this.primaryStage.setResizable(false);
        
        AnchorPane root = FXMLLoader.load(getClass().getResource("view/OptionsMenu.fxml"),Tusca_db.BUNDLE);
        root.setId("AnchorPane");

        Scene scene = new Scene(root);
        stage.setScene(scene);
        stage.show();
    }

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        launch(args);
    }

    private void closeProgram() {
        this.primaryStage.close();
    }
}
