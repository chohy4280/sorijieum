package bookmaking.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import book.model.vo.Book;
import book.model.vo.BookMakingProgress;
import bookmaking.model.dao.BookMakingDao;

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
	
	//제작완료 카운트
	public int getMakedBookCount(){
		Connection conn = getConnection();
		int dcount = bmDao.getMakedBookCount(conn);
		close(conn);
		return dcount;
	}
	
	//도서제작 팝업창, 메인창 불러오기
	public ArrayList<BookMakingProgress> selectBookMakingPopupLoad(String bookcode, String userid){
		Connection conn = getConnection();
		ArrayList<BookMakingProgress> list = bmDao.selectBookMakingPopupLoad(conn, bookcode, userid);
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

	//도서제작 제작 시작시 BOOK TABLE MAKESTATUS MAKE로 변경
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
	
	//도서제작 제작시 BOOKMAKING TABLE MAKESTART SYSDATE 변경
	public int insertBookMaking(String bookcode) {
		Connection conn = getConnection();
		int result = bmDao.insertBookMaking(conn, bookcode);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	
	//도서제작 페이지 입력 저장
	public int inputInsert(BookMakingProgress bmp, int index) {
		Connection conn = getConnection();
		int result = bmDao.inputInsert(conn, bmp, index);
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
	
	//도서제작 제출 후 makebook 추가
	public int insertMakeBook(BookMakingProgress bmp, int page, int bookpage) {
		Connection conn = getConnection();
		int result = bmDao.insertMakeBook(conn, bmp, page, bookpage);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//도서제작 제출 후 bookmaking table makepage 추가
	public int insertMakePage(BookMakingProgress bmp, String bookcode, int page, int bookendpage) {
		Connection conn = getConnection();
		int result = bmDao.insertMakePage(conn, bmp, bookcode, page, bookendpage);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//제출 성공시 제출yn 추가
	public int insertCompleteyn(BookMakingProgress bmp, int page, int endpage) {
		Connection conn = getConnection();
		int result = bmDao.insertCompleteyn(conn, bmp, page, endpage);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//도서 제출을 못했는데 저장된 제작데이터가 있을 때 수정처리
	public int deleteInput(String userid, String bookcode, int index, int bookpage, int makepage) {
		Connection conn = getConnection();
		int result = bmDao.deleteInput(conn, userid, bookcode, index, bookpage, makepage);
		System.out.println("service result:" +result);
		
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	//************************************************************************************
	// 관리자
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
}
