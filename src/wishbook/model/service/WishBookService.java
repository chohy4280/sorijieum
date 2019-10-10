package wishbook.model.service;

import static common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;

import wishbook.model.dao.WishBookDao;
import wishbook.model.vo.WishBook;

public class WishBookService {
	
	//의존성 주입
	public WishBookDao wbDao = new WishBookDao();
	
	public WishBookService() {}

	public ArrayList<WishBook> selectWaitWishBook() {
		Connection conn = getConnection();
		ArrayList<WishBook> wbWaitList = wbDao.selectWaitWishBook(conn);
		close(conn);
		return wbWaitList;
	}
	
	//도서신청 게시물 카운트
	public int getListCount(){
		return 0;
	}
	
	//도서신청 목록
	public ArrayList<WishBook> selectWishBookList(int startnum, int endnum){
		return null;
	}

	//도서신청 상세보기
	public WishBook selectWishBookOne(int wishno){
		return null;
	}

	//도서신청 게시물 수정
	public int updateWishBook(WishBook wishbook){
		return 0;
	}
	
	//도서신청 게시물 등록
	public int insertWishBook(WishBook wishbook){
		return 0;
	}
	
	//도서신청 게시물 삭제
	public int deleteWishBook(WishBook wishbook){
		return 0;
	}
	
	//나의 도서신청 게시물보기
	public WishBook selectMyWishBook(int wishno, String wishwriter){
		return null;
	}
	
	//도서신청글 제목 검색
	public ArrayList<WishBook> selectTitleWishBook(String wishbooktitle){
		return null;
	}
	
	//도서신청글 저자명 검색
	public ArrayList<WishBook> selectWriterWishBook(String wishbooktitle){
		return null;
	}

}
