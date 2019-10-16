package wishbook.model.service;

import java.sql.*;
import static common.JDBCTemplate.*;
import java.util.ArrayList;

import book.model.vo.BookMakingProgress;
import wishbook.model.dao.WishBookDao;
import wishbook.model.vo.WishBook;

public class WishBookService {
	
	//의존성 주입
	public WishBookDao wbDao = new WishBookDao();
	
	public WishBookService() {}

	
	//관리자 서비스****************************************
	// 관리자 신청도서(대기) 조회용
	public ArrayList<WishBook> selectWaitWishBook(){
		Connection conn = getConnection();
		ArrayList<WishBook> wishbList = wbDao.selectWaitWishBook(conn);
		return wishbList;
	}
	
	
	// 관리자 신청도서(전체) 조회용
	public ArrayList<WishBook> selectAll(){
		Connection conn = getConnection();
		ArrayList<WishBook> list = wbDao.selectAll(conn);
		close(conn);
		return list;
	}
	
	
	// 관리자 신청도서 검색용
	public ArrayList<WishBook> selectWishBookSearch(String searchtype, String keyword, String wishstatus){
		Connection conn = getConnection();
		ArrayList<WishBook> list = wbDao.selectWishBookSearch(conn, searchtype, keyword, wishstatus);
		close(conn);
		return list;
	}
	
	
	// 관리자 신청도서 한 개 불러오기 용
	public WishBook selectWishBookOneAdmin(int wishno) {
		return null;
	}
	
	
	// 관리자 신청도서 승인반려처리용
	public WishBook insertWishBookResult(int wishno) {
		return null;
	}
	
	//*********************************************************************
	
	//도서신청 게시물 카운트
	public int getListCount(){
		Connection conn = getConnection();
		int wcount = wbDao.getListCount(conn);
		close(conn);
		return wcount;
	}
	
	//도서신청 목록
	public ArrayList<WishBook> selectWishBookList(int startnum, int endnum){
		Connection conn = getConnection();
		ArrayList<WishBook> list = wbDao.selectWishBookList(conn, startnum, endnum);
		close(conn);
		return list;
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
