package helloLinux.member;

public class MemberDAO {
	
	public boolean addMember(Member member) {
		// 회원가입
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
