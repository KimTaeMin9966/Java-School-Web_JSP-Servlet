package com.KimTaeMin.phone;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class NumberAdd extends Application {

	@Override
	public void stop() throws Exception {
		PhoneController.rs.close();
		PhoneController.pstmt.close();
		PhoneController.dbConn.close();
	}

	@Override
	public void start(Stage primaryStage) throws Exception {
		Parent parent = FXMLLoader.load(getClass().getResource("Phone.fxml"));
		Scene scene = new Scene(parent);
		
		primaryStage.setScene(scene);
		primaryStage.show();
	}

	public static void main(String[] args) {
		launch(args);
	}
}
