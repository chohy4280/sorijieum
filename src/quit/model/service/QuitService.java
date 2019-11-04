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
	
		// 전체탈퇴회원 리스트카운트 출력용
		public int getListCountAdmin() {
			Connection conn = getConnection();
			int listCount = qDao.getListCountAdmin(conn);
			close(conn);
			return listCount;
		}
		
		
		// 관리자 탈퇴회원 전체 조회용
		public ArrayList<Quit> selectAll(int startRow, int endRow){
			Connection conn = getConnection();
			ArrayList<Quit> list = qDao.selectAll(conn, startRow, endRow);
			close(conn);
			return list;
		}
		
		// 탈퇴회원 검색용 리스트카운트
		public int getSearchListCountAdmin(String typenumber, String userid, String quittype) {
			Connection conn = getConnection();
			int listCount = qDao.getSerachListCountAdmin(conn, typenumber, userid, quittype);
			close(conn);
			return listCount;
		}
		
		
		// 관리자 탈퇴회원 검색 조회용
		public ArrayList<Quit> selectQuitMemberSearch(String typenumber, String userid, String quittype, int startRow, int endRow){
			Connection conn = getConnection();
			ArrayList<Quit> list = qDao.selectQuitMemberSearch(conn, typenumber, userid, quittype, startRow, endRow);
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
		public int insertMember(String userid, String answer) {
			Connection conn = getConnection();
			int result = qDao.insertMember(conn, userid, answer);
			if(result > 0)
				commit(conn);
			else
				rollback(conn);
			close(conn);
			return result;
		}


	}
