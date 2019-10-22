package wishbook.model.dao;

import java.sql.*;
import java.util.ArrayList;

import book.model.vo.BookMakingProgress;

import static common.JDBCTemplate.*;

import wishbook.model.vo.WishBook;

public class WishBookDao {
	
	public WishBookDao() {}

	// 관리자용 dao************************************************************************************************
	// 관리자 신청도서(전체)
	public ArrayList<WishBook> selectAll(Connection conn){
		ArrayList<WishBook> list = new ArrayList<WishBook>();
		
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from wishbook";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				WishBook wb = new WishBook();
				
				wb.setWishNo(rset.getInt("wishno"));
				wb.setWishDate(rset.getDate("wishdate"));
				wb.setWishBookTitle(rset.getString("wishbooktitle"));
				wb.setWishWriter(rset.getString("wishwriter"));
				wb.setWishStatus(rset.getString("wishstatus"));
				wb.setWishStatusDate(rset.getDate("wishstatusdate"));
				wb.setWishbookAdmin(rset.getString("wishbookadmin"));
				
				list.add(wb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}
	
	
	//  조회용관리자 신청도서(대기) 조회용
	public ArrayList<WishBook> selectWaitWishBook(Connection conn){
		ArrayList<WishBook> wishbList = new ArrayList<WishBook>();
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from wishbook where wishstatus = 'WAIT'";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				WishBook wb= new WishBook();
				
				wb.setWishNo(rset.getInt("wishno"));
				
				wishbList.add(wb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return wishbList;
	}
	
	
	// 관리자 신청도서 검색용
	public ArrayList<WishBook> selectWishBookSearch(Connection conn, String searchtype, String keyword, String wishstatus){
		ArrayList<WishBook> list = new ArrayList<WishBook>();
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = null;
		if(keyword == null) {
			if(wishstatus.equals("ALL") == true)
				query = "select * from wishbook where wishstatus in ('WAIT', 'DONE', 'RJCT')";
			else
				query = "select * from wishbook where wishstatus = '" + wishstatus + "'";
		} else {
			if(wishstatus.equals("ALL") == true)
				query = "select * from wishbook where " + searchtype + " like '%" + keyword + "%' and wishstatus in ('WAIT', 'DONE', 'RJCT')";
			else
				query = "select * from wishbook where " + searchtype + " like '%" + keyword + "%' and wishstatus = '" + wishstatus + "'";
		}
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			while(rset.next()) {
				WishBook wb = new WishBook();
				
				wb.setWishWriter(rset.getString("wishwriter"));
				wb.setWishBookTitle(rset.getString("wishbooktitle"));
				wb.setWishDate(rset.getDate("wishdate"));
				wb.setWishStatus(rset.getString("wishstatus"));
				wb.setWishbookAdmin(rset.getString("wishbookadmin"));
				wb.setWishStatusDate(rset.getDate("wishstatusdate"));
				
				list.add(wb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		return list;
	}
	
	
	// 관리자 신청도서 한 개 불러오기 용
	public WishBook selectWishBookOneAdmin(Connection conn, int wishno) {
		WishBook wb = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from wishbook where wishno = " + wishno;
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				wb = new WishBook();
				
				wb.setWishNo(wishno);
				wb.setWishDate(rset.getDate("wishdate"));
				wb.setWishWriter(rset.getString("wishwriter"));
				wb.setWishBookTitle(rset.getString("wishbooktitle"));
				wb.setWishStatus(rset.getString("wishstatus"));
				wb.setWishBookAuthor(rset.getString("wishbookauthor"));
				wb.setWishStatusDate(rset.getDate("wishstatusdate"));
				wb.setWishPublisher(rset.getString("wishpublisher"));
				wb.setWishbookAdmin(rset.getString("wishbookadmin"));
				wb.setRjctReason(rset.getString("rjctreason"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return wb;
	}
	
	
	// 관리자 신청도서 승인반려처리용
	public int updateWishBookResult(Connection conn, WishBook wb) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println("wb : " + wb);
		String query = "update wishbook set wishstatus = ?, rjctreason = ?, wishbookadmin = ?, wishstatusdate = sysdate where wishno = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			
			pstmt.setString(1, wb.getWishStatus());
			pstmt.setString(2, wb.getRjctReason());
			pstmt.setString(3, wb.getWishbookAdmin());
			pstmt.setInt(4, wb.getWishNo());
			
			result = pstmt.executeUpdate();

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	//************************************************************
	
	public int getListCount(Connection conn){
		int wcount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) from wishbook";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				wcount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return wcount;
	}
	
	public ArrayList<WishBook> selectWishBookList(Connection conn, int startnum, int endnum){
		ArrayList<WishBook> wlist = new ArrayList<WishBook>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, WISHNO, WISHBOOKTITLE, WISHBOOKAUTHOR, WISHWRITER, WISHDATE, WISHSTATUS, WISHVIEWS " + 
						"FROM (SELECT * FROM WISHBOOK " + 
						"ORDER BY WISHDATE DESC)) " + 
						"WHERE RNUM >= ? AND RNUM <= ? ";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				WishBook wb = new WishBook();
				wb.setWishNo(rset.getInt("wishno"));
				wb.setWishBookTitle(rset.getString("wishbooktitle"));
				wb.setWishBookAuthor(rset.getString("wishbookauthor"));
				wb.setWishWriter(rset.getString("wishwriter"));
				wb.setWishDate(rset.getDate("wishdate"));
				wb.setWishStatus(rset.getString("wishstatus"));
				wb.setWishViews(rset.getInt("wishviews"));
				wlist.add(wb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return wlist;
	}

	public WishBook selectWishBookOne(Connection conn, int wishno){
		WishBook wb = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from wishbook where wishno = " + wishno;
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				wb = new WishBook();
				wb.setWishNo(rset.getInt("wishno"));
				wb.setWishBookTitle(rset.getString("wishbooktitle"));
				wb.setWishBookAuthor(rset.getString("wishbookauthor"));
				wb.setWishPublisher(rset.getString("wishpublisher"));
				wb.setWishPublishDate(rset.getDate("wishpublishdate"));
				wb.setWishWriter(rset.getString("wishwriter"));
				wb.setWishDate(rset.getDate("wishdate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return wb;
	}

	public int updateWishBook(Connection conn, WishBook wishbook){
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update wishbook set wishbooktitle = ?, wishbookauthor = ?, "
					+ " wishpublisher = ?, wishpublishdate = ? where wishno = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, wishbook.getWishBookTitle());
			pstmt.setString(2, wishbook.getWishBookAuthor());
			pstmt.setString(3, wishbook.getWishPublisher());
			pstmt.setDate(4, wishbook.getWishPublishDate());
			pstmt.setInt(5, wishbook.getWishNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int insertWishBook(Connection conn, WishBook wishbook){
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "insert into wishbook values(SEQ_WISHNO.NEXTVAL, ?, ?, ?, ?, ?, "
						+ "sysdate, default, default, null, null, default, null)";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, wishbook.getWishWriter());
			pstmt.setString(2, wishbook.getWishBookTitle());
			pstmt.setString(3, wishbook.getWishBookAuthor());
			pstmt.setString(4, wishbook.getWishPublisher());
			pstmt.setDate(5, wishbook.getWishPublishDate());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public int deleteWishBook(Connection conn, int wishno){
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "delete from wishbook where wishno = " + wishno;
		try {
			pstmt = conn.prepareStatement(query);
			result = pstmt.executeUpdate();
			System.out.println(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	public ArrayList<WishBook> selectSearchWishBook(Connection conn, String search, String keyword, int startnum, int endnum){
		ArrayList<WishBook> list = new ArrayList<WishBook>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = null;
		if(keyword != null) {
			query = "SELECT * FROM (SELECT ROWNUM RNUM, WISHNO, WISHBOOKTITLE, WISHBOOKAUTHOR, WISHWRITER, WISHDATE, WISHSTATUS, WISHVIEWS " + 
					"FROM (SELECT * FROM WISHBOOK " + 
					"WHERE " + search + " LIKE '%" + keyword + "%' "+ 
					"ORDER BY WISHDATE DESC)) " + 
					"WHERE RNUM >= ? AND RNUM <= ?";
		}
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startnum);
			pstmt.setInt(2, endnum);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				WishBook wb = new WishBook();
				wb.setWishNo(rset.getInt("wishno"));
				wb.setWishBookTitle(rset.getString("wishbooktitle"));
				wb.setWishBookAuthor(rset.getString("wishbookauthor"));
				wb.setWishWriter(rset.getString("wishwriter"));
				wb.setWishDate(rset.getDate("wishdate"));
				wb.setWishStatus(rset.getString("wishstatus"));
				wb.setWishViews(rset.getInt("wishviews"));
				list.add(wb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getWishListCount(Connection conn, String search, String keyword) {
		int wcount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "SELECT COUNT(*) FROM WISHBOOK " + 
				"WHERE " + search + " LIKE '%" + keyword + "%' ";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				wcount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return wcount;
	}
	
	public int updateWishViews(Connection conn, int wishno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update wishbook set wishviews = wishviews + 1 where wishno = ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, wishno);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
