package RegateDahouet.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class ConnectDb {
	private static Connection cn = null;
	static String url = "jdbc:mysql://localhost/RegateDahouet";

	public static Connection getConnection() throws SQLException {
		String login = "root";
		String passwd = "admin";
		if (cn == null || (cn != null && cn.isClosed()) ) {
			try {
				Class.forName("com.mysql.jdbc.Driver");
				cn = (Connection) DriverManager.getConnection(url, login,
						passwd);
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		return cn;
	}
}
