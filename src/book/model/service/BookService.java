package book.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import book.model.dao.BookDao;
import book.model.vo.Book;
import book.model.vo.BookDV;
import book.model.vo.BookPlay;
import bookmaking.model.vo.BookMaking;
import likebook.model.vo.LikeBook;

public class BookService {

	//의존성 주입
	public BookDao bDao = new BookDao();
	
	public BookService() {}
	
	
	//관리자 서비스****************************************
	// 관리자 도서 전체 목록 조회용
	public ArrayList<Book> selectAll(int startRow, int endRow){	
		Connection conn = getConnection();
		ArrayList<Book> list = bDao.selectAll(conn, startRow, endRow);
		close(conn);
		return list;
	}
	
	// 관리자 전체도서 리스트카운트용
	public int getListCountAdmin() {
   	 Connection conn = getConnection();
   	 int listCount = bDao.getListCountAdmin(conn);
   	 close(conn);
   	 return listCount;
	}
	
	
	// 관리자 도서 검색용
	public ArrayList<Book> selectBookSearch(String searchtype, String keyword, String makestatus, int startRow, int endRow){
		Connection conn = getConnection();
		ArrayList<Book> list = bDao.selectBookSearch(conn, searchtype, keyword, makestatus, startRow, endRow);
		close(conn);
		return list;
	}
	
	// 관리자 검색도서 리스트카운트용
	public int getListCountSelectBookSearch(String searchtype, String keyword, String makestatus) {
	   	 Connection conn = getConnection();
	   	 int listCount = bDao.getListCountSelectBookSearch(conn, searchtype, keyword, makestatus);
	   	 close(conn);
	   	 return listCount;
	 }
	
	
	// 관리자 도서 삭제용
	public int deleteBook(String bookcode) {
		Connection conn = getConnection();
		int result = bDao.deleteBook(conn, bookcode);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		return result;
	}
	
	
	// 관리자 도서 한개 정보 불러오기용
	public BookDV selectBookOne(String bookcode) {
		Connection conn = getConnection();
		BookDV book = bDao.selectBookOne(conn, bookcode);
		close(conn);
		return book;
	}
	
	
	// 관리자 도서 정보 수정용
	public int updateBook(Book b) {
		Connection conn = getConnection();
		int result = bDao.updateBook(conn, b);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);
		
		return result;
	}
	
	
	// 관리자 도서 추가용
	public int insertBook(Book b) {
		Connection conn = getConnection();
		int result = bDao.insertBook(conn, b);
		if(result > 0)
			commit(conn);
		else
			rollback(conn);
		close(conn);		
		return result;
	}
	
	// 관리자 제작대기 도서 조회용
	public ArrayList<Book> seletWaitBook() {
		Connection conn = getConnection();
		ArrayList<Book> wbList = bDao.selectWaitBook(conn);
		close(conn);
		return wbList;
	}
	
	// 관리자 제작중인 도서 조회용
	public ArrayList<Book> selectMakeBook(){
		Connection conn = getConnection();
		ArrayList<Book> mbList = bDao.selectMakeBook(conn);
		close(conn);
		return mbList;
	}
	
	
	// 관리자 제작 완료 도서 조회용
	public ArrayList<Book> selectDoneBook(){
		Connection conn = getConnection();
		ArrayList<Book> dbList = bDao.selectDoneBook(conn);
		close(conn);
		return dbList;
	}
	////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////
	//도서 총 개수 

	public int getListCount() {
	Connection conn = getConnection();
	int listCount = bDao.getListCount(conn);
	close(conn);
	return listCount;
	}

	//도서검색 한개만 불러오기
	public BookPlay selectOne(String bookcode, String userId) {
	Connection conn = getConnection();
	BookPlay bp = bDao.selectOne(conn, bookcode, userId);
	close(conn);
	return bp;
	}


	//도서전체목록 페이징 처리
	public ArrayList<BookPlay> selectList(int startRow, int endRow) {//한페이지에 열개씩 담기
	Connection conn = getConnection();
	ArrayList<BookPlay> list = bDao.selectList(conn,startRow,endRow);
	close(conn);
	return list;
	}

	//도서검색용
	public ArrayList<BookPlay> selectBookTitleAuthor(String keyword, int startRow, int endRow) {
	Connection conn = getConnection();
	ArrayList<BookPlay> bplist = bDao.selectBookTitleAuthor(conn, keyword, startRow, endRow);
	close(conn);
	return bplist;
	}



	//도서조회수 증가용
	public void updateBookReadCount(String bookcode) { 
	Connection conn = getConnection();
	int result = bDao.updateBookReadCount(conn,bookcode);
	if(result > 0)
	commit(conn);
	else
	rollback(conn);
	close(conn);


	}

	//인기도서 5권 출력용
	public ArrayList<Book> selectTop5() {
	Connection conn = getConnection();
	ArrayList<Book> list = bDao.selectTop5(conn);
	close(conn);
	return list;
	}

	//도서검색 만을 위한 도서카운트
	public int getListCountBookSearch (String keyword) {
	Connection conn = getConnection();
	int listCount = bDao.getListCountBookSearch(conn, keyword);
	close(conn);
	return listCount;
	}

	//책한권 골라와서 재생
	public BookPlay getselectOneBookPlay(String bookcode, int readpage) {
	Connection conn = getConnection();
	BookPlay bp = bDao.getselectOneBookPlay(conn, bookcode, readpage);
	System.out.println(bp);
	close(conn);
	return bp;
	}
	}