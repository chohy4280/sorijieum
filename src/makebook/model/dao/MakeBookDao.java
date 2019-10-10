package makebook.model.dao;

import java.sql.*;
import java.util.ArrayList;

import mybook.model.vo.MyBook;

public class MakeBookDao {
	
	public MakeBookDao() {}

	
	// 관리자 Dao *******************************************
	// 제작자 제작도서 조회용
	public ArrayList<MyBook> selectMakerMakebookList(Connection conn, String userid){
		return null;
	}
}
