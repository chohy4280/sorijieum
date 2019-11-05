package book.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import book.model.vo.Book;
import book.model.vo.BookDV;
import bookmaking.model.vo.BookMaking;

public class BookDao {

	public BookDao() {}
	
	
	// 관리자용 dao************************************************************************************************
	
	// 관리자용 전체 도서 리스트카운트용
	public int getListCountAdmin(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from book where bookdelyn = 'N'";
		
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
	

	
	// 관리자 도서 전체 목록 조회용
		public ArrayList<Book> selectAll(Connection conn, int startRow, int endRow){	
			ArrayList<Book> list = new ArrayList<Book>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "select * from (select rownum rnum, bookcode, booktitle, author, publisher, makestatus, bookdate "
										+ "from(select * from book where bookdelyn='N' order by bookdate desc)) where rnum between ? and ?";

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
					b.setPublisher(rset.getString("publisher"));
					b.setBookDate(rset.getDate("bookdate"));
					b.setMakeStatus(rset.getString("makestatus"));
					
					list.add(b);
				}
				
					
					
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}
		
		
		// 관리자 검색도서 리스트카운트용
		public int getListCountSelectBookSearch(Connection conn, String searchtype, String keyword, String makestatus){
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = null;
			
			if(keyword == null) {					// case1)검색어가 없고
				if(makestatus.equals("ALL") == true)	// case1-1) 전체
					query = "select count(*) from (select * from book where bookdelyn = 'N') where makestatus in ('WAIT', 'MAKE', 'DONE')";
				else									// case1-2) 상태선택
					query = "select count(*) from (select * from book where bookdelyn = 'N') where makestatus = '" + makestatus + "'";
			} else {								// case2)검색어가 있고
				if(makestatus.equals("ALL") == true)	// case2-1) 전체
					query = "select count(*) from (select * from book where bookdelyn = 'N') where " + searchtype + " like '%" + keyword + "%' and makestatus in ('WAIT', 'MAKE', 'DONE')";
				else									// case2-2) 상태선택
					query = "select count(*) from (select * from book where bookdelyn = 'N') where " + searchtype + " like '%" + keyword + "%' and makestatus = '" + makestatus + "'";
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
			
			
			

		
		// 관리자 도서 검색용
		public ArrayList<Book> selectBookSearch(Connection conn, String searchtype, String keyword, String makestatus, int startRow, int endRow){
			ArrayList<Book> list = new ArrayList<Book>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = null;
			String sentence = "select * from (select rownum rnum, bookcode, booktitle, author, publisher, makestatus, bookdate from(select * from book";
			if(keyword == null) {					// case1)검색어가 없고
				if(makestatus.equals("ALL") == true)	// case1-1) 전체
					query = sentence+" where bookdelyn='N' and makestatus in ('WAIT', 'MAKE', 'DONE') order by bookdate desc)) where rnum between ? and ?";
				else									// case1-2) 상태선택
					query = sentence+" where bookdelyn='N' and makestatus = '" + makestatus + "' order by bookdate desc)) where rnum between ? and ?";
			} else {								// case2)검색어가 있고
				if(makestatus.equals("ALL") == true)	// case2-1) 전체
					query = sentence+" where bookdelyn='N' and " + searchtype + " like '%" + keyword + "%' and makestatus in ('WAIT', 'MAKE', 'DONE') order by bookdate desc)) where rnum between ? and ?";
				else									// case2-2) 상태선택
					query = sentence+" where bookdelyn='N' and " + searchtype + " like '%" + keyword + "%' and makestatus = '" + makestatus + "' order by bookdate desc)) where rnum between ? and ?";
			}
			

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
					b.setPublisher(rset.getString("publisher"));
					b.setMakeStatus(rset.getString("makestatus"));
					b.setBookDate(rset.getDate("bookdate"));
					
					list.add(b);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			
			}
			return list;
		}
		
		

			
		
		// 관리자 도서 삭제용
		public int deleteBook(Connection conn, String bookcode) {
			int result = 0;
			Statement stmt = null;
			
			String query = "update book set bookdelyn = 'Y' where bookcode = '" + bookcode + "'";
			
			try {
				stmt = conn.createStatement();
				result = stmt.executeUpdate(query);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(stmt);
			}
			return result;
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
		public int updateBook(Connection conn, Book b) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "update book set booktitle=?, author=?, publisher=?, publishdate=?, bookpage=?, bookoimg=?, bookrimg=?, bookopdf=?, bookrpdf=?, bookinfo=? where bookcode=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, b.getBookTitle());
				pstmt.setString(2, b.getAuthor());
				pstmt.setString(3, b.getPublisher());
				pstmt.setDate(4, b.getPublishDate());
				pstmt.setInt(5, b.getBookPage());
				pstmt.setString(6, b.getBookOimg());
				pstmt.setString(7, b.getBookRimg());
				pstmt.setString(8, b.getBookOpdf());
				pstmt.setString(9, b.getBookRpdf());
				pstmt.setString(10, b.getBookInfo());
				pstmt.setString(11, b.getBookCode());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
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


	
		public Book selectPlayPage(Connection conn, String bookcode) {
			Book book = null;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "SELECT BOOKRTXT FROM BOOKMAKING WHERE BOOKCODE = '" + bookcode + "'" ;
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					book = new Book();
					
					book.setBookCode(bookcode);
					book.setBookRtxt(rset.getString("bookrtxt"));
					
	}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			return book;
		}


		public Book selectPlay(Connection conn, String bookcode) {
			Book book = null;
			Statement stmt = null;
			ResultSet rset = null;
			
			String query = "SELECT BOOKRTXT FROM BOOKMAKING "
					+ "JOIN BOOK ON BOOKMAKING.BOOKCODE = "
					+ "BOOK.BOOKCODE WHERE BOOK.BOOKCODE = '" + bookcode + "'" ;
			
			try {
				stmt = conn.createStatement();
				rset = stmt.executeQuery(query);
				
				if(rset.next()) {
					book = new Book();
					
					book.setBookCode(bookcode);
					book.setBookRtxt(rset.getString("bookrtxt"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			
			return book;

		}


		public int updateBookReadCount(Connection conn, String bookcode) { //도서조회수 증가
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "update book set bookviews=bookviews+1 where bookcode=? ";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, bookcode);
				
				result = pstmt.executeUpdate();
			} catch ( SQLException e) {
				e.printStackTrace();
			}finally {
			close(pstmt);
			return result;
		}
	}


		public ArrayList<Book> selectTop5(Connection conn) {
			ArrayList<Book> list = new ArrayList<Book>();
			
			Statement stmt = null;
			ResultSet rset = null;
			
			// 조회수 많은 순 상위 5개 조회
			String query = "select * " + 
					"from (select rownum rnum, bookcode, booktitle, bookviews " + 
					"from (select * from book " + 
					"order by bookviews desc)) " + 
					"where rnum >= 1 and rnum <= 5";
			
			try {
				stmt = conn.createStatement();			
				rset = stmt.executeQuery(query);
				
				while(rset.next()) {
					Book book = new Book();
					
					book.setBookCode(rset.getString("bookcode"));
					book.setBookTitle(rset.getString("booktitle"));
					book.setBookViews(rset.getInt("bookviews"));			
					
					list.add(book);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rset);
				close(stmt);
			}
			
			return list;
		}

		public int addLikeBook(Connection conn, String userId, String bookcode) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			String query = "insert into likebook values(?, ?, sysdate)";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, userId);
				pstmt.setString(2, bookcode);
				
				result=pstmt.executeUpdate();
				
				System.out.println("dao : " + query);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
			close(pstmt);
		}
			return result;
}

		//참여도서 불러오기용 *********************************************************************************
		/*public Book selectMakeBookOne(Connection conn, String bookcode) {
			Book book = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "select * from book join bookmaking on book.bookcode=bookmaking.bookcode "+
						"where book.bookcode=?";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, bookcode);
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					book.setBookTitle(rset.getString("booktitle"));
					book.setBookCode(rset.getString("bookcode"));
					book.setAuthor(rset.getString("author"));
					book.setPublisher(rset.getString("publisher"));
					book.setPublishDate(rset.getDate("PUBLISHDATE"));
					book.setBookPage(rset.getInt("BOOKPAGE"));
					book.setBookInfo(rset.getString("BOOKINFO"));
					book.setBookOimg(rset.getString("BOOKOIMG"));
					book.setBookRimg(rset.getString("BOOKRIMG"));
					book.setBookDate(rset.getDate("bookdate"));	
					book
					
					
			
					BOOKVIEWS	NUMBER
					MAKESTATUS	VARCHAR2(4 BYTE)
					BOOKDELYN	VARCHAR2(2 BYTE)
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return book;
		}*/

}
