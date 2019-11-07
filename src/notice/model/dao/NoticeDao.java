package notice.model.dao;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;

import notice.model.vo.Notice;

public class NoticeDao {
	
	public NoticeDao() {}

	public int getListCount(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query ="select count(*) from notice order by noticedate desc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		}finally {
			close(rset);
			close(stmt);
		}
		return result;
	}

	// 공지사항 전체 조회 
	public ArrayList<Notice> selectAll(Connection conn, int startnum, int endnum) {
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, NOTICENO, NOTICETITLE , NOTICEWRITER, "
				+ " NOTICECONTENT, NOTICEDATE, NOTICEVIEWS, NOTICEOFILE, NOTICERFILE " + 
				"FROM (SELECT * FROM NOTICE ORDER BY NOTICEDATE DESC, NOTICENO DESC)) " + 
				"WHERE RNUM >= ? AND RNUM <= ? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice notice = new Notice();
				
				notice.setNoticeNo(rset.getInt("noticeno"));
				notice.setNoticeTitle(rset.getString("noticetitle"));
				notice.setNoticeWriter(rset.getString("noticewriter"));
				notice.setNoticeContent(rset.getString("noticecontent"));
				notice.setNoticeDate(rset.getDate("noticedate"));
				notice.setNoticeViews(rset.getInt("noticeviews"));
				notice.setNoticeOfile(rset.getString("noticeofile"));
				notice.setNoticeRfile(rset.getString("noticerfile"));
				list.add(notice);
;			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

   //공지사항 글 추가 
	public int insertNotice(Connection conn, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into notice values (SEQ_NOTICENO.NEXTVAL, ?, ?, ?, sysdate, default, ?, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeWriter());
			pstmt.setString(3, notice.getNoticeContent());
			pstmt.setString(4, notice.getNoticeOfile());
			pstmt.setString(5, notice.getNoticeRfile());
			result = pstmt.executeUpdate();  
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	 //공지사항 한개만 조회 
	public Notice selectOne(Connection conn, int noticeno) { 
		  Notice notice = null;
		  PreparedStatement pstmt = null;
	      ResultSet rset = null; 
	      
	      String query = "select * from notice where noticeno = " + noticeno;
	      
	      try {
	    	  pstmt = conn.prepareStatement(query);
	    	  rset = pstmt.executeQuery();
	    	  
	    	  if(rset.next()) {//if로 한칸만 내려서 한 행만 조회해라
	    		  notice = new Notice();
	    		  //안에 파랑색 글자는 DB에 있는 column_name하고 일치 해야 한다.
	    		  notice.setNoticeNo(rset.getInt("noticeno"));
	    		  notice.setNoticeTitle(rset.getString("noticetitle"));
	    		  notice.setNoticeWriter(rset.getString("noticewriter"));
	    		  notice.setNoticeDate(rset.getDate("noticedate"));
	    		  notice.setNoticeOfile(rset.getString("noticeOfile"));
	    		  notice.setNoticeRfile(rset.getString("noticeRfile"));
	    		  notice.setNoticeContent(rset.getString("noticecontent"));
	    		  notice.setNoticeViews(rset.getInt("noticeviews"));
	    	  }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return notice;
	}

	//공지사항 수정 
	public int modifyNotice(Connection conn, Notice notice) {
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String query = "update notice set noticetitle = ?, noticecontent = ?, "
				+ "noticeofile = ?, noticerfile= ? " 
                + "where noticeno = ?";		
				try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setString(3, notice.getNoticeOfile());
			pstmt.setString(4, notice.getNoticeRfile());
			pstmt.setInt(5, notice.getNoticeNo());
			
			result = pstmt.executeUpdate(); 
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	  //공지사항 삭제
	public int deleteNotice(Connection conn, int noticeNo) { 
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete notice where noticeno = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	
   //공지사항 조회수 증가
	public int updateReadCount(Connection conn, int noticeno) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update notice set noticeviews=noticeviews+1 where noticeno=? ";
			
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, noticeno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}

	 //공지사항 상단 고정
	/*public ArrayList<Notice> selectTopFixed(Connection conn) {
		ArrayList<Notice> toplist = new ArrayList<Notice>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice where noticetop = 'Y' ORDER BY NOTICEDATE DESC, noticeno desc";
		
		  
	      try {
	    	  stmt = conn.createStatement();
	    	  rset = stmt.executeQuery(query);
	    	  
	    	 
	    	  
	    	  while(rset.next()) {
	    		  Notice notice = new Notice();
	    		  
	    		  notice.setNoticeNo(rset.getInt("noticeno"));
	    		  notice.setNoticeTitle(rset.getString("noticetitle"));
	    		  notice.setNoticeWriter(rset.getString("noticewriter"));
	    		  notice.setNoticeDate(rset.getDate("noticedate"));
	    		  notice.setNoticeOfile(rset.getString("noticeOfile"));
	    		  notice.setNoticeRfile(rset.getString("noticeRfile"));
	    		  notice.setNoticeContent(rset.getString("noticecontent"));
	    		  notice.setNoticeViews(rset.getInt("noticeviews"));
	    		  notice.setNoticeTop(rset.getString("noticetop"));
	    		  toplist.add(notice);
	    	  }
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(stmt);
		}
		
		return toplist;
	}
<<<<<<< HEAD

	//공지사항 검색
	public ArrayList<Notice> selectNoticeSearch(Connection conn, String search, String keyword, int startnum, int endnum) {
=======
*/
	 //공지사항 검색
	public ArrayList<Notice> selectNoticeSearch(Connection conn, String keyword, int startnum, int endnum) {

		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, NOTICENO, NOTICETITLE, NOTICEWRITER,NOTICECONTENT,"
				       + " NOTICEDATE, NOTICEVIEWS, NOTICEOFILE, NOTICERFILE"+
		                " FROM(SELECT * FROM NOTICE" +
				         " WHERE noticetitle LIKE '%" + keyword + "%' " + 
		                 " ORDER BY NOTICENO))" + " WHERE RNUM >= ? AND RNUM <= ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Notice n = new Notice();
				n.setNoticeNo(rset.getInt("noticeno"));
				n.setNoticeTitle(rset.getString("noticetitle"));
				n.setNoticeWriter(rset.getString("noticewriter"));
				n.setNoticeContent(rset.getString("noticecontent"));
				n.setNoticeDate(rset.getDate("noticedate"));
				n.setNoticeViews(rset.getInt("noticeviews"));
				n.setNoticeOfile(rset.getString("noticeofile"));
				n.setNoticeRfile(rset.getString("noticerfile"));
				list.add(n);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getListCountNoticeSearch(Connection conn, String keyword) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = null;
			
		    if(keyword != null) {
				query =  "select count(*) from (select * from notice) where noticetitle like '%" + keyword + "%'";
		    }else {
		    	query = "select count(*) from notice";
		    }
		
		    try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(query);
				
				if(rset.next()){
					listCount = rset.getInt(1);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally{
				close(rset);
				close(stmt);
			}
		
		return listCount;
		
	}
}	
