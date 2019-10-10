package mybook.model.dao;

import java.sql.Connection;
import java.util.ArrayList;

import mybook.model.vo.MyBook;

public class MyBookDao {

	public MyBookDao() {}
	
	//내서재 목록
	public ArrayList<MyBook> selectMyBookList(Connection conn, String userId) {
		return null;
	}
	
	//내서재 삭제
	public int deleteMyBook(Connection conn, String userid, String bookCode) {
		return 0;
	}
}
