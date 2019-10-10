package likebook.model.service;

import java.util.ArrayList;

import likebook.model.dao.LikeBookDao;
import mybook.model.vo.MyBook;

public class LikeBookService {
	
	//의존성 주입
	public LikeBookDao lbDao = new LikeBookDao();
	
	public LikeBookService() {}
	
	
	// 관리자 서비스 *******************************************
	// 이용자 관심도서 조회용
	public ArrayList<MyBook> selectUserLikebookList(String userid){
		return null;
	}

}
