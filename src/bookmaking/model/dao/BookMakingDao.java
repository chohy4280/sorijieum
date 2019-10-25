package bookmaking.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import book.model.vo.Book;
import book.model.vo.BookMakingProgress;
import bookmaking.model.vo.BookMaking;

public class BookMakingDao {

	public BookMakingDao() {}
	
	public ArrayList<BookMakingProgress> selectWaitMakeBookAll(Connection conn) {
		ArrayList<BookMakingProgress> list = new ArrayList<BookMakingProgress>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from book join bookmaking using(bookcode)";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookMakingProgress bookmp = new BookMakingProgress();
				bookmp.setBookRimg(rset.getString("bookrimg"));
				bookmp.setBookCode(rset.getString("bookcode"));
				bookmp.setBookPage(rset.getInt("bookpage"));
				bookmp.setMakepage(rset.getInt("makepage"));
				bookmp.setBookRimg(rset.getString("bookrimg"));
				bookmp.setBookTitle(rset.getString("booktitle"));
				bookmp.setAuthor(rset.getString("author"));
				bookmp.setBookInfo(rset.getString("bookinfo"));
				bookmp.setPublisher(rset.getString("publisher"));
				list.add(bookmp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	public ArrayList<BookMakingProgress> selectWaitingBook(Connection conn){
		ArrayList<BookMakingProgress> waitlist = new ArrayList<BookMakingProgress>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from book join bookmaking using(bookcode) where makestatus = 'WAIT'";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookMakingProgress bookmp = new BookMakingProgress();
				bookmp.setBookRimg(rset.getString("bookrimg"));
				bookmp.setBookCode(rset.getString("bookcode"));
				bookmp.setBookTitle(rset.getString("booktitle"));
				waitlist.add(bookmp);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return waitlist;
	}
	
	public ArrayList<BookMakingProgress> selectMakingBook(Connection conn){
		ArrayList<BookMakingProgress> makelist = new ArrayList<BookMakingProgress>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book join bookmaking using(bookcode) where makestatus = 'MAKE'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookMakingProgress bookmp = new BookMakingProgress();
				bookmp.setBookRimg(rset.getString("bookrimg"));
				bookmp.setBookCode(rset.getString("bookcode"));
				bookmp.setBookPage(rset.getInt("bookpage"));
				bookmp.setMakepage(rset.getInt("makepage"));
				bookmp.setBookTitle(rset.getString("booktitle"));
				makelist.add(bookmp);
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
		int wcount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) from book where makestatus = 'WAIT'";

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
	
	public ArrayList<BookMakingProgress> selectWaitingBookList(Connection conn, int startRow, int endRow){
		ArrayList<BookMakingProgress> wlist = new ArrayList<BookMakingProgress>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, BOOKCODE, BOOKRIMG, BOOKTITLE " 
						+ " FROM (SELECT * FROM BOOK " 
						+ " WHERE MAKESTATUS = 'WAIT'" 
						+ "	ORDER BY BOOKDATE ASC)) " 
						+ "	WHERE RNUM >= ? AND RNUM <= ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				BookMakingProgress bookmp = new BookMakingProgress();
				bookmp.setBookCode(rset.getString("bookcode"));
				bookmp.setBookRimg(rset.getString("bookrimg"));
				bookmp.setBookTitle(rset.getString("booktitle"));
				wlist.add(bookmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return wlist;
	}
	
	public int getListCountMaking(Connection conn){
		int mcount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) from book where makestatus = 'MAKE'";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				mcount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return mcount;
	}
	
	public ArrayList<BookMakingProgress> selectMakingBookList(Connection conn, int startRow, int endRow){
		ArrayList<BookMakingProgress> mlist = new ArrayList<BookMakingProgress>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, BOOKCODE, BOOKRIMG, BOOKPAGE, MAKEPAGE, BOOKTITLE " 
						+ " FROM (SELECT * FROM BOOK JOIN BOOKMAKING USING(BOOKCODE) " 
						+ " WHERE MAKESTATUS = 'MAKE'" 
						+ "	ORDER BY BOOKDATE ASC)) " 
						+ "	WHERE RNUM >= ? AND RNUM <= ?";

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				BookMakingProgress bookmp = new BookMakingProgress();
				bookmp.setBookCode(rset.getString("bookcode"));
				bookmp.setBookRimg(rset.getString("bookrimg"));
				bookmp.setBookPage(rset.getInt("bookpage"));
				bookmp.setMakepage(rset.getInt("makepage"));
				bookmp.setBookTitle(rset.getString("booktitle"));
				mlist.add(bookmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return mlist;
	}
	
	public BookMakingProgress selectMakingBookOne(Connection conn, String bookrimg){
		BookMakingProgress bookmp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book join bookmaking using(bookcode) where bookrimg = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookrimg);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bookmp = new BookMakingProgress();
				bookmp.setBookCode(rset.getString("bookcode"));
				bookmp.setBookRimg(rset.getString("bookrimg"));
				bookmp.setBookTitle(rset.getString("booktitle"));
				bookmp.setAuthor(rset.getString("author"));
				bookmp.setBookInfo(rset.getString("bookinfo"));
				bookmp.setPublisher(rset.getString("publisher"));
				bookmp.setBookPage(rset.getInt("bookpage"));
				bookmp.setMakepage(rset.getInt("makepage"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return bookmp;
	}

	public int getMakedBookCount(Connection conn) {
		int dcount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) from book where makestatus = 'DONE'";

		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if (rset.next()) {
				dcount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return dcount;
	}
  
	public ArrayList<Book> selectBookLoadText(Connection conn, String bookcode) {
		ArrayList<Book> txtlist = new ArrayList<Book>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book where bookcode = '" + bookcode + "'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				Book book = new Book();
				book.setBookCode(rset.getString("bookcode"));
				book.setBookRtxt(rset.getString("bookrtxt"));
				txtlist.add(book);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return txtlist;
	}

	public BookMakingProgress selectBookMakingPopupLoad(Connection conn, String bookcode, String userid) {
		BookMakingProgress bmp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book join bookmaking using (bookcode) join bookmakingcheck using (bookcode) where bookcode = '" + bookcode + "'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bmp = new BookMakingProgress();
				bmp.setBookCode(rset.getString("bookcode"));
				bmp.setBookPage(rset.getInt("bookpage"));
				bmp.setMakepage(rset.getInt("makepage"));
				bmp.setBookTitle(rset.getString("booktitle"));
				bmp.setBookmakestartstatus(rset.getString("bookmakestartstatus"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return bmp;
	}
	
	public BookMakingProgress selectBookMakingMainLoad(Connection conn, String bookcode, String userid) {
		BookMakingProgress bmp = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book join bookmaking using (bookcode) join bookmakingcheck using (bookcode) where bookcode = '" + bookcode + "'";
		
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bmp = new BookMakingProgress();
				bmp.setBookCode(rset.getString("bookcode"));
				bmp.setBookPage(rset.getInt("bookpage"));
				bmp.setMakepage(rset.getInt("makepage"));
				bmp.setBookTitle(rset.getString("booktitle"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return bmp;
	}
	
	public int bookMakingInsert(Connection conn, String bookcode, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "insert into bookmakingcheck values(?, NULL, 'Y', NULL, DEFAULT, ?)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookcode);
			pstmt.setString(2, userid);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int bookMakingUpdate(Connection conn, String bookcode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update book set makestatus = 'MAKE' where bookcode = '" + bookcode + "'";
		try {
			pstmt = conn.prepareStatement(query);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int inputInsert(Connection conn, BookMakingProgress bmp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update bookmakingcheck set booktitle = ?, bookmaketxt = ?, bookmakepage = ?, userid = ? where bookcode = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bmp.getBookTitle());
			pstmt.setString(2, bmp.getBookmaketxt());
			pstmt.setInt(3, bmp.getBookmakepage());
			pstmt.setString(4, bmp.getUserid());
			pstmt.setString(5, bmp.getBookCode());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int inputUpdate(Connection conn, BookMakingProgress bmp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update bookmakingcheck set bookmaketxt = ? where bookcode = ? and bookmakepage = ?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bmp.getBookmaketxt());
			pstmt.setString(2, bmp.getBookCode());
			pstmt.setInt(3, bmp.getBookmakepage());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	public int inputMakeBook(Connection conn, BookMakingProgress bmp) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "insert into makebook values (?, ?, sysdate)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bmp.getUserid());
			pstmt.setString(2, bmp.getBookCode());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//************************************************************************************
	
	// 관리자 도서 추가 시 bookmaking 테이블에도 추가
		public int insertBook(Connection conn, Book b) {
			int result = 0;
			PreparedStatement pstmt = null;
			
			/*String query = "insert into bookmaking(bookcode) select bookcode from book where bookcode = '" + b.getBookCode() + "'";*/
			String query = "insert into bookmaking values (?, sysdate, null, null, null, 0)";
					
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, b.getBookCode());
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			return result;
		}
		
	// 관리자 도서 추가시 bookmakingcheck 테이블에도 추가
		public int insertBookMakeCheck(Connection conn, Book b) {
			int result = 0;
			PreparedStatement pstmt = null;
			String query = "";
			for (int i = 0; i <= b.getBookPage(); i++) {
				if (i % 10 == 0) {
					query = "insert into bookmakingcheck values(?, NULL, DEFAULT, NULL, " + i+1 + ", NULL)";
				}
	
				try {
					pstmt = conn.prepareStatement(query);
					pstmt.setString(1, b.getBookCode());
					result = pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
			}
			return result;
		}

	public BookMaking selectPlay(Connection conn, String bookcode) {
			return null;
		}

}
