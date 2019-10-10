package member.model.dao;

import java.sql.Connection;
import java.util.ArrayList;

import member.model.vo.Member;

public class MemberDao {
	
	public MemberDao() {}
	
	//로그인
	public Member loginCheck(Connection conn, String userId, String userPwd) {
		return null;
	}
	
	//가입
	public int insertMember(Connection conn, Member member) {
		return 0;
	}
	
	//탈퇴
	public int deleteMember(Connection conn, String userId) {
		return 0;
	}
	
	//수정
	public int updateMember(Connection conn, Member member) {
		return 0;
	}
	
	public Member selectMember(Connection conn, String userId) {
		return null;
	}
	
	public ArrayList<Member> selectMemberList(Connection conn){
		return null;
	}
	
	//내 문의내역
	public ArrayList<Member> selectMyQnaList(Connection conn, String userid) {
		return null;
	}
	
	//내 신청내역
	public ArrayList<Member> selectMyWishList(Connection conn, String userid) {
		return null;
	}
	
	//아이디찾기
	public Member selectMemberSearchId(Connection conn, String userName, String email) {
		return null;
	}
	
	//비밀번호 찾기
	public Member selectMemberSearchPwd(Connection conn, String userId, String email) {
		return null;
	}
}
