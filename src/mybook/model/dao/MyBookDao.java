package mybook.model.dao;

import java.sql.*;
import java.util.ArrayList;

import mybook.model.vo.MyBook;

public class MyBookDao {

	public MyBookDao() {}
	
	
	// 관리자용 dao************************************************************************************************
		// 이용자 읽은 도서 조회용
		public ArrayList<MyBook> selectUserReadbookList(Connection conn, String userid){
			return null;
		}
}
