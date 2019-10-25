package likebook.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import likebook.model.dao.LikeBookDao;
import likebook.model.vo.LikeBook;
import likebook.model.vo.adminLikeBook;

public class LikeBookService {
	
	//의존성 주입
	public LikeBookDao lbDao = new LikeBookDao();
	
	public LikeBookService() {}

	//관심도서 목록
	public ArrayList<LikeBook> selectLikeBookList(String userid) {
		return null;
	}
	
	//관심도서 삭제
	public int deleteLikeBook(String userid, String bookCode) {
		return 0;
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

}
