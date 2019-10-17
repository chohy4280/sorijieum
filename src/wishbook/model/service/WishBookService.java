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
		Connection conn = getConnection();
		WishBook wb = wbDao.selectWishBookOneAdmin(conn, wishno);
		close(conn);
		return wb;
	}
	
	
	// 관리자 신청도서 승인반려처리용
	public int updatetWishBookResult(WishBook wb) {
		Connection conn = getConnection();
		int result = wbDao.updateWishBookResult(conn, wb);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
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
		Connection conn = getConnection();
		WishBook wishbook = wbDao.selectWishBookOne(conn, wishno);
		close(conn);
		return wishbook;
	}

	//도서신청 게시물 수정
	public int updateWishBook(WishBook wishbook){
		Connection conn = getConnection();
		int result = wbDao.updateWishBook(conn, wishbook);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//도서신청 게시물 등록
	public int insertWishBook(WishBook wishbook){
		Connection conn = getConnection();
		int result = wbDao.insertWishBook(conn, wishbook);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//도서신청 게시물 삭제
	public int deleteWishBook(WishBook wishbook){
		Connection conn = getConnection();
		int result = wbDao.deleteWishBook(conn, wishbook);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//나의 도서신청 게시물보기
	public WishBook selectMyWishBook(int wishno, String wishwriter){
		return null;
	}
	
	//도서신청 도서명, 저자명 검색
	public ArrayList<WishBook> selectSearchWishBook(String search, String keyword, int startnum, int endnum){
		Connection conn = getConnection();
		ArrayList<WishBook> list = wbDao.selectSearchWishBook(conn, search, keyword, startnum, endnum);
		close(conn);
		return list;
	}

	//도서신청 검색게시물 카운트
	public int getWishListCount(String search, String keyword){
		Connection conn = getConnection();
		int wcount = wbDao.getWishListCount(conn, search, keyword);
		close(conn);
		return wcount;
	}
}
