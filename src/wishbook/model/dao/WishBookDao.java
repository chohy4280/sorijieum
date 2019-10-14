package wishbook.model.dao;

import java.sql.*;
import java.util.ArrayList;

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
	public ArrayList<WishBook> selectWishBookSearch(Connection conn, String searchtype, String keyword, String wbstatus){
		return null;
	}
	
	
	// 관리자 신청도서 한 개 불러오기 용
	public WishBook selectWishBookOneAdmin(Connection conn, int wishno) {
		return null;
	}
	
	
	// 관리자 신청도서 승인반려처리용
	public WishBook insertWishBookResult(Connection conn, int wishno) {
		return null;
	}
	
	
	//************************************************************
	
	public int getListCount(){
		return 0;
	}
	
	public ArrayList<WishBook> selectWishBookList(int startnum, int endnum){
		return null;
	}

	public WishBook selectWishBookOne(Connection conn, int wishno){
		return null;
	}

	public int updateWishBook(Connection conn, WishBook wishbook){
		return 0;
	}
	
	public int insertWishBook(Connection conn, WishBook wishbook){
		return 0;
	}
	
	public int deleteWishBook(Connection conn, WishBook wishbook){
		return 0;
	}
	
	public WishBook selectMyWishBook(Connection conn, int wishno, String wishwriter){
		return null;
	}
	
	public ArrayList<WishBook> selectTitleWishBook(Connection conn, String wishbooktitle){
		return null;
	}
	
	public ArrayList<WishBook> selectWriterWishBook(Connection conn, String wishbooktitle){
		return null;
	}
}
