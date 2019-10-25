package adminmemo.model.dao;

import static common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import adminmemo.model.vo.AdminMemo;

public class AdminMemoDao {

	
	public AdminMemoDao() {}
	
	
	// 관리자 Dao *********************************************
	// 관리자 메모 전체보기
	public ArrayList<AdminMemo> selectAll(Connection conn, String userid, int startRow, int endRow){
		ArrayList<AdminMemo> list = new ArrayList<AdminMemo>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from (select rownum rnum, memono, adminmemo, adminid, memodate from (select * from adminmemo where userid = ? order by memodate desc)) where rnum between ? and ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, userid);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				AdminMemo memo = new AdminMemo();
				memo.setUserId(userid);
				memo.setMemoNo(rset.getInt("memono"));
				memo.setMemoDate(rset.getDate("memodate"));
				memo.setAdminMemo(rset.getString("adminmemo"));
				memo.setAdminId(rset.getString("adminid"));
				
				list.add(memo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	
	// 관리자 메모 등록용
	public int insertAdminMemo(Connection conn, AdminMemo admemo) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into adminmemo values (SEQ_MEMONO.NEXTVAL, ?, ?, ?, sysdate)";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, admemo.getUserId());
			pstmt.setString(2, admemo.getAdminId());
			pstmt.setString(3, admemo.getAdminMemo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 관리자 메모 삭제용
	public int deleteAdminMemo(Connection conn, int memono) {
		int result = 0;
		Statement stmt = null;
		
		String query = "delete adminmemo where memono = " + memono;
		
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

	// 메모 갯수 조회
	public int getListCountAdmin(Connection conn, String userid) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from adminmemo where userid = '" + userid + "'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				listCount = rset.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
}
