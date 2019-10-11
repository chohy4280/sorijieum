package bookmaking.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import book.model.vo.Book;

public class BookMakingDao {

	public BookMakingDao() {}
	
	
	public ArrayList<Book> selectWaitingBook(Connection conn){
		ArrayList<Book> waitlist = new ArrayList<Book>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book where makestatus = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "WAIT");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book book = new Book();
				book.setBookRimg(rset.getString("bookrimg"));
				waitlist.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return waitlist;
	}
	
	public ArrayList<Book> selectMakingBook(Connection conn){
		ArrayList<Book> makelist = new ArrayList<Book>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book where makestatus = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "MAKE");
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book book = new Book();
				book.setBookRimg(rset.getString("bookrimg"));
				makelist.add(book);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return makelist;
	}
	
	public int getListCountWaiting(Connection conn){
		return 0;
	}
	
	public ArrayList<Book> selectWaitingBookList(Connection conn, String bookcode){
		return null;
	}
	
	public int getListCountMaking(Connection conn){
		return 0;
	}
	
	public ArrayList<Book> selectMakingBookList(Connection conn, String bookcode){
		return null;
	}
	
	public Book selectMakingBookOne(Connection conn, String bookcode){
		Book book = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book where bookcode = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookcode);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				book = new Book();
				book.setBookTitle(rset.getString("booktitle"));
				book.setAuthor(rset.getString("author"));
				book.setPublisher(rset.getString("publisher"));
				book.setBookInfo(rset.getString("bookinfo"));
				book.setBookOimg(rset.getString("bookoimg"));
				book.setBookRimg(rset.getString("bookrimg"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return book;
	}
	
	public ArrayList<Book> selectBookPdfLoad(Connection conn){
		return null;
	}
	
	public int getMakedBookCount(Connection conn){
		return 0;
	}
}
