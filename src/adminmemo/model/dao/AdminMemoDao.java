package adminmemo.model.dao;

import java.sql.*;
import java.util.ArrayList;

import adminmemo.model.vo.AdminMemo;

public class AdminMemoDao {

	
	public AdminMemoDao() {}
	
	
	// 관리자 Dao *********************************************
	// 관리자 메모 전체보기
	public ArrayList<AdminMemo> selectAll(Connection conn){
		return null;
	}
	
	// 관리자 메모 등록용
	public int insertAdminMemo(Connection conn, AdminMemo admemo) {
		return 0;
	}
	
	// 관리자 메모 삭제용
	public int deleteAdminMemo(Connection conn, int memono) {
		return 0;
	}
}
