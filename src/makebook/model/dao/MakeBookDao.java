package makebook.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import makebook.model.vo.MakeBook;
import makebook.model.vo.MakeBookBBM;
import makebook.model.vo.adminMakeBook;

public class MakeBookDao {
	
	public MakeBookDao() {}
	
	//참여도서 목록
	public ArrayList<MakeBookBBM> selectMakeBookList(Connection conn, String userid){
		ArrayList<MakeBookBBM> mblist = new ArrayList<MakeBookBBM>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from makebook mb,book b,bookmaking bm "+
					"where mb.bookcode = b.bookcode and mb.bookcode = bm.bookcode and mb.userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				MakeBookBBM mb = new MakeBookBBM();
				mb.setBookcode(rset.getString("bookcode"));
				mb.setBooktitle(rset.getString("booktitle"));
				mb.setBookrimg(rset.getString("bookrimg"));
				mb.setBookoimg(rset.getString("bookoimg"));
				mb.setAuthor(rset.getString("author"));
				mb.setPublisher(rset.getString("publisher"));
				mb.setPublishdate(rset.getDate("publishdate"));
				mb.setBookpage(rset.getInt("bookpage"));
				mb.setMakepage(rset.getInt("makepage"));
				mb.setMakestatus(rset.getString("makestatus"));
				mb.setBookdelyn(rset.getString("bookdelyn"));
				mb.setMakedate(rset.getDate("makedate"));
				mb.setUserid(userid);

				mblist.add(mb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return mblist;
	}
	
	//참여도서 삭제
	public int deleteMakeBook(Connection conn, String userid, String bookcode) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from makebook where userid=? and bookcode=?";
		
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
	
	//제작자 참여도서 개수 조회
	public int getListCount(Connection conn, String userid) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from makebook where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			if(rset.next())
				result = rset.getInt(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return result;
	}
	
	// 관리자 Dao *******************************************
	// 제작자 제작도서 조회용
	public ArrayList<adminMakeBook> selectMakerMakebookList(Connection conn, String userid, int startRow, int endRow){
		ArrayList<adminMakeBook> list = new ArrayList<adminMakeBook>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, userid, bookcode, booktitle, author, publisher from( select * from makebook join book using (bookcode) where userid = ? order by booktitle)) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				adminMakeBook mb = new adminMakeBook();
				
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

	public int getListCountAdmin(Connection conn, String userid) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from makebook join book using (bookcode) where userid = '" + userid + "' order by booktitle asc";
		
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
