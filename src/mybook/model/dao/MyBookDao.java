package mybook.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import mybook.model.vo.MyBook;
import mybook.model.vo.adminMyBook;

public class MyBookDao {

	public MyBookDao() {}
	
  //내서재 목록
  public ArrayList<MyBook> selectMyBookList(Connection conn, String userId) {
    return null;
  }

  //내서재 삭제
  public int deleteMyBook(Connection conn, String userid, String bookCode) {
    return 0;
  }

  // 관리자용 dao************************************************************************************************
  // 이용자 읽은 도서 조회용
  public ArrayList<adminMyBook> selectUserReadbookList(Connection conn, String userid, int startRow, int endRow){
	ArrayList<adminMyBook> list = new ArrayList<adminMyBook>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String query = "select * from (select rownum rnum, userid, bookcode, booktitle, author, publisher from( select * from mybook join book using (bookcode) where userid = ? order by booktitle)) where rnum between ? and ?";
	
	try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userid);
		pstmt.setInt(2, startRow);
		pstmt.setInt(3, endRow);
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			adminMyBook mb = new adminMyBook();
			
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

  // 이용자 읽은도서 리스트카운트용
	public int getListCountAdmin(Connection conn, String userid) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from mybook join book using (bookcode) where userid = '" + userid + "' order by booktitle asc";
		
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
