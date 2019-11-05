package likebook.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import likebook.model.vo.LikeBookLB;
import likebook.model.vo.adminLikeBook;

public class LikeBookDao {
	
	public LikeBookDao() {}

	//관심도서 목록
	public ArrayList<LikeBookLB> selectLikeBookList(Connection conn, String userid) {
		ArrayList<LikeBookLB> lblist = new ArrayList<LikeBookLB>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book b join likebook l on b.bookcode=l.bookcode where l.userid=? order by likedate desc";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				LikeBookLB lb = new LikeBookLB();
				lb.setBookcode(rset.getString("bookcode"));
				lb.setBooktitle(rset.getString("booktitle"));
				lb.setAuthor(rset.getString("author"));
				lb.setPublisher(rset.getString("publisher"));
				lb.setPublishdate(rset.getDate("publishdate"));
				lb.setBookoimg(rset.getString("bookoimg"));
				lb.setBookrimg(rset.getString("bookrimg"));
				lb.setUserid(userid);
				lb.setLikedate(rset.getDate("likedate"));
				lblist.add(lb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return lblist;
	}
	
	//관심도서 삭제
	public int deleteLikeBook(Connection conn, String userid, String bookcode) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from likebook where userid=? and bookcode=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, bookcode);
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	//관심도서 검색
	public ArrayList<LikeBookLB> searchLikeBookList(Connection conn, String userid, String keyword) {
		ArrayList<LikeBookLB> lblist = new ArrayList<LikeBookLB>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book b join likebook l on b.bookcode=l.bookcode where l.userid=? and "+
					"(b.booktitle like ? or b.author like ?) order by likedate desc";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, "%"+keyword+"%");
			pstmt.setString(3, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				LikeBookLB	lb = new LikeBookLB();
				lb.setBookcode(rset.getString("bookcode"));
				lb.setBooktitle(rset.getString("booktitle"));
				lb.setAuthor(rset.getString("author"));
				lb.setPublisher(rset.getString("publisher"));
				lb.setPublishdate(rset.getDate("publishdate"));
				lb.setBookoimg(rset.getString("bookoimg"));
				lb.setBookrimg(rset.getString("bookrimg"));
				lb.setUserid(userid);
				lb.setLikedate(rset.getDate("likedate"));
				lblist.add(lb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return lblist;		
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
