package member.model.service;


import java.sql.*;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import member.model.dao.MemberDao;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

public class MemberService {
	
	//의존성 주입
	public MemberDao mdao = new MemberDao();
	
	public MemberService() {}
	
	//로그인
	public Member loginCheck(String userId, String userPwd) {
		return null;
	}
	
	//가입
	public int insertMember(Member member) {
		return 0;
	}
	
	//가입시 아이디 중복체크
	public int checkUserId(String userid) {
		Connection conn = getConnection();
		int result = mdao.checkUserId(conn,userid);
		
		return result;
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
		Connection conn = getConnection();
		ArrayList<Member> list = mDao.selectAll(conn);
		close(conn);
		return list;
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
	public int updateMemberAdmin(Member member) {
		return 0;
	}
	
	// 관리자 회원 삭제(강제탈퇴)용
	public int deleteMemberAdmin(String userid) {
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
