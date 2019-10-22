package book.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import book.model.vo.Book;
import book.model.vo.BookDV;
import bookmaking.model.vo.BookMaking;

public class BookDao {

	public BookDao() {}
	
	
	// 관리자용 dao************************************************************************************************
	// 관리자 도서 전체 목록 조회용
		public ArrayList<Book> selectAll(Connection conn){	
			ArrayList<Book> list = new ArrayList<Book>();
			Statement stmt = null;
			ResultSet rset = null;
			String query = "select * from book where bookdelyn = 'N'";
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
					b.setBookDelYN(rset.getString("bookdelyn"));
					
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
		public ArrayList<Book> selectBookSearch(Connection conn, String searchtype, String keyword, String makestatus){
			ArrayList<Book> list = new ArrayList<Book>();
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = null;
			if(keyword == null) {					// case1)검색어가 없고
				if(makestatus.equals("ALL") == true)	// case1-1) 전체
					query = "select * from (select * from book where bookdelyn = 'N') where makestatus in ('WAIT', 'MAKE', 'DONE')";
				else									// case1-2) 상태선택
					query = "select * from (select * from book where bookdelyn = 'N') where makestatus = '" + makestatus + "'";
			} else {								// case2)검색어가 있고
				if(makestatus.equals("ALL") == true)	// case2-1) 전체
					query = "select * from (select * from book where bookdelyn = 'N') where " + searchtype + " like '%" + keyword + "%' and makestatus in ('WAIT', 'MAKE', 'DONE')";
				else									// case2-2) 상태선택
					query = "select * from (select * from book where bookdelyn = 'N') where " + searchtype + " like '%" + keyword + "%' and makestatus = '" + makestatus + "'";
			}
			

			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				
				while(rset.next()) {
					Book b = new Book();
					b.setBookCode(rset.getString("bookcode"));
					b.setBookTitle(rset.getString("booktitle"));
					b.setAuthor(rset.getString("author"));
					b.setPublisher(rset.getString("publisher"));
					b.setMakeStatus(rset.getString("makestatus"));
					b.setBookDate(rset.getDate("bookdate"));
					
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
		
		
		// 관리자 도서 삭제용
		public int deleteBook(Connection conn, String bookcode) {
			return 0;
		}
		
		
		// 관리자 도서 한개 정보 불러오기용
		public BookDV selectBookOne(Connection conn, String bookcode) {
			BookDV book = null;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from (select * from book join bookmaking using(bookcode) where bookdelyn = 'N') where bookcode = '" + bookcode + "'";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					book = new BookDV();
					
					book.setBookTitle(rset.getString("booktitle"));
					book.setAuthor(rset.getString("author"));
					book.setPublisher(rset.getString("publisher"));
					book.setPublishDate(rset.getDate("publishdate"));
					book.setBookPage(rset.getInt("bookpage"));
					book.setBookCode(bookcode);
					book.setBookInfo(rset.getString("bookinfo"));
					book.setBookOimg(rset.getString("bookoimg"));
					book.setBookRimg(rset.getString("bookrimg"));
					book.setBookOpdf(rset.getString("bookopdf"));
					book.setBookRpdf(rset.getString("bookrpdf"));
					book.setBookotxt(rset.getString("bookotxt"));
					book.setBookrtxt(rset.getString("bookrtxt"));
				
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			return book;
		}
		
		
		// 관리자 도서 정보 수정용
		public Book updateBook(Connection conn, String bookcode) {
			return null;
		}
		
		
		// 관리자 도서 추가용
		public int insertBook(Connection conn, Book b) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "insert into book values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, default, default, default, default)";
			
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
			
			String query = "select * from (select * from book where bookdelyn = 'N') where makestatus = 'WAIT'";
			
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
			
			String query = "select * from (select * from book where bookdelyn = 'N') where makestatus = 'MAKE'";
			
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
			
			String query = "select * from (select * from book where bookdelyn = 'N') where makestatus = 'DONE'";
			
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
		
		 //도서 총 갯수   
		public int getListCount(Connection conn) {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select count(*) from book where bookdelyn = 'N' and MAKESTATUS ='DONE'";
			
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
		
		// bookSearch 도서한권만 검색
		public Book selectOne(Connection conn, String bookcode) {
			Book book = null;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "select * from book where bookdelyn = 'N' and MAKESTATUS ='DONE' and bookcode = '" + bookcode+ "'";
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					book = new Book();
					
					book.setBookCode(bookcode);
					book.setBookTitle(rset.getString("booktitle"));
					book.setAuthor(rset.getString("author"));
					book.setPublisher(rset.getString("publisher"));
					book.setPublishDate(rset.getDate("publishdate"));
					book.setBookInfo(rset.getString("bookinfo"));
					book.setBookRimg(rset.getString("bookrimg"));
	}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			return book;
		}
		

         //도서전체목록 페이징
		public ArrayList<Book> selectList(Connection conn, int startRow, int endRow) {
			ArrayList<Book> list = new ArrayList<Book>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query ="SELECT * FROM (SELECT ROWNUM RNUM,Author, BOOKCODE,BOOKTITLE, BOOKRIMG " + 
					"FROM(SELECT * FROM BOOK " + 
					"where bookdelyn = 'N' and MAKESTATUS ='DONE' " + 
					"ORDER BY BOOKTITLE)) " + 
					"WHERE RNUM >= ? AND RNUM <= ?";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Book book = new Book();
					book.setBookCode(rset.getString("bookcode"));
				    book.setAuthor(rset.getString("author"));
					book.setBookTitle(rset.getString("booktitle"));
					book.setBookRimg(rset.getString("bookrimg"));
					
					list.add(book);
				}
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}



		public ArrayList<Book> selectBookTitleAuthor(Connection conn,String search, String keyword, int startRow, int endRow) {
			ArrayList<Book> list = new ArrayList<Book>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "SELECT * FROM (SELECT ROWNUM RNUM, BOOKCODE, BOOKTITLE, AUTHOR, BOOKRIMG "+ 
					        "FROM(SELECT * FROM BOOK " +
							"WHERE " + search + " LIKE '%" + keyword + "%' " +
							"AND bookdelyn = 'N' and MAKESTATUS ='DONE' "+
							"ORDER BY BOOKTITLE)) " +
							"WHERE RNUM >= ? AND RNUM <= ?";
					
		
		
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					Book b = new Book();
					
					b.setBookCode(rset.getString("bookcode"));
					b.setBookTitle(rset.getString("booktitle"));
					b.setAuthor(rset.getString("author"));
					b.setBookRimg(rset.getString("bookrimg"));
					list.add(b);
				
				} 
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
			close(rset);
			close(pstmt);
		}

       return list;


		}


		public BookMaking selectPlay(Connection conn, String bookcode) {
			BookMaking bookmaking = null;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "SELECT BOOKRTXT FROM BOOKMAKING WHERE BOOKCODE = '" + bookcode + "'" ;
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					bookmaking = new BookMaking();
					
					bookmaking.setBookcode(bookcode);
					bookmaking.setBookrtxt(rset.getString("bookrtxt"));
					
	}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			return bookmaking;
		}

}
