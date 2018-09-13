package util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class JdbcUtil {
	public static Connection getConnection() {
		Connection conn = null;
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}
		catch (NamingException e) { e.printStackTrace(); }
		catch (SQLException e) { e.printStackTrace(); }
		return conn;
	}
	
	public static void close(Connection conn) {
		try { if(conn != null) { conn.close(); } }
		catch (SQLException e) { e.printStackTrace(); }
	}

	public static void commit(Connection conn) {
		try { conn.commit(); }
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	public static void rollback(Connection conn) {
		try { conn.rollback(); }
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	public static void close(PreparedStatement pstmt) {
		try { if(pstmt != null) { pstmt.close(); } }
		catch (SQLException e) { e.printStackTrace(); }
	}
	
	public static void close(ResultSet rs) {
		try { if(rs != null) { rs.close(); } }
		catch (SQLException e) { e.printStackTrace(); }
	}
	
}
