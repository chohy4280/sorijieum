package bookmaking.model.dao;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import book.model.vo.Book;
import book.model.vo.BookMakingProgress;

public class BookMakingDao {

	public BookMakingDao() {}
	
	//도서제작상세정보용 전체리스트
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
	
	//도서제작 메인 제작해야할 도서 리스트
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
	
	//도서제작 메인 제작중 도서 리스트
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
	
	//제작해야할 도서 게시물 카운트
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
	
	//제작해야할 도서 리스트
	public ArrayList<BookMakingProgress> selectWaitingBookList(Connection conn, int startRow, int endRow){
		ArrayList<BookMakingProgress> wlist = new ArrayList<BookMakingProgress>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "SELECT * FROM (SELECT ROWNUM RNUM, BOOKCODE, BOOKRIMG, BOOKTITLE " 
						+ " FROM (SELECT * FROM BOOK " 
						+ " WHERE MAKESTATUS = 'WAIT'" 
						+ "	ORDER BY BOOKDATE DESC)) " 
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
	
	//제작중 도서 게시물 카운트
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
	
	//제작중 도서 리스트용
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
	
	//도서 상세정보 
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

	//제작완료 카운트
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
  
	//도서제작 추출 텍스트 파일 불러오기
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

	//도서제작 팝업창, 메인창 불러오기
	public ArrayList<BookMakingProgress> selectBookMakingPopupLoad(Connection conn, String bookcode, String userid) {
		ArrayList<BookMakingProgress> list = new ArrayList<BookMakingProgress>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book join bookmaking using (bookcode) join bookmakingcheck using (bookcode) where bookcode = '" + bookcode + "'";
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				BookMakingProgress bmp = new BookMakingProgress();
				bmp.setBookCode(rset.getString("bookcode"));
				bmp.setBookPage(rset.getInt("bookpage"));
				bmp.setMakepage(rset.getInt("makepage"));
				bmp.setBookTitle(rset.getString("booktitle"));
				bmp.setBookmakepage(rset.getInt("bookmakepage"));
				bmp.setBookmakestartstatus(rset.getString("bookmakestartstatus"));
				bmp.setBookmaketxt(rset.getString("bookmaketxt"));
				bmp.setBookcompleteyn(rset.getString("bookcompleteyn"));
				bmp.setUserid(rset.getString("userid"));
				bmp.setBookOpdf(rset.getString("bookopdf"));
				list.add(bmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
	
	//도서제작 제작하기 버튼 클릭시 동기화
	public int bookMakingInsert(Connection conn, String bookcode, String userid) {
		int result = 0;
		Statement stmt = null;
		String query = "UPDATE BOOKMAKINGCHECK SET BOOKMAKESTARTSTATUS = 'Y', USERID = '" + userid 
					+ "' WHERE BOOKCODE = '" + bookcode + "' AND BOOKMAKEPAGE = (SELECT MIN(BOOKMAKEPAGE) FROM BOOKMAKINGCHECK WHERE BOOKMAKESTARTSTATUS = 'N' AND BOOKCODE = '" + bookcode + "' )";
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
	
	//도서제작 제작 시작시 BOOK TABLE MAKESTATUS MAKE로 변경
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
	
	//도서제작 제작시 BOOKMAKING TABLE MAKESTART SYSDATE 변경
	public int insertBookMaking(Connection conn, String bookcode) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update bookmaking set makestart = sysdate where bookcode = '" + bookcode + "'";
				
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

	//도서제작 페이지 입력 저장
	public int inputInsert(Connection conn, BookMakingProgress bmp, int index) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "";
		for(int i = index*10+1; i <= index*10+10; i++) {
		if(bmp.getBookmakepage() == index*10+1) {
			query = "update bookmakingcheck set booktitle = ?, bookmaketxt = ? where bookcode = ? and bookmakepage = ?";
		}else if(bmp.getBookmakepage() != index*10+1){
			query = "insert into bookmakingcheck values(?, ?, 'Y', ?, ?, ?, DEFAULT)";
		}
		}
		try {
			pstmt = conn.prepareStatement(query);
			if(bmp.getBookmakepage() == index*10+1) {
				pstmt.setString(1, bmp.getBookTitle());
				pstmt.setString(2, bmp.getBookmaketxt());
				pstmt.setString(3, bmp.getBookCode());
				pstmt.setInt(4, bmp.getBookmakepage());
			}else if(bmp.getBookmakepage() != index*10+1){
				pstmt.setString(1, bmp.getBookCode());
				pstmt.setString(2, bmp.getBookTitle());
				pstmt.setString(3, bmp.getBookmaketxt());
				pstmt.setInt(4, bmp.getBookmakepage());
				pstmt.setString(5, bmp.getUserid());
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//도서제작 페이지 입력 수정
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
	
	//도서제작 제출 후 makebook 추가
	public int insertMakeBook(Connection conn, BookMakingProgress bmp) {
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
	
	//도서제작 제출 후 bookmaking table makepage 추가
	public int insertMakePage(Connection conn, BookMakingProgress bmp, String bookcode, int page, int bookendpage) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query ="";
		if(bmp.getBookCode() == null) {
			query = "insert into bookmaking values (?, SYSDATE, NULL, NULL, NULL, ?)";
		}else {
			query = "update bookmaking set MAKEPAGE = ? where bookcode = '" + bookcode + "'";
		}if(bmp.getBookCode() == null && page == bookendpage) {
			query = "update bookmaking set MAKEFIN = SYSDATE, MAKEPAGE = ? where bookcode = '" + bookcode + "'";
		}
		try {
			pstmt = conn.prepareStatement(query);
			if(bmp.getBookCode() == null) {
				pstmt.setString(1, bookcode);
				pstmt.setInt(2, page);
			}else {
				pstmt.setInt(1, page);
			}if(bmp.getBookCode() == null && page == bookendpage) {
				pstmt.setInt(1, page);
			}
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	//제출 성공시 제출yn 추가
	public int insertCompleteyn(Connection conn, BookMakingProgress bmp, int page, int endpage) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update bookmakingcheck set bookcompleteyn = 'Y' where bookcode = ? and bookmakepage between "+ page + " and " + endpage;
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
	
	//
	
	//도서 제출을 못했는데 저장된 제작데이터가 있을 때 수정처리
	public int deleteInput(Connection conn, String userid, String bookcode, int index, int bookpage, int makepage) {
		int result = 0;
		for(int i = index*10+1; i <= index*10+10; i++) {
		Statement pstmt = null;
		String query = "";
		if(i == index*10+1) {
			query = "UPDATE BOOKMAKINGCHECK SET BOOKMAKESTARTSTATUS = 'N', BOOKMAKETXT = NULL, USERID = NULL WHERE BOOKCODE = '" + bookcode + "' AND BOOKMAKEPAGE = " + i;
			
		}else if(i != index*10+1){
			query = "DELETE BOOKMAKINGCHECK WHERE BOOKCODE = '" + bookcode + "' AND BOOKMAKEPAGE = " + i;
			
		}
		System.out.println("Dao:" + userid+", "+bookcode+", "+index+", "+bookpage+","+makepage);
		System.out.println("query: "+query);
		try {
			pstmt = conn.createStatement();
			result += pstmt.executeUpdate(query);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		}
		return result;
	}
	
	//************************************************************************************
	// 관리자용
	// 관리자 도서 추가 시 bookmaking 테이블에도 추가
	public int insertBook(Connection conn, Book b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		/*String query = "insert into bookmaking(bookcode) select bookcode from book where bookcode = '" + b.getBookCode() + "'";*/
		String query = "insert into bookmaking values (?, null, null, null, null, 0)";
				
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
		for (int i = 0; i < b.getBookPage(); i++) {
			if (i % 10 == 0) {
				query = "insert into bookmakingcheck values(?, NULL, DEFAULT, NULL, " + (i+1) + ", NULL, DEFAULT)";
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, b.getBookCode());
				result = pstmt.executeUpdate();
				System.out.println(i+1);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
	}
		return result;
	}

	// 관리자 도서수정용
	public int updateBookadmin(Connection conn, Book b) {
		int result = 0;
		PreparedStatement pstmt = null;

		String query = "update bookmaking set bookotxt=?, bookrtxt=? where bookcode =?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, b.getBookOtxt());
			pstmt.setString(2, b.getBookRtxt());
			pstmt.setString(3, b.getBookCode());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}


}
