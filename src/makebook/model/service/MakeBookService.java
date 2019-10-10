package makebook.model.service;

import java.util.ArrayList;

import makebook.model.dao.MakeBookDao;
import mybook.model.vo.MyBook;

public class MakeBookService {
	
	//의존성 주입
	public MakeBookDao mbDao = new MakeBookDao();
	
	public MakeBookService() {}
	
	// 관리자 서비스 *******************************************
	// 제작자 제작도서 조회용
	public ArrayList<MyBook> selectMakerMakebookList(String userid){
		return null;
	}

}
