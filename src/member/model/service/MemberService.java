package member.model.service;


import java.sql.*;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import member.model.dao.MemberDao;
import member.model.vo.Member;

import static common.JDBCTemplate.*;

public class MemberService {
	
	//의존성 주입
	public MemberDao mDao = new MemberDao();
	
	public MemberService() {}
	
	//로그인
	public Member loginCheck(String userid, String userpwd) {
		Connection conn = getConnection();
		Member member = mDao.loginCheck(conn, userid, userpwd);
		close(conn);
		return member;
	}
	
	//가입
	public int insertMember(Member member) {
		Connection conn = getConnection();
		int result = mDao.insertMember(conn, member);
		
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		
		close(conn);
		return result;
	}
	
	//가입시 아이디 중복체크
	public int checkUserId(String userid) {
		Connection conn = getConnection();
		int result = mDao.checkUserId(conn,userid);
		close(conn);
		return result;
	}
	
	//탈퇴
	public int deleteMember(String userId) {
		Connection conn = getConnection();
		int result = mDao.deleteMember(conn, userId);
		if(result>0)
			commit(conn);
		else
			rollback(conn);		
		close(conn);
		return result;		
	}
	
	//수정
	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = mDao.updateMember(conn, member);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	public Member selectMember(String userId) {
		Connection conn = getConnection();
		Member member = mDao.selectMember(conn, userId);
		close(conn);
		return member;
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
	public Member selectMemberSearchId(String username, String phone) {
		Connection conn = getConnection();
		Member member = mDao.selectMemberSearchId(conn, username, phone);
		close(conn);
		return member;
	}
  
	//비밀번호 찾기
	public Member selectMemberSearchPwd(String userid, String email) {
		Connection conn = getConnection();
		Member member = mDao.selectMemberSearchPwd(conn, userid, email);
		close(conn);
		return member;
	}

	
	//관리자 서비스****************************************
	
	// 관리자 리스트카운트 출력용
	public int getListCountAdmin() {
		Connection conn = getConnection();
		int listCount = mDao.getListCountAdmin(conn);
		close(conn);
		return listCount;
	}
	
	// 관리자 전체 조회용
	public ArrayList<Member> selectAdminAll(int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<Member> list = mDao.selectAdminAll(conn, startRow, endRow);
		close(conn);
		return list;
	}
	
	// 관리자 추가용
	public int insertAdmin(Member m) {
		Connection conn = getConnection();
		int result = mDao.insertAdmin(conn, m);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	// 관리자 수정용
	public int updateAdmin(Member m) {
		Connection conn = getConnection();
		int result = mDao.updateAdmin(conn, m);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	

	// 관리자 검색용 리스트카운트 출력
	public int getListCountSearchAdmin(String searchtype, String keyword) {
		Connection conn = getConnection();
		int listCount = mDao.getListCountSearchAdmin(conn, searchtype, keyword);
		close(conn);
		return listCount;
	}
	
	// 관리자 검색용
	public ArrayList<Member> selectAdminOne(String searchtype, String keyword, int startRow, int endRow) {
		Connection conn = getConnection();
		ArrayList<Member> list = mDao.selectAdminOne(conn, searchtype, keyword, startRow, endRow);
		close(conn);
		return list;
	}
	
	// 관리자 전체 회원 리스트카운트 출력용
	public int getListCountMemberAdmin() {
		Connection conn = getConnection();
		int listCount = mDao.getListCountMemberAdmin(conn);
		close(conn);
		return listCount;
	}
	
	
	// 관리자 전체회원 조회용
	public ArrayList<Member> selectAll(int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<Member> list = mDao.selectAll(conn, startRow, endRow);
		close(conn);
		return list;
	}

	
	// 회원검색 리스트카운트 출력용
	public int getListCountMemberSearchAdmin(String searchtype, String keyword, String gender, String typenumber) {
		Connection conn = getConnection();
		int listCount = mDao.getListCountMemberSearchAdmin(conn, searchtype, keyword, gender, typenumber);
		close(conn);
		return listCount;
	}
	
	// 관리자 회원 검색용
	public ArrayList<Member> selectMemberSearch(String searchtype, String keyword, String gender, String typenumber, int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<Member> list = mDao.selectMemberSearch(conn, searchtype, keyword, gender, typenumber, startRow, endRow);
		close(conn);
		return list;
	}
	
	// 관리자 한명 출력용
	public Member selectAdminOneDetail(String userid) {
		Connection conn = getConnection();
		Member m = mDao.selectAdminOneDetail(conn, userid);
		close(conn);
		return m;
	}
	
	// 회원 한명 조회용
	public Member selectMemberOne(String userid) {
		Connection conn = getConnection();
		Member m = mDao.selectMemberOne(conn, userid);
		close(conn);
		return m;
	}
	
	// 관리자 회원 정보 수정용
	public int updateMemberAdmin(Member m) {
		Connection conn = getConnection();
		int result = mDao.updateMemberAdmin(conn, m);
		if(result > 0) 
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	
	// 관리자 이용자 신규회원(Sysdate) 검색용
	public ArrayList<Member> selectNewUserSystdate(){
		Connection conn = getConnection();
		ArrayList<Member> newUList = mDao.selectNewUserSystdate(conn);
		close(conn);
		return newUList;
	}
	
	// 관리자 제작자 신규회원(Sysdate) 검색용
		public ArrayList<Member> selectNewMakerSystdate(){
			Connection conn = getConnection();
			ArrayList<Member> newMList = mDao.selectNewMakerSystdate(conn);
			close(conn);
			return newMList;
		}

	// 관리자 이용자 전체회원 조회용Connection conn = getConnection();
		public ArrayList<Member> selectAllUser(){
			Connection conn = getConnection();
			ArrayList<Member> totalUList = mDao.selectAllUser(conn);
			close(conn);
			return totalUList;
		}
		
	// 관리자 제작자 전체회원 조회용
		public ArrayList<Member> selectAllMaker(){
			Connection conn = getConnection();
			ArrayList<Member> totalMList = mDao.selectAllMaker(conn);
			close(conn);
			return totalMList;
		}
		//임시비밀번호 적용
		public int updateTempPwd(String userid, String email) {
			Connection conn = getConnection();
			int result = mDao.updateTempPwd(conn,userid,email);
			if(result>0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}
}
