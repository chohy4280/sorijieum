package makebook.model.dao;

import java.sql.Connection;
import static common.JDBCTemplate.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import makebook.model.vo.MakeBook;

public class MakeBookDao {
	
	public MakeBookDao() {}
	
	//참여도서 목록
	public ArrayList<MakeBook> selectMakeBookList(Connection conn, String userid, int startnum, int endnum){
		ArrayList<MakeBook> mblist = new ArrayList<MakeBook>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from makebook where userid=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				MakeBook mb = new MakeBook();
				mb.setUserId(userid);
				mb.setBookCode(rset.getString("bookcode"));
				mb.setMakeDate(rset.getDate("makedate"));
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
	public int deleteMakeBook(Connection conn, String userid, int bookCode) {
		return 0;
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
	public ArrayList<MakeBook> selectMakerMakebookList(Connection conn, String userid){
		return null;
	}

	
}
