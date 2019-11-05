package mybook.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import mybook.model.vo.MyBook;
import mybook.model.vo.MyBookMYB;
import mybook.model.vo.adminMyBook;

public class MyBookDao {

	public MyBookDao() {}
	
  //내서재 목록
	public ArrayList<MyBookMYB> selectMyBookList(Connection conn, String userid) {
		ArrayList<MyBookMYB> myblist =  new ArrayList<MyBookMYB>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		  
		String query = "select * from book b join mybook my on b.bookcode=my.bookcode where my.userid=? order by readrdate desc";
		 
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyBookMYB myb = new MyBookMYB();
				myb.setBookcode(rset.getString("bookcode"));
				myb.setUserid(rset.getString("userid"));
				myb.setBooktitle(rset.getString("booktitle"));
				myb.setAuthor(rset.getString("author"));
				myb.setPublisher(rset.getString("publisher"));
				myb.setPublishdate(rset.getDate("publishdate"));
				myb.setBookpage(rset.getInt("bookpage"));
				myb.setReadpage(rset.getInt("readpage"));
				myb.setBookoimg(rset.getString("bookoimg"));
				myb.setBookrimg(rset.getString("bookrimg"));
				myb.setReadsdate(rset.getDate("readsdate"));
				myb.setReadrdate(rset.getDate("readrdate"));
				myblist.add(myb);
			}
		} catch (SQLException e) {
		e.printStackTrace();
		} finally {
		close(rset);
		close(pstmt);
		}
		  	  
		return myblist;
	}

	//내서재 삭제
	public int deleteMyBook(Connection conn, String userid, String bookcode) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from mybook where userid=? and bookcode=?";
		
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
	
	//내서재 검색
	public ArrayList<MyBookMYB> searchMyBookList(Connection conn, String userid, String keyword) {
		ArrayList<MyBookMYB> myblist = new ArrayList<MyBookMYB>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from book b join mybook my on b.bookcode=my.bookcode where my.userid=? and "+
					"b.booktitle like ? or b.author like ? order by readrdate desc";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setString(2, "%"+ keyword +"%");
			pstmt.setString(3, "%"+ keyword +"%");
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				MyBookMYB myb = new MyBookMYB();
				myb.setBookcode(rset.getString("bookcode"));
				myb.setUserid(rset.getString("userid"));
				myb.setBooktitle(rset.getString("booktitle"));
				myb.setAuthor(rset.getString("author"));
				myb.setPublisher(rset.getString("publisher"));
				myb.setPublishdate(rset.getDate("publishdate"));
				myb.setBookpage(rset.getInt("bookpage"));
				myb.setReadpage(rset.getInt("readpage"));
				myb.setBookoimg(rset.getString("bookoimg"));
				myb.setBookrimg(rset.getString("bookrimg"));
				myb.setReadsdate(rset.getDate("readsdate"));
				myb.setReadrdate(rset.getDate("readrdate"));
				myblist.add(myb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return myblist;
	}

  // 관리자용 dao************************************************************************************************
  // 이용자 읽은 도서 조회용
  public ArrayList<adminMyBook> selectUserReadbookList(Connection conn, String userid, int startRow, int endRow){
	ArrayList<adminMyBook> list = new ArrayList<adminMyBook>();
	PreparedStatement pstmt = null;
	ResultSet rset = null;
	
	String query = "select * from (select rownum rnum, userid, bookcode, booktitle, author, publisher from( select * from mybook join book using (bookcode) where userid = ? order by booktitle)) where rnum between ? and ?";
	
	try {
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, userid);
		pstmt.setInt(2, startRow);
		pstmt.setInt(3, endRow);
		rset = pstmt.executeQuery();
		
		while(rset.next()) {
			adminMyBook mb = new adminMyBook();
			
			mb.setUserId(userid);
			mb.setBookCode(rset.getString("bookcode"));
			mb.setBookTitle(rset.getString("booktitle"));
			mb.setAuthor(rset.getString("author"));
			mb.setPublisher(rset.getString("publisher"));
			
			list.add(mb);
		}
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		close(rset);
		close(pstmt);
	}
	
    return list;
  }

  // 이용자 읽은도서 리스트카운트용
	public int getListCountAdmin(Connection conn, String userid) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from mybook join book using (bookcode) where userid = '" + userid + "' order by booktitle asc";
		
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
	/////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////////////
   //이용자가 도서를 읽은 적이 있다면 최신날짜 업데이트
	public int updateReadPage(Connection conn, String bookcode, String userId) {
		int result = 0;
   PreparedStatement pstmt = null;
		
		String query = "update book set rdate=sysdate where bookcode=? userid =? ";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookcode);
			pstmt.setString(2, userId);
			
			result = pstmt.executeUpdate();
		} catch ( SQLException e) {
			e.printStackTrace();
		}finally {
		close(pstmt);
		return result;
			}

	
}
	
	

	
	   //이용자가 새로운 책을 누른다면 내 서재에 readpage, userid, bookcode 추가
		public int insertReadPage(Connection conn, String bookcode, String userId) {
			int result = 0;
	   PreparedStatement pstmt = null;
			
			String query = "insert into mybook valuse(?,?,?,sysdate)";
			
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, bookcode);
				pstmt.setString(2, userId);
				pstmt.setInt(3, 1);
				
			
				result = pstmt.executeUpdate();
			} catch ( SQLException e) {
				e.printStackTrace();
			}finally {
			close(pstmt);
			return result;
				}
		}

		public MyBook selectBookPage(Connection conn, String bookcode, String userId) {
			MyBook mb = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			
			String query = "select * from mybook where  bookcode = ? userid = ? ";
					
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bookcode);
			pstmt.setString (2, userId);
			
			rset = pstmt.executeQuery();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
		close(rset);
		close(pstmt);
		}

		return mb;
		}
}
