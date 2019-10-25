package makebook.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import makebook.model.dao.MakeBookDao;
import makebook.model.vo.MakeBook;
import makebook.model.vo.adminMakeBook;

public class MakeBookService {
	
	//의존성 주입
	public MakeBookDao mbDao = new MakeBookDao();
	
	public MakeBookService() {}

	//참여도서 목록
	public ArrayList<MakeBook> selectMakeBookList(String userid){
		return null;
	}
	
	//참여도서 삭제
	public int deleteMakeBook(String userid, int bookCode) {
		return 0;
	}
  
	// 관리자 서비스 *******************************************
	// 제작자 제작도서 조회용
	public ArrayList<adminMakeBook> selectMakerMakebookList(String userid, int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<adminMakeBook> list = mbDao.selectMakerMakebookList(conn, userid, startRow, endRow);
		close(conn);
		return list;
	}

	// 관리자 제작자 제작도서 리스트카운트용
	public int getListCountAdmin(String userid) {
		Connection conn = getConnection();
		int listCount = mbDao.getListCountAdmin(conn, userid);
		close(conn);
		return listCount;
	}

}
