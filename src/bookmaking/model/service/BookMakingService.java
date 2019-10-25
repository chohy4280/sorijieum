package bookmaking.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import book.model.vo.Book;
import book.model.vo.BookMakingProgress;
import bookmaking.model.dao.BookMakingDao;
import bookmaking.model.vo.BookMaking;

public class BookMakingService {
	//의존성 주입
	private static BookMakingDao bmDao = new BookMakingDao();
	
	public BookMakingService() {}
	
	//도서제작상세정보용 전체리스트
	public ArrayList<BookMakingProgress> selectWaitMakeBookAll(){
		Connection conn = getConnection();
		ArrayList<BookMakingProgress> list = bmDao.selectWaitMakeBookAll(conn);
		close(conn);
		return list;
	}
	
	//도서제작 메인 제작해야할 도서 리스트
	public ArrayList<BookMakingProgress> selectWaitingBook(){
		Connection conn = getConnection();
		ArrayList<BookMakingProgress> waitlist = bmDao.selectWaitingBook(conn);
		close(conn);
		return waitlist;
	}
	
	//도서제작 메인 제작중 도서 리스트
	public ArrayList<BookMakingProgress> selectMakingBook(){
		Connection conn = getConnection();
		ArrayList<BookMakingProgress> makelist = bmDao.selectMakingBook(conn);
		close(conn);
		return makelist;
	}
	
	//제작해야할 도서 게시물 카운트
	public int getListCountWaiting(){
		Connection conn = getConnection();
		int wcount = bmDao.getListCountWaiting(conn);
		close(conn);
		return wcount;
	}
	
	//제작해야할 도서 리스트
	public ArrayList<BookMakingProgress> selectWaitingBookList(int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<BookMakingProgress> list = bmDao.selectWaitingBookList(conn, startRow, endRow);
		close(conn);
		return list;
	}
	
	//제작중 도서 게시물 카운트
	public int getListCountMaking(){
		Connection conn = getConnection();
		int mcount = bmDao.getListCountMaking(conn);
		close(conn);
		return mcount;
	}
	
	//제작중 도서 리스트용
	public ArrayList<BookMakingProgress> selectMakingBookList(int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<BookMakingProgress> list = bmDao.selectMakingBookList(conn, startRow, endRow);
		close(conn);
		return list;
	}
	
	//도서 상세정보 
	public BookMakingProgress selectMakingBookOne(String bookrimg){
		Connection conn = getConnection();
		BookMakingProgress book = bmDao.selectMakingBookOne(conn, bookrimg);
		close(conn);
		return book;
	}
	
	// 관리자 도서 추가 시 bookmaking 테이블에도 추가
	public int insertBook(Book b) {
		Connection conn = getConnection();
		int result = bmDao.insertBook(conn, b);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	// 관리자 도서 추가시 bookmakingcheck 테이블에도 추가
	public int insertBookMakeCheck(Book b) {
		Connection conn = getConnection();
		int result = bmDao.insertBookMakeCheck(conn, b);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//제작완료 카운트
		public int getMakedBookCount(){
			Connection conn = getConnection();
			int dcount = bmDao.getMakedBookCount(conn);
			close(conn);
			return dcount;
		}
	
	//도서제작 추출 텍스트 파일 불러오기
	public ArrayList<Book> selectBookLoadText(String bookcode){
		Connection conn = getConnection();
		ArrayList<Book> list = bmDao.selectBookLoadText(conn, bookcode);
		close(conn);
		return list;
	}
	
	//도서제작 팝업창 불러오기
	public BookMakingProgress selectBookMakingPopupLoad(String bookcode, String userid){
		Connection conn = getConnection();
		BookMakingProgress list = bmDao.selectBookMakingPopupLoad(conn, bookcode, userid);
		close(conn);
		return list;
	}
	
	//도서제작 불러오기
	public BookMakingProgress selectBookMakingMainLoad(String bookcode, String userid){
		Connection conn = getConnection();
		BookMakingProgress list = bmDao.selectBookMakingMainLoad(conn, bookcode, userid);
		close(conn);
		return list;
	}
	
	//도서제작 제작하기 버튼 클릭시 동기화
	public int bookMakingInsert(String bookcode, String userid) {
		Connection conn = getConnection();
		int result = bmDao.bookMakingInsert(conn, bookcode, userid);
  if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}

	// 관리자 도서 수정용
	public int updateBookadmin(Book b) {
		Connection conn = getConnection();
		int result = bmDao.updateBookadmin(conn, b);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//도서제작 제작하기 버튼 클릭시 BOOK TABLE MAKESTATUS MAKE로 변경
	public int bookMakingUpdate(String bookcode) {
		Connection conn = getConnection();
		int result = bmDao.bookMakingUpdate(conn, bookcode);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//도서제작 페이지 입력 저장
	public int inputInsert(BookMakingProgress bmp) {
		Connection conn = getConnection();
		int result = bmDao.inputInsert(conn, bmp);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//도서제작 페이지 입력 수정
	public int inputUpdate(BookMakingProgress bmp) {
		Connection conn = getConnection();
		int result = bmDao.inputUpdate(conn, bmp);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//도서제작 모든 페이지 저장 후 makebook 추가
	public int inputMakeBook(BookMakingProgress bmp) {
		Connection conn = getConnection();
		int result = bmDao.inputMakeBook(conn, bmp);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//************************************************************************************
	//도서검색에서 도서재생으로 이동
	public BookMaking selectPlayPage(String bookcode) {
		 Connection conn = getConnection();
		 BookMaking bookmaking = bmDao.selectPlay(conn,bookcode);
		 close(conn);
		 return bookmaking;
	}

}
