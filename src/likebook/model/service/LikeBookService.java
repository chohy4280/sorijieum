package likebook.model.service;

import static common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import likebook.model.dao.LikeBookDao;
import likebook.model.vo.LikeBookLB;
import likebook.model.vo.adminLikeBook;

public class LikeBookService {
	
	//의존성 주입
	public LikeBookDao lbDao = new LikeBookDao();
	
	public LikeBookService() {}

	//관심도서 목록
	public ArrayList<LikeBookLB> selectLikeBookList(String userid) {
		Connection conn = getConnection();
		ArrayList<LikeBookLB> lblist = lbDao.selectLikeBookList(conn, userid);
		close(conn);
		return lblist;
	}
	
	//관심도서 삭제
	public int deleteLikeBook(String userid, String bookCode) {
		Connection conn = getConnection();
		int result = lbDao.deleteLikeBook(conn, userid, bookCode);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	//관심도서 검색
	public ArrayList<LikeBookLB> searchLikeBookList(String userid, String type, String keyword) {
		Connection conn = getConnection();
		ArrayList<LikeBookLB> lblist = lbDao.searchLikeBookList(conn, userid, type, keyword);
		close(conn);
		return lblist;
	}
	
  // 관리자 서비스 *******************************************
	// 이용자 관심도서 조회용
	public ArrayList<adminLikeBook> selectUserLikebookList(String userid, int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<adminLikeBook> list = lbDao.selectUserLikebookList(conn, userid, startRow, endRow);
		close(conn);
		return list;
	}

	// 이용자 관심도서 리스트 카운트 용
	public int getListCountAdmin(String userid) {
		Connection conn = getConnection();
		int listCount = lbDao.getListCountAdmin(conn, userid);
		close(conn);
		return listCount;
	}

	   //관심도서 추가
	public int addLikeBook(String userId, String bookcode) {
		Connection conn = getConnection();
		int result = lbDao.addLikeBook(conn,userId,bookcode);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		    close(conn);
		    return result;
	}

	  //관심도서 삭제
	public int addDeleteLikeBook(String userId, String bookcode) {
		Connection conn = getConnection();
		int result = lbDao.addDeleteLikeBook(conn,userId,bookcode);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		    close(conn);
		    return result;
	}
}
