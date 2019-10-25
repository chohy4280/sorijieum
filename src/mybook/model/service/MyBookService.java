package mybook.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import mybook.model.dao.MyBookDao;
import mybook.model.vo.MyBook;
import mybook.model.vo.adminMyBook;

public class MyBookService {
	
	//의존성 주입
	public MyBookDao mbDao = new MyBookDao();
	
	public MyBookService() {}

	//내서재 목록
	public ArrayList<MyBook> selectMyBookList(String userId) {
		return null;
	}
	
	//내서재 삭제
	public int deleteMyBook(String userid, String bookCode) {
		return 0;
	}
  
  	//관리자 서비스****************************************
	// 이용자 읽은 도서 조회용
	public ArrayList<adminMyBook> selectUserReadbookList(String userid, int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<adminMyBook> list = mbDao.selectUserReadbookList(conn, userid, startRow, endRow);
		close(conn);
		return list;
	}
	// 이용자 읽은 도서 리스트카운트용
	public int getListCountAdmin(String userid) {
		Connection conn = getConnection();
		int listCount = mbDao.getListCountAdmin(conn, userid);
		close(conn);
		return listCount;
	}
}
