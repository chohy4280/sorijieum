package member.model.service;

import java.util.ArrayList;

import member.model.dao.MemberDao;
import member.model.vo.Member;

public class MemberService {
	
	//의존성 주입
	public MemberDao mDao = new MemberDao();
	
	public MemberService() {}
	
	
	
	//관리자 서비스****************************************
	// 관리자 전체 조회용
	public ArrayList<Member> selectAdminAll(){
		return null;
	}
	
	// 관리자 추가용
	public int insertAdmin(Member member) {
		return 0;
	}
	
	// 관리자 수정용
	public int updateAdmin(Member member) {
		return 0;
	}
	
	// 관리자 삭제용
	public int deleteAmin(String userid) {
		return 0;
	}
	
	// 관리자 한명 조회용
	public Member selectAdminOne(String searchtype, String keyword) {
		return null;
	}
	
	// 관리자 전체회원 조회용
	public ArrayList<Member> selectAll(){
		return null;
	}
	
	// 관리자 회원 검색용
	public ArrayList<Member> selectMemberSearch(String searchtype, String keyword, String gender, String membertype){
		return null;
	}
	
	// 관리자 회원 한명 검색용
	public Member selectMemberOne(String userid) {
		return null;
	}
	
	// 관리자 회원 정보 수정용
	public int updateMember(Member member) {
		return 0;
	}
	
	// 관리자 회원 삭제(강제탈퇴)용
	public int deleteMember(String userid) {
		return 0;
	}
	
	// 관리자 이용자 신규회원(Sysdate) 검색용
	public ArrayList<Member> selectNewUserSystdate(){
		return null;
	}
	
	// 관리자 제작자 신규회원(Sysdate) 검색용
		public ArrayList<Member> selectNewMakerSystdate(){
			return null;
		}
		
	// 관리자 이용자 탈퇴회원 신규회원(Sysdate) 검색용
		public ArrayList<Member> selectQuitUserSysdate(){
			return null;
		}
		
	// 관리자 제작자 탈퇴회원 신규회원(Sysdate) 검색용
		public ArrayList<Member> selectQuitMakerSysdate(){
			return null;
		}

	// 관리자 이용자 전체회원 조회용
		public ArrayList<Member> selectAllUser(){
			return null;
		}
		
	// 관리자 제작자 전체회원 조회용
		public ArrayList<Member> selectAllMaker(){
			return null;
		}
}
