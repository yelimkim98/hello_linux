package helloLinux.member;

import java.sql.*;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	/* MySQL 연결 정보 */
	private String jdbc_driver = "com.mysql.jdbc.Driver"; 
	private String jdbc_url = "jdbc:mysql://localhost/jspdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	
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
	
	public boolean addMember(Member member) {
		// 회원가입
		connect();
		
		
		
		return false;
	}
	
	public boolean deleteMember(Member member) {
		// 탈퇴한 회원 정보 제거할 때 사용
		return false;
	}
	
	public boolean login(String uid, String passwd) {
		return false;
	}
	
	public Member getMemberByUid(String uid) {
		// id로 회원찾기
		Member member = new Member();
		
		return member;
	}
	
	public Member getMemberByEmail(String email) {
		Member member = new Member();
		
		return member;
	}
}
