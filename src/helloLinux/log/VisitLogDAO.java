package helloLinux.log;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class VisitLogDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	/* MySQL connection information */
	private String jdbc_driver = "com.mysql.jdbc.Driver"; 
	private String jdbc_url = "jdbc:mysql://localhost/hellolinux?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
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

	/**
	 * Logging about visit of users that is not a member of our site
	 * 
	 * @param url of a visited page
	 * @return
	 */
	public boolean visitLogging(String url) {
		connect();
		
		VisitLog visitLog = new VisitLog();
		
		java.util.Date utilDate = new java.util.Date();
		Date date = new java.sql.Date(utilDate.getTime());
		
		visitLog.setDate(date);
		visitLog.setUrl(url);
		
		String sql = "insert into hellolinux.visit_log"
				+ "(url, date) "
				+ "values(?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql); // ���⼭ ������. connect �����ؼ� conn�� null�ε�
			pstmt.setString(1, visitLog.getUrl());
			pstmt.setDate(2, visitLog.getDate());
			
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			disconnect();
		}
		
		return true;
	}
	
	
	/**
	 * Loggin about visit of users that is a member of our site
	 * 
	 * @param url
	 * @param email
	 * @return
	 */
	public boolean visitLogging(String url, String email) {
		
		connect();
		
		VisitLog visitLog = new VisitLog();
		
		java.util.Date utilDate = new java.util.Date();
		Date date = new java.sql.Date(utilDate.getTime());
		
		visitLog.setDate(date);
		visitLog.setEmail(email);
		visitLog.setUrl(url);
		
		String sql = "insert into hellolinux.visit_log"
				+ "(email, url, date) "
				+ "values(?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql); // ���⼭ ������. connect �����ؼ� conn�� null�ε�
			pstmt.setString(1, visitLog.getEmail());
			pstmt.setString(2, visitLog.getUrl());
			pstmt.setDate(3, visitLog.getDate());
			
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			disconnect();
		}
		
		return true;
	}
	
	/**
	 * 
	 * @return visiting count of users that is not a member of our site
	 */
	public int getNotMemberVisitingCnt() {
		connect();
		
		int ret = 0;
		String sql = "select count(*) as cnt from hellolinux.visit_log where email is null";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			ResultSet result = pstmt.executeQuery();
			
			if(result.next()) {
				ret = result.getInt("cnt");
				result.close();
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return ret;
	}
	
	
	/**
	 * 
	 * @return visiting count of users that is a member of our site
	 */
	public int getMemberVisitingCnt() {
		connect();
		
		int ret = 0;
		String sql = "select count(*) as cnt from hellolinux.visit_log where not email is null";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			ResultSet result = pstmt.executeQuery();
			
			if(result.next()) {
				ret = result.getInt("cnt");
				result.close();
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return ret;
	}
	
	public int getViewPageVisitCount(String url) {
		connect();
		
		int ret = 0;
		String sql = "select count(*) as cnt from hellolinux.visit_log where url=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, url);
			
			ResultSet result = pstmt.executeQuery();
			
			if(result.next()) {
				ret = result.getInt("cnt");
				result.close();
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return ret;
	}
	
}