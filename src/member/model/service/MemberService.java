package member.model.service;

import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	
	//의존성 주입
	public MemberDao mDao = new MemberDao();
	
	public MemberService() {}
	
	//로그인
	public Member loginCheck(String userId, String userPwd) {
		return null;
	}
	
	//가입
	public int insertMember(Member member) {
		return 0;
	}
	
	//탈퇴
	public int deleteMember(String userId) {
		return 0;
	}
	
	//수정
	public int updateMember(Member member) {
		return 0;
	}
	
	public Member selectMember(String userId) {
		return null;
	}
	
	public ArrayList<Member> selectMemberList(){
		return null;
	}
	
	//내 문의내역
	public ArrayList<Member> selectMyQnaList(String userid) {
		return null;
	}
	
	//내 신청내역
	public ArrayList<Member> selectMyWishList(String userid) {
		return null;
	}
	
	//아이디찾기
	public Member selectMemberSearchId(String userName, String email) {
		return null;
	}
	
	//비밀번호 찾기
	public Member selectMemberSearchPwd(String userId, String email) {
		return null;
	}

}
