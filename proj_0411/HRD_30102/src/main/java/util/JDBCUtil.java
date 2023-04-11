package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class JDBCUtil {
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection
					("jdbc:oracle:thin:@localhost:1521:xe","hr","hr");
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return conn;
	}
	
	public static void close(Connection conn, PreparedStatement ps) {
		if(ps != null) {
			try {
				ps.close();
				
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
				
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
	}
	
	public static void close(Connection conn, PreparedStatement ps, ResultSet rs) {
		if(rs != null) {
			try {
				rs.close();
				
			} catch (SQLException e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		}
		close(conn,ps);
	}
}
