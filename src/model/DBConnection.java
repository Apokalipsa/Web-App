package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	private static final String USERNAME = "root";
	private static final String PASSWORD = "root";
	private static final String DATABASE = "jdbc:mysql://localhost/imenik";

	public static Connection connect() throws SQLException {
		Connection connection = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(DATABASE, USERNAME,
					PASSWORD);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return connection;
	}
}
