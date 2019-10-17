package quit.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import quit.model.vo.Quit;

public class QuitDao {

	public QuitDao() {}

	//회원 탈퇴시 탈퇴테이블에 입력
	public int insertQuitMember(Connection conn, String userid, int reason, String etc) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into quit values(?,'G',?,sysdate)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			switch(reason) {
			case 1:
				pstmt.setString(2, "사이트 이용 빈도가 낮습니다.");
				break;
			case 2:
				pstmt.setString(2, "사이트 이용방법이 어렵습니다.");
				break;
			case 3:
				pstmt.setString(2, "개인정보 유출이 우려됩니다.");
				break;
			case 4:
				pstmt.setString(2, etc);
				break;
			}
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	// 관리자용 dao************************************************************************************************
		// 관리자 탈퇴회원 전체 조회용
		public ArrayList<Quit> selectAll(Connection conn){
			ArrayList<Quit> list = new ArrayList<Quit>();
			Statement stmt = null;
			ResultSet rset = null;
			String query = "select * from quit order by quitdate desc";
			
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
		public ArrayList<Quit> selectQuitMemberSearch(Connection conn, String typenumber, String userid, String quittype){
			ArrayList<Quit> list = new ArrayList<Quit>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = null;
/*			조건 경우의 수
 			1-1 아이디 X, 회원유형 전체, 탈퇴유형 전체
			1-2 아이디 X, 회원유형 O, 탈퇴유형 전체
			1-3 아이디 X, 회원유형 전체, 탈퇴유형 O
			1-4 아이디 X, 회원유형 O, 탈퇴유형 O

			2-1 아이디 O, 회원유형 전체, 탈퇴유형 전체
			2-2 아이디 O, 회원유형 O, 탈퇴유형 전체
			2-3 아이디 O, 회원유형 전체, 탈퇴유형 O
			2-4 아이디 O, 회원유형 O, 탈퇴유형 O*/
			if(userid == null) {
				if(typenumber.equals("ALL") && quittype.equals("ALL"))				//1-1
					query = "select * from quit join member using (userid) where typenumber in (1, 2, 3) and quittype in ('F', 'G') order by quitdate desc";
				
				else if(!(typenumber.equals("ALL")) && quittype.equals("ALL"))		//1-2
					query = "select * from quit join member using(userid) where typenumber = " + typenumber + " and quittype in ('G', 'F') order by quitdate desc";
				
				else if(typenumber.equals("ALL") && !quittype.equals("ALL"))		//1-3
					query = "select * from quit join member using(userid) where typenumber in (1,2,3) and quittype = '" + quittype + "' order by quitdate desc";
				
				else if(!(typenumber.equals("ALL")) && !quittype.equals("ALL"))	//1-4
					query = "select * from quit join member using(userid) where typenumber = " + typenumber + " and quittype = '" + quittype + "' order by quitdate desc";
			}else {
				if(typenumber.equals("ALL") && quittype.equals("ALL"))				//1-1
					query = "select * from quit join member using(userid) where userid like '%" + userid + "%' and typenumber in (1,2,3) and quittype in ('G', 'F') order by quitdate desc";
				
				else if(!(typenumber.equals("ALL")) && quittype.equals("ALL"))		//1-2
					query = "select * from quit join member using(userid) where userid like '%" + userid + "%' and typenumber = " + typenumber + " and quittype in ('G', 'F') order by quitdate desc";
				
				else if(typenumber.equals("ALL") && !quittype.equals("ALL"))		//1-3
					query = "select * from quit join member using(userid) where userid like '%" + userid + "%' and typenumber in (1,2,3) and quittype = '" + quittype + "' order by quitdate desc";
				
				else if(!(typenumber.equals("ALL")) && !quittype.equals("ALL"))	//1-4
					query = "select * from quit join member using(userid) where userid like '%" + userid + "%' and typenumber = " + typenumber + " and quittype = '" + quittype + "' order by quitdate desc";
			}
			
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
  
		// 관리자 삭제시 quit테이블에도 추가
		public int insertAdmin(Connection conn, String userid) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "insert into quit values (?, 'F', '대표 관리자에 의한 삭제', sysdate)";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userid);
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
}
