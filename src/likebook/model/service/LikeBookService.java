package likebook.model.service;

import java.util.ArrayList;

import likebook.model.dao.LikeBookDao;
import likebook.model.vo.LikeBook;

public class LikeBookService {
	
	//의존성 주입
	public LikeBookDao lbDao = new LikeBookDao();
	
	public LikeBookService() {}

	//관심도서 목록
	public ArrayList<LikeBook> selectLikeBookList(String userid) {
		return null;
	}
	
	//관심도서 삭제
	public int deleteLikeBook(String userid, String bookCode) {
		return 0;
	}

  // 관리자 서비스 *******************************************
	// 이용자 관심도서 조회용
	public ArrayList<LikeBook> selectUserLikebookList(String userid){
		return null;
	}

}
