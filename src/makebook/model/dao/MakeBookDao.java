package makebook.model.dao;

import java.sql.Connection;
import java.util.ArrayList;

import makebook.model.vo.MakeBook;

public class MakeBookDao {
	
	public MakeBookDao() {}
	
	//참여도서 목록
	public ArrayList<MakeBook> selectMakeBookList(Connection conn, String userid){
		return null;
	}
	
	//참여도서 삭제
	public int deleteMakeBook(Connection conn, String userid, int bookCode) {
		return 0;
	}

}
