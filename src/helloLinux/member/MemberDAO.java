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
	
	public boolean isEmailAlreadyExist(String email) {
		connect();
		
		String sql = "select * from hellolinux.member where email=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet ret = pstmt.executeQuery();
			boolean isExist = ret.next();
			
			if(!isExist) {
				ret.close();
				return false;
			}
			ret.close();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		
		return true;
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
	
	public Member login(String email, String passwd) {
		connect();
		
		Member m = null;
		String sql = "select * from hellolinux.member "
				+ "where email=? and passwd=? and out_date is null";
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, email);
			pstmt.setString(2, passwd);
			
			ResultSet ret = pstmt.executeQuery();
			
			// return���� boolean�̸� ȸ�������� ��� ��������??
			// => �Է¹��� ���� �����Ƿ� ������ �ʿ䰡 ����.
			if(ret.next()) { // �����Ͱ� �ϳ��� �����Ƿ� ret.next()�� �ѹ��� ����
				m = new Member();
				m.setEmail(ret.getString("email"));
				m.setName(ret.getString("name"));
				m.setPasswd("secret");
				m.setBirth_year(ret.getInt("birth_year"));
				m.setBirth_month(ret.getInt("birth_month"));
				m.setBirth_day(ret.getInt("birth_day"));
				m.setSex(ret.getString("sex"));
				m.setWork(ret.getString("work"));
				m.setBelong(ret.getString("belong"));
				
				ret.close();
				return m;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		
		} finally {
			disconnect();
		}
		
		return m;
	}
	
	public Member getMemberByEmail(String email) {
		Member member = new Member();
		
		return member;
	}
	public Member findAccount(String name, String email, int year, int month, int day) {
		connect();
		
		Member m = null;
		String sql = "select * from hellolinux.member "
				+ "where name = ? and email = ? "
				+ "and birth_year = ? and birth_month = ? and"
				+ "birth_day = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setInt(3, year);
			pstmt.setInt(4, month);
			pstmt.setInt(5, day);
			
			ResultSet ret = pstmt.executeQuery();
			
			if(ret.next()) {
				m = new Member();
				m.setEmail(ret.getString("email"));
				ret.close();
				return m;
			}
			
		} catch(SQLException e) {
			e.printStackTrace();
		
		} finally {
			disconnect();
		}
		
		return m;
	}
	public boolean resetPw(String email, String passwd) {
		connect();
		
		String sql = "update hellolinux.member set passwd = ? where email = ? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, passwd);
			pstmt.setString(2, email);
			pstmt.executeUpdate();
			return true;
			
		} catch(SQLException e) {
			e.printStackTrace();
		
		} finally {
			disconnect();
		}
		
		return false;
	}
}