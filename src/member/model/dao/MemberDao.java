package member.model.dao;

import java.sql.*;

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
  
  	// 관리자용 dao************************************************************************************************
	// 관리자 전체 조회용
	public ArrayList<Member> selectAdminAll(Connection conn){
		return null;
	}
	
	// 관리자 추가용
	public int insertAdmin(Connection conn, Member member) {
		return 0;
	}
	
	// 관리자 수정용
	public int updateAdmin(Connection conn, Member member) {
		return 0;
	}
	
	// 관리자 삭제용
	public int deleteAmin(Connection conn, String userid) {
		return 0;
	}
	
	// 관리자 한명 조회용
	public Member selectAdminOne(Connection conn, String searchtype, String keyword) {
		return null;
	}
	
	// 관리자 전체회원 조회용
	public ArrayList<Member> selectAll(Connection conn){
		return null;
	}
	
	// 관리자 회원 검색용
	public ArrayList<Member> selectMemberSearch(Connection conn, String searchtype, String keyword, String gender, String membertype){
		return null;
	}
	
	// 관리자 회원 한명 검색용
	public Member selectMemberOne(Connection conn, String userid) {
		return null;
	}
	
	// 관리자 회원 정보 수정용
	public int updateMember(Connection conn, Member member) {
		return 0;
	}
	
	// 관리자 회원 삭제(강제탈퇴)용
	public int deleteMember(Connection conn, String userid) {
		return 0;
	}
	
	// 관리자 이용자 신규회원(Sysdate) 검색용
	public ArrayList<Member> selectNewUserSystdate(Connection conn){
		return null;
	}
	
	// 관리자 제작자 신규회원(Sysdate) 검색용
		public ArrayList<Member> selectNewMakerSystdate(Connection conn){
			return null;
		}
		
	// 관리자 이용자 탈퇴회원(Sysdate) 검색용
		public ArrayList<Member> selectQuitUserSysdate(Connection conn){
			return null;
		}
		
	// 관리자 제작자 탈퇴회원(Sysdate) 검색용
		public ArrayList<Member> selectQuitMakerSysdate(Connection conn){
			return null;
		}

	// 관리자 이용자 전체회원 조회용
		public ArrayList<Member> selectAllUser(Connection conn){
			return null;
		}
		
	// 관리자 제작자 전체회원 조회용
		public ArrayList<Member> selectAllMaker(Connection conn){
			return null;
		}

}
