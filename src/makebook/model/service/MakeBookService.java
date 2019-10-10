package makebook.model.service;

import java.util.ArrayList;

import makebook.model.dao.MakeBookDao;
import makebook.model.vo.MakeBook;

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

}
