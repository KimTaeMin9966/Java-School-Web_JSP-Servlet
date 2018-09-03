package com.KimTaeMin.phone;

import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

public class PhoneController implements Initializable {
	@FXML Button In;
	@FXML Button Edit;
	@FXML Button Commit;
	@FXML TextField name;
	@FXML TextField pn;
	public static PreparedStatement pstmt;
	public static Connection dbConn;
	public static ResultSet rs;
	
	@Override
	public void initialize(URL location, ResourceBundle resources) {
		getConnection();
		In.setOnAction(event -> handleBtnIn(event));
		Edit.setOnAction(event -> handleBtnEdit(event));
		Commit.setOnAction(event -> handleBtnCommit(event));
	}
	
	public Connection getConnection() {
		String user = "root";
		String pw = "admin";
		String url = "jdbc:mariadb://localhost:3306/membersphonenumber?useSSL=false";
		
		try {
			Class.forName("org.mariadb.jdbc.Driver");
			dbConn = DriverManager.getConnection(url, user, pw);
			System.out.println("Database에 연결 되었습니다.");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 찾을 수 없습니다.");
			e.printStackTrace();
		} catch (SQLException e) {
			System.out.println("계정 정보 접속 실패");
			e.printStackTrace();
		}
		return dbConn;
	}

	private void handleBtnIn(ActionEvent event) {
		if(!buttonDBClick()) {
			String insert = "INSERT INTO highschool (member_name, member_pn) VALUES(?, ?)";
			try {
				pstmt = dbConn.prepareStatement(insert);
				pstmt.setString(1, name.getText());
				pstmt.setString(2, pn.getText());
				pstmt.executeUpdate();
			}
			catch (SQLException e) { e.printStackTrace(); }
		} else {
			System.out.println("해당 이름에 데이터가 이미 존재 합니다");
		}
	}

	private void handleBtnEdit(ActionEvent event) {
		if(buttonDBClick()) {
			String update = "UPDATE highschool SET member_pn = ? WHERE member_name = ?";
			try {
				pstmt = dbConn.prepareStatement(update);
				pstmt.setString(1, pn.getText());
				pstmt.setString(2, name.getText());
				pstmt.executeUpdate();
			}
			catch (SQLException e) { e.printStackTrace(); }
		} else {
			System.out.println("해당 이름에 데이터가 존재 하지 않습니다");
		}
	}

	private void handleBtnCommit(ActionEvent event) {
		String select = "SELECT * FROM highschool WHERE member_name = ?";
		try {
			pstmt = dbConn.prepareStatement(select);
			pstmt.setString(1, name.getText());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				System.out.println("이름 : " + rs.getString("member_name"));
				System.out.println("전화번호 : " + rs.getString("member_pn"));
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
	}

	private boolean buttonDBClick() {
		boolean date = false;
		String DBname = name.getText();
		String DBClick = "SELECT * FROM highschool WHERE member_name = ?";
		try {
			pstmt = dbConn.prepareStatement(DBClick);
			pstmt.setString(1, name.getText());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				if(DBname.equals(rs.getString("member_name"))) { date = true; }
			}
		}
		catch (SQLException e) { e.printStackTrace(); }
		return date;
	}

}
