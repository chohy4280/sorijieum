package makebook.model.dao;

import java.sql.*;

import static common.JDBCTemplate.*;

import java.util.ArrayList;

import makebook.model.vo.MakeBook;
import makebook.model.vo.adminMakeBook;
import mybook.model.vo.adminMyBook;

public class MakeBookDao {
	
	public MakeBookDao() {}
	
	//참여도서 목록
	public ArrayList<MakeBook> selectMakeBookList(Connection conn, String userid, int startnum, int endnum){
		ArrayList<MakeBook> mblist = new ArrayList<MakeBook>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from makebook where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				MakeBook mb = new MakeBook();
				mb.setUserId(userid);
				mb.setBookCode(rset.getString("bookcode"));
				mb.setMakeDate(rset.getDate("makedate"));
				mblist.add(mb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mblist;
	}
	
	//참여도서 삭제
	public int deleteMakeBook(Connection conn, String userid, int bookCode) {
		return 0;
	}
	
	//제작자 참여도서 개수 조회
	public int getListCount(Connection conn, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from makebook where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			if(rset.next())
				result = rset.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	// 관리자 Dao *******************************************
	// 제작자 제작도서 조회용
	public ArrayList<adminMakeBook> selectMakerMakebookList(Connection conn, String userid, int startRow, int endRow){
		ArrayList<adminMakeBook> list = new ArrayList<adminMakeBook>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, userid, bookcode, booktitle, author, publisher from( select * from makebook join book using (bookcode) where userid = ? order by booktitle)) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				adminMakeBook mb = new adminMakeBook();
				
				mb.setUserId(userid);
				mb.setBookCode(rset.getString("bookcode"));
				mb.setBookTitle(rset.getString("booktitle"));
				mb.setAuthor(rset.getString("author"));
				mb.setPublisher(rset.getString("publisher"));
				
				list.add(mb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
	    return list;
	}

	public int getListCountAdmin(Connection conn, String userid) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from makebook join book using (bookcode) where userid = '" + userid + "' order by booktitle asc";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) 
				listCount = rset.getInt(1);
			
		}catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(stmt);
			close(rset);
		}
		
		return listCount;
	}

	
}
