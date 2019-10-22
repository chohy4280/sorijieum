package adminmemo.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import adminmemo.model.dao.AdminMemoDao;
import adminmemo.model.vo.AdminMemo;
import static common.JDBCTemplate.*;


public class AdminMemoService {
	//의존성 주입
	public AdminMemoDao admemoDao = new AdminMemoDao();
	
	public AdminMemoService() {}
	
	
	// 관리자 서비스 *********************************************
	// 관리자 메모 전체보기
	public ArrayList<AdminMemo> selectAll(String userid){
		Connection conn = getConnection();
		ArrayList<AdminMemo> list = admemoDao.selectAll(conn, userid);
		close(conn);
		return list;
	}
	
	// 관리자 메모 등록용
	public int insertAdminMemo(AdminMemo admemo) {
		Connection conn = getConnection();
		int result = admemoDao.insertAdminMemo(conn, admemo);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	// 관리자 메모 삭제용
	public int deleteAdminMemo(int memono) {
		Connection conn = getConnection();
		int result = admemoDao.deleteAdminMemo(conn, memono);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
}
