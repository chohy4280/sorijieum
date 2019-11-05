package mybook.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import mybook.model.dao.MyBookDao;
import mybook.model.vo.MyBook;
import mybook.model.vo.MyBookMYB;
import mybook.model.vo.adminMyBook;

public class MyBookService {
	
	//의존성 주입
	public MyBookDao mbDao = new MyBookDao();
	
	public MyBookService() {}

	//내서재 목록
	public ArrayList<MyBookMYB> selectMyBookList(String userid) {
		Connection conn = getConnection();
		ArrayList<MyBookMYB> myblist = mbDao.selectMyBookList(conn, userid);
		close(conn);
		return myblist;
	}
	
	//내서재 삭제
	public int deleteMyBook(String userid, String bookCode) {
		Connection conn = getConnection();
		int result = mbDao.deleteMyBook(conn, userid, bookCode);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		return result;
	}
	
	//내서재 검색
	public ArrayList<MyBookMYB> searchMyBookList(String userid, String type, String keyword) {
		Connection conn = getConnection();
		ArrayList<MyBookMYB> myblist = mbDao.searchMyBookList(conn,userid,type,keyword);
		close(conn);
		return myblist;
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

	//이용자가 책을 읽은적이 있다면 최신날짜만 업데이트
	public int updateReadPage(String userId, String bookcode, MyBook mbb, int rpage) {
		Connection conn = getConnection();
		int result = mbDao.updateReadPage(conn, userId, bookcode, mbb, rpage);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}



	//이용자가 책을 읽은 적이 없다면 이어페이지 1추가
	public int insertReadPage(String userId, String bookcode, MyBook mbb, int rpage) {
		Connection conn = getConnection();
		int result = mbDao.insertReadPage(conn, userId, bookcode, mbb, rpage);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
     
	
	//도서상세보기에서 필요한 마이북 아이디
	public MyBook selectOneMyBookUser(String bookcode, String userId) {
		Connection conn = getConnection();
		MyBook mb = mbDao.selectOneMyBookUser(conn, bookcode, userId);
		close(conn);
		return mb;
	}

	public int updatePlayBook(String userId, String bookcode, int rpage) {
		Connection conn = getConnection();
		int result = mbDao.updatePlayBook(conn, bookcode, userId, rpage);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

}
