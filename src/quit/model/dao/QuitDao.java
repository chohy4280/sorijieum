package quit.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import quit.model.vo.Quit;

public class QuitDao {

	public QuitDao() {}
	
	// 관리자용 dao************************************************************************************************
		// 관리자 탈퇴회원 전체 조회용
		public ArrayList<Quit> selectAll(Connection conn){
			ArrayList<Quit> list = new ArrayList<Quit>();
			Statement stmt = null;
			ResultSet rset = null;
			String query = "select * from quit";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Quit q = new Quit();
					
					q.setUserId(rset.getString("userid"));
					q.setQuitType(rset.getString("quittype"));
					q.setQuitReason(rset.getString("quitreason"));
					q.setQuitDate(rset.getDate("quitdate"));
					
					list.add(q);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return list;
		}
		
		// 관리자 탈퇴화원 검색 조회용
		public ArrayList<Quit> selectQuitMemberSearch(Connection conn, String membertype, String userid, String quittype){
			return null;
		}
		
		// 관리자 이용자 탈퇴회원(Sysdate) 검색용
		public ArrayList<Quit> selectQuitUserSysdate(Connection conn){
			ArrayList<Quit> quitUList = new ArrayList<Quit>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from quit join member using(userid) where member.typenumber between 1 and 2 and quitdate = sysdate";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Quit q = new Quit();
					
					q.setUserId(rset.getString("userid"));
					
					quitUList.add(q);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(conn);
			}
			return quitUList;
		}
		
		// 관리자 제작자 탈퇴회원(Sysdate) 검색용
		public ArrayList<Quit> selectQuitMakerSysdate(Connection conn){
			ArrayList<Quit> quitMList = new ArrayList<Quit>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from quit join member using(userid) where member.typenumber = 3 and quitdate = sysdate";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Quit q = new Quit();
					
					q.setUserId(rset.getString("userid"));
					
					quitMList.add(q);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(conn);
			}
			return quitMList;
		}
}
