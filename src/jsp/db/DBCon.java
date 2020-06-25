package jsp.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
	public static Connection DBConnection() {
		Connection con = null;
		
		try {
			String jdbc_driver = "com.mysql.cj.jdbc.Driver";
			String jdbc_url = "jdbc:mysql://127.0.0.1:3306/dbproject2?serverTimezone=UTC";
			Class.forName(jdbc_driver).newInstance();

			con = DriverManager.getConnection(jdbc_url, "root", "112400ss");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
