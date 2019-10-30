package wishbook.model.service;

import java.sql.*;
import static common.JDBCTemplate.*;
import java.util.ArrayList;
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
	   
	   
	   // 관리자 전체 신청도서 갯수 출력용
	   public int getListCountAdmin() {
	      Connection conn = getConnection();
	      int listCount = wbDao.getListCountAdmin(conn);
	      close(conn);
	      return listCount;
	   }
	   
	   // 관리자 신청도서(전체) 조회용
	   public ArrayList<WishBook> selectAll(int startRow, int endRow){
	      Connection conn = getConnection();
	      ArrayList<WishBook> list = wbDao.selectAll(conn, startRow, endRow);
	      close(conn);
	      return list;
	   }
	   
	   

	   // 관리자 도서신청 검색 리스트 카운트용
	   public int getListCountSearchAdmin(String searchtype, String keyword, String wishstatus) {
	      Connection conn = getConnection();
	      int listCount = wbDao.getListCountSearchAdmin(conn, searchtype, keyword, wishstatus);
	      close(conn);
	      return listCount;
	   }
	   
	   // 관리자 신청도서 검색용
	   public ArrayList<WishBook> selectWishBookSearch(String searchtype, String keyword, String wishstatus, int startRow, int endRow){
	      Connection conn = getConnection();
	      ArrayList<WishBook> list = wbDao.selectWishBookSearch(conn, searchtype, keyword, wishstatus, startRow, endRow);
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
	
	public int getLastWishNo(int wishno) {
		Connection conn = getConnection();
		int result = wbDao.getLastWishNo(conn, wishno);
		close(conn);
		return result;
	}
	
	public int getNextWishNo(int wishno) {
		Connection conn = getConnection();
		int result = wbDao.getNextWishNo(conn, wishno);
		close(conn);
		return result;
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
	public int deleteWishBook(int wishno){
		Connection conn = getConnection();
		int result = wbDao.deleteWishBook(conn, wishno);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	
	//도서신청 도서명, 저자명 검색
	public ArrayList<WishBook> selectSearchWishBook(String search, String keyword){
		Connection conn = getConnection();
		ArrayList<WishBook> list = wbDao.selectSearchWishBook(conn, search, keyword);
		close(conn);
		return list;
	}
	
	//도서신청글 조회수 증가
	public int updateWishViews(int wishno) {
		Connection conn = getConnection();
		int wview = wbDao.updateWishViews(conn, wishno);
		if(wview > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return wview;
	}
	
	//내 신청도서 **********************************************************************
	//내 신청도서 최근 처리된 알림 보낼 리스트
	public ArrayList<WishBook> selectWishAlarmList(String userid) {
		Connection conn = getConnection();
		ArrayList<WishBook> armlist = wbDao.selectWishAlarmList(conn,userid);
		close(conn);
		return armlist;
	}

	//내 신청도서 목록 조회
	public ArrayList<WishBook> selectMyWishList(String userid) {
		Connection conn = getConnection();
		ArrayList<WishBook>  wblist = wbDao.selectMyWishList(conn,userid);
		close(conn);
		return wblist;
	}
	
	//내 신청도서 알림 삭제
	public int deleteAlarm(int wishno) {
		Connection conn = getConnection();
		int result = wbDao.deleteAlarm(conn,wishno);
		if(result>0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	//상단 알림 개수 조회용
	public int getAlarmCount(String userid) {
		Connection conn = getConnection();
		int result = wbDao.getAlarmCount(conn,userid);
		close(conn);
		return result;
	}
}
