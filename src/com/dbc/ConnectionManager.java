package com.dbc;

import java.sql.*;

public class ConnectionManager {

	private static final String DRIVER_CLASS = "com.mysql.cj.jdbc.Driver";
	private static final String DATABASE_URL = "jdbc:mysql://localhost:3306/testmvc?characterEncoding=utf8 & useSSL=false & serverTimezone=UTC & rewriteBatchedStatements=true";
	private static final String DATABASE_USRE = "root";
	private static final String DATABASE_PASSWORD = "gyh123456";

	/** �������� */
	public static Connection getConnection() {
		Connection dbConnection = null;
		try {
			Class.forName(DRIVER_CLASS);
			dbConnection = DriverManager.getConnection(DATABASE_URL, DATABASE_USRE, DATABASE_PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dbConnection;
	}

	/** �ر����� */
	public static void closeConnection(Connection dbConnection) {
		try {
			if (dbConnection != null && (!dbConnection.isClosed())) {
				dbConnection.close();
			}
		} catch (SQLException sqlEx) {
			sqlEx.printStackTrace();
		}

	}

	/** �رս���� */
	public static void closeResultSet(ResultSet res) {
		try {
			if (res != null) {
				res.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	/** �ر���� */
	public static void closeStatement(PreparedStatement pStatement) {
		try {
			if (pStatement != null) {
				pStatement.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public static void closeStatement(Statement statement) {
		try {
			if (statement != null) {
				statement.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
