package likebook.model.dao;

import static common.JDBCTemplate.*;

import java.util.ArrayList;
import java.sql.*;
import likebook.model.vo.LikeBook;

public class LikeBookDao {
	
	public LikeBookDao() {}

	//관심도서 목록
	public ArrayList<LikeBook> selectLikeBookList(Connection conn, String userid) {
		return null;
	}
	
	//관심도서 삭제
	public int deleteLikeBook(Connection conn, String userid, String bookCode) {
		return 0;
	}

	// 관리자용 dao************************************************************************************************
	// 이용자 관심도서 조회용
	public ArrayList<LikeBook> selectUserLikebookList(String userid){
		return null;
	}

}
