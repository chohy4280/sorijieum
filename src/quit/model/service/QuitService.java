package quit.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import quit.model.dao.QuitDao;
import quit.model.vo.Quit;

public class QuitService {
	
	//의존성 주입
	public QuitDao qDao = new QuitDao();
	
	public QuitService() {}
	
	//회원 탈퇴시 탈퇴 테이블에 등록용
	public int insertQuitMember(String userid,int reason,String etc) {
		Connection conn = getConnection();
		int result = qDao.insertQuitMember(conn,userid,reason,etc);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//관리자 서비스****************************************
	// 관리자 탈퇴회원 전체 조회용
	public ArrayList<Quit> selectAll(){
		Connection conn = getConnection();
		ArrayList<Quit> list = qDao.selectAll(conn);
		close(conn);
		return list;
	}
	
	// 관리자 탈퇴회원 검색 조회용
	public ArrayList<Quit> selectQuitMemberSearch(String typenumber, String userid, String quittype){
		Connection conn = getConnection();
		ArrayList<Quit> list = qDao.selectQuitMemberSearch(conn, typenumber, userid, quittype);
		close(conn);
		return list;
	}
	
	// 관리자 이용자 탈퇴회원 신규회원(Sysdate) 검색용
	public ArrayList<Quit> selectQuitUserSysdate(){
		Connection conn = getConnection();
		ArrayList<Quit> quitUList = qDao.selectQuitUserSysdate(conn);
		close(conn);
		return quitUList;
	}
	
	// 관리자 제작자 탈퇴회원 신규회원(Sysdate) 검색용
	public ArrayList<Quit> selectQuitMakerSysdate(){
		Connection conn = getConnection();
		ArrayList<Quit> quitMList = qDao.selectQuitMakerSysdate(conn);
		close(conn);
		return quitMList;
	}

	// 관리자 삭제시 quit테이블에도 추가
	public int insertAdmin(String userid) {
		Connection conn = getConnection();
		int result = qDao.insertAdmin(conn, userid);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

}
