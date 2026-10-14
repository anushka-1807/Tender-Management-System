package com.hit.utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ResourceBundle;

public class DBUtil {
	private static Connection conn = null;
	
	public DBUtil(){
		
	}

	/**
	 * Provides a MySQL connection.
	 *
	 * Priority order for credentials:
	 *  1. Environment variables (set by Railway at runtime):
	 *       MYSQL_HOST, MYSQL_PORT, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD
	 *  2. dbdetails.properties (used for local development)
	 */
	public static Connection provideConnection(){

		// --- 1. Try environment variables (Railway injects these) ---
		String mysqlHost     = System.getenv("MYSQLHOST");
		String mysqlPort     = System.getenv("MYSQLPORT");
		String mysqlDatabase = System.getenv("MYSQLDATABASE");
		String mysqlUser     = System.getenv("MYSQLUSER");
		String mysqlPassword = System.getenv("MYSQLPASSWORD");

		String cs, username, password, dbDriver;

		if (mysqlHost != null && !mysqlHost.isEmpty()) {
			// Build JDBC URL from Railway environment variables
			if (mysqlPort == null || mysqlPort.isEmpty()) mysqlPort = "3306";
			if (mysqlDatabase == null || mysqlDatabase.isEmpty()) mysqlDatabase = "tender";
			cs       = "jdbc:mysql://" + mysqlHost + ":" + mysqlPort + "/" + mysqlDatabase
					 + "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";
			username = mysqlUser;
			password = mysqlPassword;
			dbDriver = "com.mysql.cj.jdbc.Driver";
		} else {
			// --- 2. Fallback: read from dbdetails.properties ---
			ResourceBundle rb = ResourceBundle.getBundle("dbdetails");
			cs       = rb.getString("connectionString");
			username = rb.getString("username");
			password = rb.getString("password");
			dbDriver = rb.getString("driverName");
		}

		try {
			if (conn == null || conn.isClosed()) {
				try {
					Class.forName(dbDriver);
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
				conn = DriverManager.getConnection(cs, username, password);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return conn;
	}
	
	public static void closeConnection(PreparedStatement ps){
		try {
			if(ps != null)
				ps.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void closeConnection(ResultSet rs){
		try {
			if(rs != null)
				rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public static void closeConnection(Connection con){
		try {
			if(con != null)
				con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
}
