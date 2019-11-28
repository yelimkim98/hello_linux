package helloLinux.log;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class LoginLogDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	
	/* MySQL JDBC information */
	private String jdbc_driver = "com.mysql.jdbc.Driver"; 
	private String jdbc_url =  
			"jdbc:mysql://localhost/hellolinux?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
	private void connect() {
		try {
			Class.forName(jdbc_driver);
			
			conn = DriverManager.getConnection(jdbc_url, "hellolinux", "hellolinux1710");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				
			}
		}
	}
	
	/* any functions */

}
