package helloLinux.member;

import java.sql.*;

public class MemberDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	/* MySQL ���� ���� */
	private String jdbc_driver = "com.mysql.jdbc.Driver"; 
	private String jdbc_url = //"jdbc:mysql://127.0.0.1:3306/hellolinux"; 
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
	
	public boolean addMember(Member member) {
		// ȸ������
		connect();
		
		String sql = "insert into hellolinux.member"
				+ "(email, name, passwd, birth_year, birth_month, birth_day, "
				+ "sex, work, belong, is_out, out_date, date) "
				+ "values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql); // ���⼭ ������. connect �����ؼ� conn�� null�ε�
			pstmt.setString(1, member.getEmail());
			pstmt.setString(2, member.getName());
			pstmt.setString(3, member.getPasswd());
			pstmt.setInt(4, member.getBirth_year());
			pstmt.setInt(5, member.getBirth_month());
			pstmt.setInt(6, member.getBirth_day());
			pstmt.setString(7, member.getSex());
			pstmt.setString(8, member.getWork());
			pstmt.setString(9, member.getBelong());
			pstmt.setBoolean(10, member.isOut());
			pstmt.setDate(11, member.getOutDate());
			pstmt.setDate(12, member.getDate());
			
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
			return false;
			
		} finally {
			disconnect();
		}
		
		return true;
	}
	
	public boolean deleteMember(Member member) {
		// Ż���� ȸ�� ���� ������ �� ���
		return false;
	}
	
	public boolean login(String uid, String passwd) {
		return false;
	}
	
	public Member getMemberByUid(String uid) {
		// id�� ȸ��ã��
		Member member = new Member();
		
		return member;
	}
	
	public Member getMemberByEmail(String email) {
		Member member = new Member();
		
		return member;
	}
}
