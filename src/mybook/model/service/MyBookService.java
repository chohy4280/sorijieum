package mybook.model.service;

import java.util.ArrayList;

import mybook.model.dao.MyBookDao;
import mybook.model.vo.MyBook;

public class MyBookService {
	
	//의존성 주입
	public MyBookDao mbDao = new MyBookDao();
	
	public MyBookService() {}
	
	//내서재 목록
	public ArrayList<MyBook> selectMyBookList(String userId) {
		return null;
	}
	
	//내서재 삭제
	public int deleteMyBook(String userid, String bookCode) {
		return 0;
	}
}
