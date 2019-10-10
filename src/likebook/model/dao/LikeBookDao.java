package likebook.model.dao;

import static common.JDBCTemplate.*;

import java.util.ArrayList;

import mybook.model.vo.MyBook;

public class LikeBookDao {
	
	public LikeBookDao() {}
	
	// 관리자용 dao************************************************************************************************
	// 이용자 관심도서 조회용
	public ArrayList<MyBook> selectUserLikebookList(String userid){
		return null;
	}

}
