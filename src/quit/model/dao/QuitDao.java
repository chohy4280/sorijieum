package quit.model.dao;

import java.sql.*;
import java.util.ArrayList;

import quit.model.vo.Quit;

public class QuitDao {

	public QuitDao() {}
	
	// 관리자용 dao************************************************************************************************
		// 관리자 탈퇴회원 전체 조회용
		public ArrayList<Quit> selectAll(Connection conn){
			return null;
		}
		
		// 관리자 탈퇴화원 검색 조회용
		public ArrayList<Quit> selectQuitMemberSearch(Connection conn, String membertype, String userid, String quittype){
			return null;
		}
}
