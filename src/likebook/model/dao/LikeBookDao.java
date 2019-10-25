package likebook.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import likebook.model.vo.LikeBook;
import likebook.model.vo.adminLikeBook;
import mybook.model.vo.adminMyBook;

public class LikeBookDao {
	
	public LikeBookDao() {}

	//관심도서 목록
	public ArrayList<LikeBook> selectLikeBookList(Connection conn, String userid) {
		return null;
	}
	
	//관심도서 삭제
	public int deleteLikeBook(Connection conn, String userid, String bookCode) {
		return 0;
	}

	// 관리자용 dao************************************************************************************************
	// 이용자 관심도서 조회용
	public ArrayList<adminLikeBook> selectUserLikebookList(Connection conn, String userid, int startRow, int endRow){
		ArrayList<adminLikeBook> list = new ArrayList<adminLikeBook>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, userid, bookcode, booktitle, author, publisher from( select * from likebook join book using (bookcode) where userid = ? order by booktitle)) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				adminLikeBook lb = new adminLikeBook();
				
				lb.setUserId(userid);
				lb.setBookCode(rset.getString("bookcode"));
				lb.setBookTitle(rset.getString("booktitle"));
				lb.setAuthor(rset.getString("author"));
				lb.setPublisher(rset.getString("publisher"));
				
				list.add(lb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
	    return list;
	}

	// 이용자 관심도서 리스트카운트용
	public int getListCountAdmin(Connection conn, String userid) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from likebook join book using (bookcode) where userid = '" + userid + "' order by booktitle asc";
		
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
