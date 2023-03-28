package Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class JDBCUtil {
	
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con 
		= DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521/xe","system","1234");
		
		return con;
	}
}
