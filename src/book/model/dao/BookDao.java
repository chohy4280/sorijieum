package book.model.dao;

import java.sql.*;
import java.util.ArrayList;
import static common.JDBCTemplate.*;

import book.model.vo.Book;

public class BookDao {

	public BookDao() {}
	
	
	// 관리자용 dao************************************************************************************************
	// 관리자 도서 전체 목록 조회용
		public ArrayList<Book> selectAll(Connection conn){	
			ArrayList<Book> list = new ArrayList<Book>();
			Statement stmt = null;
			ResultSet rset = null;
			String query = "select * from book";
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Book b = new Book();
					
					b.setBookCode(rset.getString("bookcode"));
					b.setBookTitle(rset.getString("booktitle"));
					b.setAuthor(rset.getString("author"));
					b.setPublisher(rset.getString("publisher"));
					b.setPublishDate(rset.getDate("publishdate"));
					b.setBookPage(rset.getInt("bookpage"));
					b.setBookInfo(rset.getString("bookinfo"));
					b.setBookOimg(rset.getString("bookoimg"));
					b.setBookRimg(rset.getString("bookrimg"));
					b.setBookOpdf(rset.getString("bookopdf"));
					b.setBookRpdf(rset.getString("bookrpdf"));
					b.setBookDate(rset.getDate("bookdate"));
					b.setBookViews(rset.getInt("bookviews"));
					b.setMakeStatus(rset.getString("makestatus"));
					
					list.add(b);	
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return list;
		}
		
		
		// 관리자 도서 검색용
		public ArrayList<Book> selectBookSearch(Connection conn, String searchtype, String keyword, String bookstatus){
			return null;
		}
		
		
		// 관리자 도서 삭제용
		public int deleteBook(Connection conn, int bookcode) {
			return 0;
		}
		
		
		// 관리자 도서 한개 정보 불러오기용
		public Book selectBookOne(Connection conn, int bookcode) {
			return null;
		}
		
		
		// 관리자 도서 정보 수정용
		public Book updateBook(Connection conn, int bookcode) {
			return null;
		}
		
		
		// 관리자 도서 추가용
		public int insertBook(Connection conn, Book b) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "insert into book values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default)";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, b.getBookCode());
				pstmt.setString(2, b.getBookTitle());
				pstmt.setString(3, b.getAuthor());
				pstmt.setString(4, b.getPublisher());
				pstmt.setDate(5, b.getPublishDate());
				pstmt.setInt(6, b.getBookPage());
				pstmt.setString(7, b.getBookInfo());
				pstmt.setString(8, b.getBookOimg());
				pstmt.setString(9, b.getBookRimg());
				pstmt.setString(10, b.getBookOpdf());
				pstmt.setString(11, b.getBookRpdf());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
		// 관리자 제작대기 도서 조회용
		public ArrayList<Book> selectWaitBook(Connection conn) {
			ArrayList<Book> wbList = new ArrayList<Book>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from book where makestatus = 'WAIT'";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Book b = new Book();
					b.setBookCode(rset.getString("bookcode"));
					
					wbList.add(b);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return wbList;
		}
		
		// 관리자 제작중인 도서 조회용
		public ArrayList<Book> selectMakeBook(Connection conn){
			ArrayList<Book> mbList = new ArrayList<Book>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from book where makestatus = 'MAKE'";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Book b = new Book();
					b.setBookCode(rset.getString("bookcode"));
					
					mbList.add(b);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return mbList;
		}
		
		
		// 관리자 제작 완료 도서 조회용
		public ArrayList<Book> selectDoneBook(Connection conn){
			ArrayList<Book> dbList = new ArrayList<Book>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from book where makestatus = 'DONE'";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Book b = new Book();
					b.setBookCode(rset.getString("bookcode"));
					
					dbList.add(b);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return dbList;
		}
		
		//////////////////////////////////////////////////////////////////////////////////////////
		
		
		// bookSearch 도서전체목록
		public ArrayList<Book> selectAll2(Connection conn){
	        ArrayList<Book> blist = new ArrayList<Book>();
	        Statement stmt = null;
			ResultSet rset = null;
			String query = "select * from book";
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Book b = new Book();
					
					b.setBookCode(rset.getString("bookCode"));
					b.setBookTitle(rset.getString("bookTitle"));
					b.setAuthor(rset.getString("author"));
					b.setPublisher(rset.getString("publisher"));
					b.setPublishDate(rset.getDate("publishdate"));
					b.setBookPage(rset.getInt("bookpage"));
					b.setBookInfo(rset.getString("bookinfo"));
					b.setBookOimg(rset.getString("bookoimg"));
					b.setBookRimg(rset.getString("bookrimg"));
					b.setBookOpdf(rset.getString("bookopdf"));
					b.setBookRpdf(rset.getString("bookrpdf"));
					b.setBookDate(rset.getDate("bookdate"));
					b.setBookViews(rset.getInt("bookviews"));
					b.setMakeStatus(rset.getString("makestatus"));
					
					blist.add(b);	
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return blist;
		}
		
		
		// bookSearch 도서한권만 검색
		
		public Book selectOne(Connection conn, int bookcode) {
			Book book = null;
			
			return book;
		}
		
		// bookSearch 도서제목명 검색
		public ArrayList<Book> selectTitleSearch(Connection conn, String keyword){
			ArrayList<Book> list = new ArrayList<Book>();
			
			return list;
		}
		
		//도서저자명검색
		
		public ArrayList<Book> selectAuthorSearch(Connection conn, String keyword){
			ArrayList<Book> list = new ArrayList<Book>();
			
			return list;
		}


}
